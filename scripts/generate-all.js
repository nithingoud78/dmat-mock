import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

import { generateBatch as genFigure } from './generate-figure-sequences.js';
import { generateBatch as genMath } from './generate-math-equations.js';
import { generateBatch as genLatin } from './generate-latin-squares.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const sqlFilePath = path.join(__dirname, '../supabase/migrations/20260723000008_massive_expansion.sql');

const BATCH_ID = 'bbbbbbbb-0000-0000-0000-000000000002'; // A generic source ID
const SOURCE_NAME = 'Massive Expansion 2026';

let sql = `-- ==============================================================================
-- Migration: Massive Question Bank Expansion
-- ==============================================================================

-- Ensure source exists
INSERT INTO public.sources (id, title, url, description, type, difficulty_rating, reliable)
VALUES ('${BATCH_ID}', '${SOURCE_NAME}', null, 'Procedurally generated expansion batch for dMAT Practice Pro.', 'third_party_book', 3, true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, subtopic, visual_data, content_hash) VALUES
`;

const allQuestions = [];

// Generate Figures
allQuestions.push(...genFigure(30, 'easy'));
allQuestions.push(...genFigure(40, 'medium'));
allQuestions.push(...genFigure(30, 'hard'));

// Generate Math
allQuestions.push(...genMath(30, 'easy'));
allQuestions.push(...genMath(40, 'medium'));
allQuestions.push(...genMath(30, 'hard'));

// Generate Latin
allQuestions.push(...genLatin(30, 'easy'));
allQuestions.push(...genLatin(40, 'medium'));
allQuestions.push(...genLatin(30, 'hard'));

const values = allQuestions.map((q, idx) => {
  const optionsStr = JSON.stringify(q.options).replace(/'/g, "''");
  const visualStr = q.visual_data ? `'${JSON.stringify(q.visual_data).replace(/'/g, "''")}'::jsonb` : 'NULL';
  const promptStr = q.prompt_text.replace(/'/g, "''");
  const explStr = q.explanation_text.replace(/'/g, "''");
  
  return `('${q.id}', '${q.module}', '${promptStr}', '${optionsStr}'::jsonb, '${q.correct_option_id}', '${explStr}', '${q.difficulty}', '${BATCH_ID}', ${q.time_estimate_seconds}, '${q.subtopic}', ${visualStr}, 'expansion_batch_${idx}')`;
});

sql += values.join(',\n') + ';\n';

fs.writeFileSync(sqlFilePath, sql);
console.log(`Generated ${allQuestions.length} questions and saved to ${sqlFilePath}`);
