-- ============================================================
-- Seed: LATIN SQUARE
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

DELETE FROM public.questions WHERE module = 'latin_square';

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '0ce4ea12-75a7-4f4c-abc0-17f968b855b4',
  'latin_square',
  'B ? A D
A B E C
_ A _ _
C _ _ _
D E _ B

What replaces the question mark?',
  '[{"id":"a","text":"D"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"E"}]'::jsonb,
  'c',
  'In column 2, C and D are missing. C is already in row 4, so D must be inserted in row 4. Consequently, C must be inserted in the place of the question mark.',
  'easy',
  45,
  '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["B","?","A","D",""],["A","B","E","C",""],["","A","","",""],["C","","","",""],["D","E","","B",""]],"target_cell":{"row":0,"col":0}}'::jsonb,
  ARRAY['latin_square', 'logic'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '6a293e86-de1a-4569-99d3-080cab75e3bb',
  'latin_square',
  '_ _ ? _ _
_ _ _ D A
_ _ E _ D
A D _ _ B
D B _ C _

What replaces the question mark?',
  '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"}]'::jsonb,
  'd',
  'In the place of the question mark, D must be inserted because D is already given in all other columns and rows.',
  'easy',
  45,
  '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["","","?","",""],["","","","D","A"],["","","E","","D"],["A","D","","","B"],["D","B","","C",""]],"target_cell":{"row":0,"col":0}}'::jsonb,
  ARRAY['latin_square', 'logic'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'b5772dbc-47d4-4268-b77e-702639d60bc2',
  'latin_square',
  'A _ _ B _
_ B A _ _
_ E D _ _
E C _ A D
_ _ E _ ?

What replaces the question mark?',
  '[{"id":"a","text":"D"},{"id":"b","text":"C"},{"id":"c","text":"A"},{"id":"d","text":"B"}]'::jsonb,
  'd',
  'In column 3, B and C are missing. At row 4, only B can be inserted. Eventually, it is noticeable that A can only be in row 5 column 3. After elimination, the question mark must be B.',
  'medium',
  60,
  '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["A","","","B",""],["","B","A","",""],["","E","D","",""],["E","C","","A","D"],["","","E","","?"]],"target_cell":{"row":0,"col":0}}'::jsonb,
  ARRAY['latin_square', 'logic'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'abad0dd6-4325-4d11-b4fa-79f30cf1e72e',
  'latin_square',
  '_ E _ C B
? _ _ A _
_ _ A E D
B A _ D _
_ D C _ _

What replaces the question mark?',
  '[{"id":"a","text":"D"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"E"}]'::jsonb,
  'a',
  'A and D are missing in the first row. A can only be inserted at column 1, since it is already in column 3. Consequently, D must be in column 3. After elimination, the question mark must be D.',
  'medium',
  60,
  '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["","E","","C","B"],["?","","","A",""],["","","A","E","D"],["B","A","","D",""],["","D","C","",""]],"target_cell":{"row":0,"col":0}}'::jsonb,
  ARRAY['latin_square', 'logic'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '4d3815fb-6a8d-4823-bcf6-e4a2d11c94e3',
  'latin_square',
  '_ _ _ C _
_ C ? E _
_ E _ B C
A B _ D E
_ D E A _

What replaces the question mark?',
  '[{"id":"a","text":"B"},{"id":"b","text":"A"},{"id":"c","text":"D"},{"id":"d","text":"C"}]'::jsonb,
  'c',
  'Only C can be inserted at position row 1 col 4. After full elimination of the grid, D must be inserted at the question mark.',
  'hard',
  90,
  '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["","","","C",""],["","C","?","E",""],["","E","","B","C"],["A","B","","D","E"],["","D","E","A",""]],"target_cell":{"row":0,"col":0}}'::jsonb,
  ARRAY['latin_square', 'logic'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '5db5b3df-f5ad-423f-920d-7bdbed4e6f1b',
  'latin_square',
  '? _ _ _ C
_ _ _ _ _
_ D E B A
B _ D A _
_ B C _ D

What replaces the question mark?',
  '[{"id":"a","text":"B"},{"id":"b","text":"E"},{"id":"c","text":"A"},{"id":"d","text":"D"}]'::jsonb,
  'b',
  'In the first row, A, D and E must be inserted. After full elimination of the grid, E must be inserted in the position of the question mark.',
  'hard',
  90,
  '{"type":"latin_square","size":5,"symbols":["A","B","C","D","E"],"grid":[["?","","","","C"],["","","","",""],["","D","E","B","A"],["B","","D","A",""],["","B","C","","D"]],"target_cell":{"row":0,"col":0}}'::jsonb,
  ARRAY['latin_square', 'logic'],
  source_id,
  true,
  true
);

END $$;
