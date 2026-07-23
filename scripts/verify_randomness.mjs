import { createClient } from "@supabase/supabase-js";
import dotenv from "dotenv";

dotenv.config();

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error("Missing Supabase credentials in .env");
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function simulate(iterations, testType, questionLimit) {
  const frequencies = {};
  
  for (let i = 0; i < iterations; i++) {
    const { data: questions, error } = await supabase
      .rpc('get_random_questions', {
        p_module: 'general_academic', // example, or handle dynamically
        p_limit: questionLimit,
        p_difficulty: 'High'
      });

    if (error) {
      console.error("RPC Error:", error);
      break;
    }

    if (questions) {
      questions.forEach(q => {
        frequencies[q.id] = (frequencies[q.id] || 0) + 1;
      });
    }
  }

  const freqs = Object.values(frequencies);
  if (freqs.length === 0) {
    console.log(`[${testType}] No questions returned.`);
    return;
  }

  const min = Math.min(...freqs);
  const max = Math.max(...freqs);
  const avg = freqs.reduce((a, b) => a + b, 0) / freqs.length;
  const variance = freqs.reduce((acc, curr) => acc + Math.pow(curr - avg, 2), 0) / freqs.length;
  const stdDev = Math.sqrt(variance);

  console.log(`\n==================================================`);
  console.log(`RANDOMNESS QUALITY: ${testType} (${iterations} iterations)`);
  console.log(`==================================================`);
  console.log(`Coverage: ${freqs.length} unique questions served`);
  console.log(`Minimum frequency: ${min}`);
  console.log(`Maximum frequency: ${max}`);
  console.log(`Average frequency: ${avg.toFixed(2)}`);
  console.log(`Standard deviation: ${stdDev.toFixed(2)}`);
}

async function run() {
  console.log("Starting 1000-iteration simulations to verify Fisher-Yates randomness...\n");
  
  // Note: The actual fetch depends on your get_random_questions implementation.
  // This simulates the behavior of requesting a practice set of 20 questions.
  await simulate(1000, "Practice Test (20 Qs, General Academic)", 20);
  
  console.log("\nSimulation complete.");
}

run();
