# dMAT Practice Pro

An independent, production-quality practice platform for the **g.a.s.t. dMAT** (Digital Master Test) — built for Indian APS applicants preparing for master's study in Germany.

## Features

- **Figure Sequences** — Visual SVG-based pattern recognition questions
- **Mathematical Equations** — System-of-equations problems with monospace rendering
- **Latin Squares** — Interactive grid constraint-solving problems
- **Timed Mock** — Individual section practice with real exam timing (no account required)
- **Complete Mock** — Full 3-section simulation with randomized question sets (no account required)
- **Results & Analytics** — Score, accuracy, per-section breakdown, question review
- **Admin Panel** — Question management, bulk import, CSV support

## Tech Stack

- **React 18** + TypeScript
- **TanStack Router** for file-based routing
- **TanStack Query** for data fetching
- **Supabase** for database and authentication
- **Tailwind CSS v4** + shadcn/ui for styling
- **Framer Motion** for animations

## Getting Started

```bash
# Install dependencies
npm install

# Copy environment variables
cp .env.example .env
# Fill in your Supabase URL and publishable key

# Link Supabase project
npx supabase link --project-ref YOUR_PROJECT_REF

# Push database migrations
npx supabase db push

# Generate TypeScript types
npx supabase gen types typescript --linked > src/integrations/supabase/types.ts

# Start development server
npm run dev
```

## Development Scripts

```bash
npm run dev        # Start dev server
npm run build      # TypeScript check + Vite build
npm run typecheck  # TypeScript type check only
npm run lint       # ESLint
npm run format     # Prettier
```

## Database

All migrations are in `supabase/migrations/`. The schema includes:

- `questions` — Core question bank with visual_data JSONB
- `sources` — Question source attribution
- `test_attempts` — Authenticated user attempt tracking
- `anon_attempts` — Anonymous user attempt tracking
- `attempt_answers` — Per-question answer records
- `mock_sets` — Randomized mock question sets
- `profiles` / `user_roles` — Optional user accounts

## License

This is an independent personal-use practice tool. Not affiliated with g.a.s.t. or APS.
