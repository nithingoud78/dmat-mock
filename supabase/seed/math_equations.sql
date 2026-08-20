-- ============================================================
-- Seed: MATH EQUATION
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

DELETE FROM public.questions WHERE module = 'math_equation';

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'b87db871-c8db-4cbf-9ca9-cf0ef6e86c55',
  'math_equation',
  '7 + A = 14
B − 3 = A

What is the value of B?',
  '[{"id":"a","text":"7"},{"id":"b","text":"17"},{"id":"c","text":"4"},{"id":"d","text":"10"}]'::jsonb,
  'd',
  'A = 14 - 7 = 7. B = A + 3 = 7 + 3 = 10.',
  'easy',
  45,
  '{"type":"math_equation"}'::jsonb,
  ARRAY['math_equation', 'algebra'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'd7d6f6ef-9c38-4fdd-a7a8-c7ca244bbbc3',
  'math_equation',
  'B ÷ 2 = A
B − A = 8

What is the value of B?',
  '[{"id":"a","text":"4"},{"id":"b","text":"16"},{"id":"c","text":"8"},{"id":"d","text":"32"}]'::jsonb,
  'b',
  'B = 2A. 2A - A = 8 => A = 8. B = 2 * 8 = 16.',
  'easy',
  45,
  '{"type":"math_equation"}'::jsonb,
  ARRAY['math_equation', 'algebra'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'a26eaa6b-2f32-4fdf-9f04-8165fc6716e7',
  'math_equation',
  '3 × C = A
A + C = 8
2 × A + 2 × C = B

What is the value of B?',
  '[{"id":"a","text":"8"},{"id":"b","text":"16"},{"id":"c","text":"24"},{"id":"d","text":"12"}]'::jsonb,
  'b',
  '3C + C = 8 => 4C = 8 => C = 2. A = 3*2 = 6. B = 2*6 + 2*2 = 12 + 4 = 16.',
  'medium',
  60,
  '{"type":"math_equation"}'::jsonb,
  ARRAY['math_equation', 'algebra'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'b6c8b5dd-1308-478e-9435-658d8fdaac6c',
  'math_equation',
  '18 − B = A
3 × A = C
B ÷ 2 = A

What is the value of C?',
  '[{"id":"a","text":"18"},{"id":"b","text":"9"},{"id":"c","text":"12"},{"id":"d","text":"6"}]'::jsonb,
  'a',
  'B = 2A. 18 - 2A = A => 3A = 18 => A = 6. C = 3 * 6 = 18.',
  'medium',
  60,
  '{"type":"math_equation"}'::jsonb,
  ARRAY['math_equation', 'algebra'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '7e1fc3a2-77be-4b22-a148-30897fa3cf86',
  'math_equation',
  'A − B + C − D = 2
10 × B = C
5 × B = A
11 + B = D

What is the value of A?',
  '[{"id":"a","text":"12"},{"id":"b","text":"5"},{"id":"c","text":"1"},{"id":"d","text":"10"}]'::jsonb,
  'b',
  'Substitute all into first equation: 5B - B + 10B - (11 + B) = 2. 13B - 11 = 2 => 13B = 13 => B = 1. A = 5 * 1 = 5.',
  'hard',
  90,
  '{"type":"math_equation"}'::jsonb,
  ARRAY['math_equation', 'algebra'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'ad91d4f3-d3f7-4b29-b096-fba5c258bd26',
  'math_equation',
  'C + D − A = 1
5 × C = D
13 − C = A
3 × C − 1 = B

What is the value of B?',
  '[{"id":"a","text":"5"},{"id":"b","text":"11"},{"id":"c","text":"2"},{"id":"d","text":"10"}]'::jsonb,
  'a',
  'Substitute into first eq: C + 5C - (13 - C) = 1. 7C - 13 = 1 => 7C = 14 => C = 2. B = 3*2 - 1 = 5.',
  'hard',
  90,
  '{"type":"math_equation"}'::jsonb,
  ARRAY['math_equation', 'algebra'],
  source_id,
  true,
  true
);

END $$;
