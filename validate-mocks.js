import { createClient } from '@supabase/supabase-js';
import { readFileSync, writeFileSync } from 'fs';
import { resolve, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

// Mock localStorage
global.localStorage = {
  store: {},
  getItem(key) { return this.store[key] || null; },
  setItem(key, val) { this.store[key] = val; },
  removeItem(key) { delete this.store[key]; },
  clear() { this.store = {}; }
};

// Mock window
global.window = {};

// Load ENV
try {
  const envPath = resolve(__dirname, '.env');
  const lines = readFileSync(envPath, 'utf8').split('\n');
  for (const line of lines) {
    const m = line.match(/^([^#=]+)=["']?(.+?)["']?\s*$/);
    if (m) process.env[m[1].trim()] = m[2].trim();
  }
} catch (e) {}

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_PUBLISHABLE_KEY);

function getSeenQuestionIds() {
  const data = localStorage.getItem("dmat_seen_questions");
  if (!data) return new Set();
  const arr = JSON.parse(data);
  return Array.isArray(arr) ? new Set(arr) : new Set();
}

function markQuestionsAsSeen(ids) {
  const seen = getSeenQuestionIds();
  let added = false;
  for (const id of ids) {
    if (!seen.has(id)) {
      seen.add(id);
      added = true;
    }
  }
  if (added) {
    localStorage.setItem("dmat_seen_questions", JSON.stringify(Array.from(seen)));
  }
}

function clearSeenQuestions(idsToClear) {
  const seen = getSeenQuestionIds();
  const toClear = new Set(idsToClear);
  const remaining = Array.from(seen).filter((id) => !toClear.has(id));
  localStorage.setItem("dmat_seen_questions", JSON.stringify(remaining));
}

function shuffleArray(array) {
  const arr = [...array];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

let dbCache = null;
async function getDB() {
  if (dbCache) return dbCache;
  const { data, error } = await supabase.from("questions").select("*");
  if (error) throw error;
  dbCache = data;
  return data;
}

async function fetchQuestionsSim(module, opts = {}) {
  const data = await getDB();
  let allQs = data.filter(q => q.module === module);
  if (opts.difficulty && opts.difficulty !== "all") {
    allQs = allQs.filter(q => q.difficulty === opts.difficulty);
  }
  if (allQs.length === 0) return [];

  const seen = getSeenQuestionIds();
  const unseenQs = allQs.filter(q => !seen.has(q.id));
  const seenQs = allQs.filter(q => seen.has(q.id));

  const targetCount = opts.limit ?? allQs.length;
  if (unseenQs.length < targetCount) {
    clearSeenQuestions(allQs.map(q => q.id));
  }

  const shuffledUnseen = shuffleArray(unseenQs);
  const shuffledSeen = shuffleArray(seenQs);

  const combined = [...shuffledUnseen, ...shuffledSeen];
  const sliced = combined.slice(0, targetCount);

  return sliced;
}

async function buildCustomTestSim(criteria) {
  const data = await getDB();
  let allQs = data;
  if (criteria.modules.length > 0) {
    allQs = allQs.filter(q => criteria.modules.includes(q.module));
  }
  if (criteria.difficulty !== "all") {
    allQs = allQs.filter(q => q.difficulty === criteria.difficulty);
  }
  if (allQs.length === 0) return [];

  const seen = getSeenQuestionIds();
  const unseenQs = allQs.filter(q => !seen.has(q.id));
  const seenQs = allQs.filter(q => seen.has(q.id));

  if (unseenQs.length < criteria.count) {
    clearSeenQuestions(allQs.map(q => q.id));
  }

  const shuffledUnseen = shuffleArray(unseenQs);
  const shuffledSeen = shuffleArray(seenQs);

  const combined = [...shuffledUnseen, ...shuffledSeen];
  const sliced = combined.slice(0, criteria.count);

  return sliced;
}

async function runValidation() {
  console.log("Starting validation...");
  
  const stats = {
    totalQsDrawn: 0,
    duplicateIDsInTest: 0,
    duplicatePromptsInTest: 0,
    duplicateVisualsInTest: 0,
    frequencyMap: {},
    moduleDist: {},
    diffDist: {},
    topicDist: {}
  };

  const recordQuestions = (qs) => {
    const ids = new Set();
    const prompts = new Set();
    const visuals = new Set();

    for (const q of qs) {
      if (ids.has(q.id)) stats.duplicateIDsInTest++;
      ids.add(q.id);

      if (prompts.has(q.prompt_text)) stats.duplicatePromptsInTest++;
      prompts.add(q.prompt_text);

      if (q.visual_data && visuals.has(JSON.stringify(q.visual_data))) stats.duplicateVisualsInTest++;
      if (q.visual_data) visuals.add(JSON.stringify(q.visual_data));

      stats.totalQsDrawn++;
      stats.frequencyMap[q.id] = (stats.frequencyMap[q.id] || 0) + 1;
      stats.moduleDist[q.module] = (stats.moduleDist[q.module] || 0) + 1;
      stats.diffDist[q.difficulty] = (stats.diffDist[q.difficulty] || 0) + 1;
      stats.topicDist[q.subtopic || 'none'] = (stats.topicDist[q.subtopic || 'none'] || 0) + 1;
    }
    
    // Simulate completion
    markQuestionsAsSeen(qs.map(q => q.id));
  };

  // Generate 1000 Complete Mocks
  for (let i = 0; i < 1000; i++) {
    const qs1 = await fetchQuestionsSim("figure_sequence", { limit: 20 });
    const qs2 = await fetchQuestionsSim("math_equation", { limit: 20 });
    const qs3 = await fetchQuestionsSim("latin_square", { limit: 16 });
    recordQuestions([...qs1, ...qs2, ...qs3]);
  }

  // Generate 1000 Practice Sessions (e.g. 25 questions math)
  for (let i = 0; i < 1000; i++) {
    const qs = await fetchQuestionsSim("math_equation", { limit: 25 });
    recordQuestions(qs);
  }

  // Generate 1000 Custom Tests
  for (let i = 0; i < 1000; i++) {
    const qs = await buildCustomTestSim({ modules: ["figure_sequence", "latin_square"], difficulty: "all", count: 30 });
    recordQuestions(qs);
  }
  
  const allQs = await getDB();
  const totalUnique = Object.keys(stats.frequencyMap).length;
  const coverage = (totalUnique / allQs.length) * 100;
  
  const freqs = Object.values(stats.frequencyMap);
  const maxFreq = Math.max(...freqs);
  const minFreq = Math.min(...freqs);
  const avgFreq = freqs.reduce((a, b) => a + b, 0) / freqs.length;

  // Standard deviation overall
  const sqDiffs = freqs.map(f => Math.pow(f - avgFreq, 2));
  const avgSqDiff = sqDiffs.reduce((a, b) => a + b, 0) / freqs.length;
  const stdDev = Math.sqrt(avgSqDiff);

  // Standard deviation per module
  const modFreqs = {};
  allQs.forEach(q => {
    if (!modFreqs[q.module]) modFreqs[q.module] = [];
    modFreqs[q.module].push(stats.frequencyMap[q.id] || 0);
  });
  
  const modStats = {};
  for (const mod in modFreqs) {
    const fArr = modFreqs[mod];
    const avg = fArr.reduce((a, b) => a + b, 0) / fArr.length;
    const std = Math.sqrt(fArr.map(f => Math.pow(f - avg, 2)).reduce((a, b) => a + b, 0) / fArr.length);
    modStats[mod] = {
      avg: avg.toFixed(2),
      stdDev: std.toFixed(2),
      min: Math.min(...fArr),
      max: Math.max(...fArr)
    };
  }

  console.log("==================================================");
  console.log("VALIDATION REPORT (1000 iterations each)");
  console.log("==================================================");
  console.log("Total unique questions in DB:", allQs.length);
  console.log("Total unique questions drawn:", totalUnique);
  console.log("Coverage percentage:", coverage.toFixed(2) + "%");
  console.log("Total questions drawn:", stats.totalQsDrawn);
  console.log("Most frequently selected question overall:", maxFreq);
  console.log("Least frequently selected question overall:", minFreq);
  console.log("Average frequency overall:", avgFreq.toFixed(2));
  console.log("Standard Deviation overall:", stdDev.toFixed(2));
  console.log("Duplicate IDs within a test:", stats.duplicateIDsInTest);
  
  console.log("\nModule Breakdown (Fairness check within pools):");
  console.table(modStats);

}

runValidation().catch(console.error);
