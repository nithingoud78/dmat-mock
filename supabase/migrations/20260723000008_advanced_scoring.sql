-- Add scaled scoring and percentile columns to test_attempts and anon_attempts

ALTER TABLE public.test_attempts
ADD COLUMN core_raw_score int DEFAULT 0,
ADD COLUMN gam_raw_score int DEFAULT 0,
ADD COLUMN core_scaled_score int DEFAULT 0,
ADD COLUMN gam_scaled_score int DEFAULT 0,
ADD COLUMN total_scaled_score int DEFAULT 0,
ADD COLUMN core_percentile numeric DEFAULT 0.0,
ADD COLUMN gam_percentile numeric DEFAULT 0.0,
ADD COLUMN total_percentile numeric DEFAULT 0.0,
ADD COLUMN analytics_json jsonb DEFAULT '{}'::jsonb;

ALTER TABLE public.anon_attempts
ADD COLUMN core_raw_score int DEFAULT 0,
ADD COLUMN gam_raw_score int DEFAULT 0,
ADD COLUMN core_scaled_score int DEFAULT 0,
ADD COLUMN gam_scaled_score int DEFAULT 0,
ADD COLUMN total_scaled_score int DEFAULT 0,
ADD COLUMN core_percentile numeric DEFAULT 0.0,
ADD COLUMN gam_percentile numeric DEFAULT 0.0,
ADD COLUMN total_percentile numeric DEFAULT 0.0,
ADD COLUMN analytics_json jsonb DEFAULT '{}'::jsonb;
