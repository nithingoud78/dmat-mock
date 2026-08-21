-- PREPDMAT IMPORT MIGRATION
-- Generated: 2026-08-21T08:01:37.918Z


INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', '6 + A = 13
B − A = 5

What is B?', '[{"id":"a","text":"10"},{"id":"b","text":"13"},{"id":"c","text":"11"},{"id":"d","text":"12"}]'::jsonb, 'd', 'First equation: A = 13 − 6 = 7. Substitute into the second: B − 7 = 5 → B = 12.',
  'easy', NULL, 'Algebraic Systems', '5ebc2ee96c405814',
  '{math_equation,easy}', 60, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '5ebc2ee96c405814'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', '3 × C = A
A + C = 16
B = A + C − 6

What is B?', '[{"id":"a","text":"12"},{"id":"b","text":"10"},{"id":"c","text":"8"},{"id":"d","text":"16"}]'::jsonb, 'b', 'Replace A with 3C in the second equation: 3C + C = 16 → C = 4, so A = 12. Then B = 12 + 4 − 6 = 10.',
  'medium', NULL, 'Algebraic Systems', 'b86fe4218e5759bc',
  '{math_equation,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'b86fe4218e5759bc'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', 'A = 5 × B
C = B + 9
A − B + C − D = 12
D = 3 × B + 1

What is D?', '[{"id":"a","text":"9"},{"id":"b","text":"5"},{"id":"c","text":"7"},{"id":"d","text":"11"}]'::jsonb, 'c', 'Substitute everything into the third equation: 5B − B + (B + 9) − (3B + 1) = 12 → 2B + 8 = 12 → B = 2. Then D = 3 × 2 + 1 = 7. (And A = 10, C = 11 — all within 1–20.)',
  'hard', NULL, 'Algebraic Systems', 'd64bcd0f872ca0cd',
  '{math_equation,hard}', 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'd64bcd0f872ca0cd'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', 'B = C ÷ 4
A = B + C
A − B = 12

What is A?', '[{"id":"a","text":"15"},{"id":"b","text":"12"},{"id":"c","text":"3"},{"id":"d","text":"9"}]'::jsonb, 'a', 'Substitution, one step at a time. The second and third equations together give (B + C) − B = 12, so C = 12 directly. The first then gives B = 12 ÷ 4 = 3, and A = B + C = 3 + 12 = 15. Watch the division: the answer has to stay a whole number between 1 and 20, which is what fixes C at 12 rather than any other multiple of 4. The distractors are C, B, and the slip C − B.',
  'medium', NULL, 'Algebraic Systems', '5d9c66bc55743844',
  '{math_equation,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '5d9c66bc55743844'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', 'A + 3 = B
D = 2 × A
C = D − B
C = 4

What is B?', '[{"id":"a","text":"7"},{"id":"b","text":"10"},{"id":"c","text":"14"},{"id":"d","text":"13"}]'::jsonb, 'b', 'Since C = 4, the third equation gives D − B = 4. Substitute D = 2A and B = A + 3: 2A − A − 3 = 4 → A = 7. So B = 10 (and D = 14). Notice the habit: substitute everything into the one equation with a known value.',
  'medium', NULL, 'Algebraic Systems', '1bb1085008941326',
  '{math_equation,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '1bb1085008941326'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', 'A − 4 = B
A + B = 14

What is B?', '[{"id":"a","text":"5"},{"id":"b","text":"9"},{"id":"c","text":"4"},{"id":"d","text":"7"}]'::jsonb, 'a', 'From the first equation A = B + 4, so (B + 4) + B = 14 → B = 5 (and A = 9).',
  'easy', NULL, 'Algebraic Systems', '8ac31bfff7965219',
  '{math_equation,easy}', 60, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8ac31bfff7965219'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', 'C = A + B
A = 2 × B
C = 9

What is A?', '[{"id":"a","text":"3"},{"id":"b","text":"9"},{"id":"c","text":"6"},{"id":"d","text":"4"}]'::jsonb, 'c', 'Substitute A = 2B into the first equation: 2B + B = 9 → B = 3, so A = 6.',
  'medium', NULL, 'Algebraic Systems', '42a0f913e4a324de',
  '{math_equation,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '42a0f913e4a324de'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', 'B ÷ A = 4
B − A = 12

What is B?', '[{"id":"a","text":"16"},{"id":"b","text":"12"},{"id":"c","text":"8"},{"id":"d","text":"20"}]'::jsonb, 'a', 'B = 4A, so 4A − A = 12 → A = 4 and B = 16.',
  'medium', NULL, 'Algebraic Systems', 'f4ebfc7ee819d2f2',
  '{math_equation,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'f4ebfc7ee819d2f2'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', 'A + B + C = 22
B = A + 2
C = 3 × A

What is C?', '[{"id":"a","text":"6"},{"id":"b","text":"16"},{"id":"c","text":"10"},{"id":"d","text":"12"}]'::jsonb, 'd', 'Substitute everything into the first: A + (A + 2) + 3A = 22 → 5A = 20 → A = 4, so C = 12 (and B = 6).',
  'medium', NULL, 'Algebraic Systems', '7bf107e80bf56454',
  '{math_equation,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '7bf107e80bf56454'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', 'D − C = 5
C = 2 × B
A = B + C + D
B = 2

What is A?', '[{"id":"a","text":"13"},{"id":"b","text":"17"},{"id":"c","text":"15"},{"id":"d","text":"11"}]'::jsonb, 'c', 'Start from the known value: B = 2 gives C = 4, then D = 9, so A = 2 + 4 + 9 = 15. Always anchor on the equation that already contains a number.',
  'medium', NULL, 'Algebraic Systems', '739258de5275ee66',
  '{math_equation,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '739258de5275ee66'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', 'C − B + D − A = 13
8 × A = C
3 × A = D
A + 5 = B

What is C?', '[{"id":"a","text":"16"},{"id":"b","text":"24"},{"id":"c","text":"12"},{"id":"d","text":"18"}]'::jsonb, 'a', 'There is no equation here that hands you a number outright — the official materials'' hardest equation exercise is built exactly this way, and the technique is always the same: pick the letter every other equation depends on and write everything in terms of it. Here that letter is A. C = 8A, D = 3A, B = A + 5. Substitute into the long equation: 8A − (A + 5) + 3A − A = 13, which is 9A − 5 = 13, so A = 2. Then C = 16 (and B = 7, D = 6 — all inside 1–20, as the format guarantees). 24 is 8 × 3 — multiplying the two coefficients instead of solving; 12 answers for D + wrong A; 18 comes from dropping the −5 when you collect terms.',
  'hard', NULL, 'Algebraic Systems', '7a493b09087cd94e',
  '{math_equation,hard}', 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '7a493b09087cd94e'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', '3 × A − B = 7
A + 2 × B = 14
C = A + B
D = 2 × C − A

What is D?', '[{"id":"a","text":"14"},{"id":"b","text":"9"},{"id":"c","text":"5"},{"id":"d","text":"13"}]'::jsonb, 'a', 'No equation hands you a letter outright, so the first two have to be solved together. Double the first (6A − 2B = 14) and add the second (A + 2B = 14): 7A = 28, so A = 4, and then B = 5 from either one. C = A + B = 9, and D = 2 × C − A = 18 − 4 = 14. Every value stays inside 1–20. The tempting wrong answers are the other letters you solve on the way — 9 is C and 5 is B, both correct numbers to the wrong question.',
  'hard', NULL, 'Algebraic Systems', 'f979a40bf8b4cf5b',
  '{math_equation,hard}', 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'f979a40bf8b4cf5b'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'math_equation', 'A + B = 9
B + C = 13
A + C = 10
D = C − A

What is D?', '[{"id":"a","text":"4"},{"id":"b","text":"7"},{"id":"c","text":"3"},{"id":"d","text":"6"}]'::jsonb, 'a', 'Three equations, three letters, and none of them isolated — the standard route is to add all three: (A+B) + (B+C) + (A+C) = 9 + 13 + 10 = 32, which is 2 × (A + B + C), so A + B + C = 16. Subtracting each original equation from that total gives the missing letter each time: C = 16 − 9 = 7, A = 16 − 13 = 3, B = 16 − 10 = 6. Then D = C − A = 7 − 3 = 4. The distractors are A, B and C themselves.',
  'hard', NULL, 'Algebraic Systems', 'e0083b33f8cd68e8',
  '{math_equation,hard}', 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'e0083b33f8cd68e8'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter replaces the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'b', 'Look at column 1: it already contains E, A, D and C. The only letter missing is B.',
  'easy', '{"grid":[["?","C","D","?","?"],["E","A","B","?","?"],["A","B","C","E","D"],["D","?","?","C","?"],["C","?","?","?","A"]]}'::jsonb, 'Grid Logic', 'eb52e7c7d3b4169e',
  '{latin_square,easy}', 60, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'eb52e7c7d3b4169e'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter replaces the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'c', 'Column 1 already has E and B, so the ? can only be A, C or D. Look at row 4 (A, E, C given): it still needs B and D, and its column-1 cell can''t be B (column 1 already has one) — so that cell takes D. Now row 2: it already contains A, ruling A out for the ?. Only C remains.',
  'medium', '{"grid":[["E","D","C","?","A"],["?","?","?","A","?"],["B","?","?","D","?"],["?","A","E","C","?"],["?","?","?","E","?"]]}'::jsonb, 'Grid Logic', 'c50a1afed17c138f',
  '{latin_square,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'c50a1afed17c138f'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter replaces the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'e', 'Column 3 already shows D, A and C — only B and E are missing, split between the ? and the bottom cell. Row 5 already contains E, so the bottom cell of column 3 must take B. That forces the ? to be E. Two steps, no guessing.',
  'easy', '{"grid":[["?","?","D","?","?"],["?","?","A","?","B"],["A","B","C","?","E"],["?","?","?","A","?"],["?","A","?","E","?"]]}'::jsonb, 'Grid Logic', '8ef9d1ac944c8e21',
  '{latin_square,easy}', 60, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8ef9d1ac944c8e21'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter replaces the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'c', 'Row 2 already contains E, A and B; column 4 adds E and D. Four letters excluded — only C fits.',
  'easy', '{"grid":[["?","C","?","?","D"],["E","A","?","?","B"],["?","?","B","?","C"],["B","?","C","E","A"],["C","?","?","D","E"]]}'::jsonb, 'Grid Logic', 'fdf0efcc5da6bdd0',
  '{latin_square,easy}', 60, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'fdf0efcc5da6bdd0'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter replaces the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'd', 'Column 5 contains B, C and A; row 5 adds B, A and E. The union rules out A, B, C and E — only D fits.',
  'easy', '{"grid":[["D","A","?","C","B"],["?","?","?","?","C"],["?","E","?","?","A"],["?","C","D","B","?"],["?","B","A","E","?"]]}'::jsonb, 'Grid Logic', '7307e5e7d9739e9a',
  '{latin_square,easy}', 60, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '7307e5e7d9739e9a'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter replaces the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'd', 'Row 4 still needs C and D, split between the ? and its column-3 cell. Column 3 already has a D (row 2), so the column-3 cell must take C — leaving D for the ?.',
  'easy', '{"grid":[["D","?","?","E","?"],["?","A","D","B","E"],["B","?","?","D","?"],["E","?","?","A","B"],["A","?","?","?","?"]]}'::jsonb, 'Grid Logic', '03aba1f48a988fd2',
  '{latin_square,easy}', 60, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '03aba1f48a988fd2'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter replaces the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'c', 'Row 2 and column 2 together narrow the ? to A or C. Now test A: following the forced cells through columns 4 and 5 runs into a dead end — the grid can''t complete. Only C works. On hard items, eliminate with the row-plus-column union first, then test the survivors.',
  'easy', '{"grid":[["E","D","B","?","A"],["D","?","E","?","?"],["?","?","D","?","?"],["?","E","A","?","C"],["?","B","?","?","?"]]}'::jsonb, 'Grid Logic', '0f811754bc89c375',
  '{latin_square,easy}', 60, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '0f811754bc89c375'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter replaces the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'd', 'Row 5 and column 1 between them exclude only B and C, so three letters are still possible at the ? — you cannot read this one off. Turn it round and ask where a letter is still allowed. Look down column 1: C has exactly one legal free field there, so place it. That fills a cell in row 2, and now D has exactly one legal free field left in row 2 — place that too. Finally run the same test along row 5: every other free field in that row sits in a column that already contains a D, so the ? is the only place left for it. Answer: D. This is the “hidden single” move the official materials demonstrate — what you reach for when simple row-and-column elimination stalls, and the difference between a square you can solve and one you end up guessing.',
  'hard', '{"grid":[["?","?","D","C","?"],["?","A","?","?","?"],["?","?","?","?","C"],["B","?","?","?","D"],["?","C","?","?","?"]]}'::jsonb, 'Grid Logic', 'ae9fcc83f071ce26',
  '{latin_square,hard}', 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ae9fcc83f071ce26'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter replaces the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'c', 'This grid needs 7 forced placements before the question mark itself is forced — the count is measured on the grid, not assigned by feel. Work the chain: fill every field that has only one letter left, and each fill removes a candidate somewhere else. After the seventh such placement the marked field has a single letter remaining, C. The official high exercises publish paths of six to seven steps, so this sits in that band.',
  'hard', '{"grid":[["?","?","?","D","?"],["?","D","?","A","?"],["?","B","E","?","?"],["?","C","D","E","?"],["?","A","C","B","D"]]}'::jsonb, 'Grid Logic', 'f6f9370e9ce629e5',
  '{latin_square,hard}', 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'f6f9370e9ce629e5'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter replaces the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'e', 'The longest chain in the bank: 9 forced placements are required before the marked field is determined, and the count is measured rather than assigned. Only ten fields are given, so the early steps come from letters that have exactly one legal field left in their row — the hidden single — rather than from fields with one candidate. Following that chain through, the marked field resolves to E.',
  'hard', '{"grid":[["?","?","?","A","?"],["?","?","A","?","D"],["E","D","C","?","A"],["?","?","?","?","?"],["?","A","E","?","C"]]}'::jsonb, 'Grid Logic', '96a1532d8bff8e98',
  '{latin_square,hard}', 120, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '96a1532d8bff8e98'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A standardised test reports results as percentile ranks: the percentage of all test takers whose score was equal to or lower than yours. In one sitting, 1,600 candidates take the test. Priya''s score is higher than 1,120 of them and equal to none. What is Priya''s percentile rank?', '[{"id":"a","text":"30"},{"id":"b","text":"70"},{"id":"c","text":"48"},{"id":"d","text":"75"}]'::jsonb, 'b', '1,120 of 1,600 scored lower → 1,120 ÷ 1,600 = 0.70. Percentile rank = 70: she did as well as or better than 70% of all candidates. This is exactly how your dMAT certificate reports results (plus a 0–200 score per module).',
  'medium', NULL, 'Reasoning', '619ebf476a094101',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '619ebf476a094101'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A learning study reports: of 240 students who used spaced practice, 168 passed their exam; of 160 students who crammed, 96 passed. Which statement follows from this data?', '[{"id":"a","text":"Spaced practice caused the higher pass rate"},{"id":"b","text":"Most students who passed had crammed"},{"id":"c","text":"Fewer than half of the crammers passed"},{"id":"d","text":"The pass rate was higher with spaced practice"}]'::jsonb, 'd', '168 ÷ 240 = 70% vs 96 ÷ 160 = 60% — the spaced-practice pass rate is higher, and that''s all the data supports. "Caused" is the classic trap: the data shows association, not causation (maybe stronger students choose spaced practice). Passers: 168 &gt; 96, so most passers did NOT cram; and 60% of crammers passing is more than half. Distinguishing what follows from what merely sounds plausible is the core General Academic Module skill.',
  'medium', NULL, 'Reasoning', '6932ec71aee78156',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '6932ec71aee78156'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A dMAT test city has 480 available seats across its centres, booked first-come-first-served. If about 5,000 candidates prefer that city, roughly what share of them will have to choose another city?', '[{"id":"a","text":"About 90%"},{"id":"b","text":"About 10%"},{"id":"c","text":"About 48%"},{"id":"d","text":"Cannot be determined"}]'::jsonb, 'a', '480 of 5,000 preferences can be satisfied: 480 ÷ 5,000 = 9.6% get seats, so roughly 90% must book elsewhere. ''Cannot be determined'' tempts because real demand is unknown — but the question says ''if about 5,000'', making the calculation valid under its own assumption. (This is also why you register early.)',
  'medium', NULL, 'Reasoning', 'e228721ee7bb4820',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'e228721ee7bb4820'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'The dMAT score scale runs 0–200 with a fixed mean of 100 per module. Priya scores 118 on the core module and 96 on the subject module. Which statement follows?', '[{"id":"a","text":"She answered 118 core questions correctly"},{"id":"b","text":"Her overall percentile must be above 50"},{"id":"c","text":"Her core result is above average; her subject result is below average"},{"id":"d","text":"Her subject performance failed the exam"}]'::jsonb, 'c', 'The 0–200 scale has mean 100, so 118 is above and 96 below average — that is all the scale tells you. The score is a conversion, not a raw count (rules out B); the percentile depends on the whole distribution (C); and the dMAT has no pass/fail (D).',
  'medium', NULL, 'Reasoning', '79f18833bddbed14',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '79f18833bddbed14'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'In a survey, 500 test takers who used official preparatory materials averaged 112, while 300 who didn''t averaged 104. Which conclusion follows from the data alone?', '[{"id":"a","text":"On average, users of the official materials scored 8 points higher"},{"id":"b","text":"Using the official materials raises a candidate''s score by 8 points"},{"id":"c","text":"Every user of the materials outscored every non-user"},{"id":"d","text":"Most of the 800 candidates scored above 104"}]'::jsonb, 'a', 'Only the difference in group averages follows from the data. ''Raises'' claims causation (motivated students may self-select into preparing); averages say nothing about every individual (C); and a group mean doesn''t locate the median (D).',
  'medium', NULL, 'Reasoning', '3df13c9099a3a770',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '3df13c9099a3a770'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A firm has fixed costs of ₹60,000 per month. Each unit sells for ₹50 and costs ₹30 to produce. What is the monthly break-even quantity?', '[{"id":"a","text":"1,200 units"},{"id":"b","text":"2,000 units"},{"id":"c","text":"4,000 units"},{"id":"d","text":"3,000 units"}]'::jsonb, 'd', 'Contribution margin = 50 − 30 = ₹20 per unit. Q* = 60,000 ÷ 20 = 3,000 units. The trap answers divide by the price alone (60,000 ÷ 50 = 1,200) or by the variable cost (60,000 ÷ 30 = 2,000) — both ignore that only the margin covers fixed costs.',
  'medium', NULL, 'Reasoning', '9524deb3c23e6000',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '9524deb3c23e6000'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Which change lowers a firm''s break-even quantity?', '[{"id":"a","text":"A rise in fixed costs"},{"id":"b","text":"A rise in variable cost per unit"},{"id":"c","text":"A rise in the selling price"},{"id":"d","text":"A fall in the selling price"}]'::jsonb, 'c', 'Q* = F ÷ (p − v). A higher selling price widens the contribution margin (the denominator), so fewer units are needed to cover fixed costs. Higher F raises Q*; higher v or lower p shrink the margin and raise Q* too.',
  'medium', NULL, 'Reasoning', 'a9c5fe953a724542',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a9c5fe953a724542'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Price and variable cost per unit both increase by exactly ₹5. What happens to the break-even quantity?', '[{"id":"a","text":"It rises"},{"id":"b","text":"It stays the same"},{"id":"c","text":"It falls"},{"id":"d","text":"It cannot be determined"}]'::jsonb, 'b', 'The contribution margin is (p + 5) − (v + 5) = p − v — unchanged. Since F is also unchanged, Q* is identical. The question tests whether you reason from the formula''s structure rather than recalculating blindly — exactly the transfer skill the module measures.',
  'medium', NULL, 'Reasoning', '1b7dd701b4792e3a',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '1b7dd701b4792e3a'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A solid block has a mass of 400 g and a volume of 500 cm³. What fraction of the block is below the surface when it floats in fresh water?', '[{"id":"a","text":"20%"},{"id":"b","text":"80%"},{"id":"c","text":"50%"},{"id":"d","text":"100%"}]'::jsonb, 'b', 'Density = 400 ÷ 500 = 0.8 g/cm³. Submerged fraction = 0.8 ÷ 1.0 = 80%. The 20% option is the part above water — read what the question asks. 100% would mean the block barely sinks, which needs density ≥ 1.0.',
  'medium', NULL, 'Reasoning', '1ea4405fd25cf2f6',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '1ea4405fd25cf2f6'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'The same block is moved from fresh water into denser seawater (1.05 g/cm³). What happens?', '[{"id":"a","text":"It sinks deeper into the water"},{"id":"b","text":"Exactly the same fraction is submerged"},{"id":"c","text":"It sinks completely"},{"id":"d","text":"It floats higher — a smaller fraction is submerged"}]'::jsonb, 'd', 'Submerged fraction = ρobject ÷ ρfluid = 0.8 ÷ 1.05 ≈ 76%, less than the 80% in fresh water. A denser fluid supports the same weight with less displaced volume — the reason ships ride higher in the sea than in a river.',
  'medium', NULL, 'Reasoning', 'deb3621569c86f5f',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'deb3621569c86f5f'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Objects A and B have equal mass, but A has twice the volume of B. Which statement follows?', '[{"id":"a","text":"A''s density is twice B''s"},{"id":"b","text":"Their densities are equal"},{"id":"c","text":"A''s density is half of B''s"},{"id":"d","text":"It cannot be determined from the given information"}]'::jsonb, 'c', 'ρ = m ÷ V: same numerator, double the denominator → half the density. No numbers are needed — the relationship alone answers it. "Cannot be determined" tempts because no masses are given, but the ratio is fully determined.',
  'medium', NULL, 'Reasoning', 'a5027c0dee6ef739',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a5027c0dee6ef739'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A university surveys students found in the library at 9 a.m. about campus-wide study habits. What is the main weakness?', '[{"id":"a","text":"The sample is too small to compute percentages"},{"id":"b","text":"Library visitors at 9 a.m. may differ systematically from the student body"},{"id":"c","text":"The question wording was leading"},{"id":"d","text":"It proves nothing because correlation implies causation"}]'::jsonb, 'b', 'This is a convenience sample: early-morning library users are plausibly more studious than average, so generalising to all students is unsafe. Nothing in the stem tells us the sample size or wording — don''t import weaknesses the text doesn''t state.',
  'medium', NULL, 'Reasoning', '5e7db4103bd73401',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '5e7db4103bd73401'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'What distinguishes a randomised experiment from an observational study?', '[{"id":"a","text":"Treatment is assigned at random by the researchers, which supports causal conclusions"},{"id":"b","text":"It always includes more participants"},{"id":"c","text":"It always runs for a longer period"},{"id":"d","text":"It does not need a control group"}]'::jsonb, 'a', 'Random assignment balances hidden factors across groups, so a difference in outcomes can be attributed to the treatment. Sample size and duration are separate design choices, and experiments typically rely on control groups rather than dropping them.',
  'medium', NULL, 'Reasoning', '379c6dafd7765556',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '379c6dafd7765556'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A fitness app finds that members who log meals lose more weight. What would be needed to support the claim that logging meals causes weight loss?', '[{"id":"a","text":"A much larger sample of app members"},{"id":"b","text":"Random assignment of members to logging and non-logging groups"},{"id":"c","text":"Repeating the same survey a year later"},{"id":"d","text":"More precise measurement of weight"}]'::jsonb, 'b', 'The association could reflect motivation: disciplined members both log meals and diet harder. Only random assignment removes that confound. A bigger sample, a repeat survey, or better scales make the association more precise — not causal.',
  'medium', NULL, 'Reasoning', 'b5aa16832523c14a',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'b5aa16832523c14a'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A newspaper invites readers to vote online on a policy; 78% of the 100,000 votes oppose it. Why can''t this result be generalised to the whole population?', '[{"id":"a","text":"The sample is too small"},{"id":"b","text":"Percentages cannot be calculated from online votes"},{"id":"c","text":"No reason — a large sample generalises automatically"},{"id":"d","text":"Readers who choose to vote may differ systematically from the general population"}]'::jsonb, 'd', '100,000 is plenty — the flaw is self-selection: people with strong opinions (and this newspaper''s readership) choose to vote. A biased sampling method isn''t cured by size; a small random sample beats a huge self-selected one.',
  'medium', NULL, 'Reasoning', '2dec889a36818034',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '2dec889a36818034'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, content_hash, 
  tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Which option states the effect of each change on the break-even quantity Q* correctly?', '[{"id":"a","text":"Higher fixed costs raise Q*; a higher selling price raises Q*; a higher variable cost lowers Q*"},{"id":"b","text":"Higher fixed costs raise Q*; a higher selling price lowers Q*; a higher variable cost raises Q*"},{"id":"c","text":"Higher fixed costs lower Q*; a higher selling price lowers Q*; a higher variable cost raises Q*"},{"id":"d","text":"Higher fixed costs raise Q*; a higher selling price lowers Q*; a higher variable cost lowers Q*"}]'::jsonb, 'b', 'Everything follows from Q* = F ÷ (p − v). Raising F raises the numerator, so Q* rises. Raising p widens the contribution margin p − v, so the denominator grows and Q* falls. Raising v narrows that margin, so Q* rises. Only one option gets all three right. This is the compound form the official module uses: several claims bundled into a single option, so a single wrong claim kills the whole option however plausible the rest of it reads — check every clause, not the first one that sounds right.',
  'medium', NULL, 'Reasoning', '99cdc28aebe3e78b',
  '{general_academic,medium}', 90, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '99cdc28aebe3e78b'
);
