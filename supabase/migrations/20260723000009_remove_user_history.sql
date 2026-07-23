-- ============================================================
-- Migration: Remove User History Architecture
-- ============================================================

-- Drop seen_questions from profiles as user history is no longer tracked
ALTER TABLE public.profiles 
  DROP COLUMN IF EXISTS seen_questions;

-- Done
