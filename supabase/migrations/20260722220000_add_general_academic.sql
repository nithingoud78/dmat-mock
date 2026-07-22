-- ============================================================
-- Migration: Add general_academic to module_type enum
-- ============================================================

-- Add new value to the module_type enum
ALTER TYPE public.module_type ADD VALUE IF NOT EXISTS 'general_academic';

-- Also add to attempt_mode if we want to track GA-specific attempts
-- (attempt_mode already has 'practice', 'timed_section', 'complete_mock' — sufficient)

-- Done
