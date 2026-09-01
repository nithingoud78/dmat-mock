-- Fix: Allow the SECURITY DEFINER function owner to perform the auto-expiry UPDATE.
-- The existing admin-update policy uses auth.uid() which is NULL when called from
-- a SECURITY DEFINER function running as the postgres role. We add a separate
-- policy granting the postgres/service_role the ability to update for auto-expiry.

-- Policy for the SECURITY DEFINER function owner (postgres role) to update
DROP POLICY IF EXISTS "Allow system auto-expiry update on site_settings" ON public.site_settings;
CREATE POLICY "Allow system auto-expiry update on site_settings"
    ON public.site_settings
    FOR UPDATE
    USING (current_user = 'postgres' OR current_user = 'service_role');

-- Also update the function to set a safe search_path
CREATE OR REPLACE FUNCTION public.get_effective_site_settings()
RETURNS SETOF public.site_settings
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
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
