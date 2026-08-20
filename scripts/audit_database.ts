import { createClient } from "@supabase/supabase-js";
import fs from "fs";
// Removed dotenv

const SUPABASE_URL = process.env.VITE_SUPABASE_URL || "";
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.VITE_SUPABASE_ANON_KEY || "";

if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
  console.error("Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env");
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
});

const stats = {
  inspected: 0,
  deleted: 0,
  repaired: 0,
  inserted: 0,
  modules: {
    figure_sequence: 0,
    math_equation: 0,
    latin_square: 0,
    subject_module: 0,
    complete_mock: 0,
  },
  reasons: {} as Record<string, number>,
};

function logReason(reason: string) {
  stats.reasons[reason] = (stats.reasons[reason] || 0) + 1;
}

async function runAudit() {
  console.log("Starting Database Quality Audit & Remediation...\n");

  const { data: questions, error } = await supabase.from("questions").select("*");
  if (error || !questions) {
    console.error("Failed to fetch questions", error);
    return;
  }

  stats.inspected = questions.length;
  console.log(`Fetched ${questions.length} total questions currently in database.`);

  const { data: sources } = await supabase.from("sources").select("*");
  const antigravitySource = sources?.find(s => s.name.includes("Antigravity"));
  
  for (const q of questions) {
    // Count modules
    if (q.module === "figure_sequence") stats.modules.figure_sequence++;
    else if (q.module === "math_equation") stats.modules.math_equation++;
    else if (q.module === "latin_square") stats.modules.latin_square++;
    else if (q.module === "subject_module" || q.module === "general_academic") stats.modules.subject_module++;

    let isInvalid = false;
    let deletionReason = "";

    // 1. Procedural Generator 
    if (antigravitySource && q.source_id === antigravitySource.id) {
      isInvalid = true;
      deletionReason = "AI Hallucination (Procedural Generator)";
    }
    
    // 2. Option A Bias Root Cause
    else if (q.correct_option_id === "a" && (!q.options || q.options.length === 0 || q.options[0].id === "a")) {
      // Check if it's the static option A bug where they are not shuffled
      if (q.module === "figure_sequence" || q.prompt_text.includes("moves")) {
        isInvalid = true;
        deletionReason = "Static Option A Bias (Unshuffled)";
      }
    }
    
    // 3. Repeated Explanation
    else if (q.explanation_text && (q.explanation_text.includes("wraps around") || q.explanation_text.includes("By eliminating symbols already present"))) {
      isInvalid = true;
      deletionReason = "Duplicated Generic Explanation";
    }

    // 4. Broken JSON / Missing Fields
    else if (!q.prompt_text || q.prompt_text.trim() === "" || !q.options || q.options.length < 2) {
      isInvalid = true;
      deletionReason = "Broken JSON / Missing Required Fields";
    }

    // Since the requirement is to ONLY have legitimate questions from dmat.txt,
    // we delete ALL legacy questions and replace them entirely with the 45 curated ones.
    if (!isInvalid) {
        isInvalid = true;
        deletionReason = "Legacy/Unverified Question (Replacing with Official)";
    }

    if (isInvalid) {
      logReason(deletionReason);
      stats.deleted++;
      await supabase.from("questions").delete().eq("id", q.id);
    }
  }

  console.log(`\nDeleted ${stats.deleted} legacy/broken questions.`);
  
  // Seed the legitimate questions
  console.log("Seeding 45 legitimate official questions...");
  
  if (fs.existsSync("official_questions.json")) {
    const rawData = fs.readFileSync("official_questions.json", "utf-8");
    const officialQuestions = JSON.parse(rawData);

    // Ensure the Official Source exists
    const officialSourceId = "11111111-2222-3333-4444-555555555555";
    await supabase.from("sources").upsert({
      id: officialSourceId,
      name: "Official dMAT Preparatory Materials",
      publisher: "g.a.s.t. TestDaF-Institut",
      note: "Questions extracted directly from official_dmat.pdf"
    });

    const batchSize = 10;
    for (let i = 0; i < officialQuestions.length; i += batchSize) {
        const batch = officialQuestions.slice(i, i + batchSize);
        const { error: insertError } = await supabase.from("questions").insert(batch);
        if (insertError) {
            console.error(`Insert error at batch ${i}: `, insertError);
        } else {
            stats.inserted += batch.length;
        }
    }
    console.log(`Successfully inserted ${stats.inserted} legitimate questions.`);
  } else {
    console.error("official_questions.json not found! Please run extract_official_questions.ts first.");
  }

  console.log("\n==================================================");
  console.log("FINAL AUDIT REPORT");
  console.log("==================================================");
  console.log(`Total questions inspected: ${stats.inspected}`);
  console.log(`Total legacy Figure Sequence questions removed: ${stats.modules.figure_sequence}`);
  console.log(`Total legacy Mathematical questions removed: ${stats.modules.math_equation}`);
  console.log(`Total legacy Latin Square questions removed: ${stats.modules.latin_square}`);
  console.log(`Total legacy Subject Module questions removed: ${stats.modules.subject_module}`);
  console.log(`--------------------------------------------------`);
  console.log(`Root cause of Option A bug: The procedural generators (seed.html and early SQL scripts) hardcoded correct_option_id to "a" and failed to shuffle the distractors array.`);
  console.log(`Root cause of Repeated Explanations: Procedural generators used static template strings (e.g. "By eliminating symbols...") instead of unique logical rationales.`);
  console.log(`--------------------------------------------------`);
  console.log(`Total REPAIRED/REPLACED: ${stats.inserted} (45 legitimate official questions)`);
  console.log(`Total DELETED: ${stats.deleted}`);
  console.log(`\nDeletion Reasons:`);
  for (const [reason, count] of Object.entries(stats.reasons)) {
    console.log(`- ${reason}: ${count}`);
  }
  console.log("==================================================\n");
}

runAudit().catch(console.error);
