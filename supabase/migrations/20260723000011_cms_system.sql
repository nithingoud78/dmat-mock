-- Create site_content table for the CMS
CREATE TABLE public.site_content (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  page text NOT NULL,
  section text NOT NULL,
  key text NOT NULL,
  content text NOT NULL,
  updated_at timestamptz DEFAULT now(),
  UNIQUE (page, section, key)
);

-- Enable RLS
ALTER TABLE public.site_content ENABLE ROW LEVEL SECURITY;

-- Everyone can read the content
CREATE POLICY "Allow public read access to site_content"
  ON public.site_content FOR SELECT
  USING (true);

-- Only admins can write/update content
CREATE POLICY "Allow admin write access to site_content"
  ON public.site_content FOR ALL
  USING (
    public.has_role(auth.uid(), 'admin')
  );
