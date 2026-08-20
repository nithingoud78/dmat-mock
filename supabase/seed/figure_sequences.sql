-- ============================================================
-- Seed: FIGURE SEQUENCE
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

DELETE FROM public.questions WHERE module = 'figure_sequence';

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '12cccbe0-4b3b-48b8-ab88-6192a51103a6',
  'figure_sequence',
  'Identify the correct next figure in the sequence.',
  '[{"id":"a","text":"See visual option","objects":[{"shape":"diamond","color":"#10b981","row":0,"col":1}]},{"id":"b","text":"See visual option","objects":[{"shape":"diamond","color":"#10b981","row":2,"col":1}]},{"id":"c","text":"See visual option","objects":[{"shape":"diamond","color":"#10b981","row":1,"col":2}]},{"id":"d","text":"See visual option","objects":[{"shape":"diamond","color":"#10b981","row":3,"col":1}]}]'::jsonb,
  'b',
  'The symbol moves vertically one field at a time in the second column and bounces off the upper or lower boundary.',
  'easy',
  75,
  '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"diamond","color":"#10b981","row":2,"col":1}]},{"objects":[{"shape":"diamond","color":"#10b981","row":1,"col":1}]},{"objects":[{"shape":"diamond","color":"#10b981","row":0,"col":1}]},{"objects":[{"shape":"diamond","color":"#10b981","row":1,"col":1}]}]}'::jsonb,
  ARRAY['figure_sequence', 'movement', 'bounce'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '6c91aac4-01bf-4965-86f8-866e9e9b442d',
  'figure_sequence',
  'Identify the correct next figure in the sequence.',
  '[{"id":"a","text":"See visual option","objects":[{"shape":"square","color":"#fef08a","row":3,"col":0}]},{"id":"b","text":"See visual option","objects":[{"shape":"square","color":"#fef08a","row":0,"col":3}]},{"id":"c","text":"See visual option","objects":[{"shape":"square","color":"#fef08a","row":1,"col":2}]},{"id":"d","text":"See visual option","objects":[{"shape":"square","color":"#fef08a","row":2,"col":1}]}]'::jsonb,
  'c',
  'The symbol always moves one space diagonally upwards to the right from its starting position until it bounces off the upper boundary and returns to the starting position in the same way (diagonally downwards to the left). Once there, it bounces off the lower boundary and moves diagonally upwards to the right again.',
  'easy',
  75,
  '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"square","color":"#fef08a","row":3,"col":0}]},{"objects":[{"shape":"square","color":"#fef08a","row":2,"col":1}]},{"objects":[{"shape":"square","color":"#fef08a","row":1,"col":2}]},{"objects":[{"shape":"square","color":"#fef08a","row":0,"col":3}]}]}'::jsonb,
  ARRAY['figure_sequence', 'diagonal', 'bounce'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'dfdc55b6-61d3-423a-b29f-d018633bd07e',
  'figure_sequence',
  'Identify the correct next figure in the sequence.',
  '[{"id":"a","text":"See visual option","objects":[{"shape":"hexagon","color":"#fef08a","row":1,"col":0},{"shape":"triangle","color":"#000000","rotation":180,"row":2,"col":1}]},{"id":"b","text":"See visual option","objects":[{"shape":"hexagon","color":"#fef08a","row":0,"col":0},{"shape":"triangle","color":"#000000","rotation":270,"row":2,"col":1}]},{"id":"c","text":"See visual option","objects":[{"shape":"hexagon","color":"#fef08a","row":0,"col":0},{"shape":"triangle","color":"#000000","rotation":0,"row":2,"col":1}]},{"id":"d","text":"See visual option","objects":[{"shape":"hexagon","color":"#fef08a","row":1,"col":0},{"shape":"triangle","color":"#000000","rotation":90,"row":2,"col":1}]}]'::jsonb,
  'c',
  'The symbol (hexagon) moves along the outer borders counter clockwise one space at a time. The symbol (arrow) moves along the outer borders clockwise by two squares at a time. It changes its colour alternately from black to pink. The symbol (triangle-like) rotates 90 degrees to the right from image to image.',
  'medium',
  75,
  '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"hexagon","color":"#fef08a","row":1,"col":3},{"shape":"triangle","color":"#000000","rotation":0,"row":2,"col":1}]},{"objects":[{"shape":"hexagon","color":"#fef08a","row":0,"col":3},{"shape":"triangle","color":"#000000","rotation":90,"row":2,"col":1}]},{"objects":[{"shape":"hexagon","color":"#fef08a","row":0,"col":2},{"shape":"triangle","color":"#000000","rotation":180,"row":2,"col":1}]},{"objects":[{"shape":"hexagon","color":"#fef08a","row":0,"col":1},{"shape":"triangle","color":"#000000","rotation":270,"row":2,"col":1}]}]}'::jsonb,
  ARRAY['figure_sequence', 'rotation', 'multi-rule'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '136cc11d-58c0-4176-8e97-97c3688ebfaa',
  'figure_sequence',
  'Identify the correct next figure in the sequence.',
  '[{"id":"a","text":"See visual option","objects":[{"shape":"hexagon","color":"#ffffff","row":3,"col":0},{"shape":"square","color":"#f472b6","row":2,"col":1},{"shape":"triangle","color":"#10b981","rotation":90,"row":3,"col":1}]},{"id":"b","text":"See visual option","objects":[{"shape":"hexagon","color":"#ffffff","row":2,"col":1},{"shape":"square","color":"#f472b6","row":3,"col":1},{"shape":"triangle","color":"#10b981","rotation":180,"row":3,"col":2}]},{"id":"c","text":"See visual option","objects":[{"shape":"hexagon","color":"#ffffff","row":1,"col":2},{"shape":"square","color":"#f472b6","row":1,"col":2},{"shape":"triangle","color":"#10b981","rotation":270,"row":3,"col":3}]},{"id":"d","text":"See visual option","objects":[{"shape":"hexagon","color":"#ffffff","row":2,"col":1},{"shape":"square","color":"#f472b6","row":2,"col":1},{"shape":"triangle","color":"#10b981","rotation":90,"row":3,"col":2}]}]'::jsonb,
  'd',
  'The green triangle moves horizontally by one field in the fourth row and bounces off the right or left border. It rotates 90 degrees to the right. The pink square moves from its starting position one field at a time: left, up, right, down, and so on. The hexagon moves diagonally downwards to the left until it bounces off the bottom left corner and returns the same way.',
  'medium',
  75,
  '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"hexagon","color":"#ffffff","row":0,"col":3},{"shape":"square","color":"#f472b6","row":2,"col":1},{"shape":"triangle","color":"#10b981","rotation":90,"row":3,"col":0}]},{"objects":[{"shape":"hexagon","color":"#ffffff","row":1,"col":2},{"shape":"square","color":"#f472b6","row":2,"col":0},{"shape":"triangle","color":"#10b981","rotation":180,"row":3,"col":1}]},{"objects":[{"shape":"hexagon","color":"#ffffff","row":2,"col":1},{"shape":"square","color":"#f472b6","row":1,"col":0},{"shape":"triangle","color":"#10b981","rotation":270,"row":3,"col":2}]},{"objects":[{"shape":"hexagon","color":"#ffffff","row":3,"col":0},{"shape":"square","color":"#f472b6","row":1,"col":1},{"shape":"triangle","color":"#10b981","rotation":0,"row":3,"col":3}]}]}'::jsonb,
  ARRAY['figure_sequence', 'multi-rule'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '6f904d85-fc39-49d1-91be-b10e7a7f1c06',
  'figure_sequence',
  'Identify the correct next figure in the sequence.',
  '[{"id":"a","text":"See visual option","objects":[{"shape":"triangle","color":"#fef08a","row":0,"col":3},{"shape":"triangle","color":"#f472b6","rotation":270,"row":2,"col":2}]},{"id":"b","text":"See visual option","objects":[{"shape":"triangle","color":"#fef08a","row":0,"col":2},{"shape":"triangle","color":"#ffffff","rotation":90,"row":2,"col":1}]},{"id":"c","text":"See visual option","objects":[{"shape":"triangle","color":"#fef08a","row":1,"col":3},{"shape":"triangle","color":"#f472b6","rotation":180,"row":2,"col":2}]},{"id":"d","text":"See visual option","objects":[{"shape":"triangle","color":"#fef08a","row":0,"col":3},{"shape":"triangle","color":"#fef08a","rotation":270,"row":2,"col":2}]}]'::jsonb,
  'a',
  'The yellow triangle moves along the outer borders clockwise by x + 1 fields (i.e. from matrix 1 to matrix 2 one field, from matrix 2 to matrix 3 two fields, and so on). The angled line moves horizontally by one field in the third row and bounces off the right or left border. In doing so, it turns 90 degrees to the left from image to image and changes its colour from white to pink to yellow.',
  'hard',
  90,
  '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"triangle","color":"#fef08a","row":3,"col":1},{"shape":"triangle","color":"#ffffff","rotation":270,"row":2,"col":0}]},{"objects":[{"shape":"triangle","color":"#fef08a","row":3,"col":2},{"shape":"triangle","color":"#f472b6","rotation":180,"row":2,"col":1}]},{"objects":[{"shape":"triangle","color":"#fef08a","row":3,"col":0},{"shape":"triangle","color":"#fef08a","rotation":90,"row":2,"col":2}]},{"objects":[{"shape":"triangle","color":"#fef08a","row":0,"col":0},{"shape":"triangle","color":"#ffffff","rotation":0,"row":2,"col":3}]}]}'::jsonb,
  ARRAY['figure_sequence', 'complex-rule'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '77990c0c-47ca-47e3-bd04-a4a6cddfedfc',
  'figure_sequence',
  'Identify the correct next figure in the sequence.',
  '[{"id":"a","text":"See visual option","objects":[{"shape":"triangle","color":"#f97316","rotation":270,"row":0,"col":1}]},{"id":"b","text":"See visual option","objects":[{"shape":"triangle","color":"#000000","rotation":180,"row":1,"col":2}]},{"id":"c","text":"See visual option","objects":[{"shape":"triangle","color":"#f97316","rotation":0,"row":1,"col":0}]},{"id":"d","text":"See visual option","objects":[{"shape":"triangle","color":"#000000","rotation":0,"row":1,"col":0}]}]'::jsonb,
  'c',
  'The symbol moves from its starting position one field at a time from image to image. The sequence of directions in which the symbol moves is: down, right, up, left, and so on. It turns 90 degrees to the left and changes its colour alternately from orange to black.',
  'hard',
  90,
  '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"triangle","color":"#f97316","row":1,"col":0}]},{"objects":[{"shape":"triangle","color":"#000000","rotation":270,"row":2,"col":0}]},{"objects":[{"shape":"triangle","color":"#f97316","rotation":180,"row":2,"col":1}]},{"objects":[{"shape":"triangle","color":"#000000","rotation":90,"row":1,"col":1}]}]}'::jsonb,
  ARRAY['figure_sequence', 'complex-rule'],
  source_id,
  true,
  true
);

END $$;
