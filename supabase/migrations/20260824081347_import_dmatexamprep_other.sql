-- dmatexamprep.com Math/Latin/GA Import
-- Generated: 2026-08-24T08:13:47.643Z
-- Source: https://dmatexamprep.com/practice/
-- Math: 20, Latin: 20, GA: 4
-- Total new questions: 44



INSERT INTO public.sources (id, name, publisher, edition, year, license_note, url, note)
VALUES (
  '55555555-5555-5555-5555-555555555555',
  'dMAT Exam Prep',
  'dMAT Exam Prep',
  NULL,
  '2026',
  'Approved Source',
  'https://dmatexamprep.com/practice',
  'Math, Latin Squares, and General Academic questions from dmatexamprep'
)
ON CONFLICT DO NOTHING;


INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'B = 2 × A
B + A = 9',
  '[{"label":"A","correct_value":3},{"label":"B","correct_value":6}]'::jsonb,
  'A=3, B=6',
  'Substitute B with 2 × A in the second equation: 2A + A = 9, so 3A = 9 and A = 3. Then B = 2 × 3 = 6.',
  'easy',
  'Algebraic Systems',
  'ed595586783c39e2',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ed595586783c39e2'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'A + 4 = B
A + B = 14',
  '[{"label":"A","correct_value":5},{"label":"B","correct_value":9}]'::jsonb,
  'A=5, B=9',
  'From the first equation B = A + 4. Substitute into the second: A + (A + 4) = 14, so 2A = 10 and A = 5. Then B = 9.',
  'easy',
  'Algebraic Systems',
  'a37b8e16e7687d24',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a37b8e16e7687d24'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'C + D − A = 5
2 × C = D
7 − C = A
3 × C − 1 = B',
  '[{"label":"A","correct_value":4},{"label":"B","correct_value":8},{"label":"C","correct_value":3},{"label":"D","correct_value":6}]'::jsonb,
  'A=4, B=8, C=3, D=6',
  'Solve from C. Try C = 3: D = 2 × 3 = 6, A = 7 − 3 = 4, B = 3 × 3 − 1 = 8. Check the first equation: 3 + 6 − 4 = 5 ✓. So A=4, B=8, C=3, D=6.',
  'easy',
  'Algebraic Systems',
  'ad3682df37a4cdd4',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ad3682df37a4cdd4'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'B = 3 × A
B + A = 12',
  '[{"label":"A","correct_value":3},{"label":"B","correct_value":9}]'::jsonb,
  'A=3, B=9',
  'Substitute B with 3 × A: 3A + A = 12, so 4A = 12 and A = 3. Then B = 3 × 3 = 9.',
  'easy',
  'Algebraic Systems',
  '4f2ee1272fd3e068',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '4f2ee1272fd3e068'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'B + D − C = 11
2 × A + 1 = B
3 × A = D
A + 6 = C',
  '[{"label":"A","correct_value":4},{"label":"B","correct_value":9},{"label":"C","correct_value":10},{"label":"D","correct_value":12}]'::jsonb,
  'A=4, B=9, C=10, D=12',
  'Solve from A. The last three equations give B = 2A + 1, D = 3A, and C = A + 6. Substitute into the first equation: (2A + 1) + 3A − (A + 6) = 11, so 4A − 5 = 11, giving 4A = 16 and A = 4. Then B = 2 × 4 + 1 = 9, D = 3 × 4 = 12, and C = 4 + 6 = 10.',
  'easy',
  'Algebraic Systems',
  '9203330bf532ffd4',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '9203330bf532ffd4'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'C − D = 13
A = D + 2
B = 2 × A − 1
C = B + 3',
  '[{"label":"A","correct_value":9},{"label":"B","correct_value":17},{"label":"C","correct_value":20},{"label":"D","correct_value":7}]'::jsonb,
  'A=9, B=17, C=20, D=7',
  'Follow the chain from D. From the second equation, A = D + 2. Substitute into the third: B = 2 × (D + 2) − 1 = 2D + 3. Substitute into the fourth: C = (2D + 3) + 3 = 2D + 6. Substitute into the first equation: (2D + 6) − D = 13, so D + 6 = 13 and D = 7. Then A = 7 + 2 = 9, B = 2 × 9 − 1 = 17, and C = 17 + 3 = 20.',
  'easy',
  'Algebraic Systems',
  'f1e9154c23300ae4',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'f1e9154c23300ae4'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'B = 2 × A
B + A = 9',
  '[{"label":"A","correct_value":3},{"label":"B","correct_value":6}]'::jsonb,
  'A=3, B=6',
  'Substitute B with 2 × A in the second equation: 2A + A = 9, so 3A = 9 and A = 3. Then B = 2 × 3 = 6.',
  'medium',
  'Algebraic Systems',
  'ed595586783c39e2',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ed595586783c39e2'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'A + 6 = B
A + B = 16',
  '[{"label":"A","correct_value":5},{"label":"B","correct_value":11}]'::jsonb,
  'A=5, B=11',
  'From the first equation, B = A + 6. Substitute into the second: A + (A + 6) = 16, so 2A = 10 and A = 5. Then B = 11.',
  'medium',
  'Algebraic Systems',
  'da8da377f6bec83f',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'da8da377f6bec83f'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'B − 6 = A
B + A = 16',
  '[{"label":"A","correct_value":5},{"label":"B","correct_value":11}]'::jsonb,
  'A=5, B=11',
  'From the first equation, A = B − 6. Substitute into the second: B + (B − 6) = 16, so 2B = 22 and B = 11. Then A = B − 6 = 5.',
  'medium',
  'Algebraic Systems',
  'a7d60a222e19f336',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a7d60a222e19f336'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  '3 × C = A
A + C = 8
2 × A + 2 × C = B',
  '[{"label":"A","correct_value":6},{"label":"B","correct_value":16},{"label":"C","correct_value":2}]'::jsonb,
  'A=6, B=16, C=2',
  'The first equation gives A = 3C. Substitute into the second: 3C + C = 8, so 4C = 8 and C = 2. Then A = 3 × 2 = 6, and B = 2 × 6 + 2 × 2 = 16.',
  'medium',
  'Algebraic Systems',
  'a5e851c871fd7e61',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a5e851c871fd7e61'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  '3 × C = A
A + C = 8
3 × A − C = B',
  '[{"label":"A","correct_value":6},{"label":"B","correct_value":16},{"label":"C","correct_value":2}]'::jsonb,
  'A=6, B=16, C=2',
  'The first equation gives A = 3C. Substitute into the second: 3C + C = 8, so 4C = 8 and C = 2. Then A = 3 × 2 = 6, and B = 3 × 6 − 2 = 16.',
  'medium',
  'Algebraic Systems',
  '955af77938f4171e',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '955af77938f4171e'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  '2 × B = C
C − B = 2
A = C + B',
  '[{"label":"A","correct_value":6},{"label":"B","correct_value":2},{"label":"C","correct_value":4}]'::jsonb,
  'A=6, B=2, C=4',
  'The first equation gives C = 2B. Substitute into the second: 2B − B = 2, so 1B = 2 and B = 2. Then C = 2 × 2 = 4, and A = C + B = 6.',
  'medium',
  'Algebraic Systems',
  '1d51a56cc0bdd265',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '1d51a56cc0bdd265'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'B = 2 × A
A + B = 6
C = A + B',
  '[{"label":"A","correct_value":2},{"label":"B","correct_value":4},{"label":"C","correct_value":6}]'::jsonb,
  'A=2, B=4, C=6',
  'Substitute B with 2 × A in the second equation: 2A + A = 6, so 3A = 6 and A = 2. Then B = 2 × 2 = 4, and C = A + B = 6.',
  'hard',
  'Algebraic Systems',
  '8f94de64edaebf7e',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8f94de64edaebf7e'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'C − D = 7
A = D + 1
B = 2 × A − 1
C = B + 2',
  '[{"label":"A","correct_value":5},{"label":"B","correct_value":9},{"label":"C","correct_value":11},{"label":"D","correct_value":4}]'::jsonb,
  'A=5, B=9, C=11, D=4',
  'Follow the chain from D. From the second equation, A = D + 1. Substitute into the third: B = 2 × (D + 1) − 1 = 2D + 1. Substitute into the fourth: C = (2D + 1) + 2 = 2D + 3. Substitute into the first equation: (2D + 3) − D = 7, so D + 3 = 7 and D = 4. Then A = 4 + 1 = 5, B = 2 × 5 − 1 = 9, and C = 9 + 2 = 11.',
  'hard',
  'Algebraic Systems',
  '4c2175b21fb7a8ab',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '4c2175b21fb7a8ab'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'A − B + C − D = −6
B = A + 2
D = 4 × A
C = D − B',
  '[{"label":"A","correct_value":2},{"label":"B","correct_value":4},{"label":"C","correct_value":4},{"label":"D","correct_value":8}]'::jsonb,
  'A=2, B=4, C=4, D=8',
  'Express B, D and C in terms of A: B = A + 2, D = 4 × A, and C = D − B = 4A − (A + 2) = 3A − 2. Substitute all three into the first equation: A − (A + 2) + (3A − 2) − 4A = −6. The A terms combine to −A, so this simplifies to −A − 4 = −6, giving A = 2. Then B = 2 + 2 = 4, D = 4 × 2 = 8, and C = 8 − 4 = 4.',
  'hard',
  'Algebraic Systems',
  'b6a373d41f9fc169',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'b6a373d41f9fc169'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'C + D − A = 0
4 × C = D
12 − C = A
3 × C − 3 = B',
  '[{"label":"A","correct_value":10},{"label":"B","correct_value":3},{"label":"C","correct_value":2},{"label":"D","correct_value":8}]'::jsonb,
  'A=10, B=3, C=2, D=8',
  'The information given in equations two and three for A and D can be inserted into the first equation, so it can be solved for C: C + 4C − (12 − C) = 0. This gives 6C − 12 = 0, so 6C = 12 and C = 2. This can be inserted into the other equations: 4 × 2 = D or D = 8, 12 − 2 = A or A = 10, and 3 × 2 − 3 = B or B = 3.',
  'hard',
  'Algebraic Systems',
  '83d9f4d2af566a96',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '83d9f4d2af566a96'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'A + B − C + D = 9
B = A − 2
C = 2 × B + 1
D = C − 1',
  '[{"label":"A","correct_value":6},{"label":"B","correct_value":4},{"label":"C","correct_value":9},{"label":"D","correct_value":8}]'::jsonb,
  'A=6, B=4, C=9, D=8',
  'Express B, C and D in terms of A: B = A − 2, C = 2 × (A − 2) + 1 = 2A − 3, and D = C − 1 = 2A − 4. Substitute all three into the first equation: A + (A − 2) − (2A − 3) + (2A − 4) = 9. The A terms combine to 2A, so this simplifies to 2A − 3 = 9, giving A = 6. Then B = 6 − 2 = 4, C = 2 × 4 + 1 = 9, and D = 9 − 1 = 8.',
  'hard',
  'Algebraic Systems',
  'a3652b593811a98f',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a3652b593811a98f'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'B + D = 10
C = 4 × D
A = C + 1
B = A − 1',
  '[{"label":"A","correct_value":9},{"label":"B","correct_value":8},{"label":"C","correct_value":8},{"label":"D","correct_value":2}]'::jsonb,
  'A=9, B=8, C=8, D=2',
  'Follow the chain from D: C = 4D. Substitute into the third equation: A = 4D + 1. Substitute into the fourth: B = (4D + 1) − 1 = 4D. Substitute into the first equation: (4D) + D = 10, so 5D = 10 and D = 2. Then C = 4 × 2 = 8, A = 8 + 1 = 9, and B = 9 − 1 = 8.',
  'hard',
  'Algebraic Systems',
  'd026530a51868882',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'd026530a51868882'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'D − B = 5
A = 3 × B
C = A + 3
D = C − 2',
  '[{"label":"A","correct_value":6},{"label":"B","correct_value":2},{"label":"C","correct_value":9},{"label":"D","correct_value":7}]'::jsonb,
  'A=6, B=2, C=9, D=7',
  'Follow the chain from B: A = 3B. Substitute into the third equation: C = 3B + 3. Substitute into the fourth: D = (3B + 3) − 2 = 3B + 1. Substitute into the first equation: (3B + 1) − B = 5, so 2B + 1 = 5 and B = 2. Then A = 3 × 2 = 6, C = 6 + 3 = 9, and D = 9 − 2 = 7.',
  'hard',
  'Algebraic Systems',
  '62de8e5ceb21c095',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '62de8e5ceb21c095'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'math_equation',
  'A + D = 12
A = 3 × C
B = A + 3
D = B − 3',
  '[{"label":"A","correct_value":6},{"label":"B","correct_value":9},{"label":"C","correct_value":2},{"label":"D","correct_value":6}]'::jsonb,
  'A=6, B=9, C=2, D=6',
  'Follow the chain from C: A = 3C. Substitute into the third equation: B = 3C + 3. Substitute into the fourth: D = (3C + 3) − 3 = 3C. Substitute into the first equation: 3C + (3C) = 12, so 6C = 12 and C = 2. Then A = 3 × 2 = 6, B = 6 + 3 = 9, and D = 9 − 3 = 6.',
  'hard',
  'Algebraic Systems',
  'aac2ac32e6b62d25',
  '{math_equation,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'aac2ac32e6b62d25'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":true},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'C',
  'Row 1 already contains A, B, D and E. The only letter missing from that row is C, so the ? must be C.',
  'easy',
  'Grid Logic',
  '5de3712a4c2f2887',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["A","B","?","D","E"],["B","C","D","E","A"],["C","","E","","B"],["D","E","A","B","C"],["","A","","C",""]],"target":{"row":0,"col":2},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '5de3712a4c2f2887'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":true},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'D',
  'The ? row already shows A, B, C and E, leaving only D unplaced, so the answer is D.',
  'easy',
  'Grid Logic',
  '5fa42b0026bc78ed',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["C","","E","","B"],["E","A","B","C","D"],["A","B","C","?","E"],["D","E","A","B","C"],["","C","","E",""]],"target":{"row":2,"col":3},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '5fa42b0026bc78ed'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":true}]'::jsonb,
  'E',
  'Row 1 already contains B, C, D and A — only E is missing. You can confirm with the column, which also still needs E. So the ? is E.',
  'easy',
  'Grid Logic',
  '48d77fd37864ea76',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["B","C","D","?","A"],["","","","A",""],["","","","B",""],["","","","C",""],["","","","D",""]],"target":{"row":0,"col":3},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '48d77fd37864ea76'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":true},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'C',
  'Row 4 already shows B, D, E and A — the only letter missing from that row is C, so the ? must be C. The column agrees: it''s also still missing a C.',
  'easy',
  'Grid Logic',
  'eb5b8997a0467b90',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["D","E","","B","C"],["E","A","B","C","D"],["A","B","C","D","E"],["B","?","D","E","A"],["","D","","A",""]],"target":{"row":3,"col":1},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'eb5b8997a0467b90'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":true},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'D',
  'Row 1 already shows A, B, C and E — the only letter missing from that row is D, so the ? must be D.',
  'easy',
  'Grid Logic',
  'f9cd9c13e49d59f7',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["C","E","?","A","B"],["A","","B","E","C"],["D","","A","",""],["B","A","E","","D"],["E","B","","","A"]],"target":{"row":0,"col":2},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'f9cd9c13e49d59f7'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":true},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'A',
  'Row 2 already shows B, C, D and E — the only letter missing from that row is A, so the ? must be A.',
  'medium',
  'Grid Logic',
  '491f8f957513178c',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["A","D","E","","C"],["E","C","D","?","B"],["C","A","B","",""],["","E","A","",""],["","","","","A"]],"target":{"row":1,"col":3},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '491f8f957513178c'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":true},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'C',
  'Row 3 already shows A, B, D and E — the only letter missing from that row is C, so the ? must be C.',
  'medium',
  'Grid Logic',
  'b2fbff0f9c27eac8',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["A","E","","","C"],["D","","C","E",""],["?","D","B","A","E"],["E","B","A","",""],["B","C","E","D",""]],"target":{"row":2,"col":0},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'b2fbff0f9c27eac8'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":true},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'D',
  'Row 4 already shows A, B, C and E — the only letter missing from that row is D, so the ? must be D.',
  'medium',
  'Grid Logic',
  'da539b2825ecb78c',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["","B","","A",""],["A","D","C","E",""],["B","C","A","D","E"],["E","A","B","C","?"],["C","","D","B","A"]],"target":{"row":3,"col":4},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'da539b2825ecb78c'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":true},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'B',
  'Row 5 already shows A, C, D and E — the only letter missing from that row is B, so the ? must be B.',
  'medium',
  'Grid Logic',
  '8fed666c91fca646',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["","","A","D",""],["E","","D","B",""],["","C","","A","D"],["","D","B","C",""],["D","?","C","E","A"]],"target":{"row":4,"col":1},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8fed666c91fca646'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":true},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'D',
  'Row 1 already shows A, B, C and E — the only letter missing from that row is D, so the ? must be D.',
  'medium',
  'Grid Logic',
  'a8b86cbe69128f93',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["A","E","B","C","?"],["","","C","",""],["C","A","","",""],["D","C","A","B",""],["E","","","","C"]],"target":{"row":0,"col":4},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a8b86cbe69128f93'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":true},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'B',
  'Row 2 already shows A, C, D and E — the only letter missing from that row is B, so the ? must be B.',
  'hard',
  'Grid Logic',
  'f67914c222485849',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["","","","",""],["?","C","E","D","A"],["D","","","",""],["","D","","A",""],["E","","","",""]],"target":{"row":1,"col":0},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'f67914c222485849'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":true},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'C',
  'Row 3 already shows A, B, D and E — the only letter missing from that row is C, so the ? must be C.',
  'hard',
  'Grid Logic',
  'f7e29b01e262778d',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["","","","",""],["","","","",""],["B","D","E","?","A"],["E","C","","","D"],["","","","",""]],"target":{"row":2,"col":3},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'f7e29b01e262778d'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":true},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'D',
  'Row 4 already shows A, B, C and E — the only letter missing from that row is D, so the ? must be D.',
  'hard',
  'Grid Logic',
  '3f1e9d89e1bb9e4a',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["","C","","A",""],["","B","","D",""],["","E","A","",""],["A","?","C","E","B"],["","","","B","C"]],"target":{"row":3,"col":1},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '3f1e9d89e1bb9e4a'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":true},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'A',
  'Row 5 already shows B, C, D and E — the only letter missing from that row is A, so the ? must be A.',
  'hard',
  'Grid Logic',
  '9f3357a4ef6da124',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["","D","B","E",""],["","","E","D",""],["","E","","",""],["B","C","","A",""],["E","B","?","C","D"]],"target":{"row":4,"col":2},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '9f3357a4ef6da124'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":true}]'::jsonb,
  'E',
  'Row 1 already shows A, B, C and D — the only letter missing from that row is E, so the ? must be E.',
  'hard',
  'Grid Logic',
  'bbb88f7128b810df',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["D","?","A","B","C"],["C","D","B","E","A"],["","","E","","B"],["","","","A","D"],["","A","","",""]],"target":{"row":0,"col":1},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'bbb88f7128b810df'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":true}]'::jsonb,
  'E',
  'Row 2 already shows A, B, C and D — the only letter missing from that row is E, so the ? must be E.',
  'hard',
  'Grid Logic',
  'd37c76e4c285c17d',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["C","","","B",""],["D","B","C","A","?"],["","","","","C"],["A","","","C",""],["E","","","","B"]],"target":{"row":1,"col":4},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'd37c76e4c285c17d'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":true},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'C',
  'Row 3 already shows A, B, D and E — the only letter missing from that row is C, so the ? must be C.',
  'hard',
  'Grid Logic',
  '8c077e87bead126d',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["D","","","",""],["","","","","E"],["E","A","?","B","D"],["","","","",""],["","","","D",""]],"target":{"row":2,"col":2},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8c077e87bead126d'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":true},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'A',
  'Row 4 already shows B, C, D and E — the only letter missing from that row is A, so the ? must be A.',
  'hard',
  'Grid Logic',
  'a8136a6c74b48c59',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["D","","","",""],["","","","","C"],["","","B","",""],["?","C","E","D","B"],["","","","B",""]],"target":{"row":3,"col":0},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a8136a6c74b48c59'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":false},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":true}]'::jsonb,
  'E',
  'Row 5 already shows A, B, C and D — the only letter missing from that row is E, so the ? must be E.',
  'hard',
  'Grid Logic',
  '24155c5d91ae9550',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["C","","D","",""],["","C","","A","B"],["","","","","C"],["","","","","A"],["A","B","C","?","D"]],"target":{"row":4,"col":3},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '24155c5d91ae9550'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id, visual_data
)
SELECT
  'latin_square',
  'Which letter replaces the question mark?',
  '[{"id":"A","text":"A","isCorrect":false},{"id":"B","text":"B","isCorrect":false},{"id":"C","text":"C","isCorrect":true},{"id":"D","text":"D","isCorrect":false},{"id":"E","text":"E","isCorrect":false}]'::jsonb,
  'C',
  'Row 1 already shows A, B, D and E — the only letter missing from that row is C, so the ? must be C.',
  'hard',
  'Grid Logic',
  '7f0a1cbdadc28e5c',
  '{latin_square,dmatexamprep}',
  75,
  '55555555-5555-5555-5555-555555555555',
  '{"type":"latin_square","grid":[["?","D","A","B","E"],["E","A","B","C",""],["","","","A","C"],["","","","",""],["D","","","",""]],"target":{"row":0,"col":0},"grid_size":5}'::jsonb
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '7f0a1cbdadc28e5c'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'general_academic',
  'Given a = (1, 2) and b = (3, −1), what is a + b?',
  '[{"id":"a","text":"(4, 3)","isCorrect":false},{"id":"b","text":"(3, −2)","isCorrect":false},{"id":"c","text":"(4, 1)","isCorrect":true},{"id":"d","text":"(2, −3)","isCorrect":false}]'::jsonb,
  'c',
  'Add component by component: (1 + 3, 2 + (−1)) = (4, 1).',
  'easy',
  'Vector Calculations',
  '79b55f6793f99067',
  '{general_academic,dmatexamprep}',
  90,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '79b55f6793f99067'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'general_academic',
  'A vector is multiplied by the scalar 3. What happens to it?',
  '[{"id":"a","text":"Its length triples; its direction reverses.","isCorrect":false},{"id":"b","text":"Its length increases by 3 units; its direction is unchanged.","isCorrect":false},{"id":"c","text":"Its length triples; its direction is unchanged.","isCorrect":true},{"id":"d","text":"Its length is unchanged; only its direction reverses.","isCorrect":false}]'::jsonb,
  'c',
  'Multiplying by a positive scalar greater than 1 scales every component by that factor, tripling the length while keeping the direction the same — it does not add a fixed amount, it multiplies.',
  'easy',
  'Vector Calculations',
  '4acae8029c180edc',
  '{general_academic,dmatexamprep}',
  90,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '4acae8029c180edc'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'general_academic',
  'Two vectors have magnitudes 3 and 4 and are perpendicular to each other. What is their scalar product?',
  '[{"id":"a","text":"7","isCorrect":false},{"id":"b","text":"0","isCorrect":true},{"id":"c","text":"12","isCorrect":false},{"id":"d","text":"5","isCorrect":false}]'::jsonb,
  'b',
  'The scalar product is |a||b|cos(φ). At φ = 90°, cos(φ) = 0, so the scalar product is 3 × 4 × 0 = 0 regardless of the magnitudes.',
  'easy',
  'Vector Calculations',
  'c35522aae53d4ce6',
  '{general_academic,dmatexamprep}',
  90,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'c35522aae53d4ce6'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'general_academic',
  'The same two perpendicular vectors from the previous question (magnitudes 3 and 4) instead have their vector product taken. What is the magnitude of the resulting vector?',
  '[{"id":"a","text":"12","isCorrect":true},{"id":"b","text":"0","isCorrect":false},{"id":"c","text":"7","isCorrect":false},{"id":"d","text":"6","isCorrect":false}]'::jsonb,
  'a',
  'The magnitude of the vector product is |a||b|sin(φ). At φ = 90°, sin(φ) = 1, so the magnitude is 3 × 4 × 1 = 12 — this also equals the area of the parallelogram the two vectors span.',
  'medium',
  'Vector Calculations',
  '0737b1414d21a886',
  '{general_academic,dmatexamprep}',
  90,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '0737b1414d21a886'
);
