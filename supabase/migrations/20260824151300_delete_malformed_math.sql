-- Delete 20 malformed Mathematical Equation questions imported from dMATExamPrep
-- These questions lack multiple-choice distractors and options.id fields, causing
-- a TypeError in TestRunner.tsx
DELETE FROM public.questions
WHERE module = 'math_equation'
  AND 'dmatexamprep' = ANY(tags);
