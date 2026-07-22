-- ============================================================
-- Migration: Add visual_data, anon_attempts, mock_sets
-- ============================================================

-- 1. Add visual_data JSONB column to questions
ALTER TABLE public.questions
  ADD COLUMN IF NOT EXISTS visual_data JSONB;

-- 2. Add tags index (useful for filtering)
CREATE INDEX IF NOT EXISTS idx_questions_tags ON public.questions USING GIN(tags);
CREATE INDEX IF NOT EXISTS idx_questions_visual ON public.questions((visual_data IS NOT NULL));

-- 3. Anonymous sessions table
CREATE TABLE IF NOT EXISTS public.anon_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_token TEXT NOT NULL UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  last_seen_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE public.anon_sessions ENABLE ROW LEVEL SECURITY;
GRANT SELECT, INSERT, UPDATE ON public.anon_sessions TO anon, authenticated;
GRANT ALL ON public.anon_sessions TO service_role;
CREATE POLICY "anon_sessions insert" ON public.anon_sessions
  FOR INSERT WITH CHECK (TRUE);
CREATE POLICY "anon_sessions select own" ON public.anon_sessions
  FOR SELECT USING (TRUE);

-- 4. Anonymous attempts table
CREATE TABLE IF NOT EXISTS public.anon_attempts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_token TEXT NOT NULL,
  mode public.attempt_mode NOT NULL,
  module public.module_type,
  started_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  submitted_at TIMESTAMPTZ,
  status public.attempt_status NOT NULL DEFAULT 'in_progress',
  score INT,
  accuracy NUMERIC(5,2),
  correct_count INT NOT NULL DEFAULT 0,
  incorrect_count INT NOT NULL DEFAULT 0,
  skipped_count INT NOT NULL DEFAULT 0,
  total_questions INT NOT NULL DEFAULT 0,
  duration_seconds INT,
  question_ids UUID[] NOT NULL DEFAULT '{}',
  answers JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_anon_attempts_token ON public.anon_attempts(session_token, started_at DESC);
GRANT SELECT, INSERT, UPDATE ON public.anon_attempts TO anon, authenticated;
GRANT ALL ON public.anon_attempts TO service_role;
ALTER TABLE public.anon_attempts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "anon_attempts insert" ON public.anon_attempts
  FOR INSERT WITH CHECK (TRUE);
CREATE POLICY "anon_attempts select own" ON public.anon_attempts
  FOR SELECT USING (TRUE);
CREATE POLICY "anon_attempts update own" ON public.anon_attempts
  FOR UPDATE USING (TRUE);
CREATE TRIGGER trg_anon_attempts_updated BEFORE UPDATE ON public.anon_attempts
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 5. Mock sets table
CREATE TABLE IF NOT EXISTS public.mock_sets (
  id SERIAL PRIMARY KEY,
  label TEXT,
  module_breakdown JSONB NOT NULL DEFAULT '{}',
  question_ids UUID[] NOT NULL DEFAULT '{}',
  total_questions INT NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.mock_sets TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.mock_sets TO authenticated;
GRANT ALL ON public.mock_sets TO service_role;
ALTER TABLE public.mock_sets ENABLE ROW LEVEL SECURITY;
CREATE POLICY "mock_sets public read" ON public.mock_sets FOR SELECT USING (TRUE);
CREATE POLICY "mock_sets admin write" ON public.mock_sets FOR INSERT TO authenticated
  WITH CHECK (public.has_role(auth.uid(), 'admin'));
CREATE POLICY "mock_sets admin update" ON public.mock_sets FOR UPDATE TO authenticated
  USING (public.has_role(auth.uid(), 'admin'));

-- 6. Update questions SELECT policy to allow anon reads (already exists, but ensure visual_data is accessible)
-- The existing "questions public read" policy already covers anon reads with USING (TRUE).
-- No change needed.

-- Done
