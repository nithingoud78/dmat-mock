import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { PublicLayout } from "@/components/PublicLayout";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { ArrowRight, ExternalLink, Sparkles } from "lucide-react";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "dMAT Practice Pro — Serious practice for the g.a.s.t. dMAT" },
      {
        name: "description",
        content:
          "Realistic timed mocks, section drills, and analytics for the g.a.s.t. dMAT used in Germany's APS process.",
      },
      { property: "og:title", content: "dMAT Practice Pro" },
      {
        property: "og:description",
        content: "Realistic timed practice for the dMAT exam.",
      },
    ],
  }),
  component: Home,
});

interface HomeContent {
  hero: {
    title: string;
    subtitle: string;
    primary_cta: { label: string; href: string };
    secondary_cta: { label: string; href: string };
  };
  what_is_dmat: { title: string; body: string };
  aps_relevance: { title: string; body: string };
  exam_pattern: {
    title: string;
    rows: { section: string; questions: string; time: string }[];
    caption: string;
    scoring_note: string;
  };
  prep_tips: { title: string; items: string[] };
  faq: { title: string; items: { q: string; a: string }[] };
  official_links: { title: string; items: { label: string; url: string }[] };
  footer: { note: string };
}

function Home() {
  const { data } = useQuery({
    queryKey: ["homepage_content_with_stats"],
    queryFn: async () => {
      const { data: contentData, error } = await supabase
        .from("homepage_content")
        .select("content")
        .eq("id", 1)
        .maybeSingle();
      if (error) throw error;

      const { count: qCount } = await supabase
        .from("questions")
        .select("*", { count: "exact", head: true });
      const { count: mCount } = await supabase
        .from("mock_sets")
        .select("*", { count: "exact", head: true });
      const { count: aCount } = await supabase
        .from("test_attempts")
        .select("*", { count: "exact", head: true });

      const { count: figCount } = await supabase
        .from("questions")
        .select("*", { count: "exact", head: true })
        .eq("module", "figure_sequence");
      const { count: mathCount } = await supabase
        .from("questions")
        .select("*", { count: "exact", head: true })
        .eq("module", "math_equation");
      const { count: latinCount } = await supabase
        .from("questions")
        .select("*", { count: "exact", head: true })
        .eq("module", "latin_square");
      const { count: gaCount } = await supabase
        .from("questions")
        .select("*", { count: "exact", head: true })
        .eq("module", "general_academic");

      return {
        c: (contentData?.content ?? null) as HomeContent | null,
        stats: {
          questions: qCount ?? 0,
          mocks: mCount ?? 0,
          attempts: aCount ?? 0,
          figure: figCount ?? 0,
          math: mathCount ?? 0,
          latin: latinCount ?? 0,
          general: gaCount ?? 0,
        },
      };
    },
  });

  return (
    <PublicLayout>
      {data?.c ? (
        <HomeBody c={data.c} stats={data.stats} />
      ) : (
        <div className="p-8 text-muted-foreground">Loading…</div>
      )}
    </PublicLayout>
  );
}

function HomeBody({
  c,
  stats,
}: {
  c: HomeContent;
  stats: {
    questions: number;
    mocks: number;
    attempts: number;
    figure: number;
    math: number;
    latin: number;
    general: number;
  };
}) {
  return (
    <div className="mx-auto max-w-6xl px-4 py-10 sm:py-14 md:px-8">
      {/* Hero */}
      <section className="rounded-3xl border bg-card p-8 shadow-card sm:p-12">
        <div className="inline-flex items-center gap-2 rounded-full border bg-secondary px-3 py-1 text-xs font-medium text-secondary-foreground">
          <Sparkles className="h-3.5 w-3.5" /> Built for the 2026 dMAT format
        </div>
        <h1 className="mt-5 text-3xl font-semibold tracking-tight text-foreground sm:text-5xl">
          {c.hero.title}
        </h1>
        <p className="mt-4 max-w-2xl text-base text-muted-foreground sm:text-lg">
          {c.hero.subtitle}
        </p>
        <div className="mt-8 flex flex-wrap gap-3">
          <Button asChild size="lg">
            <Link to={c.hero.primary_cta.href}>
              {c.hero.primary_cta.label} <ArrowRight className="ml-2 h-4 w-4" />
            </Link>
          </Button>
          <Button asChild size="lg" variant="outline">
            <Link to={c.hero.secondary_cta.href}>{c.hero.secondary_cta.label}</Link>
          </Button>
        </div>
      </section>

      {/* Live Stats */}
      <section className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <Card className="flex flex-col items-center justify-center p-6 text-center shadow-card bg-card/60 backdrop-blur-sm border-primary/20">
          <div className="text-3xl font-bold text-primary">{stats.figure.toLocaleString()}</div>
          <div className="mt-1 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
            Figure Questions
          </div>
        </Card>
        <Card className="flex flex-col items-center justify-center p-6 text-center shadow-card bg-card/60 backdrop-blur-sm border-primary/20">
          <div className="text-3xl font-bold text-primary">{stats.math.toLocaleString()}</div>
          <div className="mt-1 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
            Math Questions
          </div>
        </Card>
        <Card className="flex flex-col items-center justify-center p-6 text-center shadow-card bg-card/60 backdrop-blur-sm border-primary/20">
          <div className="text-3xl font-bold text-primary">{stats.latin.toLocaleString()}</div>
          <div className="mt-1 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
            Latin Questions
          </div>
        </Card>
        <Card className="flex flex-col items-center justify-center p-6 text-center shadow-card bg-card/60 backdrop-blur-sm border-primary/20">
          <div className="text-3xl font-bold text-primary">{stats.general.toLocaleString()}</div>
          <div className="mt-1 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
            General Academic Qs
          </div>
        </Card>
      </section>

      {/* What is / APS */}
      <section className="mt-8 grid gap-5 md:grid-cols-2">
        <Card className="p-7 shadow-card">
          <h2 className="text-lg font-semibold">{c.what_is_dmat.title}</h2>
          <p className="mt-3 text-sm leading-relaxed text-muted-foreground">
            {c.what_is_dmat.body}
          </p>
        </Card>
        <Card className="p-7 shadow-card">
          <h2 className="text-lg font-semibold">{c.aps_relevance.title}</h2>
          <p className="mt-3 text-sm leading-relaxed text-muted-foreground">
            {c.aps_relevance.body}
          </p>
        </Card>
      </section>

      {/* Exam pattern & Practice Mode */}
      <section className="mt-8 grid gap-5 lg:grid-cols-2">
        <Card className="overflow-hidden shadow-card flex flex-col h-full">
          <div className="border-b p-6 bg-secondary/20">
            <h2 className="text-lg font-semibold flex items-center gap-2">
              <span className="h-2 w-2 rounded-full bg-primary" /> Official Exam Pattern
            </h2>
            <p className="mt-1 text-xs text-muted-foreground">
              This is the format of the real test.
            </p>
          </div>
          <div className="overflow-x-auto grow">
            <table className="w-full text-sm">
              <thead className="bg-secondary/40 text-left text-xs uppercase tracking-wide text-muted-foreground">
                <tr>
                  <th className="px-6 py-3 font-medium">Section</th>
                  <th className="px-6 py-3 font-medium">Questions</th>
                  <th className="px-6 py-3 font-medium">Time</th>
                </tr>
              </thead>
              <tbody>
                {c.exam_pattern.rows.map((r, i) => (
                  <tr key={i} className="border-t">
                    <td className="px-6 py-3 font-medium text-foreground">{r.section}</td>
                    <td className="px-6 py-3 text-muted-foreground">{r.questions}</td>
                    <td className="px-6 py-3 text-muted-foreground">{r.time}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          <p className="border-t bg-secondary/40 px-6 py-4 text-xs text-muted-foreground">
            {c.exam_pattern.caption}
          </p>
        </Card>

        <Card className="overflow-hidden shadow-card border-primary/20 flex flex-col h-full">
          <div className="border-b p-6 bg-primary/5">
            <h2 className="text-lg font-semibold text-primary flex items-center gap-2">
              <Sparkles className="h-4 w-4" /> Practice Configuration
            </h2>
            <p className="mt-1 text-xs text-muted-foreground">
              Our recommended format for timed section drills.
            </p>
          </div>
          <div className="overflow-x-auto grow">
            <table className="w-full text-sm">
              <thead className="bg-primary/5 text-left text-xs uppercase tracking-wide text-primary/70">
                <tr>
                  <th className="px-6 py-3 font-medium">Section</th>
                  <th className="px-6 py-3 font-medium">Questions</th>
                  <th className="px-6 py-3 font-medium">Time</th>
                </tr>
              </thead>
              <tbody>
                <tr className="border-t border-primary/10">
                  <td className="px-6 py-4 font-medium text-foreground">Figure Sequences</td>
                  <td className="px-6 py-4 text-muted-foreground font-mono">20</td>
                  <td className="px-6 py-4 text-muted-foreground font-mono">25 min</td>
                </tr>
                <tr className="border-t border-primary/10">
                  <td className="px-6 py-4 font-medium text-foreground">Mathematical Equations</td>
                  <td className="px-6 py-4 text-muted-foreground font-mono">20</td>
                  <td className="px-6 py-4 text-muted-foreground font-mono">25 min</td>
                </tr>
                <tr className="border-t border-primary/10">
                  <td className="px-6 py-4 font-medium text-foreground">Latin Squares</td>
                  <td className="px-6 py-4 text-muted-foreground font-mono">20</td>
                  <td className="px-6 py-4 text-muted-foreground font-mono">25 min</td>
                </tr>
                <tr className="border-t border-primary/10">
                  <td className="px-6 py-4 font-medium text-foreground">General Academic</td>
                  <td className="px-6 py-4 text-muted-foreground font-mono">20</td>
                  <td className="px-6 py-4 text-muted-foreground font-mono">90 min</td>
                </tr>
              </tbody>
            </table>
          </div>
          <p className="border-t bg-primary/5 px-6 py-4 text-xs text-muted-foreground">
            Practice modes use 20 questions per section matching the real exam format.
          </p>
        </Card>
      </section>

      {/* Prep tips */}
      <section className="mt-8">
        <Card className="p-7 shadow-card">
          <h2 className="text-lg font-semibold">{c.prep_tips.title}</h2>
          <ul className="mt-4 space-y-3">
            {c.prep_tips.items.map((t, i) => (
              <li key={i} className="flex gap-3 text-sm text-muted-foreground">
                <span className="mt-1.5 h-1.5 w-1.5 shrink-0 rounded-full bg-primary" />
                <span>{t}</span>
              </li>
            ))}
          </ul>
        </Card>
      </section>

      {/* FAQ */}
      <section className="mt-8">
        <Card className="p-7 shadow-card">
          <h2 className="text-lg font-semibold">{c.faq.title}</h2>
          <Accordion type="single" collapsible className="mt-4">
            {c.faq.items.map((f, i) => (
              <AccordionItem key={i} value={`i-${i}`}>
                <AccordionTrigger className="text-left text-sm font-medium">{f.q}</AccordionTrigger>
                <AccordionContent className="text-sm text-muted-foreground">{f.a}</AccordionContent>
              </AccordionItem>
            ))}
          </Accordion>
        </Card>
      </section>

      {/* Official links */}
      <section className="mt-8">
        <Card className="p-7 shadow-card">
          <h2 className="text-lg font-semibold">{c.official_links.title}</h2>
          <ul className="mt-4 space-y-2">
            {c.official_links.items.map((l, i) => (
              <li key={i}>
                <a
                  href={l.url}
                  target="_blank"
                  rel="noreferrer"
                  className="inline-flex items-center gap-2 text-sm text-primary hover:underline"
                >
                  {l.label} <ExternalLink className="h-3.5 w-3.5" />
                </a>
              </li>
            ))}
          </ul>
        </Card>
      </section>

      <footer className="mt-10 border-t pt-6 text-xs text-muted-foreground">{c.footer.note}</footer>
    </div>
  );
}
