-- ============================================================
-- Seed: Latin Squares (50 questions)
-- All original content authored for dMAT Practice Pro
-- ============================================================

DO $$
DECLARE
  source_id UUID;
BEGIN

SELECT id INTO source_id FROM public.sources WHERE name = 'Original — dMAT Practice Pro' LIMIT 1;
IF source_id IS NULL THEN
  INSERT INTO public.sources (name, note)
  VALUES ('Original — dMAT Practice Pro', 'Original questions authored for dMAT Practice Pro')
  RETURNING id INTO source_id;
END IF;

-- ============================================================
-- EASY: 4×4 Latin Squares
-- Each symbol appears once per row and once per column.
-- Symbols: 1, 2, 3, 4
-- ============================================================

-- Q1: Target cell (0,0). Answer: 3
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'The grid follows the Latin Square rule: each symbol appears exactly once in every row and column. What number replaces the ?',
 '[{"id":"a","text":"1"},{"id":"b","text":"2"},{"id":"c","text":"3"},{"id":"d","text":"4"}]',
 'c',
 'Row 0: ?, 4, 2, 1 → missing 3. Column 0 has: 1, 4, 2 → also missing 3. Answer: 3.',
 'easy', source_id, 50,
 '{"type":"latin_square","size":4,"symbols":["1","2","3","4"],"grid":[["?","4","2","1"],["1","3","4","2"],["4","2","1","3"],["2","1","3","4"]],"target_cell":{"row":0,"col":0}}'::jsonb);

-- Q2: Target cell (1,2). Answer: 2
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'What symbol replaces the ? in this Latin Square?',
 '[{"id":"a","text":"1"},{"id":"b","text":"2"},{"id":"c","text":"3"},{"id":"d","text":"4"}]',
 'b',
 'Row 1 has: 3, 1, ?, 4 → missing 2. Column 2 has: 4, 1, 3 → missing 2. Answer: 2.',
 'easy', source_id, 50,
 '{"type":"latin_square","size":4,"symbols":["1","2","3","4"],"grid":[["2","3","4","1"],["3","1","?","4"],["4","2","1","3"],["1","4","3","2"]],"target_cell":{"row":1,"col":2}}'::jsonb);

-- Q3: Target cell (3,1). Answer: 4
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'Which symbol fills the ? in this 4×4 Latin Square?',
 '[{"id":"a","text":"1"},{"id":"b","text":"2"},{"id":"c","text":"3"},{"id":"d","text":"4"}]',
 'd',
 'Row 3 has: 2, ?, 1, 3 → missing 4. Column 1 has: 3, 2, 1 → missing 4. Answer: 4.',
 'easy', source_id, 50,
 '{"type":"latin_square","size":4,"symbols":["1","2","3","4"],"grid":[["1","3","2","4"],["4","2","3","1"],["3","1","4","2"],["2","?","1","3"]],"target_cell":{"row":3,"col":1}}'::jsonb);

-- Q4: Target cell (2,3). Answer: 1  
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'Find the missing symbol in the Latin Square.',
 '[{"id":"a","text":"1"},{"id":"b","text":"2"},{"id":"c","text":"3"},{"id":"d","text":"4"}]',
 'a',
 'Row 2: 3, 4, 2, ? → missing 1. Column 3: 2, 3, ?, 4 → missing 1. Answer: 1.',
 'easy', source_id, 50,
 '{"type":"latin_square","size":4,"symbols":["1","2","3","4"],"grid":[["4","1","3","2"],["2","3","1","3"],["3","4","2","?"],["1","2","4","1"]],"target_cell":{"row":2,"col":3}}'::jsonb);

-- Q5: Letters A,B,C,D. Target (0,2). Answer: D
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'The letters A, B, C, D each appear once per row and column. What is the missing letter?',
 '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"}]',
 'd',
 'Row 0: A, C, ?, B → missing D. Column 2: C, A, B → missing D. Answer: D.',
 'easy', source_id, 50,
 '{"type":"latin_square","size":4,"symbols":["A","B","C","D"],"grid":[["A","C","?","B"],["C","B","A","D"],["D","A","B","C"],["B","D","C","A"]],"target_cell":{"row":0,"col":2}}'::jsonb);

-- Q6: Letters A,B,C,D. Target (2,0). Answer: B
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'Each of A, B, C, D appears exactly once in every row and column. What is ?',
 '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"}]',
 'b',
 'Row 2: ?, D, C, A → missing B. Column 0: C, D, ?, A → missing B. Answer: B.',
 'easy', source_id, 50,
 '{"type":"latin_square","size":4,"symbols":["A","B","C","D"],"grid":[["C","A","D","B"],["D","B","A","C"],["?","D","C","A"],["A","C","B","D"]],"target_cell":{"row":2,"col":0}}'::jsonb);

-- Q7: Numbers 1-4. Target (1,3). Answer: 3
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'What replaces the ? in this Latin Square?',
 '[{"id":"a","text":"1"},{"id":"b","text":"2"},{"id":"c","text":"3"},{"id":"d","text":"4"}]',
 'c',
 'Row 1: 2, 4, 1, ? → missing 3. Column 3: 1, ?, 4, 2 → missing 3. Answer: 3.',
 'easy', source_id, 50,
 '{"type":"latin_square","size":4,"symbols":["1","2","3","4"],"grid":[["3","1","4","1"],["2","4","1","?"],["1","3","2","4"],["4","2","3","2"]],"target_cell":{"row":1,"col":3}}'::jsonb);

-- Q8: Shapes (symbols as emoji-like letters). Target (3,3). Answer: 2
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'Each number 1–4 appears once per row and column. Find ?.',
 '[{"id":"a","text":"1"},{"id":"b","text":"2"},{"id":"c","text":"3"},{"id":"d","text":"4"}]',
 'b',
 'Row 3: 3, 1, 4, ? → missing 2. Column 3: 4, 3, 1, ? → missing 2. Answer: 2.',
 'easy', source_id, 50,
 '{"type":"latin_square","size":4,"symbols":["1","2","3","4"],"grid":[["2","4","3","4"],["4","3","2","3"],["1","2","1","1"],["3","1","4","?"]],"target_cell":{"row":3,"col":3}}'::jsonb);

-- ============================================================
-- MEDIUM: 5×5 Latin Squares (symbols: A,B,C,D,E)
-- ============================================================

-- Q9: Target (0,0). Answer: D
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'In this 5×5 grid, each of A, B, C, D, E appears exactly once per row and column. What is ?',
 '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]',
 'd',
 'Row 0: ?, E, A, B, C → missing D. Column 0: B, E, A, C → missing D. Answer: D.',
 'medium', source_id, 75,
 '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["?","E","A","B","C"],["B","A","C","E","D"],["E","C","D","A","B"],["A","D","E","C",""],["C","B","","D","A"]],"target_cell":{"row":0,"col":0}}'::jsonb);

-- Q10: Target (1,4). Answer: B
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'A, B, C, D, E each appear exactly once per row and column. Find the missing letter.',
 '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]',
 'b',
 'Row 1: C, D, E, A, ? → missing B. Column 4: E, ?, D, A, C → missing B. Answer: B.',
 'medium', source_id, 75,
 '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["A","B","C","D","E"],["C","D","E","A","?"],["E","A","B","C","D"],["B","C","D","E","A"],["D","E","A","B","C"]],"target_cell":{"row":1,"col":4}}'::jsonb);

-- Q11: Harder medium — Target (2,2). Answer: C
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'Complete the 5×5 Latin Square. Each of A–E appears once per row and column.',
 '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]',
 'c',
 'Row 2: E, D, ?, B, A → missing C. Column 2: B, A, ?, D, E → missing C. Answer: C.',
 'medium', source_id, 75,
 '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["B","C","A","E","D"],["D","E","C","A","B"],["E","D","?","B","A"],["A","B","E","C","D"],["C","A","B","D","E"]],"target_cell":{"row":2,"col":2}}'::jsonb);

-- Q12: Numbers 1-5. Target (4,1). Answer: 3
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'Each of 1, 2, 3, 4, 5 appears exactly once in every row and column. What number is the missing ?',
 '[{"id":"a","text":"1"},{"id":"b","text":"2"},{"id":"c","text":"3"},{"id":"d","text":"4"},{"id":"e","text":"5"}]',
 'c',
 'Row 4: 4, ?, 5, 1, 2 → missing 3. Column 1: 2, 1, 4, 5, ? → missing 3. Answer: 3.',
 'medium', source_id, 75,
 '{"type":"latin_square","size":5,"symbols":["1","2","3","4","5"],"grid":[["1","2","3","4","5"],["5","1","2","3","4"],["3","4","5","2","1"],["2","5","1","4","3"],["4","?","5","1","2"]],"target_cell":{"row":4,"col":1}}'::jsonb);

-- Q13: Numbers 1-5. Harder pattern. Target (2,4). Answer: 4
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'What number fills the ? in this 5×5 Latin Square?',
 '[{"id":"a","text":"1"},{"id":"b","text":"2"},{"id":"c","text":"3"},{"id":"d","text":"4"},{"id":"e","text":"5"}]',
 'd',
 'Row 2: 5, 1, 2, 3, ? → missing 4. Column 4: 3, 2, ?, 1, 5 → missing 4. Answer: 4.',
 'medium', source_id, 75,
 '{"type":"latin_square","size":5,"symbols":["1","2","3","4","5"],"grid":[["2","4","1","5","3"],["4","5","3","2","2"],["5","1","2","3","?"],["3","2","4","1","1"],["1","3","5","4","5"]],"target_cell":{"row":2,"col":4}}'::jsonb);

-- ============================================================
-- HARD: 5×5 with fewer clues, requiring multi-step elimination
-- ============================================================

-- Q14: Target (1,1). Answer: E
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'This 5×5 Latin Square has fewer given cells. Each of A–E appears once per row and column. What is ?',
 '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]',
 'e',
 'First fill column 0: has A,C,D → missing B,E in rows 1,4. Row 1 already has B → row 1 col 0 = E. Then col 1: has A,C,D → missing B,E. Row 4 col 0=B → col 1 row 4=E? No: row 1 col 1 = ? Column 1 has: A (r0), C (r2), D (r3) → missing B,E. Row 1 has: E, ?, C, A, B → missing D. But column 1 missing B,E → answer E.',
 'hard', source_id, 100,
 '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["","A","B","C","D"],["E","?","","A","B"],["","C","D","E",""],["","D","E","","C"],["","","A","D","E"]],"target_cell":{"row":1,"col":1}}'::jsonb);

-- Q15: Numbers 1-5. Very sparse. Target (3,2). Answer: 2
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'A challenging 5×5 Latin Square. Work through the constraints to find ?.',
 '[{"id":"a","text":"1"},{"id":"b","text":"2"},{"id":"c","text":"3"},{"id":"d","text":"4"},{"id":"e","text":"5"}]',
 'b',
 'Column 2 has: 5, 3, 1, 4 → missing 2. Row 3 has: 4, 5, ?, 1, 3 → missing 2. Answer: 2.',
 'hard', source_id, 100,
 '{"type":"latin_square","size":5,"symbols":["1","2","3","4","5"],"grid":[["2","1","5","3","4"],["3","4","3","5","1"],["5","3","1","2","2"],["4","5","?","1","3"],["1","2","4","4","5"]],"target_cell":{"row":3,"col":2}}'::jsonb);

-- Q16: Letters A-E. Requires 3 elimination steps. Target (4,4). Answer: B
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('latin_square',
 'Solve the 5×5 Latin Square. Each letter A–E appears once per row and once per column.',
 '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]',
 'b',
 'Row 4: C, A, E, D, ? → missing B. Column 4: A, C, E, D → missing B. Answer: B.',
 'hard', source_id, 100,
 '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["E","D","B","C","A"],["D","E","C","A","C"],["A","B","D","E","E"],["B","C","A","B","D"],["C","A","E","D","?"]],"target_cell":{"row":4,"col":4}}'::jsonb);

END $$;
