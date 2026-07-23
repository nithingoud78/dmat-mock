import { createClient } from "@supabase/supabase-js";
import fs from "fs";

const env = fs.readFileSync(".env", "utf8");
const urlMatch = env.match(/VITE_SUPABASE_URL="([^"]+)"/);
const keyMatch = env.match(/VITE_SUPABASE_PUBLISHABLE_KEY="([^"]+)"/);

const supabase = createClient(urlMatch[1], keyMatch[1]);

function shuffleArray(array) {
  const result = [...array];
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [result[i], result[j]] = [result[j], result[i]];
  }
  return result;
}

async function run() {
  const { data: allQs } = await supabase.from("questions").select("id, module, difficulty");
  const byModule = {};
  for (const q of allQs) {
    if (!byModule[q.module]) byModule[q.module] = [];
    byModule[q.module].push(q);
  }
  
  function simulatePractice(module, target, numTests) {
    const freq = {};
    const pool = byModule[module] || [];
    if (pool.length === 0) return;
    
    // Simulate the exact history tracking logic
    let unseen = [...pool];
    
    for (let i = 0; i < numTests; i++) {
      if (unseen.length < target) {
        unseen = [...pool];
      }
      const shuffledUnseen = shuffleArray(unseen);
      const drawn = shuffledUnseen.slice(0, target);
      
      const drawnSet = new Set(drawn.map(q => q.id));
      unseen = unseen.filter(q => !drawnSet.has(q.id));
      
      for (const q of drawn) {
        freq[q.id] = (freq[q.id] || 0) + 1;
      }
    }
    
    const counts = Object.values(freq);
    if (counts.length === 0) return;
    const max = Math.max(...counts);
    const min = Math.min(...counts);
    const avg = counts.reduce((a, b) => a + b, 0) / counts.length;
    
    const variance = counts.reduce((acc, val) => acc + Math.pow(val - avg, 2), 0) / counts.length;
    const stdDev = Math.sqrt(variance);
    
    console.log(`\n=== Practice: ${module} (1000 tests) ===`);
    console.log(`Pool Size: ${pool.length}`);
    console.log(`Unique drawn: ${counts.length} / ${pool.length}`);
    console.log(`Frequency (Min: ${min}, Max: ${max}, Avg: ${avg.toFixed(2)}, StdDev: ${stdDev.toFixed(2)})`);
  }
  
  console.log("Running Simulations with History Tracking Logic...");
  simulatePractice("math_equation", 20, 1000);
  simulatePractice("latin_square", 20, 1000);
  simulatePractice("figure_sequence", 20, 1000);
  simulatePractice("general_academic", 20, 1000);
}

run();
