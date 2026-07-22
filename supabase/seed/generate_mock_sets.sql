DO $$ 
DECLARE
    i INT;
    q_fig_ids UUID[];
    q_math_ids UUID[];
    q_lat_ids UUID[];
    all_q_ids UUID[];
    set_label TEXT;
    mod_breakdown JSONB;
BEGIN
    -- We want to generate 100 mock sets
    FOR i IN 1..100 LOOP
        -- Select 25 random Figure Sequences
        SELECT array_agg(id) INTO q_fig_ids
        FROM (SELECT id FROM public.questions WHERE module = 'figure_sequence' ORDER BY random() LIMIT 25) sub;

        -- Select 25 random Math Equations
        SELECT array_agg(id) INTO q_math_ids
        FROM (SELECT id FROM public.questions WHERE module = 'math_equation' ORDER BY random() LIMIT 25) sub;

        -- Select 25 random Latin Squares
        SELECT array_agg(id) INTO q_lat_ids
        FROM (SELECT id FROM public.questions WHERE module = 'latin_square' ORDER BY random() LIMIT 25) sub;

        -- Combine into one flat array
        all_q_ids := array_cat(array_cat(q_fig_ids, q_math_ids), q_lat_ids);

        -- Construct JSON breakdown
        mod_breakdown := jsonb_build_object(
            'figure_sequence', q_fig_ids,
            'math_equation', q_math_ids,
            'latin_square', q_lat_ids
        );

        set_label := 'Mock Set ' || i;

        -- Check if it already exists by label (for safety)
        IF NOT EXISTS (SELECT 1 FROM public.mock_sets WHERE label = set_label) THEN
            INSERT INTO public.mock_sets (label, module_breakdown, question_ids, total_questions)
            VALUES (set_label, mod_breakdown, all_q_ids, array_length(all_q_ids, 1));
        ELSE
            UPDATE public.mock_sets 
            SET module_breakdown = mod_breakdown, question_ids = all_q_ids, total_questions = array_length(all_q_ids, 1)
            WHERE label = set_label;
        END IF;

    END LOOP;
END $$;
