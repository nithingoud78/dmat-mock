CREATE TABLE IF NOT EXISTS public.site_settings (
    id text PRIMARY KEY,
    ads_enabled boolean NOT NULL DEFAULT true,
    ads_disabled_at timestamp with time zone,
    updated_at timestamp with time zone DEFAULT now()
);

-- Ensure a canonical row exists
INSERT INTO public.site_settings (id, ads_enabled)
VALUES ('global', true)
ON CONFLICT (id) DO NOTHING;

-- Enable RLS
ALTER TABLE public.site_settings ENABLE ROW LEVEL SECURITY;

-- Allow public read access
CREATE POLICY "Allow public read access on site_settings"
    ON public.site_settings
    FOR SELECT
    USING (true);

-- Allow admins to update
CREATE POLICY "Allow admins to update site_settings"
    ON public.site_settings
    FOR UPDATE
    USING (public.has_role(auth.uid(), 'admin'));

-- Function to get effective settings and auto-enable if expired
CREATE OR REPLACE FUNCTION public.get_effective_site_settings()
RETURNS SETOF public.site_settings
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_setting public.site_settings%ROWTYPE;
BEGIN
    -- Get the current row
    SELECT * INTO v_setting FROM public.site_settings WHERE id = 'global' LIMIT 1;
    
    -- Check if it's disabled and 1 hour has passed
    IF v_setting.ads_enabled = false AND v_setting.ads_disabled_at IS NOT NULL AND now() >= v_setting.ads_disabled_at + interval '1 hour' THEN
        -- Atomically update it
        UPDATE public.site_settings
        SET ads_enabled = true,
            ads_disabled_at = null,
            updated_at = now()
        WHERE id = 'global'
        RETURNING * INTO v_setting;
    END IF;
    
    RETURN NEXT v_setting;
END;
$$;
