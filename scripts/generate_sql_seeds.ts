import fs from "fs";

if (!fs.existsSync("official_questions.json")) {
  console.error("official_questions.json not found! Please run extract_official_questions.ts first.");
  process.exit(1);
}

const rawData = fs.readFileSync("official_questions.json", "utf-8");
const officialQuestions = JSON.parse(rawData);

function generateSql(module: string, questions: any[]) {
  let sql = `-- ============================================================
-- Seed: ${module.replace("_", " ").toUpperCase()}
-- All original content authored for dMAT Practice Pro from official_dmat.pdf
-- ============================================================

DO $$
DECLARE
  source_id UUID;
BEGIN

SELECT id INTO source_id FROM public.sources WHERE name = 'Official dMAT Preparatory Materials' LIMIT 1;
IF source_id IS NULL THEN
  INSERT INTO public.sources (name, publisher, note)
  VALUES ('Official dMAT Preparatory Materials', 'g.a.s.t. TestDaF-Institut', 'Questions extracted directly from official_dmat.pdf')
  RETURNING id INTO source_id;
END IF;

`;

  // We delete any existing from this module to ensure clean seed
  sql += `DELETE FROM public.questions WHERE module = '${module}';\n\n`;

  for (const q of questions) {
    const promptText = q.prompt_text.replace(/'/g, "''");
    const explanationText = q.explanation_text.replace(/'/g, "''");
    const optionsJson = JSON.stringify(q.options).replace(/'/g, "''");
    const visualDataJson = q.visual_data ? `'${JSON.stringify(q.visual_data).replace(/'/g, "''")}'::jsonb` : 'NULL';
    
    // Convert tags array to string for PostgreSQL text array
    const tagsSql = `ARRAY[${q.tags.map((t: string) => `'${t}'`).join(', ')}]`;

    sql += `INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '${q.id}',
  '${q.module}',
  '${promptText}',
  '${optionsJson}'::jsonb,
  '${q.correct_option_id}',
  '${explanationText}',
  '${q.difficulty}',
  ${q.time_estimate_seconds},
  ${visualDataJson},
  ${tagsSql},
  source_id,
  true,
  true
);\n\n`;
  }

  sql += `END $$;\n`;
  return sql;
}

const figSeq = officialQuestions.filter((q: any) => q.module === "figure_sequence");
const latinSq = officialQuestions.filter((q: any) => q.module === "latin_square");
const mathEq = officialQuestions.filter((q: any) => q.module === "math_equation");
const subjMod = officialQuestions.filter((q: any) => q.module === "general_academic");

fs.writeFileSync("supabase/seed/figure_sequences.sql", generateSql("figure_sequence", figSeq));
console.log(`Generated supabase/seed/figure_sequences.sql with ${figSeq.length} questions.`);

fs.writeFileSync("supabase/seed/latin_squares.sql", generateSql("latin_square", latinSq));
console.log(`Generated supabase/seed/latin_squares.sql with ${latinSq.length} questions.`);

fs.writeFileSync("supabase/seed/math_equations.sql", generateSql("math_equation", mathEq));
console.log(`Generated supabase/seed/math_equations.sql with ${mathEq.length} questions.`);

fs.writeFileSync("supabase/seed/subject_module.sql", generateSql("general_academic", subjMod));
console.log(`Generated supabase/seed/subject_module.sql with ${subjMod.length} questions.`);
