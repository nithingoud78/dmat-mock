-- ==============================================================================
-- Migration: Batch 2 - 100 Programmatically Generated Latin Squares
-- ==============================================================================

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, subtopic, question_type, content_hash) VALUES
('b5ce145e-c444-b39d-4377-306faa24c398', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | A | _ | _ | _
D | C | ? | E | A
A | E | _ | _ | C
C | _ | _ | _ | E
E | _ | _ | A | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_0'),
('1f2371c1-b910-3b73-66c7-ba8012f89f3a', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | C | A | D
_ | _ | _ | B | E
_ | _ | B | D | C
C | ? | _ | E | _
A | _ | _ | _ | B

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_1'),
('cef1c553-1275-9a4b-adb5-45d4f9d511f2', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

E | B | _ | _ | ?
A | _ | C | D | _
D | C | _ | E | A
_ | D | _ | _ | C
_ | _ | D | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_2'),
('66acb8cd-f3c2-e579-096c-5062ad38c52a', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | ? | _ | _
B | E | A | _ | _
_ | _ | _ | _ | A
_ | _ | C | D | _
A | _ | _ | _ | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_3'),
('35ee03d2-9c6b-4518-6771-5b9b7185a8ea', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

D | _ | _ | _ | A
E | _ | _ | B | _
_ | A | _ | C | _
_ | _ | ? | _ | _
_ | _ | _ | _ | C

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_4'),
('681ab144-19fd-8f60-b485-463802ce96d8', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | _ | C
A | _ | B | C | _
_ | _ | C | _ | A
_ | _ | _ | _ | ?
C | E | _ | D | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_5'),
('c20c10e8-b30d-d6f3-0fb4-ee2a2796d233', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | E | B | _ | A
_ | _ | _ | _ | _
_ | C | _ | _ | B
C | B | ? | _ | D
E | A | D | B | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_6'),
('babe93a2-8b4c-fd94-440a-e0107ffe1d8e', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | ? | _ | _ | A
D | E | _ | A | B
E | A | _ | _ | D
B | _ | A | _ | C
_ | _ | D | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_7'),
('6e69173b-cba0-1a37-e6c5-e6925085ac03', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | C | A | D
_ | _ | _ | _ | C
A | E | _ | C | ?
_ | _ | _ | _ | _
C | _ | _ | D | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_8'),
('60d34c06-ef9b-f9f4-f2a2-611f7affaf79', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

D | _ | _ | _ | E
A | E | _ | _ | _
_ | ? | _ | A | _
_ | _ | _ | B | _
_ | _ | D | E | B

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_9'),
('2747e260-f967-ae8e-c56a-44fe18c589dc', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | D | _ | ? | _
_ | E | C | _ | _
E | _ | D | _ | _
_ | _ | _ | C | D
B | _ | A | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_10'),
('1b23b1ac-a2df-c33b-00a3-2fba94ad1d66', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | _ | _ | D | _
_ | ? | _ | B | _
_ | C | _ | _ | _
_ | _ | _ | _ | _
D | _ | B | A | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_11'),
('5c90fc0a-e74c-b0b3-8a06-bfd9f0335fd4', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | C | D
_ | E | A | _ | C
B | _ | D | _ | A
A | _ | _ | _ | _
_ | ? | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_12'),
('8b5750c4-994c-7d0b-7ab1-00e58cd0ef3c', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

C | _ | E | B | A
E | _ | D | A | _
_ | _ | _ | _ | _
_ | A | B | _ | _
B | C | ? | E | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_13'),
('ea28483e-fa2b-ff92-7f0b-7e13b9542d1b', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | A | C | D | _
_ | _ | _ | _ | _
_ | D | _ | _ | C
? | B | _ | _ | _
E | _ | _ | _ | A

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_14'),
('29c5b546-c996-7689-d107-58cbb9de7eda', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | B | _ | E
C | A | _ | _ | B
D | B | _ | _ | _
_ | E | C | _ | _
E | _ | ? | B | D

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_15'),
('af26f87d-5ccd-7227-f5cc-7ce8f957227b', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

E | _ | A | _ | _
_ | _ | _ | C | D
_ | _ | _ | A | _
? | _ | D | _ | _
C | E | _ | _ | A

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_16'),
('25bffc97-a276-a7d9-2d85-45e2ad882f38', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

E | A | _ | C | _
_ | _ | D | ? | _
B | E | C | D | _
A | _ | _ | _ | _
D | _ | _ | E | B

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_17'),
('be9111f8-bb1e-5f7e-bc68-ed2bc4c9a096', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | E | C | D
B | _ | _ | D | _
_ | E | _ | _ | _
_ | A | _ | B | ?
_ | _ | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_18'),
('28dda385-5bb5-abbd-e68c-74665d24067c', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

C | _ | _ | _ | B
_ | _ | C | E | A
_ | C | B | _ | _
D | A | E | _ | _
E | _ | A | ? | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_19'),
('9c8a0198-fab4-564d-4fd1-5f9e0349abee', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | D | _ | E | A
_ | _ | _ | ? | _
_ | C | _ | _ | _
_ | _ | _ | B | _
E | _ | B | _ | C

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_20'),
('66e4d79a-4d80-85fe-5033-170badbfdf5e', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | E | _ | _ | C
_ | _ | _ | C | A
? | B | _ | E | _
_ | _ | E | A | B
_ | _ | D | _ | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_21'),
('3d08b335-5819-ebd7-dcdf-c6bf03b39c17', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | E | C | _ | _
_ | _ | A | E | _
E | _ | _ | C | D
C | _ | _ | _ | E
A | _ | E | _ | ?

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_22'),
('5c0ce801-4e4b-6448-0a4f-74e53d729f83', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | _ | C
_ | D | B | _ | E
B | C | D | ? | A
_ | E | C | _ | _
C | A | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_23'),
('2f463ecb-12f2-f186-86ea-6cf3522c76ab', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | A | _ | B | E
_ | D | _ | _ | C
_ | ? | A | D | B
B | _ | C | _ | _
D | _ | E | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_24'),
('b3fb0805-8020-c477-62bf-b7d6f99bd262', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

A | _ | D | _ | C
? | D | _ | C | _
C | _ | _ | _ | D
_ | _ | _ | _ | _
B | E | C | D | A

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_25'),
('c6f4d2ef-33f1-0c27-38db-bf6030dcc7a5', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | E | A
_ | _ | B | _ | _
_ | _ | C | _ | _
B | A | ? | _ | _
_ | _ | _ | D | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_26'),
('a687f45a-b51f-f570-1ca1-c180ddee2d04', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | _ | _ | _ | D
_ | _ | _ | _ | _
_ | _ | A | C | _
A | _ | B | _ | _
? | B | D | _ | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_27'),
('af29c7f4-c2b6-d8c1-aec8-8e2427948d70', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | B | _ | _ | _
_ | _ | B | _ | D
_ | _ | C | D | B
A | _ | E | _ | _
_ | _ | _ | _ | ?

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_28'),
('71ad2c23-bead-c0ab-8548-262e39431c9a', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | D | _ | A | C
C | A | _ | _ | _
_ | _ | C | _ | B
_ | B | _ | C | _
D | C | ? | E | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_29'),
('088db910-a437-0089-bdf7-b44b97c4a0f0', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

E | ? | B | _ | D
_ | _ | _ | A | _
A | _ | _ | _ | E
_ | D | _ | _ | _
_ | B | _ | D | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_30'),
('749ef841-d8dc-377f-44f9-82b2942e9a34', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | C | E | _
_ | _ | _ | _ | D
_ | _ | _ | _ | _
A | B | _ | D | _
E | ? | _ | C | A

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_31'),
('9922816e-cd10-1e0a-3f2e-ee1ac99b0bbf', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | A | _ | _
E | D | _ | _ | _
_ | _ | _ | E | D
B | _ | _ | ? | _
_ | _ | E | A | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_32'),
('373e72fa-8207-9ff1-2572-f6a50685a71f', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | C | E | _
? | B | _ | _ | _
B | E | _ | A | _
E | _ | B | _ | _
C | A | _ | B | D

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_33'),
('2f82d312-5eda-36af-c2ad-c3488171b169', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | C | E
_ | A | _ | _ | _
A | _ | C | _ | B
_ | B | _ | E | ?
_ | _ | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_34'),
('34b02256-52ad-6db4-0fc5-5a4f7ffa948c', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | C | A | B | _
B | _ | E | _ | D
_ | _ | B | _ | C
_ | _ | D | _ | _
E | ? | C | D | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_35'),
('f45b2d1e-9dff-8b8b-286c-2e6810e91ca2', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | C | E | ? | _
E | D | C | _ | B
D | _ | _ | _ | _
B | _ | A | _ | _
_ | _ | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_36'),
('860da0b9-9b39-0042-e710-282f91549146', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

E | _ | _ | _ | _
_ | D | C | ? | _
_ | _ | _ | D | _
_ | _ | D | C | A
_ | _ | A | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_37'),
('b8516e98-0182-30b9-9d9a-27564247f140', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | ? | E | D
_ | _ | _ | B | _
D | _ | A | _ | _
_ | _ | E | _ | B
B | _ | _ | D | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_38'),
('2fb14009-8fd3-be28-77a2-60115b10c310', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | D | A | B
_ | _ | C | D | A
_ | A | B | _ | _
_ | _ | _ | _ | ?
A | _ | E | C | D

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_39'),
('2b92e2e6-7239-5f22-abfe-be7da6f5abd6', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

D | _ | _ | _ | C
B | _ | C | _ | D
C | ? | _ | _ | _
_ | C | D | _ | B
_ | _ | B | C | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_40'),
('907ee60f-6e13-5231-5943-b45a8f9ad733', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | C | E | _
_ | D | B | ? | _
_ | C | _ | _ | _
_ | _ | D | _ | B
_ | _ | _ | B | D

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_41'),
('3ba56647-2a5b-cb92-56ad-2aee144f7cd7', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | _ | C | _ | _
_ | _ | _ | D | _
_ | _ | _ | E | _
A | ? | _ | _ | _
D | C | A | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_42'),
('ea103a1b-3a85-e988-7510-024bfc3659bd', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | D | C | E | A
_ | _ | _ | _ | _
_ | E | _ | _ | _
_ | A | ? | B | _
A | B | E | _ | C

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_43'),
('e5f5748c-78ab-b00a-b5f3-085ba28135ce', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | C | A | D | _
_ | D | _ | _ | B
E | _ | ? | C | _
D | B | _ | _ | C
C | E | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_44'),
('165b0e6e-159a-054d-220c-5c35aeebfb60', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | E | _ | _
_ | E | B | ? | _
_ | B | _ | _ | _
E | _ | C | _ | D
_ | _ | _ | A | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_45'),
('b2f9fd71-142d-b507-c130-624f4ce481a8', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | A | C | _ | E
_ | E | _ | C | D
D | _ | E | _ | _
_ | B | D | E | _
? | _ | A | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_46'),
('838924ef-fa7e-91a4-1294-08963fd58c6c', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

A | D | B | _ | _
_ | C | A | _ | B
_ | _ | _ | _ | A
_ | _ | C | _ | D
_ | A | ? | D | C

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_47'),
('6f233b6e-ffd2-2728-f6a9-b2c7811bb61e', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

C | _ | B | A | _
B | _ | ? | _ | C
_ | B | C | D | _
D | _ | _ | C | _
_ | _ | E | B | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_48'),
('01db0598-244f-5ea6-a574-84d39c9779ac', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

E | _ | _ | _ | _
C | E | _ | _ | _
_ | _ | _ | _ | A
_ | _ | C | B | E
? | B | _ | C | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_49'),
('59829b48-002e-56da-32ef-d2d7cfc53bcd', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | A | C | _ | E
_ | _ | B | C | _
_ | B | _ | E | _
_ | _ | D | _ | _
? | _ | _ | _ | D

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_50'),
('0fd5298c-25da-2c00-3e60-d0ad3d22117b', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

C | E | _ | A | ?
_ | _ | A | _ | _
_ | _ | _ | E | A
D | _ | E | _ | C
A | _ | B | _ | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_51'),
('bb6f6e1e-c817-45ce-8ac6-c45a9fff1a88', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | _ | D | C | _
A | C | _ | _ | _
_ | _ | _ | _ | _
_ | D | A | E | _
_ | _ | _ | ? | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_52'),
('b76358c9-a145-8d99-5297-745e9eb8226f', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | D | E
_ | A | _ | B | _
_ | B | E | C | D
D | _ | C | _ | _
_ | D | B | ? | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_53'),
('d4272389-bd85-ffa6-b2a2-5b5d4616d1ad', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

D | _ | _ | _ | _
_ | _ | C | _ | _
C | _ | _ | A | D
_ | _ | _ | D | ?
_ | E | _ | B | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_54'),
('f8fe1705-3667-0ee6-c78a-5c7ab2ff95c2', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | _ | A
C | B | E | A | _
B | D | _ | ? | _
_ | A | _ | D | C
A | _ | _ | _ | B

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_55'),
('7ec048b6-bfe6-f4c8-bdeb-4b75ef504440', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | ? | E | _ | _
_ | _ | _ | _ | B
_ | _ | _ | _ | A
_ | E | _ | D | _
B | _ | C | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_56'),
('c267d1c8-7ba1-eecc-76ef-2072f2a51434', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | ? | C | _
A | _ | _ | _ | C
_ | _ | _ | D | _
B | _ | _ | _ | _
_ | E | B | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_57'),
('b1ab6ec4-c6a9-1f4f-9318-090a96552a94', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | ? | D | A | B
A | _ | _ | C | _
_ | _ | _ | _ | _
_ | E | _ | _ | _
D | _ | B | _ | C

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_58'),
('9d4dcc78-0f23-0863-a487-d336371d36d9', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

A | _ | _ | E | _
E | _ | ? | _ | _
_ | B | _ | _ | _
D | _ | _ | B | A
_ | D | _ | C | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_59'),
('3bad743c-53c3-4a46-6c4d-bbc4240d10b2', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

D | A | _ | _ | _
_ | _ | _ | A | B
A | _ | D | _ | ?
_ | _ | _ | _ | _
E | C | _ | _ | A

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_60'),
('3fc9c035-ef3f-f437-1bf3-6ab733f3749b', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | E | _ | _ | A
_ | _ | _ | _ | _
A | C | B | ? | _
D | _ | C | _ | _
C | B | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_61'),
('fae8b34f-39c7-2ce5-b66a-b91de9768627', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

C | _ | E | B | _
_ | C | _ | _ | B
_ | B | D | _ | A
_ | ? | _ | _ | E
_ | _ | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_62'),
('3fe1e56f-2986-3cd7-6907-427a292a77ba', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | A | D | _ | _
_ | E | ? | C | D
D | _ | B | A | _
C | _ | _ | D | A
_ | _ | _ | E | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_63'),
('a975090e-bd05-cf05-952a-2e565e43f362', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | A | _
_ | B | _ | _ | _
D | _ | C | B | A
_ | _ | _ | C | ?
_ | _ | D | _ | C

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_64'),
('ac4bf29e-a2c2-3741-a769-4a8f8545058f', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | E | A | D | B
_ | _ | _ | A | D
_ | _ | _ | C | _
_ | _ | D | B | C
_ | _ | ? | E | A

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_65'),
('3aa7125d-f095-9744-ebf8-57fae453911b', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

E | ? | C | _ | _
_ | D | _ | _ | _
D | E | _ | _ | B
_ | _ | B | _ | E
C | _ | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_66'),
('f399dfab-1477-01da-6675-436e1313f6c8', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | A | _ | _ | C
_ | _ | A | B | _
B | ? | _ | A | _
_ | _ | _ | _ | _
C | _ | _ | D | A

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_67'),
('0770b93f-6a95-c8e2-b4fa-c7a5dac035f1', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

C | A | _ | B | D
A | _ | _ | E | _
_ | D | _ | _ | ?
D | _ | B | A | _
B | _ | C | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_68'),
('c7114c7d-1b67-caa9-ed09-002de54b7b89', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

C | _ | D | _ | A
_ | A | _ | _ | _
D | E | A | _ | ?
B | D | E | _ | _
_ | C | B | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_69'),
('1ccdea36-f0d5-f700-5fd5-53810e998f8c', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

D | _ | A | _ | _
_ | ? | _ | _ | D
_ | B | C | D | A
_ | _ | _ | _ | _
C | E | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_70'),
('e28472b0-e9d3-dbf0-92d7-1b5f5f6948cf', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

A | _ | _ | D | _
_ | C | _ | _ | D
_ | D | C | E | _
_ | _ | A | _ | ?
_ | _ | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_71'),
('23b43558-7c51-c531-eed2-5b716349bc46', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | _ | B
_ | E | _ | _ | _
_ | ? | E | _ | _
B | A | _ | _ | _
E | B | _ | D | C

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_72'),
('542b54f7-254c-4a89-e9b3-6a26863e550c', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | _ | D
? | _ | C | _ | _
B | _ | _ | _ | _
E | _ | A | B | _
D | B | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_73'),
('a15b719f-d4b5-7829-f0d5-a01f490a11f4', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | ? | A | D | _
_ | A | _ | _ | D
_ | _ | B | C | A
A | _ | D | B | _
_ | D | _ | A | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_74'),
('c481651d-8c53-b37b-fcb4-440e4178e7a4', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | E | _ | _ | D
_ | _ | A | _ | B
C | D | _ | B | A
_ | A | _ | _ | C
D | ? | _ | _ | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_75'),
('d1375ca5-6854-4b90-a6f3-a530b339c08c', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | A | _ | _ | _
_ | _ | A | _ | _
C | _ | _ | _ | B
E | _ | _ | _ | ?
_ | B | D | _ | C

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_76'),
('14e7ff2c-79ec-da02-6fb3-c175cf959c7f', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

E | D | _ | _ | _
_ | B | _ | _ | _
B | _ | A | E | _
D | _ | ? | _ | _
_ | _ | _ | D | A

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_77'),
('43572959-4124-4590-a0e2-e462242a6572', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | E | _ | A
_ | A | _ | _ | _
A | _ | _ | _ | B
_ | E | _ | _ | _
C | ? | B | A | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_78'),
('6e359c5b-3298-e374-7f35-f073b7d05860', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | _ | D
_ | _ | C | _ | ?
_ | E | _ | _ | C
_ | _ | _ | E | A
D | _ | B | _ | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_79'),
('cdaa458c-5d84-a01c-46b5-cc832b4052cd', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

D | C | _ | _ | _
_ | _ | _ | _ | B
E | D | B | _ | _
B | _ | _ | _ | D
A | B | C | D | ?

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_80'),
('fc777693-a05a-ae4a-1716-d17cb16f2381', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | _ | C
_ | _ | _ | _ | _
_ | E | C | _ | D
A | _ | D | C | _
C | A | ? | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_81'),
('5bc514f2-2e43-4aed-75aa-f523b1c0bd95', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | D | ? | _ | _
_ | C | A | D | _
_ | B | _ | _ | E
_ | _ | C | B | A
C | A | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_82'),
('d3d9417b-2d2e-b677-0b8a-32d10765ac93', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | _ | C
E | B | _ | _ | _
_ | _ | _ | ? | D
D | _ | _ | _ | E
_ | C | _ | D | B

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_83'),
('108fd8de-db42-cc73-dee5-2eb3d61e5bc8', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

C | B | D | A | E
B | _ | E | _ | A
E | _ | _ | _ | _
_ | C | B | _ | _
D | _ | ? | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_84'),
('7dc8ac8f-44ee-cee5-2030-6fa4e15eca2f', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | _ | E
_ | _ | _ | _ | A
D | _ | _ | A | ?
_ | D | _ | C | _
_ | E | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_85'),
('c3559f96-b5f3-9673-e504-12af5583f600', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | ? | A | _
_ | _ | _ | _ | E
_ | _ | A | _ | C
_ | A | _ | C | _
C | B | _ | D | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_86'),
('a9eee379-13f3-3018-40b9-9da7bcadcac9', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

D | E | C | B | _
_ | B | _ | A | D
_ | _ | _ | _ | C
A | ? | _ | E | B
B | _ | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'c', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be C. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_87'),
('d70a5c6c-2dd6-9241-32ae-26be6dd5091d', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

C | _ | _ | _ | D
E | _ | _ | D | A
? | _ | _ | _ | _
D | _ | _ | C | E
B | E | D | A | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_88'),
('408b95d3-889c-3eb2-34b7-05a3c27ae233', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | _ | _ | _ | ?
_ | B | _ | E | C
_ | _ | _ | A | _
A | E | _ | D | _
E | _ | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_89'),
('1645e42f-a17c-b894-790f-629e88732e0e', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | _ | _ | _ | ?
_ | _ | D | _ | _
C | _ | _ | A | B
_ | E | C | B | _
_ | _ | _ | E | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_90'),
('bf0d6431-3743-cf6c-d88a-0b4ed530e5ea', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

B | C | E | _ | _
_ | A | _ | _ | _
D | _ | _ | C | _
_ | _ | ? | A | _
_ | _ | _ | B | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_91'),
('36689a06-153f-8b86-9be5-b33fe04cc1c3', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | A | _ | _ | C
_ | E | _ | _ | _
E | _ | A | _ | D
_ | C | E | A | ?
A | D | C | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'b', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be B. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_92'),
('4466f338-3b86-8398-7d65-a267d2b377bb', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

A | _ | _ | _ | D
_ | _ | A | D | C
_ | _ | _ | A | B
E | ? | B | C | A
_ | _ | _ | _ | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_93'),
('bcccb401-6800-55a7-a214-74dc0452f6d1', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

C | E | D | _ | _
E | A | _ | _ | _
_ | _ | E | _ | D
_ | C | _ | A | _
_ | _ | ? | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'a', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be A. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_94'),
('598606ed-be7b-751b-e99d-c457a83a8295', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | _ | D | _
_ | E | _ | B | _
_ | C | _ | _ | B
C | _ | _ | _ | _
? | B | A | _ | E

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_95'),
('4ea8e650-665c-778d-f6ac-379669035d42', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | B | _ | _ | _
B | A | _ | E | _
_ | D | _ | _ | _
_ | _ | A | C | _
_ | _ | E | _ | ?

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_96'),
('5f8ce25d-ec44-aa94-fa60-f43b9a89cddc', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | _ | C | _ | D
B | _ | D | _ | _
E | _ | _ | _ | _
_ | C | A | ? | _
_ | B | _ | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_97'),
('a18a42da-8dd6-5ffb-bfea-f09441590567', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

? | A | D | _ | _
A | D | _ | _ | B
_ | E | A | _ | _
D | _ | _ | _ | _
_ | B | E | D | A

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'e', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be E. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_98'),
('7f636e0e-4ca5-d5b1-913d-8a29efc03097', 'latin_square', 'In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.

_ | ? | _ | _ | C
_ | _ | C | _ | _
_ | E | _ | A | D
_ | _ | _ | _ | A
A | C | E | _ | _

Which letter belongs in the cell marked with ''?''?', '[{"id": "a", "text": "A"}, {"id": "b", "text": "B"}, {"id": "c", "text": "C"}, {"id": "d", "text": "D"}, {"id": "e", "text": "E"}]'::jsonb, 'd', 'By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked ''?'' is uniquely forced to be D. You can deduce this by observing the row and column constraints that eliminate all other possibilities.', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_99')

ON CONFLICT (id) DO NOTHING;
