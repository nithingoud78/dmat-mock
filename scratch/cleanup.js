const fs = require('fs');
const path = require('path');

const filesToDelete = [
  'supabase/migrations/20260722230000_seed_general_academic.sql',
  'supabase/migrations/20260723000002_seed_official_dmat_questions.sql',
  'supabase/migrations/20260723000004_seed_official_pdf_questions.sql',
  'supabase/migrations/20260723000005_batch1_math_equations.sql',
  'supabase/migrations/20260723000006_batch2_latin_squares.sql',
  'supabase/migrations/20260723000012_clean_and_seed_official_questions.sql',
  'supabase/seed/figure_sequences.sql',
  'supabase/seed/math_equations.sql',
  'supabase/seed/latin_squares.sql',
  'supabase/seed/generate_mock_sets.sql',
  'scratch/extract_prepdmat.ts',
  'C:/Users/knith/.gemini/antigravity-ide/brain/1fca0e87-cca2-490e-ad83-73d14c898475/new_offline_dataset.json',
  'C:/Users/knith/.gemini/antigravity-ide/brain/1fca0e87-cca2-490e-ad83-73d14c898475/offline_qa_report.md',
  'C:/Users/knith/.gemini/antigravity-ide/brain/1fca0e87-cca2-490e-ad83-73d14c898475/task.md',
  'C:/Users/knith/.gemini/antigravity-ide/brain/1fca0e87-cca2-490e-ad83-73d14c898475/implementation_plan.md'
];

let deletedCount = 0;

for (const file of filesToDelete) {
  const fullPath = path.resolve(process.cwd(), file);
  if (fs.existsSync(fullPath)) {
    try {
      fs.unlinkSync(fullPath);
      console.log(`DELETED: ${file}`);
      deletedCount++;
    } catch (e) {
      console.error(`FAILED TO DELETE: ${file}`, e);
    }
  } else {
    console.log(`NOT FOUND (already deleted): ${file}`);
  }
}

console.log(`\nCleanup complete. ${deletedCount} files removed.`);
