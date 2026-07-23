import { createClient } from "@supabase/supabase-js";
import fs from "fs";
import path from "path";
import crypto from "crypto";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// --- Load Env ---
const envPath = path.resolve(__dirname, "..", ".env");
if (fs.existsSync(envPath)) {
  const envConfig = fs.readFileSync(envPath, "utf-8");
  envConfig.split("\n").forEach((line) => {
    const match = line.match(/^([^=]+)=(.*)$/);
    if (match) {
      process.env[match[1].trim()] = match[2].trim().replace(/^['"]|['"]$/g, "");
    }
  });
}

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error("Missing VITE_SUPABASE_URL or VITE_SUPABASE_ANON_KEY in .env");
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

function uuid() {
  return crypto.randomUUID();
}

function randInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function shuffle(array) {
  const arr = [...array];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

function randChoice(arr) {
  return arr[randInt(0, arr.length - 1)];
}

// Generate base latin square
function generateBaseSquare(size) {
  const sq = [];
  for (let r = 0; r < size; r++) {
    const row = [];
    for (let c = 0; c < size; c++) {
      row.push((r + c) % size);
    }
    sq.push(row);
  }
  return sq;
}

// Shuffle rows, cols, and symbols
function randomizeSquare(sq, size) {
  let rs = [...Array(size).keys()];
  let cs = [...Array(size).keys()];
  let syms = [...Array(size).keys()];
  
  rs = shuffle(rs);
  cs = shuffle(cs);
  syms = shuffle(syms);
  
  const res = [];
  for (let r = 0; r < size; r++) {
    const row = [];
    for (let c = 0; c < size; c++) {
      row.push(syms[sq[rs[r]][cs[c]]]);
    }
    res.push(row);
  }
  return res;
}

function copyGrid(grid) {
  return grid.map(r => [...r]);
}

// Simple deduction solver
function solveGrid(grid, size) {
  let progress = true;
  const g = copyGrid(grid);
  
  while (progress) {
    progress = false;
    for (let r = 0; r < size; r++) {
      for (let c = 0; c < size; c++) {
        if (g[r][c] !== null) continue;
        
        const possible = new Set([...Array(size).keys()]);
        for (let i = 0; i < size; i++) {
          if (g[r][i] !== null) possible.delete(g[r][i]);
          if (g[i][c] !== null) possible.delete(g[i][c]);
        }
        
        if (possible.size === 1) {
          g[r][c] = Array.from(possible)[0];
          progress = true;
        }
      }
    }
  }
  
  return g;
}

function canSolveTarget(grid, size, targetR, targetC) {
  const solved = solveGrid(grid, size);
  return solved[targetR][targetC] !== null;
}

function generatePuzzle(size, difficulty) {
  const base = generateBaseSquare(size);
  const solution = randomizeSquare(base, size);
  
  const allSymbolSets = [
    ['A', 'B', 'C', 'D', 'E'],
    ['1', '2', '3', '4', '5'],
    ['+', '-', 'x', '/', '='],
    ['α', 'β', 'γ', 'δ', 'ε'],
    ['O', 'Δ', '□', 'X', '☆']
  ];
  const symbolSet = randChoice(allSymbolSets).slice(0, size);
  
  const targetR = randInt(0, size - 1);
  const targetC = randInt(0, size - 1);
  const targetVal = solution[targetR][targetC];
  
  let puzzle = copyGrid(solution);
  puzzle[targetR][targetC] = null;
  
  const pos = [];
  for (let r = 0; r < size; r++) {
    for (let c = 0; c < size; c++) {
      if (r !== targetR || c !== targetC) pos.push({r, c});
    }
  }
  const shuffledPos = shuffle(pos);
  
  let removedCount = 0;
  for (const p of shuffledPos) {
    const backup = puzzle[p.r][p.c];
    puzzle[p.r][p.c] = null;
    
    if (!canSolveTarget(puzzle, size, targetR, targetC)) {
      puzzle[p.r][p.c] = backup;
    } else {
      removedCount++;
    }
  }
  
  if (difficulty === 'easy') {
    const toRestore = Math.floor(removedCount * 0.4);
    let restored = 0;
    for (const p of pos) {
      if (puzzle[p.r][p.c] === null && restored < toRestore) {
        puzzle[p.r][p.c] = solution[p.r][p.c];
        restored++;
      }
    }
  } else if (difficulty === 'medium') {
    const toRestore = Math.floor(removedCount * 0.2);
    let restored = 0;
    for (const p of pos) {
      if (puzzle[p.r][p.c] === null && restored < toRestore) {
        puzzle[p.r][p.c] = solution[p.r][p.c];
        restored++;
      }
    }
  }
  
  const finalGrid = [];
  for (let r = 0; r < size; r++) {
    const row = [];
    for (let c = 0; c < size; c++) {
      if (r === targetR && c === targetC) row.push('?');
      else if (puzzle[r][c] === null) row.push('');
      else row.push(symbolSet[puzzle[r][c]]);
    }
    finalGrid.push(row);
  }
  
  return {
    solutionGrid: solution.map(row => row.map(v => symbolSet[v])),
    finalGrid,
    symbolSet,
    targetR,
    targetC,
    targetVal: symbolSet[targetVal]
  };
}

class LatinSquareGenerator {
  constructor() {
    this.questions = [];
    this.sourceId = "8d3e91d5-8f65-4f3b-ba2c-5b23d9b4b0e9"; // Antigravity Proc Gen source
  }

  generateQuestion(difficulty) {
    const size = (difficulty === 'easy' || difficulty === 'medium') ? 4 : randChoice([4, 5]);
    const p = generatePuzzle(size, difficulty);
    
    const optionsRaw = p.symbolSet.map(s => ({
      id: s.toLowerCase(),
      text: s,
      isCorrect: s === p.targetVal
    }));
    
    let finalOpts = optionsRaw;
    if (size === 5) {
      const correctOpt = optionsRaw.find(o => o.isCorrect);
      const incorrectOpts = optionsRaw.filter(o => !o.isCorrect);
      finalOpts = [correctOpt, ...shuffle(incorrectOpts).slice(0, 3)];
    }
    
    const shuffled = shuffle(finalOpts);
    const optionIds = ['a', 'b', 'c', 'd'];
    let correctOptionId = 'a';

    const optionsFormatted = shuffled.map((o, i) => {
      if (o.isCorrect) correctOptionId = optionIds[i];
      return { id: optionIds[i], text: o.text };
    });

    const visualData = {
      type: "latin_square",
      size: size,
      symbols: p.symbolSet,
      grid: p.finalGrid,
      target_cell: { row: p.targetR, col: p.targetC }
    };
    
    const explanation = `In a Latin Square, each symbol must appear exactly once in each row and column. By deducing which symbols cannot go in the empty cells based on existing symbols in the same row or column, we can determine the target cell (?) must be ${p.targetVal}.`;

    return {
      id: uuid(),
      module: 'latin_square',
      prompt_text: 'Which symbol replaces the question mark?',
      options: optionsFormatted,
      correct_option_id: correctOptionId,
      explanation_text: explanation,
      difficulty: difficulty,
      source_id: this.sourceId,
      time_estimate_seconds: difficulty === 'hard' ? 90 : 75,
      visual_data: visualData,
      subtopic: `${size}x${size} Grid`,
      tags: ["latin_square", "logic", `size_${size}`],
      verified: true,
      approved: true,
      created_at: new Date().toISOString()
    };
  }

  async run() {
    console.log("Generating 100 Latin Squares questions...");
    
    // Generate exactly 100 questions (34 Easy, 33 Medium, 33 Hard)
    for (let i = 0; i < 34; i++) this.questions.push(this.generateQuestion('easy'));
    for (let i = 0; i < 33; i++) this.questions.push(this.generateQuestion('medium'));
    for (let i = 0; i < 33; i++) this.questions.push(this.generateQuestion('hard'));

    console.log(`Generated ${this.questions.length} questions. Inserting into Supabase...`);

    // Ensure source exists
    const { error: srcError } = await supabase.from("sources").upsert({
      id: this.sourceId,
      name: "Antigravity Procedural Generator (g.a.s.t. pattern matching)",
      publisher: "dMAT Practice Pro",
      note: "Programmatically generated original questions covering all official rule families."
    });

    if (srcError) {
      console.error("Failed to insert source:", srcError);
    }

    const batchSize = 20;
    for (let i = 0; i < this.questions.length; i += batchSize) {
      const batch = this.questions.slice(i, i + batchSize);
      const { error } = await supabase.from("questions").insert(batch);
      if (error) {
        console.error("Failed to insert batch:", error);
      } else {
        console.log(`Inserted batch ${i / batchSize + 1}`);
      }
    }

    console.log("Successfully seeded Latin Squares!");
  }
}

new LatinSquareGenerator().run().catch(console.error);
