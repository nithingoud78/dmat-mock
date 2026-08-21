-- STRICT IMPORT MIGRATION
-- Generated: 2026-08-21T07:49:23.122Z
-- Contains ONLY questions exactly as printed in the official 2026 PDF. No options generated.


INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Which vector results when the operation s = a + b - c is performed? Given a = (1,3), b = (5,1), c = (1,-2).', '[{"id":"a","text":"s = (5, 6)"},{"id":"b","text":"s = (7, 2)"},{"id":"c","text":"s = (5, 2)"},{"id":"d","text":"s = (7, 6)"}]'::jsonb, 'a', '',
  'medium', NULL, 'Vector Calculations', 'single_choice', 'b8ed22ca37dcf38a',
  'Official g.a.s.t. 2026 PDF, Vector Calculations Q1', true, true, '{general_academic,medium,vector calculations}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'b8ed22ca37dcf38a'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'What statement is true when a vector is multiplied by the number "-2"?', '[{"id":"a","text":"The length doubles; the direction remains the same."},{"id":"b","text":"The length halves; the direction is reversed."},{"id":"c","text":"The length doubles; the direction is reversed."},{"id":"d","text":"The length halves; the direction remains the same."}]'::jsonb, 'c', '',
  'easy', NULL, 'Vector Calculations', 'single_choice', '82238cd8384b7e12',
  'Official g.a.s.t. 2026 PDF, Vector Calculations Q2', true, true, '{general_academic,easy,vector calculations}', 60, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '82238cd8384b7e12'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'The type of result from the three operations (scalar product, vector product, triple product) is not always the same. Which statement is correct?', '[{"id":"a","text":"Scalar product → scalar; vector product → vector; triple product → vector."},{"id":"b","text":"Scalar product → scalar; vector product → vector; triple product → scalar."},{"id":"c","text":"Scalar product → vector; vector product → vector; triple product → scalar."},{"id":"d","text":"Scalar product → scalar; vector product → scalar; triple product → scalar."}]'::jsonb, 'b', '',
  'medium', NULL, 'Vector Calculations', 'single_choice', 'a7b4f7a2c55ef846',
  'Official g.a.s.t. 2026 PDF, Vector Calculations Q3', true, true, '{general_academic,medium,vector calculations}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'a7b4f7a2c55ef846'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'For vectors a = (1, 2, 3) and b = (4, 5, 6), the scalar product was calculated. Which result is correct?', '[{"id":"a","text":"21"},{"id":"b","text":"32"},{"id":"c","text":"√14 + √77"},{"id":"d","text":"126"}]'::jsonb, 'b', '',
  'medium', NULL, 'Vector Calculations', 'single_choice', 'c478d08e11b35499',
  'Official g.a.s.t. 2026 PDF, Vector Calculations Q4', true, true, '{general_academic,medium,vector calculations}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'c478d08e11b35499'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'What angle φ is formed between vectors a = (1, 2) and b = (2, 1)?', '[{"id":"a","text":"φ = arccos(4/5)"},{"id":"b","text":"φ = arccos(4/√5)"},{"id":"c","text":"φ = arccos(5/4)"},{"id":"d","text":"φ = arccos(4/√3)"}]'::jsonb, 'a', '',
  'hard', NULL, 'Vector Calculations', 'single_choice', 'f3c8a7211d3eab3b',
  'Official g.a.s.t. 2026 PDF, Vector Calculations Q5', true, true, '{general_academic,hard,vector calculations}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'f3c8a7211d3eab3b'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'The magnitude of the vector product result corresponds to the area of the parallelogram spanned. How large is the area? (Vectors shown in the figure with z-coordinates set to zero.)', '[{"id":"a","text":"√5 square units"},{"id":"b","text":"5 square units"},{"id":"c","text":"√10 square units"},{"id":"d","text":"10 square units"}]'::jsonb, 'd', '',
  'hard', NULL, 'Vector Calculations', 'single_choice', '81db008290ca1db0',
  'Official g.a.s.t. 2026 PDF, Vector Calculations Q7', true, true, '{general_academic,hard,vector calculations}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '81db008290ca1db0'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Which statement is correct for all possible cases when the triple product has a value of "0"?', '[{"id":"a","text":"The vectors lie in a plane."},{"id":"b","text":"The vectors are pairwise perpendicular."},{"id":"c","text":"The vectors are linearly independent."},{"id":"d","text":"The vectors sum up to the zero vector."}]'::jsonb, 'a', '',
  'medium', NULL, 'Vector Calculations', 'single_choice', 'd079abfbc539c8c1',
  'Official g.a.s.t. 2026 PDF, Vector Calculations Q8', true, true, '{general_academic,medium,vector calculations}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'd079abfbc539c8c1'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A submarine dives to a depth of 10,000 m below sea level. What is the approximate pressure on the hull of the submarine?', '[{"id":"a","text":"1 bar"},{"id":"b","text":"10 bar"},{"id":"c","text":"100 bar"},{"id":"d","text":"1000 bar"}]'::jsonb, 'd', '',
  'easy', NULL, 'Hydrostatics', 'single_choice', 'e4df692c39a6bd36',
  'Official g.a.s.t. 2026 PDF, Hydrostatics Q1', true, true, '{general_academic,easy,hydrostatics}', 60, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'e4df692c39a6bd36'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A body with a volume of 2 m³ floats in water. The top edge is 3 m below the surface, and the bottom edge is 4 m below. What is the mass of the body?', '[{"id":"a","text":"1,000 kg"},{"id":"b","text":"2,000 kg"},{"id":"c","text":"3,000 kg"},{"id":"d","text":"4,000 kg"}]'::jsonb, 'b', '',
  'medium', NULL, 'Hydrostatics', 'single_choice', 'b61e7c8b58cf0a9f',
  'Official g.a.s.t. 2026 PDF, Hydrostatics Q2', true, true, '{general_academic,medium,hydrostatics}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'b61e7c8b58cf0a9f'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A ship collides with an iceberg, tearing open the hull 10 m below the waterline. Room R has height 24 m and is sealed. The tear is 0.2 m high above the floor. What will happen?', '[{"id":"a","text":"Room R will be completely flooded."},{"id":"b","text":"Water will rise to about 12 m above the floor."},{"id":"c","text":"Water will rise to about 0.2 m above the floor."},{"id":"d","text":"No water enters because the air cannot escape."}]'::jsonb, 'b', '',
  'hard', NULL, 'Hydrostatics', 'single_choice', '42d5a978ec1e78df',
  'Official g.a.s.t. 2026 PDF, Hydrostatics Q3', true, true, '{general_academic,hard,hydrostatics}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '42d5a978ec1e78df'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A sealed vessel contains water with a floating object containing an air bubble. Pressure is applied through a rubber membrane. What will happen?', '[{"id":"a","text":"The object sinks because the air bubble is compressed, reducing buoyant force."},{"id":"b","text":"The object rises because increased water density increases buoyant force."},{"id":"c","text":"The object stays because water cannot be compressed."},{"id":"d","text":"The object is pushed down by a pressure wave then returns."}]'::jsonb, 'a', '',
  'hard', NULL, 'Hydrostatics', 'single_choice', '00c0c01bb35e4e47',
  'Official g.a.s.t. 2026 PDF, Hydrostatics Q4', true, true, '{general_academic,hard,hydrostatics}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '00c0c01bb35e4e47'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A pump with 3 bar delivery pressure pumps water from the sea. The suction port creates vacuum. Which statement is correct?', '[{"id":"a","text":"Height h must not be greater than depth t."},{"id":"b","text":"Height h must not exceed 10 m."},{"id":"c","text":"Depth t must not exceed 20 m."},{"id":"d","text":"Total length h + t must not exceed 30 m."}]'::jsonb, 'b', '',
  'hard', NULL, 'Hydrostatics', 'single_choice', '0fd01e1522db6824',
  'Official g.a.s.t. 2026 PDF, Hydrostatics Q5', true, true, '{general_academic,hard,hydrostatics}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '0fd01e1522db6824'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Three ships have same mass but different cross-sections. A box is moved the same distance d to the right on each. Which statement about tilting is correct?', '[{"id":"a","text":"Ship A (narrowest) tilts the furthest."},{"id":"b","text":"Ship B tilts the furthest."},{"id":"c","text":"Ship C tilts the furthest."},{"id":"d","text":"All ships tilt by the same angle."}]'::jsonb, 'a', '',
  'hard', NULL, 'Hydrostatics', 'single_choice', '5bf1fbba0096057b',
  'Official g.a.s.t. 2026 PDF, Hydrostatics Q6', true, true, '{general_academic,hard,hydrostatics}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '5bf1fbba0096057b'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Which statement correctly describes a central assumption of the optimal order quantity model?', '[{"id":"a","text":"Demand can be reliably forecast and remains stable over the year."},{"id":"b","text":"Demand fluctuates, so safety stocks are particularly important."},{"id":"c","text":"Quantity discounts are taken into account because larger orders may be cheaper."},{"id":"d","text":"The optimal order quantity minimises storage space needed."}]'::jsonb, 'a', '',
  'easy', NULL, 'Optimal Order Quantity', 'single_choice', '67a280eb62e4ce8d',
  'Official g.a.s.t. 2026 PDF, Optimal Order Quantity Q1', true, true, '{general_academic,easy,optimal order quantity}', 60, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '67a280eb62e4ce8d'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'What could an increase in the optimal order quantity be attributed to?', '[{"id":"a","text":"A reduction in holding costs per unit per year."},{"id":"b","text":"A reduction in ordering costs per order."},{"id":"c","text":"A reduction in annual demand."},{"id":"d","text":"None of the listed options."}]'::jsonb, 'a', '',
  'medium', NULL, 'Optimal Order Quantity', 'single_choice', '2cd1d1b903a8058b',
  'Official g.a.s.t. 2026 PDF, Optimal Order Quantity Q2', true, true, '{general_academic,medium,optimal order quantity}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '2cd1d1b903a8058b'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Why does the model use Holding Costs = (Q/2) × H?', '[{"id":"a","text":"Q/2 is the highest inventory level after an order."},{"id":"b","text":"Q/2 is the average inventory level between two orders."},{"id":"c","text":"Only half of the products incur holding costs."},{"id":"d","text":"Q/2 indicates how often orders are placed per year."}]'::jsonb, 'b', '',
  'medium', NULL, 'Optimal Order Quantity', 'single_choice', '238a4287ec3739b6',
  'Official g.a.s.t. 2026 PDF, Optimal Order Quantity Q3', true, true, '{general_academic,medium,optimal order quantity}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '238a4287ec3739b6'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A retailer requires 1,800 units annually. Each order costs 50 euros. Storage costs 2 euros per unit per year. What is the optimal order quantity?', '[{"id":"a","text":"150 units"},{"id":"b","text":"300 units"},{"id":"c","text":"450 units"},{"id":"d","text":"600 units"}]'::jsonb, 'b', '',
  'medium', NULL, 'Optimal Order Quantity', 'single_choice', 'e1edfc7f80cbcf69',
  'Official g.a.s.t. 2026 PDF, Optimal Order Quantity Q4', true, true, '{general_academic,medium,optimal order quantity}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'e1edfc7f80cbcf69'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'If the ordering cost per order S is doubled and all other values stay the same, how does the optimal order quantity change?', '[{"id":"a","text":"It halves."},{"id":"b","text":"It doubles."},{"id":"c","text":"It quadruples."},{"id":"d","text":"It increases by a factor of √2."}]'::jsonb, 'd', '',
  'hard', NULL, 'Optimal Order Quantity', 'single_choice', '329a76c8eafe1971',
  'Official g.a.s.t. 2026 PDF, Optimal Order Quantity Q5', true, true, '{general_academic,hard,optimal order quantity}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '329a76c8eafe1971'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'If the value per unit of the stored product increases, how might this affect the optimal order quantity?', '[{"id":"a","text":"It could decrease because annual holding cost per unit might increase."},{"id":"b","text":"It could increase because the holding cost rate might increase."},{"id":"c","text":"It remains unchanged because unit value has no influence."},{"id":"d","text":"It could increase because fixed ordering costs decrease."}]'::jsonb, 'a', '',
  'hard', NULL, 'Optimal Order Quantity', 'single_choice', '59e6a3d73914699d',
  'Official g.a.s.t. 2026 PDF, Optimal Order Quantity Q6', true, true, '{general_academic,hard,optimal order quantity}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '59e6a3d73914699d'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A figure shows costs A-D as a function of order quantity. D represents the optimal order quantity. Which line shows the total fixed ordering costs incurred by all orders in one year?', '[{"id":"a","text":"Line A"},{"id":"b","text":"Line B"},{"id":"c","text":"Line C"},{"id":"d","text":"Line D"}]'::jsonb, 'b', '',
  'hard', NULL, 'Optimal Order Quantity', 'single_choice', 'ef2ad73373b7959f',
  'Official g.a.s.t. 2026 PDF, Optimal Order Quantity Q7', true, true, '{general_academic,hard,optimal order quantity}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ef2ad73373b7959f'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'How can the following sentence be correctly finished? The deductive research strategy...?', '[{"id":"a","text":"...requires a certain, fixed sample size, independent of research design."},{"id":"b","text":"...focusses on the identification of causal mechanisms."},{"id":"c","text":"...examines the relation between factors and effects."},{"id":"d","text":"...shows how and why certain conditions influence causes and effects in single cases."}]'::jsonb, 'c', '',
  'medium', NULL, 'Research Strategies in Social Sciences', 'single_choice', '040bffbd3024a124',
  'Official g.a.s.t. 2026 PDF, Research Strategies Q1', true, true, '{general_academic,medium,research strategies in social sciences}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '040bffbd3024a124'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Which of the following statements applies to the inductive research strategy?', '[{"id":"a","text":"It is crucial to make statistically proven statements about how well results are transferable."},{"id":"b","text":"It is crucial to examine in which way certain factors have certain consequences."},{"id":"c","text":"It is only possible to consider a single case."},{"id":"d","text":"Proof about the spread of functioning mechanisms is provided."}]'::jsonb, 'b', '',
  'medium', NULL, 'Research Strategies in Social Sciences', 'single_choice', '26c196497b17e7eb',
  'Official g.a.s.t. 2026 PDF, Research Strategies Q2', true, true, '{general_academic,medium,research strategies in social sciences}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '26c196497b17e7eb'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Which of the following statements about conducting research projects is true?', '[{"id":"a","text":"In a qualitative project, the research question can be reformulated during the process."},{"id":"b","text":"In a quantitative project, the sample can be modified in any way after first data analyses."},{"id":"c","text":"In a qualitative project, changes to the research design do not need to be recorded."},{"id":"d","text":"In a quantitative project, the order of the four phases is not important."}]'::jsonb, 'a', '',
  'medium', NULL, 'Research Strategies in Social Sciences', 'single_choice', '1121712a55decad7',
  'Official g.a.s.t. 2026 PDF, Research Strategies Q3', true, true, '{general_academic,medium,research strategies in social sciences}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '1121712a55decad7'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'Which approach most clearly contradicts the ideal-typical process of a quantitative research project?', '[{"id":"a","text":"In a qualitative study, 5 teenagers are interviewed. The research question is then refined."},{"id":"b","text":"In a qualitative study, further teenagers with different traits are deliberately included."},{"id":"c","text":"In a quantitative study, 500 teenagers are surveyed. The hypothesis is retrospectively adapted to fit results."},{"id":"d","text":"In a quantitative study, a supplementary data collection plan is executed to balance the sample."}]'::jsonb, 'c', '',
  'hard', NULL, 'Research Strategies in Social Sciences', 'single_choice', '1e168a025ba53fec',
  'Official g.a.s.t. 2026 PDF, Research Strategies Q4', true, true, '{general_academic,hard,research strategies in social sciences}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '1e168a025ba53fec'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A doctoral student wants to investigate why young people use the library and what literature they read, using a mixed approach. Which procedure is suitable?', '[{"id":"a","text":"Analysis of 1,000 borrowing records and semi-structured interviews with 4 young people."},{"id":"b","text":"A group discussion with 3 young people and an interview with the library director."},{"id":"c","text":"A count of all books borrowed (without titles) over 10 days and an interview with the largest publisher."},{"id":"d","text":"A count of young people entering the library and evaluation of population statistics."}]'::jsonb, 'a', '',
  'hard', NULL, 'Research Strategies in Social Sciences', 'single_choice', 'dcc69f1163d96e55',
  'Official g.a.s.t. 2026 PDF, Research Strategies Q5', true, true, '{general_academic,hard,research strategies in social sciences}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'dcc69f1163d96e55'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'general_academic', 'A master''s student investigates whether certain behaviours affect seminar group productivity using a known psychological theory and statistical methods. Which statement applies?', '[{"id":"a","text":"The student has chosen a deductive approach."},{"id":"b","text":"The student has chosen an inductive approach."},{"id":"c","text":"The student has chosen a qualitative approach."},{"id":"d","text":"The student has chosen a mixed-method approach."}]'::jsonb, 'a', '',
  'medium', NULL, 'Research Strategies in Social Sciences', 'single_choice', '3ba12a79e3e167db',
  'Official g.a.s.t. 2026 PDF, Research Strategies Q6', true, true, '{general_academic,medium,research strategies in social sciences}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '3ba12a79e3e167db'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter belongs in the field with the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'e', '',
  'easy', '{"type":"latin_square","grid":[["","","D","",""],["","","A","","B"],["A","B","C","","E"],["","","?","A",""],["","A","","E",""]]}'::jsonb, '5x5 grid', 'single_choice', 'b2967ba01534fb3a',
  'Official g.a.s.t. 2026 PDF, Latin Squares Exercise 1', true, true, '{latin_square,low}', 60, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'b2967ba01534fb3a'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter belongs in the field with the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'c', '',
  'easy', '{"type":"latin_square","grid":[["C","","B","",""],["","A","","","D"],["","","E","","B"],["E","","D","","A"],["","E","A","?",""]]}'::jsonb, '5x5 grid', 'single_choice', '293ff54a0c3f9e73',
  'Official g.a.s.t. 2026 PDF, Latin Squares Exercise 2', true, true, '{latin_square,low}', 60, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = '293ff54a0c3f9e73'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter belongs in the field with the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'a', '',
  'medium', '{"type":"latin_square","grid":[["D","","","",""],["A","","D","","E"],["","C","","",""],["","","B","?","D"],["","D","","C",""]]}'::jsonb, '5x5 grid', 'single_choice', 'ebe37a993706efb9',
  'Official g.a.s.t. 2026 PDF, Latin Squares Exercise 3', true, true, '{latin_square,medium}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'ebe37a993706efb9'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter belongs in the field with the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'e', '',
  'medium', '{"type":"latin_square","grid":[["B","","","C",""],["","","","",""],["A","","D","","B"],["","C","","?",""],["","A","E","","D"]]}'::jsonb, '5x5 grid', 'single_choice', 'fe4872a9541e251e',
  'Official g.a.s.t. 2026 PDF, Latin Squares Exercise 4', true, true, '{latin_square,medium}', 90, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'fe4872a9541e251e'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter belongs in the field with the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'd', '',
  'hard', '{"type":"latin_square","grid":[["","A","E","",""],["","","","","D"],["C","E","","B",""],["","","?","",""],["B","","","","C"]]}'::jsonb, '5x5 grid', 'single_choice', 'e0fa3604fce77123',
  'Official g.a.s.t. 2026 PDF, Latin Squares Exercise 5', true, true, '{latin_square,high}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'e0fa3604fce77123'
);

INSERT INTO public.questions (
  module, prompt_text, options, correct_option_id, explanation_text, 
  difficulty, visual_data, subtopic, question_type, content_hash, 
  imported_from, verified, approved, tags, time_estimate_seconds, source_id
)
SELECT 
  'latin_square', 'Which letter belongs in the field with the question mark?', '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"},{"id":"e","text":"E"}]'::jsonb, 'c', '',
  'hard', '{"type":"latin_square","grid":[["B","A","","",""],["E","","D","",""],["","","B","",""],["","","","?","A"],["","E","","D",""]]}'::jsonb, '5x5 grid', 'single_choice', 'cb73ca6584f1cdf1',
  'Official g.a.s.t. 2026 PDF, Latin Squares Exercise 6', true, true, '{latin_square,high}', 120, '22222222-2222-2222-2222-222222222222'
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions WHERE content_hash = 'cb73ca6584f1cdf1'
);
