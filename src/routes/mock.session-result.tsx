import { createFileRoute, Link, useSearch } from "@tanstack/react-router";
import { PublicLayout } from "@/components/PublicLayout";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { formatMMSS } from "@/lib/time";
import { MODULES } from "@/lib/modules";
import { AlertTriangle, CheckCircle2, Home, RotateCcw, XCircle } from "lucide-react";

export const Route = createFileRoute("/mock/session-result")({
  head: () => ({
    meta: [{ title: "Mock Result — dMAT Practice Pro" }, { name: "robots", content: "noindex" }],
  }),
  validateSearch: (search: Record<string, unknown>) => ({
    c: Number(search.c ?? 0),
    i: Number(search.i ?? 0),
    s: Number(search.s ?? 0),
    score: Number(search.score ?? 0),
    coreScaled: Number(search.coreScaled ?? 0),
    gamScaled: Number(search.gamScaled ?? 0),
    corePctl: Number(search.corePctl ?? 0),
    gamPctl: Number(search.gamPctl ?? 0),
    totalPctl: Number(search.totalPctl ?? 0),
    time: Number(search.time ?? 0),
    switches: Number(search.switches ?? 0),
    sections: String(search.sections ?? "[]"),
  }),
  component: SessionResultPage,
});

function SessionResultPage() {
  const {
    c,
    i,
    s,
    score,
    coreScaled,
    gamScaled,
    corePctl,
    gamPctl,
    totalPctl,
    time,
    switches,
    sections: sectionsJson,
  } = useSearch({
    from: "/mock/session-result",
  });

  let sectionData: Array<{
    moduleId: string;
    moduleLabel: string;
    correct: number;
    total: number;
  }> = [];
  try {
    sectionData = JSON.parse(sectionsJson);
  } catch {
    sectionData = [];
  }

  const total = c + i + s;
  const accuracy = total > 0 ? ((c / total) * 100).toFixed(1) : "0.0";

  return (
    <PublicLayout>
      <div className="mx-auto max-w-4xl px-4 py-10 md:px-8">
        <div className="text-sm text-muted-foreground">Complete Mock Result</div>
        <h1 className="mt-1 text-3xl font-semibold tracking-tight">Your Result</h1>

        {/* Score summary */}
        <div className="mt-6 grid gap-4 sm:grid-cols-2 md:grid-cols-4">
          <BigStat label="Estimated Score" value={`${score}/200`} accent />
          <BigStat label="Estimated Percentile" value={`${totalPctl}th`} />
          <BigStat label="Accuracy" value={`${accuracy}%`} />
          <BigStat label="Time Used" value={formatMMSS(time)} />
        </div>

        <div className="mt-4 grid gap-4 sm:grid-cols-2">
          <Card className="p-5 shadow-card border-primary/20 bg-card">
            <div className="font-semibold text-lg mb-3 flex items-center justify-between">
              Core Module
              <Badge variant="outline" className="font-mono">{coreScaled}/200</Badge>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div>
                <div className="text-xs uppercase text-muted-foreground">Est. Percentile</div>
                <div className="text-lg font-semibold">{corePctl}th</div>
              </div>
            </div>
          </Card>

          <Card className="p-5 shadow-card border-primary/20 bg-card">
            <div className="font-semibold text-lg mb-3 flex items-center justify-between">
              General Academic
              <Badge variant="outline" className="font-mono">{gamScaled}/200</Badge>
            </div>
            <div className="grid grid-cols-2 gap-4">
              <div>
                <div className="text-xs uppercase text-muted-foreground">Est. Percentile</div>
                <div className="text-lg font-semibold">{gamPctl}th</div>
              </div>
            </div>
          </Card>
        </div>

        {/* Quick breakdown */}
        <Card className="mt-6 p-6 shadow-card">
          <div className="mb-4 text-sm font-semibold">Quick Breakdown</div>
          <div className="flex flex-wrap gap-3">
            <Badge className="gap-1 bg-success/15 text-success border-success/30 hover:bg-success/20">
              <CheckCircle2 className="h-3 w-3" /> {c} Correct
            </Badge>
            <Badge className="gap-1 bg-destructive/15 text-destructive border-destructive/30 hover:bg-destructive/20">
              <XCircle className="h-3 w-3" /> {i} Incorrect
            </Badge>
            <Badge variant="secondary" className="hover:bg-secondary/80">
              {s} Skipped
            </Badge>
            {switches > 0 && (
              <Badge className="gap-1 bg-warning/15 text-warning border-warning/30 hover:bg-warning/20">
                <AlertTriangle className="h-3 w-3" /> {switches} Tab Switch
                {switches > 1 ? "es" : ""}
              </Badge>
            )}
          </div>
        </Card>

        {/* Per section */}
        {sectionData.length > 0 && (
          <div className="mt-6 space-y-4">
            {sectionData.map((sec) => {
              const mod = MODULES[sec.moduleId as keyof typeof MODULES];
              const secAcc = sec.total > 0 ? ((sec.correct / sec.total) * 100).toFixed(0) : "0";
              return (
                <Card key={sec.moduleId} className="p-5 shadow-card">
                  <div className="flex flex-wrap items-center justify-between gap-2">
                    <div className="font-semibold">
                      {mod?.icon} {sec.moduleLabel}
                    </div>
                    <div className="flex flex-wrap gap-2 text-xs">
                      <Badge variant="secondary">
                        {sec.correct}/{sec.total} correct
                      </Badge>
                      <Badge variant="secondary">{secAcc}% accuracy</Badge>
                    </div>
                  </div>
                  <div className="mt-3 h-2 rounded-full bg-secondary overflow-hidden">
                    <div
                      className="h-full rounded-full bg-primary transition-all"
                      style={{ width: `${secAcc}%` }}
                    />
                  </div>
                </Card>
              );
            })}
          </div>
        )}

        <div className="mt-6 rounded-lg border border-primary/20 bg-primary/5 px-5 py-4 text-sm text-foreground">
          <strong>Note:</strong> This score is an estimated practice score designed to approximate the official dMAT reporting format. The official dMAT scaled score and percentile are calculated centrally by the TestDaF Institute using a proprietary normalization process.
        </div>

        <div className="mt-4 rounded-lg border border-muted bg-secondary/30 px-4 py-3 text-xs text-muted-foreground">
          Sign in to save your results and track your progress over time.
        </div>

        <div className="mt-8 flex flex-wrap justify-center gap-3">
          <Button asChild variant="outline">
            <Link to="/">
              <Home className="mr-2 h-4 w-4" /> Back to Home
            </Link>
          </Button>
          <Button asChild>
            <Link to="/mock/complete">
              <RotateCcw className="mr-2 h-4 w-4" /> Take Another Mock
            </Link>
          </Button>
        </div>
      </div>
    </PublicLayout>
  );
}

function BigStat({
  label,
  value,
  accent,
  color,
}: {
  label: string;
  value: string;
  accent?: boolean;
  color?: string;
}) {
  return (
    <Card className="p-5 shadow-card">
      <div className="text-xs uppercase tracking-wide text-muted-foreground">{label}</div>
      <div className={`mt-1 text-2xl font-semibold ${accent ? "text-primary" : (color ?? "")}`}>
        {value}
      </div>
    </Card>
  );
}
