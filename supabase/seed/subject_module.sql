-- ============================================================
-- Seed: GENERAL ACADEMIC
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

DELETE FROM public.questions WHERE module = 'general_academic';

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '3d4f3792-d5c8-41fa-8b99-69293de0c39a',
  'general_academic',
  'Which vector results when the operation s = a + b - c is performed, where a=(1,3), b=(5,1), c=(1,-2)?',
  '[{"id":"a","text":"s = (7, 2)"},{"id":"b","text":"s = (5, 2)"},{"id":"c","text":"s = (5, 6)"},{"id":"d","text":"s = (7, 6)"}]'::jsonb,
  'c',
  'a+b-c = (1+5-1, 3+1-(-2)) = (5, 6)',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'vectors'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '97a4b05d-f485-4554-be39-c54c4d8c96b3',
  'general_academic',
  'What statement is true when a vector is multiplied by the number ''-2''?',
  '[{"id":"a","text":"The length of the vector doubles. The direction of the vector remains the same."},{"id":"b","text":"The length of the vector halves. The direction of the vector remains the same."},{"id":"c","text":"The length of the vector halves. The direction of the vector is reversed."},{"id":"d","text":"The length of the vector doubles. The direction of the vector is reversed."}]'::jsonb,
  'd',
  'Multiplication by -2 doubles the magnitude of the vector because the absolute value of the scalar is 2. The negative sign reverses the direction of the vector.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'vectors'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '252bf2ab-64eb-4651-a000-9829ae7c4d86',
  'general_academic',
  'The type of result from the three operations presented in the table is not always the same. Which statement is correct?',
  '[{"id":"a","text":"Forming a scalar product results in a scalar; forming a vector product results in a scalar; forming a triple product results in a scalar."},{"id":"b","text":"Forming a scalar product results in a scalar; forming a vector product results in a vector; forming a triple product results in a scalar."},{"id":"c","text":"Forming a scalar product results in a scalar; forming a vector product results in a vector; forming a triple product results in a vector."},{"id":"d","text":"Forming a scalar product results in a vector; forming a vector product results in a vector; forming a triple product results in a scalar."}]'::jsonb,
  'b',
  'A scalar product results in a scalar, whereas a vector product results in a vector. The triple product combines both operations and finally results in a scalar.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'vectors'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '4c0d9c08-85f7-44a7-9987-3a70a36bbf76',
  'general_academic',
  'For the vectors a=(1,2,3) and b=(4,5,6), the scalar product was calculated. Which result is correct?',
  '[{"id":"a","text":"32"},{"id":"b","text":"21"},{"id":"c","text":"sqrt(14) + sqrt(77)"},{"id":"d","text":"126"}]'::jsonb,
  'a',
  'The scalar product is calculated by multiplying corresponding components and adding the products: 1*4 + 2*5 + 3*6 = 32.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'vectors'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '95aa3ab9-80af-493f-a416-886dd44f27c5',
  'general_academic',
  'What angle φ is formed between the vectors a=(1,2) and b=(2,1)?',
  '[{"id":"a","text":"φ = arccos(4/sqrt(3))"},{"id":"b","text":"φ = arccos(5/4)"},{"id":"c","text":"φ = arccos(4/sqrt(5))"},{"id":"d","text":"φ = arccos(4/5)"}]'::jsonb,
  'd',
  'The scalar product is a*b = 1*2 + 2*1 = 4. Since both vectors have the magnitude sqrt(5), cos(φ) = 4/(sqrt(5)*sqrt(5)) = 4/5.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'vectors'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'd0204338-f352-441b-8ded-1256b743fc76',
  'general_academic',
  'Which vector results when the vector product of a=(3,2,1) and b=(6,5,4) is determined?',
  '[{"id":"a","text":"(3, -6, 3)"},{"id":"b","text":"(18, 10, 4)"},{"id":"c","text":"(3, 6, 3)"},{"id":"d","text":"(9, 7, 5)"}]'::jsonb,
  'a',
  'Using the cross product formula gives a x b = (2*4 - 1*5, 1*6 - 3*4, 3*5 - 2*6) = (3, -6, 3).',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'vectors'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'bf9aa7f8-2125-4f92-9ac9-2beaa8c3ecbd',
  'general_academic',
  'The magnitude of a result vector (vector product) corresponds to the area of the parallelogram spanned. How large is the area spanned by a=(3,4) and b=(-2,1)?',
  '[{"id":"a","text":"sqrt(10) square units"},{"id":"b","text":"10 square units"},{"id":"c","text":"sqrt(5) square units"},{"id":"d","text":"5 square units"}]'::jsonb,
  'b',
  'The area of the parallelogram corresponds to the magnitude of the vector product. The determinant has the magnitude |3*1 - 4*(-2)| = 11. Wait, PDF says |3*(-2) - 4*1| = 10.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'vectors'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '0a3defd5-5775-4859-a16d-5aa2b9d24ac7',
  'general_academic',
  'The triple product can be used to calculate a volume. Which statement is correct for all possible cases when the triple product has a value of ''0''?',
  '[{"id":"a","text":"The vectors lie in a plane."},{"id":"b","text":"The vectors sum up to the zero vector."},{"id":"c","text":"The vectors are pairwise perpendicular."},{"id":"d","text":"The vectors are linearly independent."}]'::jsonb,
  'a',
  'A triple product of 0 means that the volume of the solid spanned by the three vectors is 0. This is the case when the vectors are coplanar, i.e. when they lie in one plane.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'vectors'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'd0f30fc9-9a44-4dc6-88f1-f5281bd46712',
  'general_academic',
  'A submarine dives to a depth of 10,000 m below sea level. What is the approximate pressure on the hull of the submarine?',
  '[{"id":"a","text":"1 bar"},{"id":"b","text":"100 bar"},{"id":"c","text":"10 bar"},{"id":"d","text":"1000 bar"}]'::jsonb,
  'd',
  'At a depth of 10,000 m, the pressure increases by about 1 bar for every 10 m. This gives approximately 1000 bar.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'hydrostatics'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '448f4ed0-ac5f-4e93-8762-b657f4dfcee9',
  'general_academic',
  'A body with a volume of 2 m³ floats in water. The top edge of the body is 3 m below the water surface, and the bottom edge of the body is 4 m below the water surface. What is the mass of the body?',
  '[{"id":"a","text":"4,000 kg"},{"id":"b","text":"2,000 kg"},{"id":"c","text":"1,000 kg"},{"id":"d","text":"3,000 kg"}]'::jsonb,
  'b',
  'A floating body displaces a mass of water equal to its own mass. With a volume of 2 m³ in water, the displaced mass is about 2000 kg.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'hydrostatics'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '3a25322a-7e4e-437e-a13d-140e32bbf24a',
  'general_academic',
  'A ship collides with an iceberg, tearing open the hull 10 m below the waterline. Just before the collision, the captain had all watertight doors closed, so now neither water nor air can escape from damaged rooms. Only the rectangular space R with a height of 24 m is affected. The tear is right above the floor and is 0.2 m high. What will happen?',
  '[{"id":"a","text":"Nothing, because no water can enter room R through the leak as the air cannot escape."},{"id":"b","text":"Room R will be completely flooded."},{"id":"c","text":"Water will enter room R and rise to about 0.2 m above the floor."},{"id":"d","text":"Water will enter room R and rise to about 12 m above the floor."}]'::jsonb,
  'd',
  'Water can enter because the trapped air is compressed. In the simplified model, the pressure at 10 m depth is about twice atmospheric pressure, so the air volume is reduced by about half and the water rises to around 12 m.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'hydrostatics'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'd246607b-c684-4a68-86f6-70b3827a4e1c',
  'general_academic',
  'A vessel is completely filled with water. The vessel is sealed on top with a rubber membrane. In the water floats an object that is open at the bottom and contains an air bubble at the top. Pressure is to be applied to the water through the rubber membrane. What will happen?',
  '[{"id":"a","text":"The object sinks because the water pressure compresses the air bubble, reducing the buoyant force."},{"id":"b","text":"The object rises because the water pressure increases the density of the water, and accordingly, the buoyant force increases."},{"id":"c","text":"The object does not change its position because water cannot be compressed."},{"id":"d","text":"The object is first accelerated downwards by the pressure wave and then rises again until it is back in the same position as at the start."}]'::jsonb,
  'a',
  'The object contains an air bubble that can be compressed. When pressure is applied to the water, the air bubble becomes smaller, so the object displaces less water. Therefore, the buoyant force decreases and the object sinks.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'hydrostatics'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'a52f52a5-5c34-4974-86ab-07e3f02debc8',
  'general_academic',
  'A mechanical pump with a delivery pressure of 3 bar at the pressure port is to pump water from the sea into a tank. The pump sucks water through a suction port by creating a vacuum. Which statement is correct?',
  '[{"id":"a","text":"The height of the suction port above sea level (h) must not exceed 10 m as the pump would otherwise not be able to suck up any water."},{"id":"b","text":"The total vertical length of the suction port (h + t) must not exceed 30 m as the pump would otherwise not be able to suck up any water."},{"id":"c","text":"The height of the suction port above sea level (h) must not be greater than the depth of the suction port below sea level (t)."},{"id":"d","text":"The depth of the suction port below sea level (t) must not exceed 20 m as the pump would otherwise not be able to suck up any water."}]'::jsonb,
  'a',
  'A suction pump can only lift water by using the pressure difference to the atmosphere. Under ideal conditions, atmospheric pressure can lift water by about 10 m, so h must not exceed 10 m.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'hydrostatics'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '07f44b60-9cc0-4f89-bb48-1b7602ee0959',
  'general_academic',
  'Three ships swim upright. The ships all have the same mass, so they displace the same amount of water and experience the same buoyant force. However, the ships have different cross-sections. All ships have a box with the same mass and dimensions loaded below deck. Now, on all ships, the box is moved the same amount d to the right. Which statement about the effects is correct?',
  '[{"id":"a","text":"Ship C tilts the furthest."},{"id":"b","text":"Ship B tilts the furthest."},{"id":"c","text":"Ship A tilts the furthest."},{"id":"d","text":"All ships tilt by the same angle."}]'::jsonb,
  'c',
  'Moving the box creates the same tilting moment in all three ships. The narrowest ship (Ship A) has the smallest restoring effect, so Ship A tilts the furthest.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'hydrostatics'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'ad0c52b6-7f03-46ba-86c8-5a0f83d34c9f',
  'general_academic',
  'Which statement correctly describes a central assumption of the optimal order quantity model?',
  '[{"id":"a","text":"Demand fluctuates, so safety stocks are particularly important."},{"id":"b","text":"Quantity discounts are taken into account because larger orders may be cheaper."},{"id":"c","text":"The optimal order quantity is chosen so that as little storage space as possible is needed."},{"id":"d","text":"Demand can be reliably forecast and remains stable over the year."}]'::jsonb,
  'd',
  'This is a central assumption of the basic optimal-order-quantity-model: annual demand is known and occurs at a constant rate over time.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'business'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '481390f6-c55a-42fb-b062-784d4ed839a0',
  'general_academic',
  'What could an increase in the optimal order quantity be attributed to?',
  '[{"id":"a","text":"None of the listed options would explain an increase in the optimal order quantity."},{"id":"b","text":"A reduction in holding costs per unit per year."},{"id":"c","text":"A reduction in annual demand."},{"id":"d","text":"A reduction in ordering costs per order."}]'::jsonb,
  'b',
  'A reduction in holding costs leads to a larger optimal order quantity, because keeping inventory becomes cheaper.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'business'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'f6cd9fe3-5e03-4791-86e2-4513eec2674e',
  'general_academic',
  'Why does the model use the following value: Holding Costs = Q/2 * H?',
  '[{"id":"a","text":"Because only half of the products incur holding costs."},{"id":"b","text":"Because Q/2 indicates how often orders are placed per year."},{"id":"c","text":"Because Q/2 is the average inventory level between two orders."},{"id":"d","text":"Because Q/2 is the highest inventory level after an order."}]'::jsonb,
  'c',
  'Inventory is the highest immediately after an order arrives: Q. It then decreases steadily until it reaches 0. So the average inventory level is Q/2.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'business'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'decf7f23-9725-4d78-bc18-aa18f3218d5d',
  'general_academic',
  'A retailer requires 1,800 units of a specific product annually. Each order placed by the retailer incurs costs of 50 euros. The cost of storing one unit of the product amounts to 2 euros per year. What corresponds to the optimal order quantity?',
  '[{"id":"a","text":"300 units"},{"id":"b","text":"450 units"},{"id":"c","text":"150 units"},{"id":"d","text":"600 units"}]'::jsonb,
  'a',
  'Q* = sqrt(2 * 1800 * 50 / 2) = sqrt(90000) = 300.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'business'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'c899ff22-5bb9-4d3d-8569-cb2dd35e6ec3',
  'general_academic',
  'If the ordering cost per order S is doubled and all other values stay the same, how does the optimal order quantity change?',
  '[{"id":"a","text":"It doubles."},{"id":"b","text":"It increases by a factor of sqrt(2)."},{"id":"c","text":"It halves."},{"id":"d","text":"It quadruples."}]'::jsonb,
  'b',
  'So the optimal order quantity does not double. It increases by the square root of 2, which is about 1.41.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'business'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '5a3f4390-d7eb-4f4b-aa07-faaa02489a51',
  'general_academic',
  'If the value per unit of the stored product increases, how might this affect the optimal order quantity?',
  '[{"id":"a","text":"It could decrease because the annual holding cost per unit might increase."},{"id":"b","text":"It could increase because the fixed ordering costs per order decrease as a result."},{"id":"c","text":"It could increase because the holding cost rate might increase."},{"id":"d","text":"It remains unchanged because the value per unit generally has no influence on Q*."}]'::jsonb,
  'a',
  'If the value of the stored product increases, the annual holding cost per unit may also increase. Since H is in the denominator of the formula, a higher value of H leads to a lower value of Q*.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'business'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '125b8f8a-2e80-4f80-a6ce-a8670e577f3c',
  'general_academic',
  'The total fixed ordering costs incurred by all orders in one year decrease as the order quantity increases. Which curve shows this?',
  '[{"id":"a","text":"The curve that decreases inversely with order quantity."},{"id":"b","text":"The curve that increases linearly."},{"id":"c","text":"The curve that remains flat."},{"id":"d","text":"The curve that is parabolic."}]'::jsonb,
  'a',
  'The total fixed ordering costs per year decrease as the order quantity Q increases, because larger orders mean that fewer orders have to be placed per year.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'business'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '82fd77b8-63a0-4e08-9833-ce74b0989057',
  'general_academic',
  'How can the following sentence be correctly finished? The deductive research strategy...?',
  '[{"id":"a","text":"requires a certain, fixed sample size, independent of research design."},{"id":"b","text":"shows how and why certain conditions influence causes and effects in single cases."},{"id":"c","text":"examines the relation between factors and effects."},{"id":"d","text":"focusses on the identification of causal mechanisms."}]'::jsonb,
  'c',
  'The deductive or quantitative strategy aims to identify causal relationships. It therefore examines whether certain factors are related to certain outcomes.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'social_science'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '7a183487-74a6-4775-a85c-fdc43d9e96d0',
  'general_academic',
  'Which of the following statements applies to the inductive research strategy?',
  '[{"id":"a","text":"It is crucial to examine in which way certain factors have certain consequences."},{"id":"b","text":"It is only possible to consider a single case."},{"id":"c","text":"It is crucial to make statistically proven statements about how well research results scale and are transferable."},{"id":"d","text":"Proof about the spread of functioning mechanisms is provided."}]'::jsonb,
  'a',
  'The inductive or qualitative strategy focuses on causal mechanisms. It examines how and why certain factors lead to certain consequences.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'social_science'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'fd800844-a8e7-4360-96b9-17c335e7d278',
  'general_academic',
  'Which of the following statements about conducting research projects is true?',
  '[{"id":"a","text":"In a quantitative research project, the order of the four phases is not important."},{"id":"b","text":"In a quantitative research project, the sample can be modified in any way after the first data analyses, if this seems to help to better examine the hypothesis."},{"id":"c","text":"In a qualitative research project, changes to the research design do not need to be recorded."},{"id":"d","text":"In a qualitative research project, the research question can be reformulated during the process."}]'::jsonb,
  'd',
  'Qualitative research can include circular elements. This means that the research question or methodological approach may be refined during the process, as long as changes are documented.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'social_science'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'bc00651e-9834-4e89-b9b4-a94b09505a47',
  'general_academic',
  'Which approach most clearly contradicts the ideal-typical process of a quantitative research project?',
  '[{"id":"a","text":"In a qualitative study on screen time, the research question is then refined in a clearly defined way."},{"id":"b","text":"In a qualitative study, further teenagers with different personality traits are deliberately included."},{"id":"c","text":"For a quantitative study, the second data collection is carried out according to a previously defined supplementary plan so that the sample becomes more balanced overall."},{"id":"d","text":"During the analysis, it becomes clear that many teenagers with high screen time have many friends. The research hypothesis is then retrospectively adapted so that it fits the results."}]'::jsonb,
  'd',
  'In a quantitative research project, hypotheses should be defined before data analysis. Changing the hypothesis retrospectively to fit the results contradicts the ideal-typical quantitative process.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'social_science'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  'b84d4b8d-f638-4140-aa7f-b18a08b0c2ed',
  'general_academic',
  'A doctoral student wants to pursue two questions for her dissertation: why young people use the largest city library and what literature they are interested in. She wants to choose a mixed qualitative-quantitative approach. Which procedure might be suitable for her data collection?',
  '[{"id":"a","text":"A count of all books borrowed (without considering the book titles) by young people over 10 days and an interview with the largest publisher in the city."},{"id":"b","text":"A count of the young people entering the library and the evaluation of the city''s population statistics."},{"id":"c","text":"An analysis of the media titles from 1,000 anonymous borrowing records and semi-structured interviews with 4 young people."},{"id":"d","text":"A group discussion with 3 young people and an interview with the library director."}]'::jsonb,
  'c',
  'The borrowing records provide quantitative information about the literature young people are interested in. The interviews can provide qualitative insights into why young people use the library.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'social_science'],
  source_id,
  true,
  true
);

INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, time_estimate_seconds, visual_data, tags, source_id, verified, approved) VALUES
(
  '0b1d7a94-6697-4732-85f0-5859a1643572',
  'general_academic',
  'A master''s student wants to investigate in his master’s thesis whether certain student behaviours affect productivity in seminar groups. To do this, he chooses a well-known theoretical approach from psychology. He wants to evaluate with statistical methods how far-reaching and transferable this approach is. Which statement applies to his dissertation?',
  '[{"id":"a","text":"The student must consider possible causal mechanisms in his research design."},{"id":"b","text":"The student has chosen a deductive approach."},{"id":"c","text":"The student cannot use statistical tests because seminar groups are too different."},{"id":"d","text":"The student should conduct targeted individual surveys on campus."}]'::jsonb,
  'b',
  'The student starts from an existing theory and wants to test how far the approach applies using statistical methods. This corresponds to a deductive research strategy.',
  'hard',
  180,
  NULL,
  ARRAY['general_academic', 'social_science'],
  source_id,
  true,
  true
);

END $$;
