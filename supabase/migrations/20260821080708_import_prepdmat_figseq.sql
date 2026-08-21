-- PREPDMAT FIGURE SEQUENCES IMPORT MIGRATION
-- Generated: 2026-08-21T08:07:08.220Z


INSERT INTO public.questions (
module, prompt_text, options, correct_option_id, explanation_text, 
difficulty, visual_data, subtopic, content_hash, 
tags, time_estimate_seconds, source_id
)
SELECT 
'figure_sequence', 'The sequence below follows one rule. Which matrix comes next?', '[{"id":"a","objects":[{"shape":"triangle","row":3,"col":1,"color":"ink"}]},{"id":"b","objects":[{"shape":"triangle","row":3,"col":1,"color":"ink","rotation":180}]},{"id":"c","objects":[{"shape":"triangle","row":3,"col":2,"color":"ink"}]}]'::jsonb, 'a', 'id="q1expl">The triangle moves down one field per step in column 2. In matrix 4 it reaches the bottom row (option A). From there it would bounce off the lower boundary and move back up — the classic vertical-movement-with-bounce rule. Option B flips the triangle upside-down — nothing in the sequence rotates it. Option C shifts it to the wrong column.',
'medium', '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"triangle","row":0,"col":1,"color":"ink"}]},{"objects":[{"shape":"triangle","row":1,"col":1,"color":"ink"}]},{"objects":[{"shape":"triangle","row":2,"col":1,"color":"ink"}]}]}'::jsonb, 'Pattern Inference', '6c4be69beba85f81',
'{figure_sequence}', 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
SELECT 1 FROM public.questions WHERE content_hash = '6c4be69beba85f81'
);

INSERT INTO public.questions (
module, prompt_text, options, correct_option_id, explanation_text, 
difficulty, visual_data, subtopic, content_hash, 
tags, time_estimate_seconds, source_id
)
SELECT 
'figure_sequence', 'Two symbols, two rules. Which matrix comes next?', '[{"id":"a","objects":[{"shape":"circle","row":2,"col":3,"color":"primary"},{"shape":"triangle","row":1,"col":2,"color":"ink","rotation":270}]},{"id":"b","objects":[{"shape":"circle","row":3,"col":3,"color":"amber"},{"shape":"triangle","row":1,"col":2,"color":"ink","rotation":180}]},{"id":"c","objects":[{"shape":"circle","row":3,"col":3,"color":"primary"},{"shape":"triangle","row":1,"col":2,"color":"ink","rotation":270}]}]'::jsonb, 'c', 'id="q2expl">The circle moves clockwise along the outer border by 2 fields per step and alternates colour (amber → indigo). The triangle stays in place but rotates 90° to the right each step: up → right → down — so next it points left. Option C satisfies both rules; A moves the circle only 1 field, B gets both the colour and the rotation wrong.',
'medium', '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"circle","row":0,"col":0,"color":"amber"},{"shape":"triangle","row":1,"col":2,"color":"ink"}]},{"objects":[{"shape":"circle","row":0,"col":2,"color":"primary"},{"shape":"triangle","row":1,"col":2,"color":"ink","rotation":90}]},{"objects":[{"shape":"circle","row":1,"col":3,"color":"amber"},{"shape":"triangle","row":1,"col":2,"color":"ink","rotation":180}]}]}'::jsonb, 'Pattern Inference', 'bac25140bc524677',
'{figure_sequence}', 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
SELECT 1 FROM public.questions WHERE content_hash = 'bac25140bc524677'
);

INSERT INTO public.questions (
module, prompt_text, options, correct_option_id, explanation_text, 
difficulty, visual_data, subtopic, content_hash, 
tags, time_estimate_seconds, source_id
)
SELECT 
'figure_sequence', 'Two symbols, two rules — one of them changes colour. Which matrix comes next?', '[{"id":"a","objects":[{"shape":"circle","row":1,"col":0,"color":"primary"},{"shape":"triangle","row":1,"col":1,"color":"ink","rotation":90}]},{"id":"b","objects":[{"shape":"circle","row":0,"col":0,"color":"primary"},{"shape":"triangle","row":1,"col":1,"color":"ink","rotation":90}]},{"id":"c","objects":[{"shape":"circle","row":0,"col":0,"color":"amber"},{"shape":"triangle","row":1,"col":1,"color":"ink","rotation":180}]}]'::jsonb, 'b', 'id="q9expl">The circle moves counter-clockwise along the top border one field per step and alternates colour (amber → indigo). The triangle stays in place but rotates 90° to the left each step (up → left → down → right). Option B satisfies both rules; A moves the circle too far, C forgets both the colour change and the rotation.',
'medium', '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"circle","row":0,"col":3,"color":"amber"},{"shape":"triangle","row":1,"col":1,"color":"ink"}]},{"objects":[{"shape":"circle","row":0,"col":2,"color":"primary"},{"shape":"triangle","row":1,"col":1,"color":"ink","rotation":270}]},{"objects":[{"shape":"circle","row":0,"col":1,"color":"amber"},{"shape":"triangle","row":1,"col":1,"color":"ink","rotation":180}]}]}'::jsonb, 'Pattern Inference', 'a65d57d1b523e45f',
'{figure_sequence}', 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
SELECT 1 FROM public.questions WHERE content_hash = 'a65d57d1b523e45f'
);

INSERT INTO public.questions (
module, prompt_text, options, correct_option_id, explanation_text, 
difficulty, visual_data, subtopic, content_hash, 
tags, time_estimate_seconds, source_id
)
SELECT 
'figure_sequence', 'One symbol, one rule. Which matrix comes next?', '[{"id":"a","objects":[{"shape":"triangle","row":1,"col":3,"color":"ink"}]},{"id":"b","objects":[{"shape":"triangle","row":0,"col":2,"color":"ink"}]},{"id":"c","objects":[{"shape":"triangle","row":0,"col":3,"color":"ink"}]}]'::jsonb, 'c', 'id="q14expl">The triangle moves diagonally up-right one field per step: (row 4, col 1) → (3,2) → (2,3). Next it reaches the top-right corner. From there the official rules say it would bounce and return along the same diagonal — option C. A and B break the diagonal.',
'medium', '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"triangle","row":3,"col":0,"color":"ink"}]},{"objects":[{"shape":"triangle","row":2,"col":1,"color":"ink"}]},{"objects":[{"shape":"triangle","row":1,"col":2,"color":"ink"}]}]}'::jsonb, 'Pattern Inference', 'fbf7f591547c9b5d',
'{figure_sequence}', 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
SELECT 1 FROM public.questions WHERE content_hash = 'fbf7f591547c9b5d'
);

INSERT INTO public.questions (
module, prompt_text, options, correct_option_id, explanation_text, 
difficulty, visual_data, subtopic, content_hash, 
tags, time_estimate_seconds, source_id
)
SELECT 
'figure_sequence', 'The movement accelerates. Which matrix comes next?', '[{"id":"a","objects":[{"shape":"square","row":1,"col":3,"color":"primary"}]},{"id":"b","objects":[{"shape":"square","row":3,"col":3,"color":"primary"}]},{"id":"c","objects":[{"shape":"square","row":3,"col":2,"color":"primary"}]}]'::jsonb, 'b', 'id="q15expl">The square moves clockwise along the border by x + 1 fields: 1 step, then 2 steps, so next it moves 3 steps — from the top-right corner three border fields clockwise lands in the bottom-right corner. This accelerating rule appears in the official materials — option B. A assumes constant 1-step movement, C overshoots by one.',
'medium', '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"square","row":0,"col":0,"color":"primary"}]},{"objects":[{"shape":"square","row":0,"col":1,"color":"primary"}]},{"objects":[{"shape":"square","row":0,"col":3,"color":"primary"}]}]}'::jsonb, 'Pattern Inference', '498d73e160efdd4b',
'{figure_sequence}', 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
SELECT 1 FROM public.questions WHERE content_hash = '498d73e160efdd4b'
);

INSERT INTO public.questions (
module, prompt_text, options, correct_option_id, explanation_text, 
difficulty, visual_data, subtopic, content_hash, 
tags, time_estimate_seconds, source_id
)
SELECT 
'figure_sequence', 'Two symbols, two rules. Which matrix comes next?', '[{"id":"a","objects":[{"shape":"circle","row":3,"col":0,"color":"primary"},{"shape":"square","row":3,"col":3,"color":"amber"}]},{"id":"b","objects":[{"shape":"circle","row":3,"col":0,"color":"amber"},{"shape":"square","row":3,"col":3,"color":"primary"}]},{"id":"c","objects":[{"shape":"circle","row":2,"col":0,"color":"primary"},{"shape":"square","row":3,"col":3,"color":"amber"}]}]'::jsonb, 'a', 'id="q16expl">The circle travels counter-clockwise down the left border, one field per step; the square travels clockwise down the right border, one field per step. Both reach the bottom corners next. B swaps the colours (nothing in the rules changes colour); C stalls the circle.',
'medium', '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"circle","row":0,"col":0,"color":"primary"},{"shape":"square","row":0,"col":3,"color":"amber"}]},{"objects":[{"shape":"circle","row":1,"col":0,"color":"primary"},{"shape":"square","row":1,"col":3,"color":"amber"}]},{"objects":[{"shape":"circle","row":2,"col":0,"color":"primary"},{"shape":"square","row":2,"col":3,"color":"amber"}]}]}'::jsonb, 'Pattern Inference', '54ba89df415bcbb5',
'{figure_sequence}', 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
SELECT 1 FROM public.questions WHERE content_hash = '54ba89df415bcbb5'
);

INSERT INTO public.questions (
module, prompt_text, options, correct_option_id, explanation_text, 
difficulty, visual_data, subtopic, content_hash, 
tags, time_estimate_seconds, source_id
)
SELECT 
'figure_sequence', 'Watch the colour carefully. Which matrix comes next?', '[{"id":"a","objects":[{"shape":"triangle","row":3,"col":2,"color":"primary"}]},{"id":"b","objects":[{"shape":"triangle","row":2,"col":2,"color":"amber"}]},{"id":"c","objects":[{"shape":"triangle","row":3,"col":2,"color":"amber"}]}]'::jsonb, 'c', 'id="q17expl">Two rules stacked: the triangle moves down one field per step, AND its colour cycles through three states — amber → indigo → ink → back to amber. Matrix 4 needs the bottom row and the cycle restarting at amber — option C. A keeps the wrong colour phase; B forgets to move.',
'medium', '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"triangle","row":0,"col":2,"color":"amber"}]},{"objects":[{"shape":"triangle","row":1,"col":2,"color":"primary"}]},{"objects":[{"shape":"triangle","row":2,"col":2,"color":"ink"}]}]}'::jsonb, 'Pattern Inference', '4c9a305d8b543154',
'{figure_sequence}', 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
SELECT 1 FROM public.questions WHERE content_hash = '4c9a305d8b543154'
);

INSERT INTO public.questions (
module, prompt_text, options, correct_option_id, explanation_text, 
difficulty, visual_data, subtopic, content_hash, 
tags, time_estimate_seconds, source_id
)
SELECT 
'figure_sequence', 'The rotation accelerates. Which matrix comes next?', '[{"id":"a","objects":[{"shape":"triangle","row":2,"col":3,"color":"ink"}]},{"id":"b","objects":[{"shape":"triangle","row":2,"col":3,"color":"ink","rotation":180}]},{"id":"c","objects":[{"shape":"triangle","row":2,"col":2,"color":"ink","rotation":180}]}]'::jsonb, 'b', 'id="q18expl">The triangle moves right one field per step, and rotates 90° clockwise x + 1 times: once (→90°), then twice (90°+180°=270°), so next it rotates three times — 270° more, landing at 180° (pointing down) in the last column — option B. A forgets the acceleration; C forgets the movement.',
'medium', '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"triangle","row":2,"col":0,"color":"ink"}]},{"objects":[{"shape":"triangle","row":2,"col":1,"color":"ink","rotation":90}]},{"objects":[{"shape":"triangle","row":2,"col":2,"color":"ink","rotation":270}]}]}'::jsonb, 'Pattern Inference', 'c719cafc21baa03a',
'{figure_sequence}', 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
SELECT 1 FROM public.questions WHERE content_hash = 'c719cafc21baa03a'
);

INSERT INTO public.questions (
module, prompt_text, options, correct_option_id, explanation_text, 
difficulty, visual_data, subtopic, content_hash, 
tags, time_estimate_seconds, source_id
)
SELECT 
'figure_sequence', 'Three symbols, three rules — and one of them leaves the grid. Which matrix comes next?', '[{"id":"a","objects":[{"shape":"circle","row":0,"col":1,"color":"amber"},{"shape":"square","row":2,"col":0,"color":"primary"},{"shape":"triangle","row":2,"col":2,"color":"ink","rotation":180}]},{"id":"b","objects":[{"shape":"circle","row":0,"col":3,"color":"amber"},{"shape":"square","row":2,"col":0,"color":"primary"},{"shape":"triangle","row":2,"col":2,"color":"ink","rotation":270}]},{"id":"c","objects":[{"shape":"circle","row":0,"col":1,"color":"amber"},{"shape":"square","row":2,"col":0,"color":"primary"},{"shape":"triangle","row":2,"col":2,"color":"ink","rotation":270}]}]'::jsonb, 'c', 'id="q42expl">Watch what happens between the second and third matrix: the circle is at the right-hand edge, and instead of bouncing back it reappears on the far left of the same row. It wraps — that is a different rule from the bounce you usually see, and the sequence shows it happening so you can rely on it. The square does the same thing vertically down column 1: bottom row, then back to the top. The triangle simply turns 90° clockwise where it stands. Next: circle one more field right, square one more field down, triangle turned again (C). A keeps the triangle at its previous angle; B reads the circle as bouncing back instead of wrapping.',
'medium', '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"circle","row":0,"col":2,"color":"amber"},{"shape":"square","row":3,"col":0,"color":"primary"},{"shape":"triangle","row":2,"col":2,"color":"ink"}]},{"objects":[{"shape":"circle","row":0,"col":3,"color":"amber"},{"shape":"square","row":0,"col":0,"color":"primary"},{"shape":"triangle","row":2,"col":2,"color":"ink","rotation":90}]},{"objects":[{"shape":"circle","row":0,"col":0,"color":"amber"},{"shape":"square","row":1,"col":0,"color":"primary"},{"shape":"triangle","row":2,"col":2,"color":"ink","rotation":180}]}]}'::jsonb, 'Pattern Inference', '4e56983dbbcf8e8c',
'{figure_sequence}', 75, '33333333-3333-3333-3333-333333333333'
WHERE NOT EXISTS (
SELECT 1 FROM public.questions WHERE content_hash = '4e56983dbbcf8e8c'
);
