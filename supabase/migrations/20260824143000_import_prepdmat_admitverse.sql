-- Migration: Import PrepDMAT and AdmitVerse questions
-- Generated: 2026-08-24T09:10:23.063Z
-- Sources:
--   PrepDMAT (https://prepdmat.com/practice) — "original PrepDMAT items written in the official dMAT task formats"
--   AdmitVerse (https://admitverse.com/dmat-mock-test/sample-questions)
-- Total questions: 43

-- AdmitVerse source (insert if not exists)
INSERT INTO public.sources (id, name, publisher, edition, year, license_note, url, note)
VALUES (
  '44444444-4444-4444-4444-444444444444',
  'AdmitVerse dMAT Sample Questions',
  'AdmitVerse',
  '1st',
  '2026',
  'Approved Source — original practice questions in official dMAT task formats',
  'https://www.admitverse.com/dmat-mock-test/sample-questions',
  'Five real dMAT-style questions with worked solutions. Built on the official g.a.s.t. format.'
)
ON CONFLICT DO NOTHING;

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is B?

6 + A = 13
B − A = 5', '[{"id":"a","text":"10","correct":false},{"id":"b","text":"13","correct":false},{"id":"c","text":"11","correct":false},{"id":"d","text":"12","correct":true}]'::jsonb, 'd', 'First equation: A = 13 − 6 = 7. Substitute into the second: B − 7 = 5 → B = 12.', 'easy', 'Algebraic Systems', '8184f56d1dc8c401', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8184f56d1dc8c401'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is B?

3 × C = A
A + C = 16
B = A + C − 6', '[{"id":"a","text":"12","correct":false},{"id":"b","text":"10","correct":true},{"id":"c","text":"8","correct":false},{"id":"d","text":"16","correct":false}]'::jsonb, 'b', 'Replace A with 3C in the second equation: 3C + C = 16 → C = 4, so A = 12. Then B = 12 + 4 − 6 = 10.', 'medium', 'Algebraic Systems', '7de942ef41ca85bf', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '7de942ef41ca85bf'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is D?

A = 5 × B
C = B + 9
A − B + C − D = 12
D = 3 × B + 1', '[{"id":"a","text":"9","correct":false},{"id":"b","text":"5","correct":false},{"id":"c","text":"7","correct":true},{"id":"d","text":"11","correct":false}]'::jsonb, 'c', 'Substitute everything into the third equation: 5B − B + (B + 9) − (3B + 1) = 12 → 2B + 8 = 12 → B = 2. Then D = 3 × 2 + 1 = 7.', 'hard', 'Algebraic Systems', '8363701f84d0d125', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8363701f84d0d125'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is A?

B = C ÷ 4
A = B + C
A − B = 12', '[{"id":"a","text":"15","correct":true},{"id":"b","text":"12","correct":false},{"id":"c","text":"3","correct":false},{"id":"d","text":"9","correct":false}]'::jsonb, 'a', 'The second and third equations together give (B + C) − B = 12, so C = 12. Then B = 12 ÷ 4 = 3, and A = 3 + 12 = 15.', 'medium', 'Algebraic Systems', '44e2c79052cfdfde', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '44e2c79052cfdfde'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is B?

A + 3 = B
D = 2 × A
C = D − B
C = 4', '[{"id":"a","text":"7","correct":false},{"id":"b","text":"10","correct":true},{"id":"c","text":"14","correct":false},{"id":"d","text":"13","correct":false}]'::jsonb, 'b', 'Since C = 4, the third equation gives D − B = 4. Substitute D = 2A and B = A + 3: 2A − A − 3 = 4 → A = 7. So B = 10.', 'medium', 'Algebraic Systems', '0bb12fd51a90e886', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '0bb12fd51a90e886'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is B?

A − 4 = B
A + B = 14', '[{"id":"a","text":"5","correct":true},{"id":"b","text":"9","correct":false},{"id":"c","text":"4","correct":false},{"id":"d","text":"7","correct":false}]'::jsonb, 'a', 'From the first equation A = B + 4, so (B + 4) + B = 14 → B = 5 (and A = 9).', 'easy', 'Algebraic Systems', '2eb5984e513e6604', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '2eb5984e513e6604'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is A?

C = A + B
A = 2 × B
C = 9', '[{"id":"a","text":"3","correct":false},{"id":"b","text":"9","correct":false},{"id":"c","text":"6","correct":true},{"id":"d","text":"4","correct":false}]'::jsonb, 'c', 'Substitute A = 2B into the first equation: 2B + B = 9 → B = 3, so A = 6.', 'medium', 'Algebraic Systems', 'd3ffa72f9a51057a', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'd3ffa72f9a51057a'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is B?

B ÷ A = 4
B − A = 12', '[{"id":"a","text":"16","correct":true},{"id":"b","text":"12","correct":false},{"id":"c","text":"8","correct":false},{"id":"d","text":"20","correct":false}]'::jsonb, 'a', 'B = 4A, so 4A − A = 12 → A = 4 and B = 16.', 'medium', 'Algebraic Systems', '4d9348318a1982d3', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '4d9348318a1982d3'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is C?

A + B + C = 22
B = A + 2
C = 3 × A', '[{"id":"a","text":"6","correct":false},{"id":"b","text":"16","correct":false},{"id":"c","text":"10","correct":false},{"id":"d","text":"12","correct":true}]'::jsonb, 'd', 'Substitute everything into the first: A + (A + 2) + 3A = 22 → 5A = 20 → A = 4, so C = 12.', 'medium', 'Algebraic Systems', 'b5061ef33642ed2b', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'b5061ef33642ed2b'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is A?

D − C = 5
C = 2 × B
A = B + C + D
B = 2', '[{"id":"a","text":"13","correct":false},{"id":"b","text":"17","correct":false},{"id":"c","text":"15","correct":true},{"id":"d","text":"11","correct":false}]'::jsonb, 'c', 'Start from B = 2: C = 4, then D = C + 5 = 9, so A = 2 + 4 + 9 = 15.', 'medium', 'Algebraic Systems', 'abfc599e3cd2c004', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'abfc599e3cd2c004'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is C?

C − B + D − A = 13
8 × A = C
3 × A = D
A + 5 = B', '[{"id":"a","text":"16","correct":true},{"id":"b","text":"24","correct":false},{"id":"c","text":"12","correct":false},{"id":"d","text":"18","correct":false}]'::jsonb, 'a', 'Express everything in terms of A: C = 8A, D = 3A, B = A + 5. Substitute: 8A − (A + 5) + 3A − A = 13 → 9A − 5 = 13 → A = 2. Then C = 8 × 2 = 16.', 'hard', 'Algebraic Systems', '41548f8894320ad6', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '41548f8894320ad6'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is D?

3 × A − B = 7
A + 2 × B = 14
C = A + B
D = 2 × C − A', '[{"id":"a","text":"14","correct":true},{"id":"b","text":"9","correct":false},{"id":"c","text":"5","correct":false},{"id":"d","text":"13","correct":false}]'::jsonb, 'a', 'Double the first equation and add the second: 7A = 28, so A = 4 and B = 5. C = 9, D = 2 × 9 − 4 = 14.', 'hard', 'Algebraic Systems', '3ccd9162dbb0f927', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '3ccd9162dbb0f927'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter is an integer between 1 and 20. What is D?

A + B = 9
B + C = 13
A + C = 10
D = C − A', '[{"id":"a","text":"4","correct":true},{"id":"b","text":"7","correct":false},{"id":"c","text":"3","correct":false},{"id":"d","text":"6","correct":false}]'::jsonb, 'a', 'Add all three: 2(A + B + C) = 32, so A + B + C = 16. Then C = 16 − 9 = 7, A = 16 − 13 = 3, B = 16 − 10 = 6. D = 7 − 3 = 4.', 'hard', 'Algebraic Systems', '3f01e41c2b02e0f2', '{math_equation,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '3f01e41c2b02e0f2'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'math_equation', 'Each letter stands for a whole number. What is the value of C?

A + B = 9
B + C = 11
A + C = 10', '[{"id":"a","text":"4","correct":false},{"id":"b","text":"5","correct":false},{"id":"c","text":"6","correct":true},{"id":"d","text":"7","correct":false}]'::jsonb, 'c', 'Add all three equations: 2(A + B + C) = 30, so A + B + C = 15. Subtract the first equation (A + B = 9) to get C = 6.', 'medium', 'Algebraic Systems', 'c610ce247f4992a6', '{math_equation,admitverse}'::text[], 75, '44444444-4444-4444-4444-444444444444'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'c610ce247f4992a6'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ?', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":true},{"id":"c","text":"C","correct":false},{"id":"d","text":"D","correct":false},{"id":"e","text":"E","correct":false}]'::jsonb, 'b', 'Look at column 1: it already contains E, A, D and C. The only letter missing is B.', 'easy', 'Latin Squares', 'a3dd5b91bda16da8', '{latin_square,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["?","C","D","",""],["E","A","B","",""],["A","B","C","E","D"],["D","","","C",""],["C","","","","A"]],"target_cell":{"row":0,"col":0}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a3dd5b91bda16da8'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ?', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":false},{"id":"c","text":"C","correct":true},{"id":"d","text":"D","correct":false},{"id":"e","text":"E","correct":false}]'::jsonb, 'c', 'Column 1 already has E and B, so the ? can only be A, C or D. Row 4 (A, E, C given) still needs B and D, and its column-1 cell can''t be B (column 1 already has one) — so that cell takes D. Now row 2 already contains A, ruling A out. Only C remains.', 'medium', 'Latin Squares', '0e3915a1f81a7750', '{latin_square,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["E","D","C","","A"],["?","","","A",""],["B","","","D",""],["","A","E","C",""],["","","","E",""]],"target_cell":{"row":1,"col":0}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '0e3915a1f81a7750'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ?', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":false},{"id":"c","text":"C","correct":false},{"id":"d","text":"D","correct":false},{"id":"e","text":"E","correct":true}]'::jsonb, 'e', 'Column 3 already shows D, A and C — only B and E are missing. Row 5 already contains E, so the bottom cell of column 3 must take B. That forces the ? to be E.', 'easy', 'Latin Squares', '45256ee779b54629', '{latin_square,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["","","D","",""],["","","A","","B"],["A","B","C","","E"],["","","?","A",""],["","A","","E",""]],"target_cell":{"row":3,"col":2}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '45256ee779b54629'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ?', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":false},{"id":"c","text":"C","correct":true},{"id":"d","text":"D","correct":false},{"id":"e","text":"E","correct":false}]'::jsonb, 'c', 'Row 2 already contains E, A and B; column 4 adds E and D. Four letters excluded — only C fits.', 'easy', 'Latin Squares', '26f48277a3ec36c1', '{latin_square,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["","C","","","D"],["E","A","","?","B"],["","","B","","C"],["B","","C","E","A"],["C","","","D","E"]],"target_cell":{"row":1,"col":3}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '26f48277a3ec36c1'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ?', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":false},{"id":"c","text":"C","correct":false},{"id":"d","text":"D","correct":true},{"id":"e","text":"E","correct":false}]'::jsonb, 'd', 'Column 5 contains B, C and A; row 5 adds B, A and E. The union rules out A, B, C and E — only D fits.', 'easy', 'Latin Squares', '1a9f561f0fb7be1d', '{latin_square,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["D","A","","C","B"],["","","","","C"],["","E","","","A"],["","C","D","B",""],["","B","A","E","?"]],"target_cell":{"row":4,"col":4}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '1a9f561f0fb7be1d'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ?', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":false},{"id":"c","text":"C","correct":false},{"id":"d","text":"D","correct":true},{"id":"e","text":"E","correct":false}]'::jsonb, 'd', 'Row 4 still needs C and D. Column 3 already has D (row 2), so the column-3 cell of row 4 must take C — leaving D for the ?.', 'easy', 'Latin Squares', 'ddb053fc32d08b55', '{latin_square,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["D","","","E",""],["","A","D","B","E"],["B","","","D",""],["E","?","","A","B"],["A","","","",""]],"target_cell":{"row":3,"col":1}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ddb053fc32d08b55'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ?', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":false},{"id":"c","text":"C","correct":true},{"id":"d","text":"D","correct":false},{"id":"e","text":"E","correct":false}]'::jsonb, 'c', 'Row 2 and column 2 together narrow the ? to A or C. Testing A leads to a dead end; only C works.', 'medium', 'Latin Squares', '797224ad5b13880a', '{latin_square,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["E","D","B","","A"],["D","?","E","",""],["","","D","",""],["","E","A","","C"],["","B","","",""]],"target_cell":{"row":1,"col":1}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '797224ad5b13880a'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ? (Hard — requires reasoning beyond simple elimination)', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":false},{"id":"c","text":"C","correct":false},{"id":"d","text":"D","correct":true},{"id":"e","text":"E","correct":false}]'::jsonb, 'd', 'Row 5 and column 1 exclude only B and C, leaving three possibilities. Look down column 1: C has exactly one legal free field, so place it. That fills a cell in row 2, and D then has exactly one legal free field left in row 2. Finally, every other free field in row 5 sits in a column that already contains D — so the ? must be D.', 'hard', 'Latin Squares', '9c3b32432c0467b8', '{latin_square,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["","","D","C",""],["","A","","",""],["","","","","C"],["B","","","","D"],["?","C","","",""]],"target_cell":{"row":4,"col":0}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '9c3b32432c0467b8'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ? (7 forced placements required)', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":false},{"id":"c","text":"C","correct":true},{"id":"d","text":"D","correct":false},{"id":"e","text":"E","correct":false}]'::jsonb, 'c', 'This grid needs 7 forced placements before the question mark itself is forced. Work the chain: fill every field that has only one letter left, and each fill removes a candidate somewhere else. After the seventh such placement the marked field has a single letter remaining, C.', 'hard', 'Latin Squares', 'bfae64ef494c2068', '{latin_square,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["","","","D","?"],["","D","","A",""],["","B","E","",""],["","C","D","E",""],["","A","C","B","D"]],"target_cell":{"row":0,"col":4}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'bfae64ef494c2068'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ? (9 forced placements required)', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":false},{"id":"c","text":"C","correct":false},{"id":"d","text":"D","correct":false},{"id":"e","text":"E","correct":true}]'::jsonb, 'e', '9 forced placements are required. Early steps use the hidden single technique: letters with exactly one legal field left in their row. Following that chain through, the marked field resolves to E.', 'hard', 'Latin Squares', '956978e9c66b4b19', '{latin_square,prepdmat}'::text[], 75, '33333333-3333-3333-3333-333333333333', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["","","","A",""],["","","A","","D"],["E","D","C","","A"],["","?","","",""],["","A","E","","C"]],"target_cell":{"row":3,"col":1}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '956978e9c66b4b19'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'latin_square', 'Each letter A–E appears exactly once in every row and every column. Which letter belongs in the cell marked ×?', '[{"id":"a","text":"A","correct":false},{"id":"b","text":"B","correct":false},{"id":"c","text":"C","correct":false},{"id":"d","text":"D","correct":true},{"id":"e","text":"E","correct":false}]'::jsonb, 'd', 'Read the row: C, ×, E, A, B — it is missing D. Confirm with the column: B, C, ×, E, A — also missing D. Both agree, so × is D.', 'easy', 'Latin Squares', '7608fdc7c9579f6a', '{latin_square,admitverse}'::text[], 75, '44444444-4444-4444-4444-444444444444', '{"type":"latin_square","grid_size":5,"symbols":["A","B","C","D","E"],"grid":[["A","B","C","D","E"],["B","C","D","E","A"],["C","×","E","A","B"],["D","E","A","B","C"],["E","A","B","C","D"]],"target_cell":{"row":2,"col":1}}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '7608fdc7c9579f6a'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'general_academic', 'A standardised test reports results as percentile ranks: the percentage of all test takers whose score was equal to or lower than yours. In one sitting, 1,600 candidates take the test. Priya''s score is higher than 1,120 of them and equal to none. What is Priya''s percentile rank?', '[{"id":"a","text":"30","correct":false},{"id":"b","text":"70","correct":true},{"id":"c","text":"48","correct":false},{"id":"d","text":"75","correct":false}]'::jsonb, 'b', '1,120 of 1,600 scored lower → 1,120 ÷ 1,600 = 0.70. Percentile rank = 70: she did as well as or better than 70% of all candidates.', 'medium', 'Percentile calculation', '915112e679b00467', '{general_academic,prepdmat}'::text[], 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '915112e679b00467'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'general_academic', 'A learning study reports: of 240 students who used spaced practice, 168 passed their exam; of 160 students who crammed, 96 passed. Which statement follows from this data?', '[{"id":"a","text":"Spaced practice caused the higher pass rate","correct":false},{"id":"b","text":"Most students who passed had crammed","correct":false},{"id":"c","text":"Fewer than half of the crammers passed","correct":false},{"id":"d","text":"The pass rate was higher with spaced practice","correct":true}]'::jsonb, 'd', '168 ÷ 240 = 70% vs 96 ÷ 160 = 60% — the spaced-practice pass rate is higher. "Caused" is the classic trap: the data shows association, not causation.', 'medium', 'Data interpretation', '8bd8c7de3cdb55ff', '{general_academic,prepdmat}'::text[], 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8bd8c7de3cdb55ff'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'general_academic', 'A dMAT test city has 480 available seats across its centres, booked first-come-first-served. If about 5,000 candidates prefer that city, roughly what share of them will have to choose another city?', '[{"id":"a","text":"About 90%","correct":true},{"id":"b","text":"About 10%","correct":false},{"id":"c","text":"About 48%","correct":false},{"id":"d","text":"Cannot be determined","correct":false}]'::jsonb, 'a', '480 of 5,000 preferences can be satisfied: 480 ÷ 5,000 = 9.6% get seats, so roughly 90% must book elsewhere.', 'easy', 'Proportional reasoning', 'd487d59b1d5f4cdb', '{general_academic,prepdmat}'::text[], 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'd487d59b1d5f4cdb'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'general_academic', 'The dMAT score scale runs 0–200 with a fixed mean of 100 per module. Priya scores 118 on the core module and 96 on the subject module. Which statement follows?', '[{"id":"a","text":"She answered 118 core questions correctly","correct":false},{"id":"b","text":"Her overall percentile must be above 50","correct":false},{"id":"c","text":"Her core result is above average; her subject result is below average","correct":true},{"id":"d","text":"Her subject performance failed the exam","correct":false}]'::jsonb, 'c', 'The 0–200 scale has mean 100, so 118 is above and 96 below average — that is all the scale tells you.', 'medium', 'Score interpretation', '9cb4bde0921564ec', '{general_academic,prepdmat}'::text[], 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '9cb4bde0921564ec'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'general_academic', 'In a survey, 500 test takers who used official preparatory materials averaged 112, while 300 who didn''t averaged 104. Which conclusion follows from the data alone?', '[{"id":"a","text":"On average, users of the official materials scored 8 points higher","correct":true},{"id":"b","text":"Using the official materials raises a candidate''s score by 8 points","correct":false},{"id":"c","text":"Every user of the materials outscored every non-user","correct":false},{"id":"d","text":"Most of the 800 candidates scored above 104","correct":false}]'::jsonb, 'a', 'Only the difference in group averages follows from the data. "Raises" claims causation; averages say nothing about every individual; and a group mean does not locate the median.', 'medium', 'Causation vs correlation', 'ef1366224fa17cbb', '{general_academic,prepdmat}'::text[], 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ef1366224fa17cbb'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'A firm has fixed costs of ₹60,000 per month. Each unit sells for ₹50 and costs ₹30 to produce. What is the monthly break-even quantity?', '[{"id":"a","text":"1,200 units","correct":false},{"id":"b","text":"2,000 units","correct":false},{"id":"c","text":"4,000 units","correct":false},{"id":"d","text":"3,000 units","correct":true}]'::jsonb, 'd', 'Contribution margin = 50 − 30 = ₹20 per unit. Q* = 60,000 ÷ 20 = 3,000 units. Dividing by price alone (60,000 ÷ 50 = 1,200) or by variable cost (60,000 ÷ 30 = 2,000) are both wrong — only the margin covers fixed costs.', 'medium', 'Break-even analysis', 'ed5f4cf28a286996', '{general_academic,prepdmat,business_admin}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"A firm''s fixed costs (rent, salaries, machinery) stay the same regardless of output, while variable costs are incurred per unit produced. If each unit sells at price p and costs v to make, the difference p − v is the contribution margin: what each sale contributes toward covering fixed costs F. The break-even quantity is the output at which total revenue exactly equals total cost: Q* = F ÷ (p − v). Below Q* the firm makes a loss; above it, a profit.","passage_title":"Passage A · Business Administration: Break-even analysis"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ed5f4cf28a286996'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'Which change lowers a firm''s break-even quantity?', '[{"id":"a","text":"A rise in fixed costs","correct":false},{"id":"b","text":"A rise in variable cost per unit","correct":false},{"id":"c","text":"A rise in the selling price","correct":true},{"id":"d","text":"A fall in the selling price","correct":false}]'::jsonb, 'c', 'Q* = F ÷ (p − v). A higher selling price widens the contribution margin (the denominator), so fewer units are needed to cover fixed costs. Higher F raises Q*; higher v or lower p shrink the margin and raise Q* too.', 'medium', 'Break-even analysis', '33e188ecc447a154', '{general_academic,prepdmat,business_admin}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"A firm''s fixed costs (rent, salaries, machinery) stay the same regardless of output, while variable costs are incurred per unit produced. If each unit sells at price p and costs v to make, the difference p − v is the contribution margin: what each sale contributes toward covering fixed costs F. The break-even quantity is the output at which total revenue exactly equals total cost: Q* = F ÷ (p − v). Below Q* the firm makes a loss; above it, a profit.","passage_title":"Passage A · Business Administration: Break-even analysis"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '33e188ecc447a154'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'Price and variable cost per unit both increase by exactly ₹5. What happens to the break-even quantity?', '[{"id":"a","text":"It rises","correct":false},{"id":"b","text":"It stays the same","correct":true},{"id":"c","text":"It falls","correct":false},{"id":"d","text":"It cannot be determined","correct":false}]'::jsonb, 'b', 'The contribution margin is (p + 5) − (v + 5) = p − v — unchanged. Since F is also unchanged, Q* is identical.', 'hard', 'Break-even analysis', '8a8f66c6204e108c', '{general_academic,prepdmat,business_admin}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"A firm''s fixed costs (rent, salaries, machinery) stay the same regardless of output, while variable costs are incurred per unit produced. If each unit sells at price p and costs v to make, the difference p − v is the contribution margin: what each sale contributes toward covering fixed costs F. The break-even quantity is the output at which total revenue exactly equals total cost: Q* = F ÷ (p − v). Below Q* the firm makes a loss; above it, a profit.","passage_title":"Passage A · Business Administration: Break-even analysis"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8a8f66c6204e108c'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'A solid block has a mass of 400 g and a volume of 500 cm³. What fraction of the block is below the surface when it floats in fresh water?', '[{"id":"a","text":"20%","correct":false},{"id":"b","text":"80%","correct":true},{"id":"c","text":"50%","correct":false},{"id":"d","text":"100%","correct":false}]'::jsonb, 'b', 'Density = 400 ÷ 500 = 0.8 g/cm³. Submerged fraction = 0.8 ÷ 1.0 = 80%. The 20% option is the part above water.', 'medium', 'Density and flotation', '16db5c9879c4227c', '{general_academic,prepdmat,natural_sciences}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"Density is mass per volume: ρ = m ÷ V. An object placed in a fluid floats if its average density is lower than the fluid''s, and sinks if it is higher. A floating object displaces exactly enough fluid to support its weight, so the fraction of its volume below the surface equals the ratio of the densities: object ÷ fluid. Fresh water has a density of 1.0 g/cm³.","passage_title":"Passage B · Natural Sciences: Density and flotation"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '16db5c9879c4227c'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'The same block (density 0.8 g/cm³) is moved from fresh water into denser seawater (1.05 g/cm³). What happens?', '[{"id":"a","text":"It sinks deeper into the water","correct":false},{"id":"b","text":"Exactly the same fraction is submerged","correct":false},{"id":"c","text":"It sinks completely","correct":false},{"id":"d","text":"It floats higher — a smaller fraction is submerged","correct":true}]'::jsonb, 'd', 'Submerged fraction = 0.8 ÷ 1.05 ≈ 76%, less than the 80% in fresh water. A denser fluid supports the same weight with less displaced volume.', 'medium', 'Density and flotation', 'cfc5371da1646032', '{general_academic,prepdmat,natural_sciences}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"Density is mass per volume: ρ = m ÷ V. An object placed in a fluid floats if its average density is lower than the fluid''s, and sinks if it is higher. A floating object displaces exactly enough fluid to support its weight, so the fraction of its volume below the surface equals the ratio of the densities: object ÷ fluid. Fresh water has a density of 1.0 g/cm³.","passage_title":"Passage B · Natural Sciences: Density and flotation"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'cfc5371da1646032'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'Objects A and B have equal mass, but A has twice the volume of B. Which statement follows?', '[{"id":"a","text":"A''s density is twice B''s","correct":false},{"id":"b","text":"Their densities are equal","correct":false},{"id":"c","text":"A''s density is half of B''s","correct":true},{"id":"d","text":"It cannot be determined from the given information","correct":false}]'::jsonb, 'c', 'ρ = m ÷ V: same numerator, double the denominator → half the density.', 'medium', 'Density and flotation', 'f9d42daa2223e796', '{general_academic,prepdmat,natural_sciences}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"Density is mass per volume: ρ = m ÷ V. An object placed in a fluid floats if its average density is lower than the fluid''s, and sinks if it is higher. A floating object displaces exactly enough fluid to support its weight, so the fraction of its volume below the surface equals the ratio of the densities: object ÷ fluid. Fresh water has a density of 1.0 g/cm³.","passage_title":"Passage B · Natural Sciences: Density and flotation"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'f9d42daa2223e796'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'A university surveys students found in the library at 9 a.m. about campus-wide study habits. What is the main weakness?', '[{"id":"a","text":"The sample is too small to compute percentages","correct":false},{"id":"b","text":"Library visitors at 9 a.m. may differ systematically from the student body","correct":true},{"id":"c","text":"The question wording was leading","correct":false},{"id":"d","text":"It proves nothing because correlation implies causation","correct":false}]'::jsonb, 'b', 'This is a convenience sample: early-morning library users are plausibly more studious than average, so generalising to all students is unsafe.', 'medium', 'Sampling and study design', 'a1cdf0f7ecc58204', '{general_academic,prepdmat,research_methods}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"Conclusions from a study are only as good as its design. A random sample gives every member of the population an equal chance of inclusion, so results can be generalised. A convenience or self-selected sample — whoever is nearby or chooses to respond — may differ systematically from the population. Observational data can show that two things are associated, but a causal claim requires an experiment in which researchers assign participants to conditions at random, so that no hidden third factor explains the difference.","passage_title":"Passage C · Research Methods: Sampling and study design"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a1cdf0f7ecc58204'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'What distinguishes a randomised experiment from an observational study?', '[{"id":"a","text":"Treatment is assigned at random by the researchers, which supports causal conclusions","correct":true},{"id":"b","text":"It always includes more participants","correct":false},{"id":"c","text":"It always runs for a longer period","correct":false},{"id":"d","text":"It does not need a control group","correct":false}]'::jsonb, 'a', 'Random assignment balances hidden factors across groups, so a difference in outcomes can be attributed to the treatment.', 'medium', 'Sampling and study design', 'ea6215b6419912b4', '{general_academic,prepdmat,research_methods}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"Conclusions from a study are only as good as its design. A random sample gives every member of the population an equal chance of inclusion, so results can be generalised. A convenience or self-selected sample — whoever is nearby or chooses to respond — may differ systematically from the population. Observational data can show that two things are associated, but a causal claim requires an experiment in which researchers assign participants to conditions at random, so that no hidden third factor explains the difference.","passage_title":"Passage C · Research Methods: Sampling and study design"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ea6215b6419912b4'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'A fitness app finds that members who log meals lose more weight. What would be needed to support the claim that logging meals causes weight loss?', '[{"id":"a","text":"A much larger sample of app members","correct":false},{"id":"b","text":"Random assignment of members to logging and non-logging groups","correct":true},{"id":"c","text":"Repeating the same survey a year later","correct":false},{"id":"d","text":"More precise measurement of weight","correct":false}]'::jsonb, 'b', 'The association could reflect motivation: disciplined members both log meals and diet harder. Only random assignment removes that confound.', 'hard', 'Sampling and study design', 'a4bf2f6dba841144', '{general_academic,prepdmat,research_methods}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"Conclusions from a study are only as good as its design. A random sample gives every member of the population an equal chance of inclusion, so results can be generalised. A convenience or self-selected sample — whoever is nearby or chooses to respond — may differ systematically from the population. Observational data can show that two things are associated, but a causal claim requires an experiment in which researchers assign participants to conditions at random, so that no hidden third factor explains the difference.","passage_title":"Passage C · Research Methods: Sampling and study design"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a4bf2f6dba841144'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'A newspaper invites readers to vote online on a policy; 78% of the 100,000 votes oppose it. Why can''t this result be generalised to the whole population?', '[{"id":"a","text":"The sample is too small","correct":false},{"id":"b","text":"Percentages cannot be calculated from online votes","correct":false},{"id":"c","text":"No reason — a large sample generalises automatically","correct":false},{"id":"d","text":"Readers who choose to vote may differ systematically from the general population","correct":true}]'::jsonb, 'd', '100,000 is plenty — the flaw is self-selection: people with strong opinions choose to vote. A biased sampling method is not cured by size.', 'medium', 'Sampling and study design', '8e00fb32b7c12c78', '{general_academic,prepdmat,research_methods}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"Conclusions from a study are only as good as its design. A random sample gives every member of the population an equal chance of inclusion, so results can be generalised. A convenience or self-selected sample — whoever is nearby or chooses to respond — may differ systematically from the population. Observational data can show that two things are associated, but a causal claim requires an experiment in which researchers assign participants to conditions at random, so that no hidden third factor explains the difference.","passage_title":"Passage C · Research Methods: Sampling and study design"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8e00fb32b7c12c78'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id, visual_data)
SELECT 'general_academic', 'Which option states the effect of each change on the break-even quantity Q* correctly?', '[{"id":"a","text":"Higher fixed costs raise Q*; a higher selling price raises Q*; a higher variable cost lowers Q*","correct":false},{"id":"b","text":"Higher fixed costs raise Q*; a higher selling price lowers Q*; a higher variable cost raises Q*","correct":true},{"id":"c","text":"Higher fixed costs lower Q*; a higher selling price lowers Q*; a higher variable cost raises Q*","correct":false},{"id":"d","text":"Higher fixed costs raise Q*; a higher selling price lowers Q*; a higher variable cost lowers Q*","correct":false}]'::jsonb, 'b', 'Everything follows from Q* = F ÷ (p − v). Raising F raises Q*. Raising p widens the margin and lowers Q*. Raising v narrows the margin and raises Q*.', 'hard', 'Break-even analysis', '6995bbab040a3c89', '{general_academic,prepdmat,business_admin}'::text[], 120, '33333333-3333-3333-3333-333333333333', '{"type":"passage","passage":"A firm''s fixed costs (rent, salaries, machinery) stay the same regardless of output, while variable costs are incurred per unit produced. If each unit sells at price p and costs v to make, the difference p − v is the contribution margin: what each sale contributes toward covering fixed costs F. The break-even quantity is the output at which total revenue exactly equals total cost: Q* = F ÷ (p − v). Below Q* the firm makes a loss; above it, a profit.","passage_title":"Passage A · Business Administration: Break-even analysis"}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '6995bbab040a3c89'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'general_academic', 'A laboratory records the yield of a reaction at four temperatures:

30°C: 41%
40°C: 58%
50°C: 66%
60°C: 64%

Which statement does the data best support?', '[{"id":"a","text":"Yield rises without limit as temperature increases","correct":false},{"id":"b","text":"Yield peaks somewhere between 50°C and 60°C","correct":true},{"id":"c","text":"Yield is directly proportional to temperature","correct":false},{"id":"d","text":"Yield is unaffected by temperature","correct":false}]'::jsonb, 'b', 'Yield climbs from 30°C to 50°C but falls again by 60°C, so it must turn over between those last two readings.', 'medium', 'Data interpretation', '4e44e55425363931', '{general_academic,admitverse,natural_sciences}'::text[], 120, '44444444-4444-4444-4444-444444444444'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '4e44e55425363931'
);

INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, subtopic, content_hash, tags, time_estimate_seconds, source_id)
SELECT 'general_academic', 'A department finds that students who attended an optional weekly tutorial scored on average 12 marks higher in the final exam, and concludes the tutorial raises marks. Which finding would most weaken that conclusion?', '[{"id":"a","text":"Students who chose to attend already had higher marks in the previous year","correct":true},{"id":"b","text":"The tutorial was taught by the same lecturer as the course","correct":false},{"id":"c","text":"Both groups sat the identical final exam","correct":false},{"id":"d","text":"Attendance was recorded electronically","correct":false}]'::jsonb, 'a', 'If the attendees were already stronger, the 12-mark gap may reflect who chose to attend rather than any effect of the tutorial — the groups were not comparable to begin with.', 'hard', 'Causation and confounding', '53da1766eb826b5d', '{general_academic,admitverse,research_methods}'::text[], 120, '44444444-4444-4444-4444-444444444444'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '53da1766eb826b5d'
);
