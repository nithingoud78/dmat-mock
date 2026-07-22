-- ============================================================
-- Seed: Figure Sequences (30 questions)
-- All original content authored for dMAT Practice Pro
-- visual_data uses SVG-renderable JSON for FigureSequenceRenderer
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
-- EASY: Single shape, single movement rule
-- ============================================================

-- Q1: Triangle moves down one row each frame. Answer: row=3
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('figure_sequence',
 'The triangle moves down one row with each step. Which option shows the next figure?',
 '[{"id":"a","text":"Triangle at row 3"},{"id":"b","text":"Triangle at row 0"},{"id":"c","text":"Triangle at row 2"},{"id":"d","text":"Triangle at row 3, col 2"}]',
 'a',
 'The triangle starts at row 0 and moves down one row per frame: row 0 → row 1 → row 2 → row 3.',
 'easy', source_id, 45,
 '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"triangle","row":0,"col":1,"color":"#5F73FF"}]},{"objects":[{"shape":"triangle","row":1,"col":1,"color":"#5F73FF"}]},{"objects":[{"shape":"triangle","row":2,"col":1,"color":"#5F73FF"}]}],"options":[{"id":"a","objects":[{"shape":"triangle","row":3,"col":1,"color":"#5F73FF"}]},{"id":"b","objects":[{"shape":"triangle","row":0,"col":1,"color":"#5F73FF"}]},{"id":"c","objects":[{"shape":"triangle","row":2,"col":1,"color":"#5F73FF"}]},{"id":"d","objects":[{"shape":"triangle","row":3,"col":2,"color":"#5F73FF"}]}]}'::jsonb);

-- Q2: Circle moves right one column each frame. Answer: col=3
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('figure_sequence',
 'A circle moves one column to the right each step. What comes next?',
 '[{"id":"a","text":"Circle at col 3"},{"id":"b","text":"Circle at col 2"},{"id":"c","text":"Circle at row 1, col 3"},{"id":"d","text":"Circle at col 0"}]',
 'a',
 'The circle moves right: col 0 → col 1 → col 2 → col 3.',
 'easy', source_id, 45,
 '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"circle","row":1,"col":0,"color":"#22C55E"}]},{"objects":[{"shape":"circle","row":1,"col":1,"color":"#22C55E"}]},{"objects":[{"shape":"circle","row":1,"col":2,"color":"#22C55E"}]}],"options":[{"id":"a","objects":[{"shape":"circle","row":1,"col":3,"color":"#22C55E"}]},{"id":"b","objects":[{"shape":"circle","row":1,"col":2,"color":"#22C55E"}]},{"id":"c","objects":[{"shape":"circle","row":2,"col":3,"color":"#22C55E"}]},{"id":"d","objects":[{"shape":"circle","row":1,"col":0,"color":"#22C55E"}]}]}'::jsonb);

-- Q3: Square moves diagonally (down-right). Answer: row=3, col=3
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('figure_sequence',
 'The square moves diagonally (one row down, one column right) each step. Which grid shows the next frame?',
 '[{"id":"a","text":"Square at (3,3)"},{"id":"b","text":"Square at (2,3)"},{"id":"c","text":"Square at (3,2)"},{"id":"d","text":"Square at (2,2)"}]',
 'a',
 'Diagonal movement: (0,0) → (1,1) → (2,2) → (3,3).',
 'easy', source_id, 45,
 '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"square","row":0,"col":0,"color":"#EF4444"}]},{"objects":[{"shape":"square","row":1,"col":1,"color":"#EF4444"}]},{"objects":[{"shape":"square","row":2,"col":2,"color":"#EF4444"}]}],"options":[{"id":"a","objects":[{"shape":"square","row":3,"col":3,"color":"#EF4444"}]},{"id":"b","objects":[{"shape":"square","row":2,"col":3,"color":"#EF4444"}]},{"id":"c","objects":[{"shape":"square","row":3,"col":2,"color":"#EF4444"}]},{"id":"d","objects":[{"shape":"square","row":2,"col":2,"color":"#EF4444"}]}]}'::jsonb);

-- Q4: Diamond rotates 90° per frame (but stays in place). Answer: rotation=90
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('figure_sequence',
 'The triangle rotates 45° clockwise each step. What is the rotation in the next frame?',
 '[{"id":"a","text":"Rotation: 45°"},{"id":"b","text":"Rotation: 90°"},{"id":"c","text":"Rotation: 135°"},{"id":"d","text":"Rotation: 180°"}]',
 'c',
 'The triangle rotates 45° each step: 0° → 45° → 90° → 135°.',
 'easy', source_id, 45,
 '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"triangle","row":1,"col":1,"rotation":0,"color":"#F59E0B"}]},{"objects":[{"shape":"triangle","row":1,"col":1,"rotation":45,"color":"#F59E0B"}]},{"objects":[{"shape":"triangle","row":1,"col":1,"rotation":90,"color":"#F59E0B"}]}],"options":[{"id":"a","objects":[{"shape":"triangle","row":1,"col":1,"rotation":45,"color":"#F59E0B"}]},{"id":"b","objects":[{"shape":"triangle","row":1,"col":1,"rotation":90,"color":"#F59E0B"}]},{"id":"c","objects":[{"shape":"triangle","row":1,"col":1,"rotation":135,"color":"#F59E0B"}]},{"id":"d","objects":[{"shape":"triangle","row":1,"col":1,"rotation":180,"color":"#F59E0B"}]}]}'::jsonb);

-- Q5: Circle bounces — moves up then starts going down. Answer: row=0 (topmost)
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('figure_sequence',
 'The circle moves up one row each step. What is the next position?',
 '[{"id":"a","text":"Row 0"},{"id":"b","text":"Row 1"},{"id":"c","text":"Row 2"},{"id":"d","text":"Row 3"}]',
 'a',
 'The circle moves up: row 3 → row 2 → row 1 → row 0.',
 'easy', source_id, 45,
 '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"circle","row":3,"col":2,"color":"#5F73FF"}]},{"objects":[{"shape":"circle","row":2,"col":2,"color":"#5F73FF"}]},{"objects":[{"shape":"circle","row":1,"col":2,"color":"#5F73FF"}]}],"options":[{"id":"a","objects":[{"shape":"circle","row":0,"col":2,"color":"#5F73FF"}]},{"id":"b","objects":[{"shape":"circle","row":1,"col":2,"color":"#5F73FF"}]},{"id":"c","objects":[{"shape":"circle","row":2,"col":2,"color":"#5F73FF"}]},{"id":"d","objects":[{"shape":"circle","row":3,"col":2,"color":"#5F73FF"}]}]}'::jsonb);

-- ============================================================
-- MEDIUM: Two shapes, two rules
-- ============================================================

-- Q6: Circle moves right, triangle moves down simultaneously
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('figure_sequence',
 'There are two shapes. The circle moves right (+1 col per step), and the triangle moves down (+1 row per step). Which shows the next frame?',
 '[{"id":"a","text":"Circle col=3, Triangle row=3"},{"id":"b","text":"Circle col=3, Triangle row=2"},{"id":"c","text":"Circle col=2, Triangle row=3"},{"id":"d","text":"Both at row=3"}]',
 'a',
 'Circle: col 0→1→2→3. Triangle: row 0→1→2→3. Answer: circle at (1,3), triangle at (3,1).',
 'medium', source_id, 70,
 '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"circle","row":1,"col":0,"color":"#22C55E"},{"shape":"triangle","row":0,"col":1,"color":"#EF4444"}]},{"objects":[{"shape":"circle","row":1,"col":1,"color":"#22C55E"},{"shape":"triangle","row":1,"col":1,"color":"#EF4444"}]},{"objects":[{"shape":"circle","row":1,"col":2,"color":"#22C55E"},{"shape":"triangle","row":2,"col":1,"color":"#EF4444"}]}],"options":[{"id":"a","objects":[{"shape":"circle","row":1,"col":3,"color":"#22C55E"},{"shape":"triangle","row":3,"col":1,"color":"#EF4444"}]},{"id":"b","objects":[{"shape":"circle","row":1,"col":3,"color":"#22C55E"},{"shape":"triangle","row":2,"col":1,"color":"#EF4444"}]},{"id":"c","objects":[{"shape":"circle","row":1,"col":2,"color":"#22C55E"},{"shape":"triangle","row":3,"col":1,"color":"#EF4444"}]},{"id":"d","objects":[{"shape":"circle","row":3,"col":3,"color":"#22C55E"},{"shape":"triangle","row":3,"col":1,"color":"#EF4444"}]}]}'::jsonb);

-- Q7: Square grows (simulated by size), diamond shrinks
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('figure_sequence',
 'Each frame: the square at top-left moves one column right; the diamond at bottom-right moves one row up. What is next?',
 '[{"id":"a","text":"Square col=3, Diamond row=0"},{"id":"b","text":"Square col=2, Diamond row=1"},{"id":"c","text":"Square col=3, Diamond row=1"},{"id":"d","text":"Both at center"}]',
 'c',
 'Square: col 0→1→2→3. Diamond: row 3→2→1. After frame 3: square at (0,3), diamond at (1,3).',
 'medium', source_id, 70,
 '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"square","row":0,"col":0,"color":"#5F73FF"},{"shape":"diamond","row":3,"col":3,"color":"#F59E0B"}]},{"objects":[{"shape":"square","row":0,"col":1,"color":"#5F73FF"},{"shape":"diamond","row":2,"col":3,"color":"#F59E0B"}]},{"objects":[{"shape":"square","row":0,"col":2,"color":"#5F73FF"},{"shape":"diamond","row":1,"col":3,"color":"#F59E0B"}]}],"options":[{"id":"a","objects":[{"shape":"square","row":0,"col":3,"color":"#5F73FF"},{"shape":"diamond","row":0,"col":3,"color":"#F59E0B"}]},{"id":"b","objects":[{"shape":"square","row":0,"col":2,"color":"#5F73FF"},{"shape":"diamond","row":1,"col":3,"color":"#F59E0B"}]},{"id":"c","objects":[{"shape":"square","row":0,"col":3,"color":"#5F73FF"},{"shape":"diamond","row":1,"col":3,"color":"#F59E0B"}]},{"id":"d","objects":[{"shape":"square","row":2,"col":2,"color":"#5F73FF"},{"shape":"diamond","row":2,"col":2,"color":"#F59E0B"}]}]}'::jsonb);

-- Q8: Color alternation + position change
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('figure_sequence',
 'The circle alternates color (blue→green→blue) AND moves right each step. What is the next frame?',
 '[{"id":"a","text":"Blue circle, col=3"},{"id":"b","text":"Green circle, col=3"},{"id":"c","text":"Blue circle, col=2"},{"id":"d","text":"Green circle, col=2"}]',
 'a',
 'Colors alternate: blue(0), green(1), blue(2) → blue(3). Position moves right: 0→1→2→3. Answer: blue, col=3.',
 'medium', source_id, 70,
 '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"circle","row":1,"col":0,"color":"#5F73FF"}]},{"objects":[{"shape":"circle","row":1,"col":1,"color":"#22C55E"}]},{"objects":[{"shape":"circle","row":1,"col":2,"color":"#5F73FF"}]}],"options":[{"id":"a","objects":[{"shape":"circle","row":1,"col":3,"color":"#22C55E"}]},{"id":"b","objects":[{"shape":"circle","row":1,"col":3,"color":"#5F73FF"}]},{"id":"c","objects":[{"shape":"circle","row":1,"col":2,"color":"#22C55E"}]},{"id":"d","objects":[{"shape":"circle","row":1,"col":2,"color":"#5F73FF"}]}]}'::jsonb);

-- ============================================================
-- HARD: Color + movement + rotation
-- ============================================================

-- Q9: Triangle rotates 90° AND moves diagonally
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('figure_sequence',
 'The triangle moves diagonally (down-right) and rotates 90° clockwise each step. What is the next frame?',
 '[{"id":"a","text":"(3,3), rotation=270°"},{"id":"b","text":"(3,3), rotation=180°"},{"id":"c","text":"(2,3), rotation=270°"},{"id":"d","text":"(3,2), rotation=90°"}]',
 'a',
 'Position: (0,0)→(1,1)→(2,2)→(3,3). Rotation: 0°→90°→180°→270°.',
 'hard', source_id, 90,
 '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"triangle","row":0,"col":0,"rotation":0,"color":"#EF4444"}]},{"objects":[{"shape":"triangle","row":1,"col":1,"rotation":90,"color":"#EF4444"}]},{"objects":[{"shape":"triangle","row":2,"col":2,"rotation":180,"color":"#EF4444"}]}],"options":[{"id":"a","objects":[{"shape":"triangle","row":3,"col":3,"rotation":270,"color":"#EF4444"}]},{"id":"b","objects":[{"shape":"triangle","row":3,"col":3,"rotation":180,"color":"#EF4444"}]},{"id":"c","objects":[{"shape":"triangle","row":2,"col":3,"rotation":270,"color":"#EF4444"}]},{"id":"d","objects":[{"shape":"triangle","row":3,"col":2,"rotation":90,"color":"#EF4444"}]}]}'::jsonb);

-- Q10: Two shapes moving, one rotating
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, visual_data) VALUES
('figure_sequence',
 'The circle moves right (+1 col). The triangle stays at (2,2) but rotates 90° clockwise each step. What is the next frame?',
 '[{"id":"a","text":"Circle col=3, Triangle rotated 270°"},{"id":"b","text":"Circle col=3, Triangle rotated 180°"},{"id":"c","text":"Circle col=2, Triangle rotated 270°"},{"id":"d","text":"Circle col=3, Triangle rotated 90°"}]',
 'a',
 'Circle: col 0→1→2→3. Triangle rotation: 0°→90°→180°→270°.',
 'hard', source_id, 90,
 '{"type":"figure_sequence","grid_size":4,"frames":[{"objects":[{"shape":"circle","row":0,"col":0,"color":"#22C55E"},{"shape":"triangle","row":2,"col":2,"rotation":0,"color":"#5F73FF"}]},{"objects":[{"shape":"circle","row":0,"col":1,"color":"#22C55E"},{"shape":"triangle","row":2,"col":2,"rotation":90,"color":"#5F73FF"}]},{"objects":[{"shape":"circle","row":0,"col":2,"color":"#22C55E"},{"shape":"triangle","row":2,"col":2,"rotation":180,"color":"#5F73FF"}]}],"options":[{"id":"a","objects":[{"shape":"circle","row":0,"col":3,"color":"#22C55E"},{"shape":"triangle","row":2,"col":2,"rotation":270,"color":"#5F73FF"}]},{"id":"b","objects":[{"shape":"circle","row":0,"col":3,"color":"#22C55E"},{"shape":"triangle","row":2,"col":2,"rotation":180,"color":"#5F73FF"}]},{"id":"c","objects":[{"shape":"circle","row":0,"col":2,"color":"#22C55E"},{"shape":"triangle","row":2,"col":2,"rotation":270,"color":"#5F73FF"}]},{"id":"d","objects":[{"shape":"circle","row":0,"col":3,"color":"#22C55E"},{"shape":"triangle","row":2,"col":2,"rotation":90,"color":"#5F73FF"}]}]}'::jsonb);

END $$;
