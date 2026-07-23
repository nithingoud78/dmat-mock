import { createClient } from "@supabase/supabase-js";
import fs from "fs";

const env = fs.readFileSync(".env", "utf8");
const urlMatch = env.match(/VITE_SUPABASE_URL="([^"]+)"/);
const keyMatch = env.match(/VITE_SUPABASE_PUBLISHABLE_KEY="([^"]+)"/);

const supabase = createClient(urlMatch[1], keyMatch[1]);

function badShuffle(arr) {
  return [...arr].sort(() => Math.random() - 0.5);
}

function fisherYatesShuffle(array) {
  const arr = [...array];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

async function run() {
  const { data: allQs } = await supabase.from("questions").select("id, module");
  
  const byModule = {};
  for (const q of allQs) {
    if (!byModule[q.module]) byModule[q.module] = [];
    byModule[q.module].push(q.id);
  }
  
  const target = 20;
  
  function simulate(shuffleFn, name) {
    const freq = {};
    for (let i = 0; i < 100; i++) {
      const drawn = shuffleFn(byModule["math_equation"]).slice(0, target);
      for (const id of drawn) {
        freq[id] = (freq[id] || 0) + 1;
      }
    }
    
    const counts = Object.values(freq);
    const max = Math.max(...counts);
    const min = Math.min(...counts);
    const avg = counts.reduce((a, b) => a + b, 0) / counts.length;
    
    console.log(`\n=== ${name} ===`);
    console.log(`Unique questions seen across 100 tests: ${counts.length} / ${byModule["math_equation"].length}`);
    console.log(`Frequency (Min: ${min}, Max: ${max}, Avg: ${avg.toFixed(2)})`);
  }
  
  simulate(badShuffle, "Math.random() - 0.5 (Current)");
  simulate(fisherYatesShuffle, "Fisher-Yates (Proper)");
}
run();
