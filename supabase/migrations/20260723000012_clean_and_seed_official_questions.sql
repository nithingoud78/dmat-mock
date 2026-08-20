-- ============================================================
-- Migration: Clean Database
-- This migration PURGES ALL questions from the database.
-- Per user request, the database must remain completely empty until a fully validated dataset is ready.
-- ============================================================

DO $$
BEGIN

-- PURGE EVERYTHING
DELETE FROM public.attempt_answers;
DELETE FROM public.test_attempts;
DELETE FROM public.mock_sets;
DELETE FROM public.questions;

END $$;
