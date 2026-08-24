-- Restore 19 dmatexamprep mathematical equations

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

