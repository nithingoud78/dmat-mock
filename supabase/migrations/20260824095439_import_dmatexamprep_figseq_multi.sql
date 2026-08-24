-- dmatexamprep.com Multi-Blank Figure Sequences Import
-- Generated: 2026-08-24T09:54:39.620Z
-- Total new questions: 20


INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"corner","row":2,"col":0,"color":"blue"}]},{"objects":[{"shape":"corner","row":1,"col":2,"color":"blue"}]}]},{"id":"b","frames":[{"objects":[{"shape":"corner","row":1,"col":1,"color":"blue"}]},{"objects":[{"shape":"corner","row":0,"col":2,"color":"blue"}]}]},{"id":"c","frames":[{"objects":[{"shape":"corner","row":1,"col":2,"color":"blue"}]},{"objects":[{"shape":"corner","row":0,"col":3,"color":"blue"}]}]}]'::jsonb,
  'c',
  'Stepping down-left hits the left edge at (3,0), so the horizontal direction flips to the right and the vertical flips upward. The shape returns up-right: (2,1) → (1,2) → (0,3).',
  'easy',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"corner","row":1,"col":2,"color":"blue"}]},{"objects":[{"shape":"corner","row":2,"col":1,"color":"blue"}]},{"objects":[{"shape":"corner","row":3,"col":0,"color":"blue"}]},{"objects":[{"shape":"corner","row":2,"col":1,"color":"blue"}]}]}'::jsonb,
  'Pattern Inference',
  '1b79e5575c864cb4',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '1b79e5575c864cb4'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"chevron","row":3,"col":2,"color":"green"}]},{"objects":[{"shape":"chevron","row":2,"col":0,"color":"green","rotation":90}]}]},{"id":"b","frames":[{"objects":[{"shape":"chevron","row":2,"col":3,"color":"green"}]},{"objects":[{"shape":"chevron","row":2,"col":2,"color":"green","rotation":90}]}]},{"id":"c","frames":[{"objects":[{"shape":"chevron","row":2,"col":2,"color":"green"}]},{"objects":[{"shape":"chevron","row":2,"col":1,"color":"green","rotation":90}]}]}]'::jsonb,
  'c',
  'The chevron moves right and rotates +90° each frame. At the right edge (col 3) the horizontal direction flips, so it steps back left while rotation continues: (2,3)@270° → (2,2)@0° → (2,1)@90°.',
  'easy',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"chevron","row":2,"col":0,"color":"green"}]},{"objects":[{"shape":"chevron","row":2,"col":1,"color":"green","rotation":90}]},{"objects":[{"shape":"chevron","row":2,"col":2,"color":"green","rotation":180}]},{"objects":[{"shape":"chevron","row":2,"col":3,"color":"green","rotation":270}]}]}'::jsonb,
  'Pattern Inference',
  '677caf9e448c2834',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '677caf9e448c2834'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"triangle","row":3,"col":3,"color":"navy"}]},{"objects":[{"shape":"triangle","row":0,"col":0,"color":"navy"}]}]},{"id":"b","frames":[{"objects":[{"shape":"triangle","row":2,"col":3,"color":"navy"}]},{"objects":[{"shape":"triangle","row":1,"col":2,"color":"navy"}]}]},{"id":"c","frames":[{"objects":[{"shape":"triangle","row":2,"col":2,"color":"navy"}]},{"objects":[{"shape":"triangle","row":1,"col":1,"color":"navy"}]}]}]'::jsonb,
  'c',
  'Moving down-right reaches the corner (3,3), where both directions flip. The shape retraces the diagonal upward: (3,3) → (2,2) → (1,1).',
  'easy',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"triangle","row":0,"col":0,"color":"navy"}]},{"objects":[{"shape":"triangle","row":1,"col":1,"color":"navy"}]},{"objects":[{"shape":"triangle","row":2,"col":2,"color":"navy"}]},{"objects":[{"shape":"triangle","row":3,"col":3,"color":"navy"}]}]}'::jsonb,
  'Pattern Inference',
  'ae7b6769cc094c23',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ae7b6769cc094c23'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"circle","row":0,"col":0,"color":"red"}]},{"objects":[{"shape":"circle","row":1,"col":0,"color":"red"}]}]},{"id":"b","frames":[{"objects":[{"shape":"circle","row":1,"col":0,"color":"red"}]},{"objects":[{"shape":"circle","row":0,"col":0,"color":"red"}]}]},{"id":"c","frames":[{"objects":[{"shape":"circle","row":1,"col":1,"color":"red"}]},{"objects":[{"shape":"circle","row":0,"col":1,"color":"red"}]}]}]'::jsonb,
  'b',
  'The circle moves one step at a time clockwise along the grid''s outer edge, rather than bouncing back inward at a boundary. From (3,0) it continues up the left edge: (2,0) → (1,0) → (0,0).',
  'easy',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"circle","row":3,"col":2,"color":"red"}]},{"objects":[{"shape":"circle","row":3,"col":1,"color":"red"}]},{"objects":[{"shape":"circle","row":3,"col":0,"color":"red"}]},{"objects":[{"shape":"circle","row":2,"col":0,"color":"red"}]}]}'::jsonb,
  'Pattern Inference',
  '32fa37bde0f44760',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '32fa37bde0f44760'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"cross","row":0,"col":3,"color":"green"}]},{"objects":[{"shape":"cross","row":1,"col":0,"color":"green"}]}]},{"id":"b","frames":[{"objects":[{"shape":"cross","row":1,"col":0,"color":"green"}]},{"objects":[{"shape":"cross","row":1,"col":1,"color":"green"}]}]},{"id":"c","frames":[{"objects":[{"shape":"cross","row":2,"col":3,"color":"green"}]},{"objects":[{"shape":"cross","row":3,"col":0,"color":"green"}]}]}]'::jsonb,
  'b',
  'The cross moves one step at a time to the right along its row and bounces back inward when it reaches the right edge. The full sequence runs (1,2) → (1,3) → (1,2) → (1,1) → (1,0) → (1,1), so the two missing frames are (1,0) and (1,1).',
  'easy',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"cross","row":1,"col":2,"color":"green"}]},{"objects":[{"shape":"cross","row":1,"col":3,"color":"green"}]},{"objects":[{"shape":"cross","row":1,"col":2,"color":"green"}]},{"objects":[{"shape":"cross","row":1,"col":1,"color":"green"}]}]}'::jsonb,
  'Pattern Inference',
  '79d2e8b3f2e59b11',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '79d2e8b3f2e59b11'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"triangle","row":0,"col":0,"color":"navy"}]},{"objects":[{"shape":"triangle","row":1,"col":0,"color":"navy"}]}]},{"id":"b","frames":[{"objects":[{"shape":"triangle","row":0,"col":1,"color":"navy"}]},{"objects":[{"shape":"triangle","row":1,"col":1,"color":"navy"}]}]},{"id":"c","frames":[{"objects":[{"shape":"triangle","row":2,"col":0,"color":"navy"}]},{"objects":[{"shape":"triangle","row":3,"col":0,"color":"navy"}]}]}]'::jsonb,
  'b',
  'The triangle moves one step at a time downward along its column and bounces off the bottom edge. The full sequence runs (2,1) → (3,1) → (2,1) → (1,1) → (0,1) → (1,1), so the two missing frames are (0,1) and (1,1).',
  'easy',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"triangle","row":2,"col":1,"color":"navy"}]},{"objects":[{"shape":"triangle","row":3,"col":1,"color":"navy"}]},{"objects":[{"shape":"triangle","row":2,"col":1,"color":"navy"}]},{"objects":[{"shape":"triangle","row":1,"col":1,"color":"navy"}]}]}'::jsonb,
  'Pattern Inference',
  '4e5b67bc0d3e2781',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '4e5b67bc0d3e2781'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"circle","row":3,"col":3,"color":"red"}]},{"objects":[{"shape":"circle","row":3,"col":2,"color":"red"}]}]},{"id":"b","frames":[{"objects":[{"shape":"circle","row":1,"col":2,"color":"red"}]},{"objects":[{"shape":"circle","row":3,"col":1,"color":"red"}]}]},{"id":"c","frames":[{"objects":[{"shape":"circle","row":3,"col":2,"color":"red"}]},{"objects":[{"shape":"circle","row":1,"col":1,"color":"red"}]}]}]'::jsonb,
  'a',
  'The circle moves one step at a time clockwise along the grid''s outer boundary. The full sequence runs (0,2) → (0,3) → (1,3) → (2,3) → (3,3) → (3,2), so the two missing frames are (3,3) and (3,2).',
  'medium',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"circle","row":0,"col":2,"color":"red"}]},{"objects":[{"shape":"circle","row":0,"col":3,"color":"red"}]},{"objects":[{"shape":"circle","row":1,"col":3,"color":"red"}]},{"objects":[{"shape":"circle","row":2,"col":3,"color":"red"}]}]}'::jsonb,
  'Pattern Inference',
  '7ff448dc2bf197de',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '7ff448dc2bf197de'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"corner","row":1,"col":2,"color":"blue"}]},{"objects":[{"shape":"corner","row":0,"col":2,"color":"blue"}]}]},{"id":"b","frames":[{"objects":[{"shape":"corner","row":3,"col":2,"color":"blue"}]},{"objects":[{"shape":"corner","row":2,"col":2,"color":"blue"}]}]},{"id":"c","frames":[{"objects":[{"shape":"corner","row":1,"col":3,"color":"blue"}]},{"objects":[{"shape":"corner","row":0,"col":3,"color":"blue"}]}]}]'::jsonb,
  'c',
  'The corner-block moves one step at a time counter-clockwise along the grid''s outer boundary. The full sequence runs (3,1) → (3,2) → (3,3) → (2,3) → (1,3) → (0,3), so the two missing frames are (1,3) and (0,3).',
  'medium',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"corner","row":3,"col":1,"color":"blue"}]},{"objects":[{"shape":"corner","row":3,"col":2,"color":"blue"}]},{"objects":[{"shape":"corner","row":3,"col":3,"color":"blue"}]},{"objects":[{"shape":"corner","row":2,"col":3,"color":"blue"}]}]}'::jsonb,
  'Pattern Inference',
  '30c82fda1261f185',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '30c82fda1261f185'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"chevron","row":1,"col":1,"color":"green"}]},{"objects":[{"shape":"chevron","row":0,"col":0,"color":"green"}]}]},{"id":"b","frames":[{"objects":[{"shape":"chevron","row":1,"col":0,"color":"green"}]},{"objects":[{"shape":"chevron","row":3,"col":3,"color":"green"}]}]},{"id":"c","frames":[{"objects":[{"shape":"chevron","row":3,"col":0,"color":"green"}]},{"objects":[{"shape":"chevron","row":1,"col":3,"color":"green"}]}]}]'::jsonb,
  'a',
  'The chevron moves diagonally along the main diagonal, bouncing off the bottom-right corner. The full sequence runs (1,1) → (2,2) → (3,3) → (2,2) → (1,1) → (0,0), so the two missing frames are (1,1) and (0,0).',
  'medium',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"chevron","row":1,"col":1,"color":"green"}]},{"objects":[{"shape":"chevron","row":2,"col":2,"color":"green"}]},{"objects":[{"shape":"chevron","row":3,"col":3,"color":"green"}]},{"objects":[{"shape":"chevron","row":2,"col":2,"color":"green"}]}]}'::jsonb,
  'Pattern Inference',
  '5da166fecabdd9b4',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '5da166fecabdd9b4'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"triangle","row":1,"col":1,"color":"navy"}]},{"objects":[{"shape":"triangle","row":1,"col":0,"color":"navy","rotation":90}]}]},{"id":"b","frames":[{"objects":[{"shape":"triangle","row":3,"col":2,"color":"navy"}]},{"objects":[{"shape":"triangle","row":3,"col":1,"color":"navy","rotation":90}]}]},{"id":"c","frames":[{"objects":[{"shape":"triangle","row":3,"col":1,"color":"navy"}]},{"objects":[{"shape":"triangle","row":3,"col":0,"color":"navy","rotation":90}]}]}]'::jsonb,
  'b',
  'The triangle moves one step at a time clockwise along the outer boundary and rotates 90 degrees to the right each frame. The full sequence runs (0,3) → (1,3) → (2,3) → (3,3) → (3,2) → (3,1), so the two missing frames are (3,2) and (3,1).',
  'medium',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"triangle","row":0,"col":3,"color":"navy"}]},{"objects":[{"shape":"triangle","row":1,"col":3,"color":"navy","rotation":90}]},{"objects":[{"shape":"triangle","row":2,"col":3,"color":"navy","rotation":180}]},{"objects":[{"shape":"triangle","row":3,"col":3,"color":"navy","rotation":270}]}]}'::jsonb,
  'Pattern Inference',
  'aa8d176db1624ab6',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'aa8d176db1624ab6'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"cross","row":3,"col":1,"color":"red"}]},{"objects":[{"shape":"cross","row":3,"col":2,"color":"green"}]}]},{"id":"b","frames":[{"objects":[{"shape":"cross","row":1,"col":0,"color":"red"}]},{"objects":[{"shape":"cross","row":1,"col":1,"color":"green"}]}]},{"id":"c","frames":[{"objects":[{"shape":"cross","row":3,"col":0,"color":"red"}]},{"objects":[{"shape":"cross","row":3,"col":1,"color":"green"}]}]}]'::jsonb,
  'a',
  'The cross moves one step at a time to the left along its row, bouncing off the left edge, while its colour cycles from blue to red to green each frame. The full sequence runs (3,3) → (3,2) → (3,1) → (3,0) → (3,1) → (3,2), so the two missing frames are (3,1) and (3,2).',
  'medium',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"cross","row":3,"col":3,"color":"blue"}]},{"objects":[{"shape":"cross","row":3,"col":2,"color":"red"}]},{"objects":[{"shape":"cross","row":3,"col":1,"color":"green"}]},{"objects":[{"shape":"cross","row":3,"col":0,"color":"blue"}]}]}'::jsonb,
  'Pattern Inference',
  '550fc6e38280856b',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '550fc6e38280856b'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"circle","row":2,"col":1,"color":"red"}]},{"objects":[{"shape":"circle","row":1,"col":1,"color":"red","rotation":270}]}]},{"id":"b","frames":[{"objects":[{"shape":"circle","row":0,"col":1,"color":"red"}]},{"objects":[{"shape":"circle","row":3,"col":1,"color":"red","rotation":270}]}]},{"id":"c","frames":[{"objects":[{"shape":"circle","row":2,"col":2,"color":"red"}]},{"objects":[{"shape":"circle","row":1,"col":2,"color":"red","rotation":270}]}]}]'::jsonb,
  'c',
  'The circle moves one step at a time downward along its column, bouncing off the bottom edge, and rotates 90 degrees to the left each frame. The full sequence runs (0,2) → (1,2) → (2,2) → (3,2) → (2,2) → (1,2), so the two missing frames are (2,2) and (1,2).',
  'medium',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"circle","row":0,"col":2,"color":"red"}]},{"objects":[{"shape":"circle","row":1,"col":2,"color":"red","rotation":270}]},{"objects":[{"shape":"circle","row":2,"col":2,"color":"red","rotation":180}]},{"objects":[{"shape":"circle","row":3,"col":2,"color":"red","rotation":90}]}]}'::jsonb,
  'Pattern Inference',
  '8dcd602211301888',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '8dcd602211301888'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"chevron","row":2,"col":3,"color":"green"}]},{"objects":[{"shape":"chevron","row":2,"col":0,"color":"navy"}]}]},{"id":"b","frames":[{"objects":[{"shape":"chevron","row":0,"col":3,"color":"green"}]},{"objects":[{"shape":"chevron","row":0,"col":0,"color":"navy"}]}]},{"id":"c","frames":[{"objects":[{"shape":"chevron","row":3,"col":0,"color":"green"}]},{"objects":[{"shape":"chevron","row":2,"col":1,"color":"navy"}]}]}]'::jsonb,
  'c',
  'The chevron moves diagonally along the anti-diagonal, bouncing off the boundary, while its colour cycles from green to navy each frame. The full sequence runs (1,2) → (0,3) → (1,2) → (2,1) → (3,0) → (2,1), so the two missing frames are (3,0) and (2,1).',
  'hard',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"chevron","row":1,"col":2,"color":"green"}]},{"objects":[{"shape":"chevron","row":0,"col":3,"color":"navy"}]},{"objects":[{"shape":"chevron","row":1,"col":2,"color":"green"}]},{"objects":[{"shape":"chevron","row":2,"col":1,"color":"navy"}]}]}'::jsonb,
  'Pattern Inference',
  '62f8dd1aad55fe71',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '62f8dd1aad55fe71'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"corner","row":3,"col":0,"color":"blue"}]},{"objects":[{"shape":"corner","row":1,"col":1,"color":"blue","rotation":90}]}]},{"id":"b","frames":[{"objects":[{"shape":"corner","row":3,"col":1,"color":"blue"}]},{"objects":[{"shape":"corner","row":3,"col":2,"color":"blue","rotation":90}]}]},{"id":"c","frames":[{"objects":[{"shape":"corner","row":1,"col":0,"color":"blue"}]},{"objects":[{"shape":"corner","row":3,"col":1,"color":"blue","rotation":90}]}]}]'::jsonb,
  'b',
  'The corner-block moves one step at a time counter-clockwise along the outer boundary and rotates 90 degrees to the right each frame. The full sequence runs (0,0) → (1,0) → (2,0) → (3,0) → (3,1) → (3,2), so the two missing frames are (3,1) and (3,2).',
  'hard',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"corner","row":0,"col":0,"color":"blue"}]},{"objects":[{"shape":"corner","row":1,"col":0,"color":"blue","rotation":90}]},{"objects":[{"shape":"corner","row":2,"col":0,"color":"blue","rotation":180}]},{"objects":[{"shape":"corner","row":3,"col":0,"color":"blue","rotation":270}]}]}'::jsonb,
  'Pattern Inference',
  '3ac1a4f8fd1fbc15',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '3ac1a4f8fd1fbc15'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"triangle","row":2,"col":1,"color":"green"}]},{"objects":[{"shape":"triangle","row":2,"col":0,"color":"navy"}]}]},{"id":"b","frames":[{"objects":[{"shape":"triangle","row":0,"col":2,"color":"green"}]},{"objects":[{"shape":"triangle","row":0,"col":1,"color":"navy"}]}]},{"id":"c","frames":[{"objects":[{"shape":"triangle","row":0,"col":1,"color":"green"}]},{"objects":[{"shape":"triangle","row":0,"col":0,"color":"navy"}]}]}]'::jsonb,
  'b',
  'The triangle moves one step at a time to the right along its row, bouncing off the right edge, while its colour cycles from red to green to navy each frame. The full sequence runs (0,0) → (0,1) → (0,2) → (0,3) → (0,2) → (0,1), so the two missing frames are (0,2) and (0,1).',
  'hard',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"triangle","row":0,"col":0,"color":"red"}]},{"objects":[{"shape":"triangle","row":0,"col":1,"color":"green"}]},{"objects":[{"shape":"triangle","row":0,"col":2,"color":"navy"}]},{"objects":[{"shape":"triangle","row":0,"col":3,"color":"red"}]}]}'::jsonb,
  'Pattern Inference',
  'b7e1a0492772fa4c',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'b7e1a0492772fa4c'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"chevron","row":1,"col":3,"color":"navy"}]},{"objects":[{"shape":"chevron","row":0,"col":2,"color":"navy"}]}]},{"id":"b","frames":[{"objects":[{"shape":"chevron","row":2,"col":0,"color":"navy"}]},{"objects":[{"shape":"chevron","row":0,"col":3,"color":"navy"}]}]},{"id":"c","frames":[{"objects":[{"shape":"chevron","row":3,"col":3,"color":"navy"}]},{"objects":[{"shape":"chevron","row":2,"col":2,"color":"navy"}]}]}]'::jsonb,
  'b',
  'The chevron moves clockwise along the outer boundary, but the number of steps grows by one each frame: 1 step, then 2 steps, then 3 steps, and so on. The full sequence runs (0,0) → (0,1) → (0,3) → (3,3) → (2,0) → (0,3), so the two missing frames are (2,0) and (0,3).',
  'hard',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"chevron","row":0,"col":0,"color":"navy"}]},{"objects":[{"shape":"chevron","row":0,"col":1,"color":"navy"}]},{"objects":[{"shape":"chevron","row":0,"col":3,"color":"navy"}]},{"objects":[{"shape":"chevron","row":3,"col":3,"color":"navy"}]}]}'::jsonb,
  'Pattern Inference',
  'fd8bb49fc6ea6f1f',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'fd8bb49fc6ea6f1f'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"cross","row":2,"col":1,"color":"green"}]},{"objects":[{"shape":"cross","row":3,"col":0,"color":"green","rotation":90}]}]},{"id":"b","frames":[{"objects":[{"shape":"cross","row":0,"col":1,"color":"green"}]},{"objects":[{"shape":"cross","row":1,"col":0,"color":"green","rotation":90}]}]},{"id":"c","frames":[{"objects":[{"shape":"cross","row":2,"col":2,"color":"green"}]},{"objects":[{"shape":"cross","row":1,"col":1,"color":"green","rotation":90}]}]}]'::jsonb,
  'c',
  'The cross moves diagonally along the main diagonal, bouncing off the boundary, and rotates 90 degrees to the right each frame at the same time. The full sequence runs (0,0) → (1,1) → (2,2) → (3,3) → (2,2) → (1,1), so the two missing frames are (2,2) and (1,1).',
  'hard',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"cross","row":0,"col":0,"color":"green"}]},{"objects":[{"shape":"cross","row":1,"col":1,"color":"green","rotation":90}]},{"objects":[{"shape":"cross","row":2,"col":2,"color":"green","rotation":180}]},{"objects":[{"shape":"cross","row":3,"col":3,"color":"green","rotation":270}]}]}'::jsonb,
  'Pattern Inference',
  '79069bcd10460199',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '79069bcd10460199'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"circle","row":0,"col":3,"color":"red"}]},{"objects":[{"shape":"circle","row":1,"col":2,"color":"green"}]}]},{"id":"b","frames":[{"objects":[{"shape":"circle","row":0,"col":2,"color":"red"}]},{"objects":[{"shape":"circle","row":1,"col":1,"color":"green"}]}]},{"id":"c","frames":[{"objects":[{"shape":"circle","row":2,"col":2,"color":"red"}]},{"objects":[{"shape":"circle","row":3,"col":1,"color":"green"}]}]}]'::jsonb,
  'a',
  'The circle moves diagonally along the anti-diagonal, bouncing off the boundary, while its colour cycles from blue to red to green each frame. The full sequence runs (2,1) → (3,0) → (2,1) → (1,2) → (0,3) → (1,2), so the two missing frames are (0,3) and (1,2).',
  'hard',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"circle","row":2,"col":1,"color":"blue"}]},{"objects":[{"shape":"circle","row":3,"col":0,"color":"red"}]},{"objects":[{"shape":"circle","row":2,"col":1,"color":"green"}]},{"objects":[{"shape":"circle","row":1,"col":2,"color":"blue"}]}]}'::jsonb,
  'Pattern Inference',
  'a380595097198038',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a380595097198038'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"corner","row":3,"col":1,"color":"red"}]},{"objects":[{"shape":"corner","row":0,"col":3,"color":"navy"}]}]},{"id":"b","frames":[{"objects":[{"shape":"corner","row":1,"col":0,"color":"red"}]},{"objects":[{"shape":"corner","row":2,"col":2,"color":"navy"}]}]},{"id":"c","frames":[{"objects":[{"shape":"corner","row":3,"col":0,"color":"red"}]},{"objects":[{"shape":"corner","row":0,"col":2,"color":"navy"}]}]}]'::jsonb,
  'a',
  'The corner-block moves counter-clockwise along the outer boundary, but the number of steps grows by one each frame: 1 step, then 2 steps, then 3 steps, and so on. The full sequence runs (3,3) → (2,3) → (0,3) → (0,0) → (3,1) → (0,3), so the two missing frames are (3,1) and (0,3).',
  'hard',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"corner","row":3,"col":3,"color":"red"}]},{"objects":[{"shape":"corner","row":2,"col":3,"color":"navy"}]},{"objects":[{"shape":"corner","row":0,"col":3,"color":"red"}]},{"objects":[{"shape":"corner","row":0,"col":0,"color":"navy"}]}]}'::jsonb,
  'Pattern Inference',
  '76e32472014e4fd5',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '76e32472014e4fd5'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, visual_data, subtopic, content_hash,
  tags, time_estimate_seconds, source_id
)
SELECT
  'figure_sequence',
  'Which frames come next in the sequence?',
  '[{"id":"a","frames":[{"objects":[{"shape":"triangle","row":0,"col":3,"color":"navy"}]},{"objects":[{"shape":"triangle","row":3,"col":3,"color":"blue","rotation":270}]}]},{"id":"b","frames":[{"objects":[{"shape":"triangle","row":2,"col":3,"color":"navy"}]},{"objects":[{"shape":"triangle","row":1,"col":3,"color":"blue","rotation":270}]}]},{"id":"c","frames":[{"objects":[{"shape":"triangle","row":3,"col":0,"color":"navy"}]},{"objects":[{"shape":"triangle","row":2,"col":0,"color":"blue","rotation":270}]}]}]'::jsonb,
  'c',
  'The triangle moves one step at a time clockwise along the outer boundary, rotating 90 degrees to the left each frame while its colour cycles from navy to blue each frame at the same time. The full sequence runs (2,3) → (3,3) → (3,2) → (3,1) → (3,0) → (2,0), so the two missing frames are (3,0) and (2,0).',
  'hard',
  '{"type":"figure_sequence","grid_size":4,"blank_count":2,"frames":[{"objects":[{"shape":"triangle","row":2,"col":3,"color":"navy"}]},{"objects":[{"shape":"triangle","row":3,"col":3,"color":"blue","rotation":270}]},{"objects":[{"shape":"triangle","row":3,"col":2,"color":"navy","rotation":180}]},{"objects":[{"shape":"triangle","row":3,"col":1,"color":"blue","rotation":90}]}]}'::jsonb,
  'Pattern Inference',
  '497f513a31f4ae04',
  '{figure_sequence,dmatexamprep}'::text[],
  75,
  '55555555-5555-5555-5555-555555555555'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '497f513a31f4ae04'
);
