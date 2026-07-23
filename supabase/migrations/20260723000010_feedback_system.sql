-- ============================================================
-- Migration: Simple Feedback System
-- ============================================================

CREATE TABLE IF NOT EXISTS public.feedback (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    name TEXT,
    email TEXT,
    category TEXT NOT NULL,
    message TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'new' CHECK (status IN ('new', 'read', 'resolved'))
);

-- Turn on RLS
ALTER TABLE public.feedback ENABLE ROW LEVEL SECURITY;

-- Allow public inserts (anyone can submit feedback)
CREATE POLICY "feedback allow public insert" ON public.feedback 
    FOR INSERT 
    WITH CHECK (true);

-- Allow admins to select
CREATE POLICY "feedback allow admin select" ON public.feedback 
    FOR SELECT 
    USING (
        (SELECT role FROM public.profiles WHERE profiles.id = auth.uid()) = 'admin'
    );

-- Allow admins to update (mark read/resolved)
CREATE POLICY "feedback allow admin update" ON public.feedback 
    FOR UPDATE 
    USING (
        (SELECT role FROM public.profiles WHERE profiles.id = auth.uid()) = 'admin'
    );

-- Allow admins to delete
CREATE POLICY "feedback allow admin delete" ON public.feedback 
    FOR DELETE 
    USING (
        (SELECT role FROM public.profiles WHERE profiles.id = auth.uid()) = 'admin'
    );

-- Done
