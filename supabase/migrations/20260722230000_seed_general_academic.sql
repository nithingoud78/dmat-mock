-- ============================================================
-- Migration: Seed General Academic sample questions
-- ============================================================

-- Insert a source for GA sample questions
INSERT INTO public.sources (id, name, publisher, edition, year, license_note)
VALUES (
  'aaaaaaaa-0000-0000-0000-000000000001',
  'dMAT Practice Pro — Sample Questions',
  'dMAT Practice Pro',
  '1st',
  '2026',
  'Internal sample questions for testing the General Academic module.'
)
ON CONFLICT (id) DO NOTHING;

-- ── Question 1: Reading Comprehension ────────────────────────────────────────
INSERT INTO public.questions (
  id, module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, source_id, time_estimate_seconds, visual_data
) VALUES (
  'bbbbbbbb-0001-0000-0000-000000000001',
  'general_academic',
  'Read the following passage carefully and answer the question below.

Photosynthesis is the process by which green plants, algae, and certain bacteria convert light energy — usually from the sun — into chemical energy stored in glucose. This process takes place primarily in the chloroplasts of plant cells, where the green pigment chlorophyll absorbs sunlight. The overall chemical equation is: 6CO₂ + 6H₂O + light energy → C₆H₁₂O₆ + 6O₂. The process consists of two main stages: the light-dependent reactions, which occur in the thylakoid membranes, and the Calvin cycle (light-independent reactions), which occur in the stroma.

Q: According to the passage, where do the light-dependent reactions of photosynthesis occur?',
  '[
    {"id": "a", "text": "In the stroma of the chloroplast"},
    {"id": "b", "text": "In the thylakoid membranes"},
    {"id": "c", "text": "In the cell nucleus"},
    {"id": "d", "text": "In the mitochondria"}
  ]'::jsonb,
  'b',
  'The passage explicitly states that "the light-dependent reactions... occur in the thylakoid membranes." The stroma is where the Calvin cycle (light-independent reactions) takes place.',
  'easy',
  'aaaaaaaa-0000-0000-0000-000000000001',
  90,
  '{"type": "general_academic", "subtype": "reading_comprehension"}'::jsonb
) ON CONFLICT (id) DO NOTHING;

-- ── Question 2: Logical Reasoning ────────────────────────────────────────────
INSERT INTO public.questions (
  id, module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, source_id, time_estimate_seconds, visual_data
) VALUES (
  'bbbbbbbb-0002-0000-0000-000000000001',
  'general_academic',
  'All doctors are scientists. Some scientists are also engineers. Maria is a doctor.

Which of the following conclusions must be true?',
  '[
    {"id": "a", "text": "Maria is an engineer"},
    {"id": "b", "text": "Maria is a scientist"},
    {"id": "c", "text": "All engineers are doctors"},
    {"id": "d", "text": "Some doctors are not scientists"}
  ]'::jsonb,
  'b',
  'Since "All doctors are scientists" and "Maria is a doctor," it necessarily follows that Maria is a scientist. We cannot conclude that Maria is an engineer (that would require knowing she is one of the scientists who are also engineers).',
  'easy',
  'aaaaaaaa-0000-0000-0000-000000000001',
  75,
  '{"type": "general_academic", "subtype": "logical_reasoning"}'::jsonb
) ON CONFLICT (id) DO NOTHING;

-- ── Question 3: Data Interpretation ──────────────────────────────────────────
INSERT INTO public.questions (
  id, module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, source_id, time_estimate_seconds, visual_data
) VALUES (
  'bbbbbbbb-0003-0000-0000-000000000001',
  'general_academic',
  'A company''s quarterly revenue (in €millions) was as follows:
Q1: 45, Q2: 60, Q3: 55, Q4: 80.

What was the percentage increase in revenue from Q1 to Q4?',
  '[
    {"id": "a", "text": "33.3%"},
    {"id": "b", "text": "55.6%"},
    {"id": "c", "text": "77.8%"},
    {"id": "d", "text": "12.5%"}
  ]'::jsonb,
  'c',
  'Percentage increase = ((Q4 - Q1) / Q1) × 100 = ((80 - 45) / 45) × 100 = (35/45) × 100 ≈ 77.8%.',
  'medium',
  'aaaaaaaa-0000-0000-0000-000000000001',
  90,
  '{"type": "general_academic", "subtype": "data_interpretation"}'::jsonb
) ON CONFLICT (id) DO NOTHING;

-- ── Question 4: Applied Problem Solving ──────────────────────────────────────
INSERT INTO public.questions (
  id, module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, source_id, time_estimate_seconds, visual_data
) VALUES (
  'bbbbbbbb-0004-0000-0000-000000000001',
  'general_academic',
  'A train travels from City A to City B, a distance of 300 km, at an average speed of 75 km/h. On the return journey it travels at 100 km/h.

What is the average speed for the entire round trip?',
  '[
    {"id": "a", "text": "87.5 km/h"},
    {"id": "b", "text": "85.7 km/h"},
    {"id": "c", "text": "90 km/h"},
    {"id": "d", "text": "80 km/h"}
  ]'::jsonb,
  'b',
  'Average speed for a round trip = 2 × (v₁ × v₂) / (v₁ + v₂) = 2 × (75 × 100) / (75 + 100) = 15000 / 175 ≈ 85.71 km/h. Note: you cannot simply average the two speeds.',
  'medium',
  'aaaaaaaa-0000-0000-0000-000000000001',
  90,
  '{"type": "general_academic", "subtype": "applied_problem_solving"}'::jsonb
) ON CONFLICT (id) DO NOTHING;

-- ── Question 5: Reading Comprehension ────────────────────────────────────────
INSERT INTO public.questions (
  id, module, prompt_text, options, correct_option_id, explanation_text,
  difficulty, source_id, time_estimate_seconds, visual_data
) VALUES (
  'bbbbbbbb-0005-0000-0000-000000000001',
  'general_academic',
  'The following is an excerpt from a study on urbanisation:

"Between 2000 and 2020, the proportion of the global population living in urban areas rose from 47% to 56%. This shift has been most pronounced in Sub-Saharan Africa and South Asia, where rapid economic growth and rural-to-urban migration have accelerated the trend. Urban areas, while accounting for only 3% of the Earth''s land surface, produce approximately 70% of global carbon emissions and consume 60–80% of global energy. Urban planning experts argue that sustainable city design — including efficient public transport, green spaces, and mixed-use zoning — is critical to mitigating these environmental impacts."

Q: Which statement is best supported by the passage?',
  '[
    {"id": "a", "text": "Urban areas are solely responsible for climate change"},
    {"id": "b", "text": "Sustainable urban planning can help reduce environmental impact"},
    {"id": "c", "text": "Rural areas produce more carbon emissions than urban areas"},
    {"id": "d", "text": "Urbanisation has slowed significantly since 2010"}
  ]'::jsonb,
  'b',
  'The passage directly states that "sustainable city design... is critical to mitigating these environmental impacts," supporting option B. Option A overstates the claim (the passage says 70%, not 100%). Option C contradicts the passage. Option D is not mentioned.',
  'medium',
  'aaaaaaaa-0000-0000-0000-000000000001',
  120,
  '{"type": "general_academic", "subtype": "reading_comprehension"}'::jsonb
) ON CONFLICT (id) DO NOTHING;

-- Done
