-- ==============================================================================
-- Migration: Admin Bootstrap
-- Description: Creates a secure RPC function to bootstrap the first admin account
-- ==============================================================================

-- Create a secure RPC function to bootstrap administrators
CREATE OR REPLACE FUNCTION public.bootstrap_admin()
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER 
SET search_path = public 
AS $$
DECLARE
  v_email TEXT;
  v_admin_emails TEXT;
  v_is_whitelisted BOOLEAN;
BEGIN
  -- Get the current authenticated user's email securely from the JWT
  v_email := auth.jwt() ->> 'email';
  
  -- If no authenticated user, return false immediately
  IF v_email IS NULL THEN
    RETURN FALSE;
  END IF;

  -- 1. Try to read the authorized emails from the PostgreSQL configuration
  -- Future deployments require ONLY setting this variable in the Supabase Dashboard:
  -- Database -> Settings -> Custom config -> app.settings.admin_emails = "a@a.com,b@b.com"
  BEGIN
    v_admin_emails := current_setting('app.settings.admin_emails', true);
  EXCEPTION WHEN OTHERS THEN
    v_admin_emails := NULL;
  END;
  
  -- 2. Fallback strictly for local MVP development
  IF v_admin_emails IS NULL OR v_admin_emails = '' THEN
    v_admin_emails := 'k.nithingoud78@gmail.com';
  END IF;

  -- 3. Check if the authenticated user's email exists in the authorized list
  v_is_whitelisted := v_email = ANY(string_to_array(v_admin_emails, ','));

  -- 4. If authorized, securely promote the user to admin
  IF v_is_whitelisted THEN
    -- The user ALWAYS has a row with role 'user' created by the handle_new_user() trigger
    -- We just need to UPDATE that existing row to 'admin'
    UPDATE public.user_roles 
    SET role = 'admin' 
    WHERE user_id = auth.uid();
    
    RETURN TRUE;
  END IF;

  RETURN FALSE;
END;
$$;
