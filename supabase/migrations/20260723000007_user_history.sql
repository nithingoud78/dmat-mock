-- ============================================================
-- Migration: User History Architecture
-- ============================================================

-- Add seen_questions to profiles for authenticated history tracking
ALTER TABLE public.profiles 
  ADD COLUMN IF NOT EXISTS seen_questions UUID[] NOT NULL DEFAULT '{}';

-- Allow authenticated users to update their own profile
DROP POLICY IF EXISTS "profiles update own" ON public.profiles;
CREATE POLICY "profiles update own" ON public.profiles 
  FOR UPDATE USING (auth.uid() = id);

-- Done
