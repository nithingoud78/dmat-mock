-- =============================================================
-- deploy_site_settings_remote.sql
-- Target: ktyaetudhqdwsmkafipo.supabase.co
-- Purpose: Deploy site_settings table + get_effective_site_settings RPC
-- Safe to re-run (idempotent).
-- =============================================================

-- STEP 1: Create table
CREATE TABLE IF NOT EXISTS public.site_settings (
    id text PRIMARY KEY,
    ads_enabled boolean NOT NULL DEFAULT true,
    ads_disabled_at timestamp with time zone,
    updated_at timestamp with time zone DEFAULT now()
);

-- STEP 2: Ensure canonical row exists
INSERT INTO public.site_settings (id, ads_enabled)
VALUES ('global', true)
ON CONFLICT (id) DO NOTHING;

-- STEP 3: Enable RLS
ALTER TABLE public.site_settings ENABLE ROW LEVEL SECURITY;

-- STEP 4: Public read policy (idempotent — drop first if exists)
DROP POLICY IF EXISTS "Allow public read access on site_settings" ON public.site_settings;
CREATE POLICY "Allow public read access on site_settings"
    ON public.site_settings
    FOR SELECT
    USING (true);

-- STEP 5: Admin-only update policy (idempotent — drop first if exists)
DROP POLICY IF EXISTS "Allow admins to update site_settings" ON public.site_settings;
CREATE POLICY "Allow admins to update site_settings"
    ON public.site_settings
    FOR UPDATE
    USING (public.has_role(auth.uid(), 'admin'));

-- STEP 6: Create or replace the RPC function
-- SECURITY DEFINER so it can atomically update even for non-owners.
-- The 1-hour check runs on server time (now()), never the browser clock.
CREATE OR REPLACE FUNCTION public.get_effective_site_settings()
RETURNS SETOF public.site_settings
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_setting public.site_settings%ROWTYPE;
BEGIN
    -- Fetch the single canonical row
    SELECT * INTO v_setting
    FROM public.site_settings
    WHERE id = 'global'
    LIMIT 1;

    -- If ads are disabled AND one hour has elapsed since disable time,
    -- atomically revert to enabled. Uses server time (now()), never the client clock.
    IF v_setting.ads_enabled = false
       AND v_setting.ads_disabled_at IS NOT NULL
       AND now() >= v_setting.ads_disabled_at + interval '1 hour'
    THEN
        UPDATE public.site_settings
        SET ads_enabled    = true,
            ads_disabled_at = null,
            updated_at      = now()
        WHERE id = 'global'
        RETURNING * INTO v_setting;
    END IF;

    RETURN NEXT v_setting;
END;
$$;

-- STEP 7: Verify deployment (read back the current state)
SELECT
    id,
    ads_enabled,
    ads_disabled_at,
    updated_at
FROM public.site_settings
WHERE id = 'global';
