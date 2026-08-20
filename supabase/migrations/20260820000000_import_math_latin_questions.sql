-- Migration: 20260820000000_import_math_latin_questions
-- Description: Import validated math equations and latin squares from PrepDMAT

DO $$
BEGIN

  INSERT INTO public.sources (id, name, url)
  VALUES ('7e94d90d-fe19-4c04-a4f0-74db59e5f97e', 'Original — dMAT Practice Pro', 'https://prepdmat.com/practice.html')
  ON CONFLICT (id) DO NOTHING;


  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is B?',
    '[{"id":"a","text":"10"},{"id":"b","text":"13"},{"id":"c","text":"11"},{"id":"d","text":"12"}]'::jsonb,
    'd',
    'First equation: A = 13 − 6 = 7. Substitute into the second: B − 7 = 5 → B = 12.',
    'easy',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    60,
    '{"type":"math_equation","equations":["6 + A = 13","B − A = 5"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is B?',
    '[{"id":"a","text":"12"},{"id":"b","text":"10"},{"id":"c","text":"8"},{"id":"d","text":"16"}]'::jsonb,
    'b',
    'Replace A with 3C in the second equation: 3C + C = 16 → C = 4, so A = 12. Then B = 12 + 4 − 6 = 10.',
    'medium',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    90,
    '{"type":"math_equation","equations":["3 × C = A","A + C = 16","B = A + C − 6"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is D?',
    '[{"id":"a","text":"9"},{"id":"b","text":"5"},{"id":"c","text":"7"},{"id":"d","text":"11"}]'::jsonb,
    'c',
    'Substitute everything into the third equation: 5B − B + (B + 9) − (3B + 1) = 12 → 2B + 8 = 12 → B = 2. Then D = 3 × 2 + 1 = 7. (And A = 10, C = 11 — all within 1–20.)',
    'hard',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    120,
    '{"type":"math_equation","equations":["A = 5 × B","C = B + 9","A − B + C − D = 12","D = 3 × B + 1"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is A?',
    '[{"id":"a","text":"15"},{"id":"b","text":"12"},{"id":"c","text":"3"},{"id":"d","text":"9"}]'::jsonb,
    'a',
    'Substitution, one step at a time. The second and third equations together give (B + C) − B = 12, so C = 12 directly. The first then gives B = 12 ÷ 4 = 3, and A = B + C = 3 + 12 = 15. Watch the division: the answer has to stay a whole number between 1 and 20, which is what fixes C at 12 rather than any other multiple of 4. The distractors are C, B, and the slip C − B.',
    'medium',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    90,
    '{"type":"math_equation","equations":["B = C ÷ 4","A = B + C","A − B = 12"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is B?',
    '[{"id":"a","text":"7"},{"id":"b","text":"10"},{"id":"c","text":"14"},{"id":"d","text":"13"}]'::jsonb,
    'b',
    'Since C = 4, the third equation gives D − B = 4. Substitute D = 2A and B = A + 3: 2A − A − 3 = 4 → A = 7. So B = 10 (and D = 14). Notice the habit: substitute everything into the one equation with a known value.',
    'medium',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    90,
    '{"type":"math_equation","equations":["A + 3 = B","D = 2 × A","C = D − B","C = 4"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is B?',
    '[{"id":"a","text":"5"},{"id":"b","text":"9"},{"id":"c","text":"4"},{"id":"d","text":"7"}]'::jsonb,
    'a',
    'From the first equation A = B + 4, so (B + 4) + B = 14 → B = 5 (and A = 9).',
    'easy',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    60,
    '{"type":"math_equation","equations":["A − 4 = B","A + B = 14"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is A?',
    '[{"id":"a","text":"3"},{"id":"b","text":"9"},{"id":"c","text":"6"},{"id":"d","text":"4"}]'::jsonb,
    'c',
    'Substitute A = 2B into the first equation: 2B + B = 9 → B = 3, so A = 6.',
    'medium',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    90,
    '{"type":"math_equation","equations":["C = A + B","A = 2 × B","C = 9"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is B?',
    '[{"id":"a","text":"16"},{"id":"b","text":"12"},{"id":"c","text":"8"},{"id":"d","text":"20"}]'::jsonb,
    'a',
    'B = 4A, so 4A − A = 12 → A = 4 and B = 16.',
    'medium',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    90,
    '{"type":"math_equation","equations":["B ÷ A = 4","B − A = 12"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is C?',
    '[{"id":"a","text":"6"},{"id":"b","text":"16"},{"id":"c","text":"10"},{"id":"d","text":"12"}]'::jsonb,
    'd',
    'Substitute everything into the first: A + (A + 2) + 3A = 22 → 5A = 20 → A = 4, so C = 12 (and B = 6).',
    'medium',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    90,
    '{"type":"math_equation","equations":["A + B + C = 22","B = A + 2","C = 3 × A"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is A?',
    '[{"id":"a","text":"13"},{"id":"b","text":"17"},{"id":"c","text":"15"},{"id":"d","text":"11"}]'::jsonb,
    'c',
    'Start from the known value: B = 2 gives C = 4, then D = 9, so A = 2 + 4 + 9 = 15. Always anchor on the equation that already contains a number.',
    'medium',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    90,
    '{"type":"math_equation","equations":["D − C = 5","C = 2 × B","A = B + C + D","B = 2"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is C?',
    '[{"id":"a","text":"16"},{"id":"b","text":"24"},{"id":"c","text":"12"},{"id":"d","text":"18"}]'::jsonb,
    'a',
    'There is no equation here that hands you a number outright — the official materials'' hardest equation exercise is built exactly this way, and the technique is always the same: pick the letter every other equation depends on and write everything in terms of it. Here that letter is A. C = 8A, D = 3A, B = A + 5. Substitute into the long equation: 8A − (A + 5) + 3A − A = 13, which is 9A − 5 = 13, so A = 2. Then C = 16 (and B = 7, D = 6 — all inside 1–20, as the format guarantees). 24 is 8 × 3 — multiplying the two coefficients instead of solving; 12 answers for D + wrong A; 18 comes from dropping the −5 when you collect terms.',
    'hard',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    120,
    '{"type":"math_equation","equations":["C − B + D − A = 13","8 × A = C","3 × A = D","A + 5 = B"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is D?',
    '[{"id":"a","text":"14"},{"id":"b","text":"9"},{"id":"c","text":"5"},{"id":"d","text":"13"}]'::jsonb,
    'a',
    'No equation hands you a letter outright, so the first two have to be solved together. Double the first (6A − 2B = 14) and add the second (A + 2B = 14): 7A = 28, so A = 4, and then B = 5 from either one. C = A + B = 9, and D = 2 × C − A = 18 − 4 = 14. Every value stays inside 1–20. The tempting wrong answers are the other letters you solve on the way — 9 is C and 5 is B, both correct numbers to the wrong question.',
    'hard',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    120,
    '{"type":"math_equation","equations":["3 × A − B = 7","A + 2 × B = 14","C = A + B","D = 2 × C − A"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'math_equation',
    'What is D?',
    '[{"id":"a","text":"4"},{"id":"b","text":"7"},{"id":"c","text":"3"},{"id":"d","text":"6"}]'::jsonb,
    'a',
    'Three equations, three letters, and none of them isolated — the standard route is to add all three: (A+B) + (B+C) + (A+C) = 9 + 13 + 10 = 32, which is 2 × (A + B + C), so A + B + C = 16. Subtracting each original equation from that total gives the missing letter each time: C = 16 − 9 = 7, A = 16 − 13 = 3, B = 16 − 10 = 6. Then D = C − A = 7 − 3 = 4. The distractors are A, B and C themselves.',
    'hard',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    120,
    '{"type":"math_equation","equations":["A + B = 9","B + C = 13","A + C = 10","D = C − A"]}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'latin_square',
    'Which letter replaces the question mark?',
    '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb,
    'b',
    'Look at column 1: it already contains E, A, D and C. The only letter missing is B.',
    'easy',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    60,
    '{"type":"latin_square","size":5,"grid":[["?","C","D","",""],["E","A","B","",""],["A","B","C","E","D"],["D","","","C",""],["C","","","","A"]],"prompt":"Which letter replaces the question mark?"}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'latin_square',
    'Which letter replaces the question mark?',
    '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb,
    'c',
    'Column 1 already has E and B, so the ? can only be A, C or D. Look at row 4 (A, E, C given): it still needs B and D, and its column-1 cell can''t be B (column 1 already has one) — so that cell takes D. Now row 2: it already contains A, ruling A out for the ?. Only C remains.',
    'medium',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    90,
    '{"type":"latin_square","size":5,"grid":[["E","D","C","","A"],["?","","","A",""],["B","","","D",""],["","A","E","C",""],["","","","E",""]],"prompt":"Which letter replaces the question mark?"}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'latin_square',
    'Which letter replaces the question mark?',
    '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb,
    'e',
    'Column 3 already shows D, A and C — only B and E are missing, split between the ? and the bottom cell. Row 5 already contains E, so the bottom cell of column 3 must take B. That forces the ? to be E. Two steps, no guessing.',
    'easy',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    60,
    '{"type":"latin_square","size":5,"grid":[["","","D","",""],["","","A","","B"],["A","B","C","","E"],["","","?","A",""],["","A","","E",""]],"prompt":"Which letter replaces the question mark?"}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'latin_square',
    'Which letter replaces the question mark?',
    '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb,
    'c',
    'Row 2 already contains E, A and B; column 4 adds E and D. Four letters excluded — only C fits.',
    'easy',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    60,
    '{"type":"latin_square","size":5,"grid":[["","C","","","D"],["E","A","","?","B"],["","","B","","C"],["B","","C","E","A"],["C","","","D","E"]],"prompt":"Which letter replaces the question mark?"}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'latin_square',
    'Which letter replaces the question mark?',
    '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb,
    'd',
    'Column 5 contains B, C and A; row 5 adds B, A and E. The union rules out A, B, C and E — only D fits.',
    'easy',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    60,
    '{"type":"latin_square","size":5,"grid":[["D","A","","C","B"],["","","","","C"],["","E","","","A"],["","C","D","B",""],["","B","A","E","?"]],"prompt":"Which letter replaces the question mark?"}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'latin_square',
    'Which letter replaces the question mark?',
    '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb,
    'd',
    'Row 4 still needs C and D, split between the ? and its column-3 cell. Column 3 already has a D (row 2), so the column-3 cell must take C — leaving D for the ?.',
    'easy',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    60,
    '{"type":"latin_square","size":5,"grid":[["D","","","E",""],["","A","D","B","E"],["B","","","D",""],["E","?","","A","B"],["A","","","",""]],"prompt":"Which letter replaces the question mark?"}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'latin_square',
    'Which letter replaces the question mark?',
    '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb,
    'c',
    'Row 2 and column 2 together narrow the ? to A or C. Now test A: following the forced cells through columns 4 and 5 runs into a dead end — the grid can''t complete. Only C works. On hard items, eliminate with the row-plus-column union first, then test the survivors.',
    'easy',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    60,
    '{"type":"latin_square","size":5,"grid":[["E","D","B","","A"],["D","?","E","",""],["","","D","",""],["","E","A","","C"],["","B","","",""]],"prompt":"Which letter replaces the question mark?"}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'latin_square',
    'Which letter replaces the question mark?',
    '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb,
    'd',
    'Row 5 and column 1 between them exclude only B and C, so three letters are still possible at the ? — you cannot read this one off. Turn it round and ask where a letter is still allowed. Look down column 1: C has exactly one legal free field there, so place it. That fills a cell in row 2, and now D has exactly one legal free field left in row 2 — place that too. Finally run the same test along row 5: every other free field in that row sits in a column that already contains a D, so the ? is the only place left for it. Answer: D. This is the “hidden single” move the official materials demonstrate — what you reach for when simple row-and-column elimination stalls, and the difference between a square you can solve and one you end up guessing.',
    'hard',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    120,
    '{"type":"latin_square","size":5,"grid":[["","","D","C",""],["","A","","",""],["","","","","C"],["B","","","","D"],["?","C","","",""]],"prompt":"Which letter replaces the question mark?"}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'latin_square',
    'Which letter replaces the question mark?',
    '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb,
    'c',
    'This grid needs 7 forced placements before the question mark itself is forced — the count is measured on the grid, not assigned by feel. Work the chain: fill every field that has only one letter left, and each fill removes a candidate somewhere else. After the seventh such placement the marked field has a single letter remaining, C. The official high exercises publish paths of six to seven steps, so this sits in that band.',
    'hard',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    120,
    '{"type":"latin_square","size":5,"grid":[["","","","D","?"],["","D","","A",""],["","B","E","",""],["","C","D","E",""],["","A","C","B","D"]],"prompt":"Which letter replaces the question mark?"}'::jsonb
  );

  INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data)
  VALUES (
    'latin_square',
    'Which letter replaces the question mark?',
    '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb,
    'e',
    'The longest chain in the bank: 9 forced placements are required before the marked field is determined, and the count is measured rather than assigned. Only ten fields are given, so the early steps come from letters that have exactly one legal field left in their row — the hidden single — rather than from fields with one candidate. Following that chain through, the marked field resolves to E.',
    'hard',
    '7e94d90d-fe19-4c04-a4f0-74db59e5f97e',
    120,
    '{"type":"latin_square","size":5,"grid":[["","","","A",""],["","","A","","D"],["E","D","C","","A"],["","?","","",""],["","A","E","","C"]],"prompt":"Which letter replaces the question mark?"}'::jsonb
  );

END $$;
