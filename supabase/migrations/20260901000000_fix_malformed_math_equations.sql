-- Migration: 20260901000000_fix_malformed_math_equations
-- Description: Fixes malformed math_equation visual_data by adding the missing 'ask' field required by MathEquationRenderer.

UPDATE public.questions
SET visual_data = jsonb_set(
    visual_data, 
    '{ask}', 
    to_jsonb(
        CASE 
            WHEN prompt_text LIKE '%What is A?%' THEN 'A'
            WHEN prompt_text LIKE '%What is B?%' THEN 'B'
            WHEN prompt_text LIKE '%What is C?%' THEN 'C'
            WHEN prompt_text LIKE '%What is D?%' THEN 'D'
            ELSE prompt_text
        END
    )
)
WHERE module = 'math_equation' 
  AND visual_data IS NOT NULL 
  AND visual_data->>'type' = 'math_equation'
  AND NOT (visual_data ? 'ask');
