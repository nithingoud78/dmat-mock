-- ==============================================================================
-- Migration: Fix Homepage Content Footer
-- Description: Re-adds the missing footer object to the homepage_content JSON
-- which caused the frontend to crash due to a TypeError (reading 'note').
-- ==============================================================================

UPDATE public.homepage_content
SET content = jsonb_set(content, '{footer}', '{"note": "dMAT Practice Pro is an independent personal-use practice tool. Not affiliated with g.a.s.t. or APS."}'::jsonb)
WHERE id = 1;
