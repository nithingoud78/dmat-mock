-- ==============================================================================
-- Migration: Seed Official dMAT Questions
-- Description: Expands the question bank based on Section 5 of the official dMAT 
-- report, utilizing the exact subtopics and high-scoring strategies mentioned.
-- ==============================================================================

-- Question 1: Figure Sequences (x+1 pattern)
INSERT INTO public.questions (
  id, module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, source_id, time_estimate_seconds, subtopic, question_type, content_hash
) VALUES (
  'ffffffff-0001-0000-0000-000000000001',
  'figure_sequence',
  'Observe the sequence of matrices. A black dot starts in the top-left corner. In step 1, it moves 1 space right. In step 2, it moves 2 spaces down. In step 3, it moves 3 spaces left (bouncing off the boundary to move right). Following this x+1 progressive movement pattern, where will the dot be in the next matrix?',
  '[
    {"id": "a", "text": "Top-right corner"},
    {"id": "b", "text": "Bottom-left corner"},
    {"id": "c", "text": "Center of the matrix"},
    {"id": "d", "text": "Moving 4 spaces up from its current position"}
  ]'::jsonb,
  'd',
  'High scoring strategy: Identify the simple rule first. The movement follows an x+1 pattern (1 step, then 2 steps, then 3 steps). The direction also rotates 90 degrees clockwise (Right, Down, Left, Up). Therefore, in the next step, it must move 4 spaces Up.',
  'hard',
  'aaaaaaaa-0000-0000-0000-000000000001',
  75,
  'x+1 pattern',
  'progressive_movement',
  'hash_fs_xplus1_001'
) ON CONFLICT (id) DO NOTHING;

-- Question 2: Mathematical Equations (Substitution methods)
INSERT INTO public.questions (
  id, module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, source_id, time_estimate_seconds, subtopic, question_type, content_hash
) VALUES (
  'eeeeeeee-0001-0000-0000-000000000001',
  'math_equation',
  'Find the integer values (between 1 and 20) for A, B, and C based on the following system of equations:
1) A + B = 15
2) B = 2 × C
3) C = A - 3',
  '[
    {"id": "a", "text": "A=7, B=8, C=4"},
    {"id": "b", "text": "A=5, B=10, C=5"},
    {"id": "c", "text": "A=9, B=6, C=3"},
    {"id": "d", "text": "A=7, B=8, C=5"}
  ]'::jsonb,
  'a',
  'High scoring strategy: Use substitution efficiently. From (3), C = A - 3. Substitute into (2): B = 2(A - 3) = 2A - 6. Substitute this into (1): A + (2A - 6) = 15 => 3A - 6 = 15 => 3A = 21 => A = 7. Then C = 7 - 3 = 4, and B = 2 × 4 = 8. Verify: 7 + 8 = 15.',
  'medium',
  'aaaaaaaa-0000-0000-0000-000000000001',
  75,
  'substitution_methods',
  'system_of_equations',
  'hash_me_subst_001'
) ON CONFLICT (id) DO NOTHING;

-- Question 3: Latin Squares (Row and column constraints)
INSERT INTO public.questions (
  id, module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, source_id, time_estimate_seconds, subtopic, question_type, content_hash
) VALUES (
  'dddddddd-0001-0000-0000-000000000001',
  'latin_square',
  'In a 5x5 Latin Square using letters A, B, C, D, E, the first row is A, B, C, D, E. The first column is A, C, D, E, B. What letter must be placed at the intersection of the second row and second column (position R2,C2)?',
  '[
    {"id": "a", "text": "A"},
    {"id": "b", "text": "B"},
    {"id": "c", "text": "D"},
    {"id": "d", "text": "E"}
  ]'::jsonb,
  'd',
  'High scoring strategy: Practice mental filling of other cells. R2,C1 is C. R1,C2 is B. Thus, R2,C2 cannot be C or B. Using indirect deduction and ensuring no row/col constraints are violated for the rest of the 5x5 grid, E is the only valid placement that does not force a contradiction later in the grid.',
  'medium',
  'aaaaaaaa-0000-0000-0000-000000000001',
  75,
  'row_and_column_constraints',
  'indirect_deduction',
  'hash_ls_rc_001'
) ON CONFLICT (id) DO NOTHING;

-- Question 4: General Academic (Data interpretation)
INSERT INTO public.questions (
  id, module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, source_id, time_estimate_seconds, subtopic, question_type, content_hash
) VALUES (
  'cccccccc-0001-0000-0000-000000000001',
  'general_academic',
  'Study the provided text scenario on annual energy consumption.
Year 2024: 500 TWh (Coal), 300 TWh (Wind)
Year 2025: 450 TWh (Coal), 400 TWh (Wind)
Assuming the absolute rate of change remains perfectly constant every year, in what year will Wind energy consumption first strictly exceed Coal energy consumption?',
  '[
    {"id": "a", "text": "2026"},
    {"id": "b", "text": "2027"},
    {"id": "c", "text": "2028"},
    {"id": "d", "text": "2029"}
  ]'::jsonb,
  'a',
  'High scoring strategy: Analyze the absolute rates of change. Coal decreases by 50 TWh/year. Wind increases by 100 TWh/year. In 2026, Coal will be 400 TWh and Wind will be 500 TWh. 500 is strictly greater than 400, so it occurs in 2026.',
  'hard',
  'aaaaaaaa-0000-0000-0000-000000000001',
  90,
  'data_interpretation',
  'trend_analysis',
  'hash_ga_data_001'
) ON CONFLICT (id) DO NOTHING;
