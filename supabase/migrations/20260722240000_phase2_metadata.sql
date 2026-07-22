-- Add Phase 2 Metadata columns to questions table

ALTER TABLE public.questions 
  ADD COLUMN subtopic text,
  ADD COLUMN question_type text,
  ADD COLUMN content_hash text UNIQUE,
  ADD COLUMN imported_from text,
  ADD COLUMN verified boolean DEFAULT false,
  ADD COLUMN approved boolean DEFAULT false,
  ADD COLUMN internal_notes text,
  ADD COLUMN solution_steps jsonb;

-- Create an index on content_hash for fast duplicate detection
CREATE INDEX IF NOT EXISTS idx_questions_content_hash ON public.questions(content_hash);

-- Create indexes for filtering performance
CREATE INDEX IF NOT EXISTS idx_questions_module ON public.questions(module);
CREATE INDEX IF NOT EXISTS idx_questions_difficulty ON public.questions(difficulty);
CREATE INDEX IF NOT EXISTS idx_questions_subtopic ON public.questions(subtopic);
CREATE INDEX IF NOT EXISTS idx_questions_question_type ON public.questions(question_type);
