-- ==============================================================================
-- Migration: Batch 1 - 100 Programmatically Generated Mathematical Equations
-- ==============================================================================

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, subtopic, question_type, content_hash) VALUES
('fe252fb9-5c80-f08c-cd26-950bdba057db', 'math_equation', 'A + B = 34
A - B = 2

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=18, B=16"}, {"id": "b", "text": "A=18, B=14"}, {"id": "c", "text": "A=18, B=18"}, {"id": "d", "text": "A=20, B=16"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=18, B=16', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_0'),
('0dd987c0-0f0f-04c5-061a-4d1428de4ab9', 'math_equation', 'A + B = 32
A - B = 2

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=17, B=15"}, {"id": "b", "text": "A=18, B=15"}, {"id": "c", "text": "A=19, B=15"}, {"id": "d", "text": "A=17, B=14"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=17, B=15', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_1'),
('7913c909-360c-45fe-c2df-f2e134bf2669', 'math_equation', 'A + B = 24
A - B = -2

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=9, B=13"}, {"id": "b", "text": "A=11, B=15"}, {"id": "c", "text": "A=10, B=13"}, {"id": "d", "text": "A=11, B=13"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=11, B=13', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_2'),
('7dd8793f-6582-b8db-9606-e9a52a3f5c29', 'math_equation', 'A + B = 18
A - B = 14

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=16, B=2"}, {"id": "b", "text": "A=16, B=3"}, {"id": "c", "text": "A=16, B=4"}, {"id": "d", "text": "A=16, B=1"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=16, B=2', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_3'),
('7b780e6d-7c4b-cae4-92e0-ecd18c88f025', 'math_equation', 'A + B = 13
B - C = 1
C + D = 15
D = 11

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=8, B=5, C=4, D=11"}, {"id": "b", "text": "A=8, B=5, C=2, D=11"}, {"id": "c", "text": "A=8, B=5, C=3, D=11"}, {"id": "d", "text": "A=8, B=3, C=4, D=11"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=8, B=5, C=4, D=11', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_4'),
('7ef60e75-c80f-0fb0-fc61-96a7089b9f79', 'math_equation', 'A + B = 10
B + C = 14
A + C = 14

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=5, B=5, C=9"}, {"id": "b", "text": "A=5, B=6, C=9"}, {"id": "c", "text": "A=3, B=5, C=9"}, {"id": "d", "text": "A=6, B=5, C=9"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=5, B=5, C=9', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_5'),
('f0115b9e-f0ee-435a-52a2-787dc2a79dfe', 'math_equation', 'A + B = 32
B - C = 5
C + D = 28
D = 20

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=19, B=13, C=8, D=18"}, {"id": "b", "text": "A=19, B=13, C=8, D=22"}, {"id": "c", "text": "A=19, B=13, C=8, D=20"}, {"id": "d", "text": "A=19, B=13, C=9, D=20"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=19, B=13, C=8, D=20', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_6'),
('a46739b2-e42b-1cc9-d588-efd9524bb1d5', 'math_equation', 'A + B = 30
B + C = 24
A + C = 28

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=19, B=13, C=11"}, {"id": "b", "text": "A=16, B=13, C=11"}, {"id": "c", "text": "A=17, B=13, C=11"}, {"id": "d", "text": "A=17, B=13, C=13"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=17, B=13, C=11', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_7'),
('3dfd8860-9e25-262e-c5ee-93fa20ed4d51', 'math_equation', 'A + B = 18
B + C = 23
A + C = 9

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=2, B=16, C=7"}, {"id": "b", "text": "A=2, B=16, C=8"}, {"id": "c", "text": "A=2, B=17, C=7"}, {"id": "d", "text": "A=2, B=18, C=7"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=2, B=16, C=7', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_8'),
('cb7b1bf0-90da-13c5-8c2e-6dbac2d0b96d', 'math_equation', 'A + B = 31
A - B = 9

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=20, B=11"}, {"id": "b", "text": "A=19, B=11"}, {"id": "c", "text": "A=20, B=10"}, {"id": "d", "text": "A=21, B=11"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=20, B=11', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_9'),
('a7321923-9c56-a3f3-4303-6bc66a6e3997', 'math_equation', 'A + B = 32
A - B = 0

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=16, B=14"}, {"id": "b", "text": "A=16, B=16"}, {"id": "c", "text": "A=18, B=16"}, {"id": "d", "text": "A=16, B=17"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=16, B=16', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_10'),
('404237b1-1b17-464c-d7e2-a5e07b71af1d', 'math_equation', 'A + B = 28
B - C = 1
C + D = 19
D = 12

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=20, B=8, C=7, D=10"}, {"id": "b", "text": "A=20, B=6, C=7, D=12"}, {"id": "c", "text": "A=20, B=8, C=7, D=12"}, {"id": "d", "text": "A=20, B=8, C=8, D=12"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=20, B=8, C=7, D=12', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_11'),
('15d0aa22-a04a-eff9-ac22-fda5ad8d51a5', 'math_equation', 'A + B = 14
B + C = 15
A + C = 11

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=5, B=9, C=6"}, {"id": "b", "text": "A=6, B=9, C=6"}, {"id": "c", "text": "A=4, B=9, C=6"}, {"id": "d", "text": "A=7, B=9, C=6"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=5, B=9, C=6', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_12'),
('cbccfe00-7b5b-4fe9-17db-60bfd37f3b58', 'math_equation', 'A + B = 16
B - C = 2
C + D = 24
D = 19

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=9, B=7, C=5, D=17"}, {"id": "b", "text": "A=9, B=5, C=5, D=19"}, {"id": "c", "text": "A=9, B=7, C=5, D=19"}, {"id": "d", "text": "A=9, B=7, C=6, D=19"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=9, B=7, C=5, D=19', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_13'),
('1b3da7ed-ed04-dbca-6e5c-818cac9dcab5', 'math_equation', 'A + B = 32
B - C = -4
C + D = 20
D = 3

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=19, B=13, C=16, D=3"}, {"id": "b", "text": "A=21, B=13, C=17, D=3"}, {"id": "c", "text": "A=19, B=13, C=17, D=4"}, {"id": "d", "text": "A=19, B=13, C=17, D=3"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=19, B=13, C=17, D=3', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_14'),
('5a7f95f2-75f4-1ebb-f43a-94a84aa00b45', 'math_equation', 'A + B = 23
B - C = -7
C + D = 33
D = 18

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=15, B=8, C=17, D=18"}, {"id": "b", "text": "A=15, B=8, C=16, D=18"}, {"id": "c", "text": "A=15, B=8, C=15, D=18"}, {"id": "d", "text": "A=15, B=8, C=14, D=18"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=15, B=8, C=15, D=18', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_15'),
('21505180-7580-b4a2-22c8-91f5e91761af', 'math_equation', 'A + B = 21
A - B = -5

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=8, B=11"}, {"id": "b", "text": "A=8, B=12"}, {"id": "c", "text": "A=8, B=13"}, {"id": "d", "text": "A=8, B=15"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=8, B=13', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_16'),
('adb648fd-8cfd-2bb8-70fc-24f5838de077', 'math_equation', 'A + B = 30
A - B = 0

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=15, B=15"}, {"id": "b", "text": "A=13, B=15"}, {"id": "c", "text": "A=15, B=13"}, {"id": "d", "text": "A=15, B=16"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=15, B=15', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_17'),
('f37fe883-37e7-ce14-ec96-2cb8748d7449', 'math_equation', 'A + B = 27
B - C = 9
C + D = 10
D = 2

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=10, B=16, C=8, D=2"}, {"id": "b", "text": "A=10, B=17, C=8, D=2"}, {"id": "c", "text": "A=10, B=19, C=8, D=2"}, {"id": "d", "text": "A=10, B=17, C=7, D=2"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=10, B=17, C=8, D=2', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_18'),
('c95114d4-0743-b70a-b5b5-4d6f68d30bac', 'math_equation', 'A + B = 29
B - C = 4
C + D = 28
D = 18

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=15, B=13, C=10, D=18"}, {"id": "b", "text": "A=15, B=14, C=10, D=18"}, {"id": "c", "text": "A=14, B=14, C=10, D=18"}, {"id": "d", "text": "A=16, B=14, C=10, D=18"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=15, B=14, C=10, D=18', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_19'),
('3db83282-91ad-ba9d-44b8-46b547ce29d2', 'math_equation', 'A + B = 9
B - C = -4
C + D = 27
D = 16

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=2, B=9, C=11, D=16"}, {"id": "b", "text": "A=2, B=7, C=11, D=17"}, {"id": "c", "text": "A=2, B=7, C=11, D=16"}, {"id": "d", "text": "A=1, B=7, C=11, D=16"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=2, B=7, C=11, D=16', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_20'),
('cee5b4f2-9da2-1c01-8350-7fda62532831', 'math_equation', 'A + B = 12
B - C = 3
C + D = 6
D = 5

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=8, B=4, C=1, D=7"}, {"id": "b", "text": "A=6, B=4, C=1, D=5"}, {"id": "c", "text": "A=9, B=4, C=1, D=5"}, {"id": "d", "text": "A=8, B=4, C=1, D=5"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=8, B=4, C=1, D=5', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_21'),
('f03ea4db-928c-c2a9-0987-5e8591710df8', 'math_equation', 'A + B = 9
B - C = -11
C + D = 34
D = 20

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=4, B=3, C=14, D=20"}, {"id": "b", "text": "A=6, B=1, C=14, D=20"}, {"id": "c", "text": "A=6, B=3, C=12, D=20"}, {"id": "d", "text": "A=6, B=3, C=14, D=20"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=6, B=3, C=14, D=20', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_22'),
('7fcda50e-fd55-35eb-4616-ac9c9acb12f0', 'math_equation', 'A + B = 10
B - C = 1
C + D = 4
D = 1

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=6, B=4, C=1, D=1"}, {"id": "b", "text": "A=6, B=4, C=3, D=1"}, {"id": "c", "text": "A=6, B=4, C=3, D=2"}, {"id": "d", "text": "A=6, B=5, C=3, D=1"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=6, B=4, C=3, D=1', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_23'),
('23ce2012-eae3-0dea-7088-56e025b943f3', 'math_equation', 'A + B = 20
A - B = 4

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=12, B=7"}, {"id": "b", "text": "A=12, B=9"}, {"id": "c", "text": "A=12, B=6"}, {"id": "d", "text": "A=12, B=8"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=12, B=8', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_24'),
('7f1b5d2e-3c89-5d10-d504-d7012825f7b3', 'math_equation', 'A + B = 18
B + C = 24
A + C = 20

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=7, B=11, C=12"}, {"id": "b", "text": "A=7, B=11, C=13"}, {"id": "c", "text": "A=8, B=11, C=13"}, {"id": "d", "text": "A=6, B=11, C=13"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=7, B=11, C=13', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_25'),
('3c2e0c0e-da65-eb4a-3071-44d7fd1b899e', 'math_equation', 'A + B = 12
B - C = 5
C + D = 6
D = 5

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=6, B=4, C=1, D=5"}, {"id": "b", "text": "A=6, B=7, C=1, D=5"}, {"id": "c", "text": "A=6, B=6, C=1, D=6"}, {"id": "d", "text": "A=6, B=6, C=1, D=5"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=6, B=6, C=1, D=5', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_26'),
('ab0aba9a-9fc6-8377-76be-37611f4710f8', 'math_equation', 'A + B = 24
B - C = -8
C + D = 22
D = 6

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=16, B=8, C=16, D=6"}, {"id": "b", "text": "A=14, B=8, C=16, D=6"}, {"id": "c", "text": "A=16, B=9, C=16, D=6"}, {"id": "d", "text": "A=15, B=8, C=16, D=6"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=16, B=8, C=16, D=6', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_27'),
('f35e0f39-c8aa-4345-ffac-6fe7229d5dd6', 'math_equation', 'A + B = 25
A - B = 5

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=15, B=8"}, {"id": "b", "text": "A=16, B=10"}, {"id": "c", "text": "A=15, B=10"}, {"id": "d", "text": "A=15, B=9"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=15, B=10', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_28'),
('56e3a4c9-c333-9cc5-8727-b634638920fc', 'math_equation', 'A + B = 24
B + C = 24
A + C = 24

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=12, B=13, C=12"}, {"id": "b", "text": "A=12, B=12, C=12"}, {"id": "c", "text": "A=12, B=10, C=12"}, {"id": "d", "text": "A=10, B=12, C=12"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=12, B=12, C=12', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_29'),
('b122d7ec-7fa1-b4c1-0327-53f14da9071e', 'math_equation', 'A + B = 17
B + C = 25
A + C = 10

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=1, B=17, C=9"}, {"id": "b", "text": "A=1, B=16, C=10"}, {"id": "c", "text": "A=1, B=16, C=8"}, {"id": "d", "text": "A=1, B=16, C=9"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=1, B=16, C=9', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_30'),
('6de79fe1-3a5c-a03a-62af-3cb38e7cb008', 'math_equation', 'A + B = 23
B - C = -7
C + D = 35
D = 17

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=12, B=9, C=18, D=17"}, {"id": "b", "text": "A=12, B=11, C=18, D=17"}, {"id": "c", "text": "A=12, B=11, C=20, D=17"}, {"id": "d", "text": "A=11, B=11, C=18, D=17"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=12, B=11, C=18, D=17', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_31'),
('30584043-fd5d-5a83-ad76-84ecfaac06d2', 'math_equation', 'A + B = 31
B - C = 6
C + D = 16
D = 3

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=10, B=19, C=13, D=3"}, {"id": "b", "text": "A=12, B=19, C=13, D=5"}, {"id": "c", "text": "A=12, B=19, C=13, D=3"}, {"id": "d", "text": "A=12, B=19, C=12, D=3"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=12, B=19, C=13, D=3', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_32'),
('7f89559e-fbb9-43c3-92f9-2a582c8f6a32', 'math_equation', 'A + B = 25
A - B = -5

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=10, B=13"}, {"id": "b", "text": "A=10, B=16"}, {"id": "c", "text": "A=12, B=15"}, {"id": "d", "text": "A=10, B=15"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=10, B=15', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_33'),
('eca4f2a3-e440-8b73-ff9c-870eb21ccf18', 'math_equation', 'A + B = 13
B + C = 30
A + C = 23

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=1, B=10, C=20"}, {"id": "b", "text": "A=3, B=8, C=20"}, {"id": "c", "text": "A=3, B=10, C=22"}, {"id": "d", "text": "A=3, B=10, C=20"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=3, B=10, C=20', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_34'),
('8afcb2b5-c8c6-f18a-261e-fa4f43fbd221', 'math_equation', 'A + B = 17
B + C = 15
A + C = 22

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=12, B=5, C=12"}, {"id": "b", "text": "A=11, B=5, C=10"}, {"id": "c", "text": "A=10, B=5, C=10"}, {"id": "d", "text": "A=12, B=5, C=10"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=12, B=5, C=10', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_35'),
('a76632d1-c50d-85bd-d2f0-5287ac46b7b4', 'math_equation', 'A + B = 24
A - B = -14

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=5, B=18"}, {"id": "b", "text": "A=3, B=19"}, {"id": "c", "text": "A=6, B=19"}, {"id": "d", "text": "A=5, B=19"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=5, B=19', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_36'),
('53ab7f7d-9de9-fe3f-4353-b4da323f6d27', 'math_equation', 'A + B = 8
B - C = 1
C + D = 20
D = 16

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=3, B=5, C=6, D=16"}, {"id": "b", "text": "A=3, B=5, C=4, D=16"}, {"id": "c", "text": "A=3, B=3, C=4, D=16"}, {"id": "d", "text": "A=3, B=5, C=5, D=16"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=3, B=5, C=4, D=16', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_37'),
('b96c561d-82fa-ef1c-ecfc-49e3e912740c', 'math_equation', 'A + B = 13
A - B = 11

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=14, B=1"}, {"id": "b", "text": "A=13, B=1"}, {"id": "c", "text": "A=11, B=1"}, {"id": "d", "text": "A=12, B=1"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=12, B=1', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_38'),
('7b567032-347e-ba7d-d340-f963f4a9f6f1', 'math_equation', 'A + B = 5
B + C = 14
A + C = 15

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=3, B=2, C=12"}, {"id": "b", "text": "A=3, B=1, C=12"}, {"id": "c", "text": "A=2, B=2, C=12"}, {"id": "d", "text": "A=3, B=2, C=11"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=3, B=2, C=12', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_39'),
('d2074f62-0269-af11-3431-e9c7334cc727', 'math_equation', 'A + B = 8
B - C = -6
C + D = 28
D = 15

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=1, B=7, C=13, D=17"}, {"id": "b", "text": "A=1, B=7, C=14, D=15"}, {"id": "c", "text": "A=1, B=7, C=13, D=15"}, {"id": "d", "text": "A=1, B=6, C=13, D=15"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=1, B=7, C=13, D=15', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_40'),
('e2196d0c-f2b1-a25c-c32f-33bc54cde413', 'math_equation', 'A + B = 35
B + C = 22
A + C = 17

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=15, B=20, C=2"}, {"id": "b", "text": "A=15, B=20, C=1"}, {"id": "c", "text": "A=14, B=20, C=2"}, {"id": "d", "text": "A=15, B=22, C=2"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=15, B=20, C=2', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_41'),
('bf28f966-9051-acb9-745c-b03bbb9abd5d', 'math_equation', 'A + B = 32
B - C = 11
C + D = 14
D = 5

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=12, B=20, C=9, D=4"}, {"id": "b", "text": "A=12, B=20, C=9, D=5"}, {"id": "c", "text": "A=12, B=20, C=8, D=5"}, {"id": "d", "text": "A=12, B=20, C=9, D=7"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=12, B=20, C=9, D=5', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_42'),
('3b4a3735-5b9c-2e69-96cc-3d1feefe0e2f', 'math_equation', 'A + B = 32
A - B = 6

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=17, B=13"}, {"id": "b", "text": "A=19, B=14"}, {"id": "c", "text": "A=19, B=13"}, {"id": "d", "text": "A=19, B=11"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=19, B=13', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_43'),
('7be8db35-2852-9a74-83aa-af3d0c35b5fd', 'math_equation', 'A + B = 19
A - B = -7

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=6, B=13"}, {"id": "b", "text": "A=6, B=12"}, {"id": "c", "text": "A=6, B=15"}, {"id": "d", "text": "A=5, B=13"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=6, B=13', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_44'),
('fd3e220c-f43c-6faa-38c4-d9ec2a203fb2', 'math_equation', 'A + B = 10
B + C = 24
A + C = 20

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=3, B=7, C=16"}, {"id": "b", "text": "A=3, B=9, C=17"}, {"id": "c", "text": "A=3, B=6, C=17"}, {"id": "d", "text": "A=3, B=7, C=17"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=3, B=7, C=17', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_45'),
('3f966e16-1946-3e53-12be-6b5a55944656', 'math_equation', 'A + B = 10
B - C = -4
C + D = 7
D = 1

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=8, B=2, C=6, D=3"}, {"id": "b", "text": "A=8, B=2, C=6, D=1"}, {"id": "c", "text": "A=10, B=2, C=6, D=1"}, {"id": "d", "text": "A=8, B=2, C=6, D=2"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=8, B=2, C=6, D=1', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_46'),
('3de29c63-ada6-8e01-7853-bd5cb86f7721', 'math_equation', 'A + B = 40
B - C = 18
C + D = 21
D = 19

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=21, B=20, C=2, D=19"}, {"id": "b", "text": "A=20, B=20, C=2, D=19"}, {"id": "c", "text": "A=20, B=20, C=2, D=17"}, {"id": "d", "text": "A=20, B=20, C=2, D=18"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=20, B=20, C=2, D=19', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_47'),
('23b25158-7b17-0ee4-7e05-4633fcd13d32', 'math_equation', 'A + B = 22
B + C = 12
A + C = 24

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=19, B=5, C=7"}, {"id": "b", "text": "A=17, B=5, C=7"}, {"id": "c", "text": "A=17, B=3, C=7"}, {"id": "d", "text": "A=17, B=4, C=7"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=17, B=5, C=7', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_48'),
('642b7b37-98c9-bb4a-c64f-cc14fc9adfd2', 'math_equation', 'A + B = 19
A - B = -1

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=9, B=8"}, {"id": "b", "text": "A=9, B=10"}, {"id": "c", "text": "A=9, B=11"}, {"id": "d", "text": "A=9, B=9"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=9, B=10', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_49'),
('85297d0d-3d1a-1d35-d077-e3002717a058', 'math_equation', 'A + B = 13
B + C = 26
A + C = 17

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=2, B=11, C=17"}, {"id": "b", "text": "A=1, B=11, C=15"}, {"id": "c", "text": "A=2, B=11, C=14"}, {"id": "d", "text": "A=2, B=11, C=15"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=2, B=11, C=15', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_50'),
('9039ead3-1293-a08d-ddc4-12d540d07de2', 'math_equation', 'A + B = 10
B + C = 10
A + C = 16

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=8, B=2, C=7"}, {"id": "b", "text": "A=9, B=2, C=8"}, {"id": "c", "text": "A=8, B=4, C=8"}, {"id": "d", "text": "A=8, B=2, C=8"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=8, B=2, C=8', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_51'),
('f3c62f48-6c06-b184-d3be-8de3740b9d46', 'math_equation', 'A + B = 25
A - B = 13

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=21, B=6"}, {"id": "b", "text": "A=19, B=6"}, {"id": "c", "text": "A=19, B=7"}, {"id": "d", "text": "A=18, B=6"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=19, B=6', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_52'),
('f9dcb425-ac55-a50c-9c4a-99e02dc342a4', 'math_equation', 'A + B = 33
B + C = 30
A + C = 23

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=13, B=21, C=10"}, {"id": "b", "text": "A=14, B=20, C=10"}, {"id": "c", "text": "A=13, B=20, C=10"}, {"id": "d", "text": "A=13, B=20, C=11"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=13, B=20, C=10', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_53'),
('6bbdb8ef-6b3f-85de-8616-e94830cdcc4e', 'math_equation', 'A + B = 16
B + C = 29
A + C = 25

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=4, B=10, C=19"}, {"id": "b", "text": "A=6, B=10, C=17"}, {"id": "c", "text": "A=7, B=10, C=19"}, {"id": "d", "text": "A=6, B=10, C=19"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=6, B=10, C=19', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_54'),
('ae5ff92a-5015-f29b-f760-cdd6a7fcbc3c', 'math_equation', 'A + B = 22
B - C = 6
C + D = 7
D = 6

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=15, B=7, C=3, D=6"}, {"id": "b", "text": "A=15, B=7, C=2, D=6"}, {"id": "c", "text": "A=15, B=7, C=1, D=6"}, {"id": "d", "text": "A=15, B=7, C=1, D=5"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=15, B=7, C=1, D=6', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_55'),
('1b989518-e6df-48e6-60ac-7a91180176a5', 'math_equation', 'A + B = 16
B + C = 31
A + C = 19

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=4, B=14, C=17"}, {"id": "b", "text": "A=2, B=14, C=15"}, {"id": "c", "text": "A=1, B=14, C=17"}, {"id": "d", "text": "A=2, B=14, C=17"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=2, B=14, C=17', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_56'),
('c05ac2a3-6d07-4201-8f38-4881a793b116', 'math_equation', 'A + B = 39
A - B = -1

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=19, B=19"}, {"id": "b", "text": "A=18, B=20"}, {"id": "c", "text": "A=19, B=20"}, {"id": "d", "text": "A=20, B=20"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=19, B=20', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_57'),
('b1dc3e35-fea0-58e2-4d76-d36db2179023', 'math_equation', 'A + B = 20
A - B = 10

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=15, B=7"}, {"id": "b", "text": "A=15, B=5"}, {"id": "c", "text": "A=14, B=5"}, {"id": "d", "text": "A=17, B=5"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=15, B=5', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_58'),
('ad0ec080-f4d2-563b-d1d5-b48c2ef69e8f', 'math_equation', 'A + B = 13
B - C = 6
C + D = 19
D = 16

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=4, B=9, C=4, D=16"}, {"id": "b", "text": "A=4, B=9, C=3, D=16"}, {"id": "c", "text": "A=4, B=10, C=3, D=16"}, {"id": "d", "text": "A=2, B=9, C=3, D=16"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=4, B=9, C=3, D=16', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_59'),
('749ed435-a25c-c174-7095-e650d19cc8ed', 'math_equation', 'A + B = 20
B - C = 16
C + D = 12
D = 9

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=1, B=19, C=3, D=9"}, {"id": "b", "text": "A=1, B=17, C=3, D=9"}, {"id": "c", "text": "A=3, B=19, C=3, D=9"}, {"id": "d", "text": "A=2, B=19, C=3, D=9"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=1, B=19, C=3, D=9', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_60'),
('21398571-c9a6-17e3-e7fc-4f955cfdf880', 'math_equation', 'A + B = 22
B - C = -4
C + D = 10
D = 4

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=20, B=1, C=6, D=4"}, {"id": "b", "text": "A=20, B=2, C=6, D=4"}, {"id": "c", "text": "A=20, B=3, C=6, D=4"}, {"id": "d", "text": "A=19, B=2, C=6, D=4"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=20, B=2, C=6, D=4', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_61'),
('7a48e94d-fc95-18eb-3839-04b378e5e05c', 'math_equation', 'A + B = 17
B - C = 10
C + D = 12
D = 10

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=3, B=12, C=2, D=10"}, {"id": "b", "text": "A=6, B=12, C=2, D=10"}, {"id": "c", "text": "A=7, B=12, C=2, D=10"}, {"id": "d", "text": "A=5, B=12, C=2, D=10"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=5, B=12, C=2, D=10', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_62'),
('91b3ce3a-a83c-5433-d624-c49157aeaa88', 'math_equation', 'A + B = 23
B - C = -5
C + D = 35
D = 16

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=9, B=14, C=17, D=16"}, {"id": "b", "text": "A=9, B=14, C=19, D=16"}, {"id": "c", "text": "A=9, B=14, C=19, D=15"}, {"id": "d", "text": "A=9, B=14, C=19, D=17"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=9, B=14, C=19, D=16', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_63'),
('23f198ea-23fa-3992-f7f2-06465257e88e', 'math_equation', 'A + B = 25
A - B = -13

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=6, B=17"}, {"id": "b", "text": "A=6, B=20"}, {"id": "c", "text": "A=4, B=19"}, {"id": "d", "text": "A=6, B=19"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=6, B=19', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_64'),
('51290c33-d0c9-824a-c798-4431e09c22f7', 'math_equation', 'A + B = 22
B - C = 4
C + D = 20
D = 8

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=6, B=16, C=12, D=8"}, {"id": "b", "text": "A=6, B=14, C=12, D=8"}, {"id": "c", "text": "A=8, B=16, C=12, D=8"}, {"id": "d", "text": "A=6, B=16, C=11, D=8"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=6, B=16, C=12, D=8', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_65'),
('0a7e9663-9aaf-e04d-85ff-b3275f47bfe3', 'math_equation', 'A + B = 15
A - B = -7

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=4, B=9"}, {"id": "b", "text": "A=4, B=13"}, {"id": "c", "text": "A=6, B=11"}, {"id": "d", "text": "A=4, B=11"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=4, B=11', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_66'),
('407c6049-8347-5a73-97c8-0396b166dfa8', 'math_equation', 'A + B = 14
B + C = 29
A + C = 21

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=3, B=11, C=17"}, {"id": "b", "text": "A=3, B=11, C=18"}, {"id": "c", "text": "A=3, B=13, C=18"}, {"id": "d", "text": "A=5, B=11, C=18"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=3, B=11, C=18', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_67'),
('1f80b7ca-bee0-4629-8af7-4ec60c124d0d', 'math_equation', 'A + B = 18
A - B = 4

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=11, B=7"}, {"id": "b", "text": "A=11, B=6"}, {"id": "c", "text": "A=10, B=7"}, {"id": "d", "text": "A=12, B=7"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=11, B=7', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_68'),
('e4a6bdf1-8614-90aa-0b84-b2dbd0c1be16', 'math_equation', 'A + B = 13
A - B = 1

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=7, B=6"}, {"id": "b", "text": "A=9, B=6"}, {"id": "c", "text": "A=8, B=6"}, {"id": "d", "text": "A=6, B=6"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=7, B=6', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_69'),
('ff76fc77-6158-653e-aecf-67af41fa1837', 'math_equation', 'A + B = 11
B - C = -11
C + D = 31
D = 18

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=7, B=2, C=13, D=18"}, {"id": "b", "text": "A=9, B=2, C=13, D=18"}, {"id": "c", "text": "A=11, B=2, C=13, D=18"}, {"id": "d", "text": "A=9, B=1, C=13, D=18"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=9, B=2, C=13, D=18', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_70'),
('2150558f-54ab-18b8-8ab2-786f53683012', 'math_equation', 'A + B = 9
A - B = 3

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=6, B=4"}, {"id": "b", "text": "A=4, B=3"}, {"id": "c", "text": "A=7, B=3"}, {"id": "d", "text": "A=6, B=3"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=6, B=3', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_71'),
('a43a1a56-8d3b-a88c-1921-fd8138716d08', 'math_equation', 'A + B = 11
A - B = 3

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=7, B=4"}, {"id": "b", "text": "A=7, B=3"}, {"id": "c", "text": "A=6, B=4"}, {"id": "d", "text": "A=7, B=6"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=7, B=4', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_72'),
('f01688d2-3485-3d53-caa2-265f246f0504', 'math_equation', 'A + B = 28
B + C = 20
A + C = 14

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=11, B=17, C=4"}, {"id": "b", "text": "A=11, B=17, C=3"}, {"id": "c", "text": "A=10, B=17, C=3"}, {"id": "d", "text": "A=9, B=17, C=3"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=11, B=17, C=3', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_73'),
('1a912ad0-7327-e86e-ddbf-f7aa8bf7e8f6', 'math_equation', 'A + B = 29
A - B = -1

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=14, B=15"}, {"id": "b", "text": "A=14, B=13"}, {"id": "c", "text": "A=14, B=14"}, {"id": "d", "text": "A=14, B=16"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=14, B=15', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_74'),
('6a046c75-3b47-b768-e856-43a7f046a1e2', 'math_equation', 'A + B = 22
A - B = 8

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=14, B=7"}, {"id": "b", "text": "A=15, B=9"}, {"id": "c", "text": "A=15, B=8"}, {"id": "d", "text": "A=15, B=7"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=15, B=7', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_75'),
('db647296-5f9f-1d22-5a7a-733e6660f49c', 'math_equation', 'A + B = 14
A - B = 4

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=11, B=5"}, {"id": "b", "text": "A=9, B=5"}, {"id": "c", "text": "A=8, B=5"}, {"id": "d", "text": "A=7, B=5"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=9, B=5', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_76'),
('6bbc2762-5092-65a0-0ab1-97da9a5dd86f', 'math_equation', 'A + B = 27
B - C = 3
C + D = 30
D = 14

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=8, B=19, C=16, D=14"}, {"id": "b", "text": "A=8, B=19, C=17, D=14"}, {"id": "c", "text": "A=8, B=19, C=18, D=14"}, {"id": "d", "text": "A=9, B=19, C=16, D=14"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=8, B=19, C=16, D=14', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_77'),
('b5aeaf64-6309-67ba-ea91-9f5b50e70d6b', 'math_equation', 'A + B = 24
B + C = 16
A + C = 26

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=17, B=7, C=7"}, {"id": "b", "text": "A=17, B=7, C=9"}, {"id": "c", "text": "A=17, B=7, C=10"}, {"id": "d", "text": "A=17, B=9, C=9"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=17, B=7, C=9', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_78'),
('fa833c6e-6d95-5a73-700c-3acbf876e921', 'math_equation', 'A + B = 26
A - B = 12

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=19, B=7"}, {"id": "b", "text": "A=18, B=7"}, {"id": "c", "text": "A=17, B=7"}, {"id": "d", "text": "A=19, B=8"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=19, B=7', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_79'),
('6d155d87-3b65-7e13-0ec1-3e46246d87e1', 'math_equation', 'A + B = 23
A - B = -9

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=5, B=16"}, {"id": "b", "text": "A=7, B=17"}, {"id": "c", "text": "A=7, B=16"}, {"id": "d", "text": "A=9, B=16"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=7, B=16', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_80'),
('3720b6b3-a199-0885-0c81-ec59be29eb1f', 'math_equation', 'A + B = 21
B + C = 21
A + C = 12

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=6, B=14, C=6"}, {"id": "b", "text": "A=6, B=15, C=7"}, {"id": "c", "text": "A=6, B=13, C=6"}, {"id": "d", "text": "A=6, B=15, C=6"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=6, B=15, C=6', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_81'),
('5b98de90-aef2-bd2c-5838-26a24c301fc3', 'math_equation', 'A + B = 26
B + C = 24
A + C = 26

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=13, B=12, C=12"}, {"id": "b", "text": "A=15, B=12, C=12"}, {"id": "c", "text": "A=14, B=12, C=14"}, {"id": "d", "text": "A=14, B=12, C=12"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=14, B=12, C=12', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_82'),
('a93adfac-afd3-f256-d6f7-079cb05d0e55', 'math_equation', 'A + B = 36
B - C = 17
C + D = 20
D = 17

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=16, B=21, C=3, D=17"}, {"id": "b", "text": "A=16, B=20, C=3, D=17"}, {"id": "c", "text": "A=16, B=19, C=3, D=17"}, {"id": "d", "text": "A=16, B=20, C=1, D=17"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=16, B=20, C=3, D=17', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_83'),
('c6e64ea9-def7-cf24-ada7-9059ad404ba3', 'math_equation', 'A + B = 29
A - B = 1

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=13, B=14"}, {"id": "b", "text": "A=15, B=13"}, {"id": "c", "text": "A=15, B=14"}, {"id": "d", "text": "A=14, B=14"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=15, B=14', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_84'),
('440477d2-a77f-b11c-49e7-93279a3bc3fc', 'math_equation', 'A + B = 25
A - B = 13

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=20, B=6"}, {"id": "b", "text": "A=19, B=6"}, {"id": "c", "text": "A=21, B=6"}, {"id": "d", "text": "A=18, B=6"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=19, B=6', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_85'),
('fb5a0049-44bc-6810-d176-d0d41050358b', 'math_equation', 'A + B = 28
A - B = -8

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=8, B=18"}, {"id": "b", "text": "A=11, B=18"}, {"id": "c", "text": "A=10, B=17"}, {"id": "d", "text": "A=10, B=18"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=10, B=18', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_86'),
('4d75685c-d3f1-d9a5-8a48-e8d5f102d77e', 'math_equation', 'A + B = 20
A - B = 2

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=11, B=9"}, {"id": "b", "text": "A=13, B=9"}, {"id": "c", "text": "A=12, B=9"}, {"id": "d", "text": "A=11, B=7"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=11, B=9', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_87'),
('eb3bcc09-7fd9-3427-fef2-e9b7a0132f8b', 'math_equation', 'A + B = 29
A - B = 11

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=18, B=9"}, {"id": "b", "text": "A=22, B=9"}, {"id": "c", "text": "A=20, B=9"}, {"id": "d", "text": "A=20, B=7"}]'::jsonb, 'c', 'Using substitution and elimination, we can solve for the variables. A=20, B=9', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_88'),
('69ecc1e9-3dff-e330-74cf-be623f0ca831', 'math_equation', 'A + B = 25
B - C = 3
C + D = 17
D = 11

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=16, B=7, C=6, D=11"}, {"id": "b", "text": "A=16, B=8, C=6, D=11"}, {"id": "c", "text": "A=16, B=11, C=6, D=11"}, {"id": "d", "text": "A=16, B=9, C=6, D=11"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=16, B=9, C=6, D=11', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_89'),
('89779515-51d7-9b93-e06b-30cfae42e7ae', 'math_equation', 'A + B = 29
B + C = 27
A + C = 36

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=19, B=10, C=17"}, {"id": "b", "text": "A=20, B=10, C=17"}, {"id": "c", "text": "A=18, B=10, C=17"}, {"id": "d", "text": "A=19, B=8, C=17"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=19, B=10, C=17', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_90'),
('e6346ef1-1314-3130-7109-abb72ac18acd', 'math_equation', 'A + B = 25
B - C = -2
C + D = 12
D = 5

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=19, B=5, C=7, D=5"}, {"id": "b", "text": "A=21, B=5, C=7, D=5"}, {"id": "c", "text": "A=20, B=5, C=5, D=5"}, {"id": "d", "text": "A=20, B=5, C=7, D=5"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=20, B=5, C=7, D=5', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_91'),
('5113b753-22f9-9df0-c0c5-7612387f70b6', 'math_equation', 'A + B = 25
B + C = 10
A + C = 19

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=17, B=8, C=2"}, {"id": "b", "text": "A=19, B=8, C=2"}, {"id": "c", "text": "A=17, B=10, C=2"}, {"id": "d", "text": "A=15, B=8, C=2"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=17, B=8, C=2', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_92'),
('0a0fb42b-4a77-1043-c8ea-db9fb069552f', 'math_equation', 'A + B = 3
A - B = -1

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=1, B=2"}, {"id": "b", "text": "A=3, B=2"}, {"id": "c", "text": "A=2, B=2"}, {"id": "d", "text": "A=1, B=1"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=1, B=2', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_93'),
('6d02888d-e75c-6ed4-a0fc-18e5711fe580', 'math_equation', 'A + B = 25
B - C = -9
C + D = 26
D = 11

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=19, B=6, C=15, D=9"}, {"id": "b", "text": "A=21, B=6, C=15, D=11"}, {"id": "c", "text": "A=19, B=8, C=15, D=11"}, {"id": "d", "text": "A=19, B=6, C=15, D=11"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=19, B=6, C=15, D=11', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_94'),
('f8c0e5eb-6735-88a6-61d9-f17648f44e31', 'math_equation', 'A + B = 24
B + C = 21
A + C = 35

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=19, B=5, C=16"}, {"id": "b", "text": "A=19, B=5, C=14"}, {"id": "c", "text": "A=17, B=5, C=16"}, {"id": "d", "text": "A=21, B=5, C=16"}]'::jsonb, 'a', 'Using substitution and elimination, we can solve for the variables. A=19, B=5, C=16', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_95'),
('73384882-ebcc-f683-87c2-f8e941cbc251', 'math_equation', 'A + B = 18
A - B = 6

What numbers do A and B correspond to?', '[{"id": "a", "text": "A=12, B=8"}, {"id": "b", "text": "A=14, B=6"}, {"id": "c", "text": "A=12, B=4"}, {"id": "d", "text": "A=12, B=6"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=12, B=6', 'easy', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'basic_equations', 'system_of_equations', 'math_batch1_96'),
('ed143089-a820-c656-f021-64b534a99d41', 'math_equation', 'A + B = 25
B - C = -8
C + D = 31
D = 16

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=18, B=7, C=16, D=16"}, {"id": "b", "text": "A=18, B=7, C=15, D=15"}, {"id": "c", "text": "A=18, B=9, C=15, D=16"}, {"id": "d", "text": "A=18, B=7, C=15, D=16"}]'::jsonb, 'd', 'Using substitution and elimination, we can solve for the variables. A=18, B=7, C=15, D=16', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_97'),
('97a30fb6-b362-8677-d727-b8384229ecb3', 'math_equation', 'A + B = 22
B - C = 13
C + D = 9
D = 8

What numbers do A, B, C and D correspond to?', '[{"id": "a", "text": "A=7, B=14, C=1, D=8"}, {"id": "b", "text": "A=8, B=14, C=1, D=8"}, {"id": "c", "text": "A=8, B=12, C=1, D=8"}, {"id": "d", "text": "A=10, B=14, C=1, D=8"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=8, B=14, C=1, D=8', 'hard', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'system_of_equations', 'system_of_equations', 'math_batch1_98'),
('f559a4c3-aec1-28a3-fbb0-1559ee354526', 'math_equation', 'A + B = 16
B + C = 9
A + C = 15

What numbers do A, B and C correspond to?', '[{"id": "a", "text": "A=11, B=5, C=6"}, {"id": "b", "text": "A=11, B=5, C=4"}, {"id": "c", "text": "A=11, B=5, C=2"}, {"id": "d", "text": "A=11, B=3, C=4"}]'::jsonb, 'b', 'Using substitution and elimination, we can solve for the variables. A=11, B=5, C=4', 'medium', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'substitution_methods', 'system_of_equations', 'math_batch1_99')

ON CONFLICT (id) DO NOTHING;
