
-- ============ ENUMS ============
CREATE TYPE public.app_role AS ENUM ('admin', 'user');
CREATE TYPE public.module_type AS ENUM ('figure_sequence', 'math_equation', 'latin_square');
CREATE TYPE public.difficulty_level AS ENUM ('easy', 'medium', 'hard');
CREATE TYPE public.attempt_mode AS ENUM ('practice', 'timed_section', 'complete_mock');
CREATE TYPE public.attempt_status AS ENUM ('in_progress', 'submitted', 'expired');

-- ============ updated_at trigger fn ============
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER LANGUAGE plpgsql SET search_path = public AS $$
BEGIN NEW.updated_at = now(); RETURN NEW; END;
$$;

-- ============ SOURCES ============
CREATE TABLE public.sources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  publisher TEXT,
  edition TEXT,
  year TEXT,
  page TEXT,
  license_note TEXT,
  url TEXT,
  question_type TEXT,
  note TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.sources TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.sources TO authenticated;
GRANT ALL ON public.sources TO service_role;
ALTER TABLE public.sources ENABLE ROW LEVEL SECURITY;
CREATE TRIGGER trg_sources_updated BEFORE UPDATE ON public.sources
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============ QUESTIONS ============
CREATE TABLE public.questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  module public.module_type NOT NULL,
  prompt_text TEXT NOT NULL DEFAULT '',
  image_url TEXT,
  options JSONB NOT NULL DEFAULT '[]'::jsonb,
  correct_option_id TEXT NOT NULL,
  explanation_text TEXT NOT NULL DEFAULT '',
  difficulty public.difficulty_level NOT NULL DEFAULT 'medium',
  source_id UUID NOT NULL REFERENCES public.sources(id) ON DELETE RESTRICT,
  tags TEXT[] NOT NULL DEFAULT '{}',
  time_estimate_seconds INT NOT NULL DEFAULT 75,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_questions_module_diff ON public.questions(module, difficulty);
CREATE INDEX idx_questions_source ON public.questions(source_id);
GRANT SELECT ON public.questions TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.questions TO authenticated;
GRANT ALL ON public.questions TO service_role;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
CREATE TRIGGER trg_questions_updated BEFORE UPDATE ON public.questions
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============ PROFILES ============
CREATE TABLE public.profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  display_name TEXT,
  email TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE ON public.profiles TO authenticated;
GRANT ALL ON public.profiles TO service_role;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
CREATE TRIGGER trg_profiles_updated BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============ USER_ROLES ============
CREATE TABLE public.user_roles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  role public.app_role NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (user_id, role)
);
GRANT SELECT ON public.user_roles TO authenticated;
GRANT ALL ON public.user_roles TO service_role;
ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

CREATE OR REPLACE FUNCTION public.has_role(_user_id UUID, _role public.app_role)
RETURNS BOOLEAN LANGUAGE SQL STABLE SECURITY DEFINER SET search_path = public AS $$
  SELECT EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = _user_id AND role = _role);
$$;

-- ============ TEST_ATTEMPTS ============
CREATE TABLE public.test_attempts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
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
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_attempts_user ON public.test_attempts(user_id, started_at DESC);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.test_attempts TO authenticated;
GRANT ALL ON public.test_attempts TO service_role;
ALTER TABLE public.test_attempts ENABLE ROW LEVEL SECURITY;
CREATE TRIGGER trg_attempts_updated BEFORE UPDATE ON public.test_attempts
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============ ATTEMPT_ANSWERS ============
CREATE TABLE public.attempt_answers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  attempt_id UUID NOT NULL REFERENCES public.test_attempts(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES public.questions(id) ON DELETE RESTRICT,
  selected_option_id TEXT,
  is_correct BOOLEAN,
  marked_for_review BOOLEAN NOT NULL DEFAULT FALSE,
  time_spent_seconds INT NOT NULL DEFAULT 0,
  answered_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (attempt_id, question_id)
);
CREATE INDEX idx_answers_attempt ON public.attempt_answers(attempt_id);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.attempt_answers TO authenticated;
GRANT ALL ON public.attempt_answers TO service_role;
ALTER TABLE public.attempt_answers ENABLE ROW LEVEL SECURITY;

-- ============ TAB_SWITCH_EVENTS ============
CREATE TABLE public.tab_switch_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  attempt_id UUID NOT NULL REFERENCES public.test_attempts(id) ON DELETE CASCADE,
  occurred_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  duration_away_seconds INT NOT NULL DEFAULT 0
);
CREATE INDEX idx_tabsw_attempt ON public.tab_switch_events(attempt_id);
GRANT SELECT, INSERT ON public.tab_switch_events TO authenticated;
GRANT ALL ON public.tab_switch_events TO service_role;
ALTER TABLE public.tab_switch_events ENABLE ROW LEVEL SECURITY;

-- ============ HOMEPAGE_CONTENT ============
CREATE TABLE public.homepage_content (
  id INT PRIMARY KEY DEFAULT 1,
  content JSONB NOT NULL DEFAULT '{}'::jsonb,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT single_row CHECK (id = 1)
);
GRANT SELECT ON public.homepage_content TO anon, authenticated;
GRANT INSERT, UPDATE ON public.homepage_content TO authenticated;
GRANT ALL ON public.homepage_content TO service_role;
ALTER TABLE public.homepage_content ENABLE ROW LEVEL SECURITY;
CREATE TRIGGER trg_home_updated BEFORE UPDATE ON public.homepage_content
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- ============ POLICIES ============
-- sources: public read, admin write
CREATE POLICY "sources public read" ON public.sources FOR SELECT USING (TRUE);
CREATE POLICY "sources admin insert" ON public.sources FOR INSERT TO authenticated WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "sources admin update" ON public.sources FOR UPDATE TO authenticated USING (public.has_role(auth.uid(),'admin'));
CREATE POLICY "sources admin delete" ON public.sources FOR DELETE TO authenticated USING (public.has_role(auth.uid(),'admin'));

-- questions
CREATE POLICY "questions public read" ON public.questions FOR SELECT USING (TRUE);
CREATE POLICY "questions admin insert" ON public.questions FOR INSERT TO authenticated WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "questions admin update" ON public.questions FOR UPDATE TO authenticated USING (public.has_role(auth.uid(),'admin'));
CREATE POLICY "questions admin delete" ON public.questions FOR DELETE TO authenticated USING (public.has_role(auth.uid(),'admin'));

-- profiles
CREATE POLICY "profile self read" ON public.profiles FOR SELECT TO authenticated USING (auth.uid() = id OR public.has_role(auth.uid(),'admin'));
CREATE POLICY "profile self insert" ON public.profiles FOR INSERT TO authenticated WITH CHECK (auth.uid() = id);
CREATE POLICY "profile self update" ON public.profiles FOR UPDATE TO authenticated USING (auth.uid() = id);

-- user_roles
CREATE POLICY "roles self read" ON public.user_roles FOR SELECT TO authenticated USING (auth.uid() = user_id OR public.has_role(auth.uid(),'admin'));

-- test_attempts
CREATE POLICY "attempts self read" ON public.test_attempts FOR SELECT TO authenticated USING (auth.uid() = user_id OR public.has_role(auth.uid(),'admin'));
CREATE POLICY "attempts self insert" ON public.test_attempts FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "attempts self update" ON public.test_attempts FOR UPDATE TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "attempts self delete" ON public.test_attempts FOR DELETE TO authenticated USING (auth.uid() = user_id);

-- attempt_answers (via parent attempt ownership)
CREATE POLICY "answers self read" ON public.attempt_answers FOR SELECT TO authenticated USING (
  EXISTS (SELECT 1 FROM public.test_attempts a WHERE a.id = attempt_id AND (a.user_id = auth.uid() OR public.has_role(auth.uid(),'admin')))
);
CREATE POLICY "answers self write" ON public.attempt_answers FOR INSERT TO authenticated WITH CHECK (
  EXISTS (SELECT 1 FROM public.test_attempts a WHERE a.id = attempt_id AND a.user_id = auth.uid())
);
CREATE POLICY "answers self update" ON public.attempt_answers FOR UPDATE TO authenticated USING (
  EXISTS (SELECT 1 FROM public.test_attempts a WHERE a.id = attempt_id AND a.user_id = auth.uid())
);
CREATE POLICY "answers self delete" ON public.attempt_answers FOR DELETE TO authenticated USING (
  EXISTS (SELECT 1 FROM public.test_attempts a WHERE a.id = attempt_id AND a.user_id = auth.uid())
);

-- tab_switch_events
CREATE POLICY "tabsw self read" ON public.tab_switch_events FOR SELECT TO authenticated USING (
  EXISTS (SELECT 1 FROM public.test_attempts a WHERE a.id = attempt_id AND (a.user_id = auth.uid() OR public.has_role(auth.uid(),'admin')))
);
CREATE POLICY "tabsw self insert" ON public.tab_switch_events FOR INSERT TO authenticated WITH CHECK (
  EXISTS (SELECT 1 FROM public.test_attempts a WHERE a.id = attempt_id AND a.user_id = auth.uid())
);

-- homepage_content
CREATE POLICY "home public read" ON public.homepage_content FOR SELECT USING (TRUE);
CREATE POLICY "home admin write" ON public.homepage_content FOR INSERT TO authenticated WITH CHECK (public.has_role(auth.uid(),'admin'));
CREATE POLICY "home admin update" ON public.homepage_content FOR UPDATE TO authenticated USING (public.has_role(auth.uid(),'admin'));

-- ============ Auto-create profile trigger ============
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
BEGIN
  INSERT INTO public.profiles (id, email, display_name)
  VALUES (NEW.id, NEW.email, COALESCE(NEW.raw_user_meta_data->>'display_name', split_part(NEW.email,'@',1)));
  INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'user') ON CONFLICT DO NOTHING;
  RETURN NEW;
END;
$$;
CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ============ SEED ============
-- Homepage content
INSERT INTO public.homepage_content (id, content) VALUES (1, '{
  "hero": {
    "title": "dMAT Practice Pro",
    "subtitle": "Serious, focused practice for the g.a.s.t. dMAT — built for Indian APS applicants preparing for Germany.",
    "primary_cta": {"label": "Start Complete Mock", "href": "/mock/complete"},
    "secondary_cta": {"label": "Practice by Section", "href": "/practice/figure-sequences"}
  },
  "what_is_dmat": {
    "title": "What is the dMAT?",
    "body": "The Digital Master Test (dMAT) is a computer-based aptitude test administered by g.a.s.t. (Gesellschaft für Akademische Studienvorbereitung und Testentwicklung). It measures general cognitive abilities and, in its subject module, field-specific academic reasoning required for master''s study in Germany."
  },
  "aps_relevance": {
    "title": "Why the dMAT matters for APS",
    "body": "For Indian applicants, the German Academic Evaluation Centre (APS) now factors dMAT results into the verification process. A strong dMAT score strengthens your APS certificate and, in turn, your German university application."
  },
  "exam_pattern": {
    "title": "Exam Pattern",
    "rows": [
      {"section": "Figure Sequences", "questions": "20", "time": "25 minutes"},
      {"section": "Mathematical Equations", "questions": "20", "time": "25 minutes"},
      {"section": "Latin Squares", "questions": "16", "time": "20 minutes"},
      {"section": "Core Module total", "questions": "56", "time": "90 minutes"},
      {"section": "Subject Module (General Academic Module)", "questions": "—", "time": "90 minutes"},
      {"section": "Full exam (with break)", "questions": "—", "time": "~3 hours, incl. 30-min break"}
    ],
    "caption": "Pattern compiled from g.a.s.t.''s official dMAT preparatory materials and current (2026) prep guides. Verify against the latest official PDF at d-mat.de before relying on it, since dMAT is a newly introduced exam and details can be updated.",
    "scoring_note": "Each module is reported as a score out of 0–200 plus a percentile."
  },
  "prep_tips": {
    "title": "Preparation Tips",
    "items": [
      "Practice each Core Module section under real time pressure — the timer per subtest is unforgiving.",
      "You cannot revisit a section once its timer ends. Train pacing on Complete Mocks, not just per-question drills.",
      "Guessing has no negative marking. Never leave a question blank when the clock is running out.",
      "Build mental math and pattern-recognition speed. Calculators are not allowed.",
      "Do at least 3–5 full Complete Mocks before test day to build stamina for the ~3-hour session."
    ]
  },
  "faq": {
    "title": "Frequently Asked Questions",
    "items": [
      {"q": "Is the dMAT mandatory for all Indian applicants?", "a": "It is required as part of the APS process for many applicants from India. Always confirm current requirements on the official d-mat.de and APS India sites."},
      {"q": "Is there negative marking?", "a": "No. Unanswered and incorrect questions score the same, so guessing when time runs out is rational."},
      {"q": "Can I go back to a previous section?", "a": "No. Once a section''s timer ends, that section is locked. Complete Mock mode simulates this."},
      {"q": "How is the score reported?", "a": "Each module gets a 0–200 scaled score plus a percentile against the reference group."}
    ]
  },
  "official_links": {
    "title": "Official Links",
    "items": [
      {"label": "d-mat.de (official dMAT site)", "url": "https://www.d-mat.de"},
      {"label": "APS India", "url": "https://www.aps-india.de"}
    ]
  },
  "footer": {"note": "dMAT Practice Pro is an independent personal-use practice tool. Not affiliated with g.a.s.t. or APS."},
  "mock_instructions": {
    "title": "Before you begin the Complete Mock",
    "items": [
      "This is a full Core Module simulation: Figure Sequences (25 min) → Mathematical Equations (25 min) → Latin Squares (20 min).",
      "Each section is independently timed. When the timer hits zero, that section auto-submits and cannot be reopened.",
      "No calculator. No going back to a previous section. Guessing has no penalty.",
      "Stay on this tab. Leaving the tab is logged for your own analytics.",
      "Total time: 70 minutes of active testing (breaks are not simulated here)."
    ]
  }
}'::jsonb);

-- Sample source
INSERT INTO public.sources (id, name, publisher, edition, year, license_note, note, question_type) VALUES
  ('11111111-1111-1111-1111-111111111111', 'Original — dMAT Practice Pro sample', 'dMAT Practice Pro', '1st', '2026', 'Original content authored for this app. Free to reuse within the app.', 'Fresh items styled after the official dMAT task formats.', 'Practice sample');

-- Figure Sequences samples
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds) VALUES
  ('figure_sequence', 'A sequence of shapes rotates 45° clockwise each step: ▲ → ◤ → ◀ → ◣ → ? What comes next?',
   '[{"id":"a","text":"▼"},{"id":"b","text":"◢"},{"id":"c","text":"▶"},{"id":"d","text":"◤"}]'::jsonb,
   'a', 'Each step is a 45° clockwise rotation. After ◣ (225°), the next 45° clockwise gives 270° which points downward: ▼.',
   'easy', '11111111-1111-1111-1111-111111111111', 60),
  ('figure_sequence', 'In each step, a black dot moves two vertices clockwise around a hexagon and a small square swaps position with the next-clockwise vertex. Which figure comes next in the pattern?',
   '[{"id":"a","text":"Dot at vertex 5, square at vertex 6"},{"id":"b","text":"Dot at vertex 1, square at vertex 2"},{"id":"c","text":"Dot at vertex 3, square at vertex 4"},{"id":"d","text":"Dot at vertex 6, square at vertex 1"}]'::jsonb,
   'a', 'Track each element independently: dot advances by 2, square advances by 1 clockwise per step. Applying both rules to the previous frame lands the dot at vertex 5 and the square at vertex 6.',
   'medium', '11111111-1111-1111-1111-111111111111', 90),
  ('figure_sequence', 'Two rules apply per step: (1) the number of sides of the outer polygon increases by one; (2) the inner shape flips vertically. Starting from a triangle with an upright arrow, what is the 4th figure?',
   '[{"id":"a","text":"Hexagon with upright arrow"},{"id":"b","text":"Hexagon with inverted arrow"},{"id":"c","text":"Pentagon with inverted arrow"},{"id":"d","text":"Heptagon with upright arrow"}]'::jsonb,
   'b', 'Sides: 3 → 4 → 5 → 6 (hexagon). Arrow flips each step: up → down → up → down (inverted). So the 4th figure is a hexagon with an inverted arrow.',
   'hard', '11111111-1111-1111-1111-111111111111', 100);

-- Math Equation samples
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds) VALUES
  ('math_equation', 'If 3(x − 2) + 4 = 2x + 5, what is x?',
   '[{"id":"a","text":"3"},{"id":"b","text":"5"},{"id":"c","text":"7"},{"id":"d","text":"9"}]'::jsonb,
   'c', 'Expand: 3x − 6 + 4 = 2x + 5 → 3x − 2 = 2x + 5 → x = 7.',
   'easy', '11111111-1111-1111-1111-111111111111', 60),
  ('math_equation', 'A number added to 25% of itself equals 60. What is the number?',
   '[{"id":"a","text":"40"},{"id":"b","text":"45"},{"id":"c","text":"48"},{"id":"d","text":"50"}]'::jsonb,
   'c', 'Let x be the number. x + 0.25x = 60 → 1.25x = 60 → x = 48.',
   'medium', '11111111-1111-1111-1111-111111111111', 70),
  ('math_equation', 'If 2^x = 8^(x−2), then x =',
   '[{"id":"a","text":"2"},{"id":"b","text":"3"},{"id":"c","text":"4"},{"id":"d","text":"6"}]'::jsonb,
   'b', 'Rewrite 8 as 2^3: 2^x = 2^{3(x−2)} → x = 3x − 6 → 2x = 6 → x = 3.',
   'medium', '11111111-1111-1111-1111-111111111111', 75);

-- Latin Squares samples
INSERT INTO public.questions (module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds) VALUES
  ('latin_square', 'A 4×4 Latin square uses symbols {A, B, C, D}. Given row 1 = A B C D, row 2 = B ? D A, row 3 = C D A B, row 4 = D A B C. What replaces ?',
   '[{"id":"a","text":"A"},{"id":"b","text":"B"},{"id":"c","text":"C"},{"id":"d","text":"D"}]'::jsonb,
   'c', 'Row 2 already has B, D, A. The missing symbol is C. Column 2 has B, ?, D, A — needing C too. Both agree: C.',
   'easy', '11111111-1111-1111-1111-111111111111', 60),
  ('latin_square', 'In a 5×5 Latin square with symbols 1–5, the diagonal reads 1, 2, 3, ?, 5 and row 4 is 4 5 1 ? 3. What is the missing diagonal value?',
   '[{"id":"a","text":"2"},{"id":"b","text":"3"},{"id":"c","text":"4"},{"id":"d","text":"5"}]'::jsonb,
   'a', 'Row 4 has 4, 5, 1, ?, 3 — missing symbol is 2. The diagonal cell in row 4 is the 4th entry of row 4, which is 2.',
   'medium', '11111111-1111-1111-1111-111111111111', 80),
  ('latin_square', 'A 4×4 Latin square uses {1,2,3,4}. Row 1 = 1 2 3 4. Column 1 top-to-bottom = 1 3 4 2. What is the entry at (row 3, col 3)?',
   '[{"id":"a","text":"1"},{"id":"b","text":"2"},{"id":"c","text":"3"},{"id":"d","text":"4"}]'::jsonb,
   'b', 'Row 3 starts with 4. It must contain {1,2,3} in the remaining cells. Column 3 contains 3 in row 1; row 3 col 3 cannot be 3 or 4. By elimination with column 3 (which needs {1,2,4} in rows 2–4), the entry at (3,3) is 2.',
   'hard', '11111111-1111-1111-1111-111111111111', 100);
