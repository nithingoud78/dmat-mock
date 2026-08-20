import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { PublicLayout } from "@/components/PublicLayout";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { MODULES } from "@/lib/modules";
import { SourcePopover } from "@/components/SourcePopover";
import { formatMMSS } from "@/lib/time";
import { CheckCircle2, XCircle, Eye } from "lucide-react";
import { ReviewQuestionDialog } from "@/components/ReviewQuestionDialog";

export const Route = createFileRoute("/mock/result/$attemptId")({
  head: () => ({
    meta: [
      { title: "Mock Result — dMAT Practice Pro" },
      { name: "description", content: "Your dMAT mock result." },
      { name: "robots", content: "noindex" },
    ],
  }),
  component: ResultPage,
});

function ResultPage() {
  const { attemptId } = Route.useParams();

  const { data } = useQuery({
    queryKey: ["attempt", attemptId],
    queryFn: async () => {
      const { data: attempt } = await supabase
        .from("test_attempts")
        .select("*")
        .eq("id", attemptId)
        .single();
      const { data: answers } = await supabase
        .from("attempt_answers")
        .select("*, question:questions(*, source:sources(*))")
        .eq("attempt_id", attemptId);
      return { attempt, answers: answers ?? [] };
    },
  });

  if (!data?.attempt) {
    return (
      <PublicLayout>
        <div className="p-10 text-center text-muted-foreground">Loading…</div>
      </PublicLayout>
    );
  }

  const a = data.attempt;
  const answers = data.answers;

  // Group by module
  const byModule: Record<string, typeof answers> = {};
  for (const r of answers) {
    const m = (r.question as any).module as string;
    (byModule[m] ??= []).push(r);
  }

  return (
    <PublicLayout>
      <div className="mx-auto max-w-5xl px-4 py-10 md:px-8">
        <div className="text-sm text-muted-foreground">
          {a.mode === "complete_mock" ? "Complete Mock" : "Timed Section"} ·{" "}
          {new Date(a.submitted_at || a.started_at).toLocaleString()}
        </div>
        <h1 className="mt-1 text-3xl font-semibold tracking-tight">Your Result</h1>

        <div className="mt-6 grid gap-4 md:grid-cols-5">
          <BigStat label="Est. Score" value={`${a.score ?? 0}/200`} />
          <BigStat label="Est. Percentile" value={`${a.total_percentile ?? 0}th`} />
          <BigStat label="Accuracy" value={`${a.accuracy ?? 0}%`} />
          <BigStat label="Correct" value={String(a.correct_count)} />
          <BigStat label="Time used" value={formatMMSS(a.duration_seconds || 0)} />
        </div>

        {a.mode === "complete_mock" && (
          <div className="mt-4 grid gap-4 sm:grid-cols-2">
            <Card className="p-5 shadow-card border-primary/20 bg-card">
              <div className="font-semibold text-lg mb-3 flex items-center justify-between">
                Core Module
                <Badge variant="outline" className="font-mono">{a.core_scaled_score ?? 0}/200</Badge>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <div className="text-xs uppercase text-muted-foreground">Est. Percentile</div>
                  <div className="text-lg font-semibold">{a.core_percentile ?? 0}th</div>
                </div>
              </div>
            </Card>

            <Card className="p-5 shadow-card border-primary/20 bg-card">
              <div className="font-semibold text-lg mb-3 flex items-center justify-between">
                General Academic
                <Badge variant="outline" className="font-mono">{a.gam_scaled_score ?? 0}/200</Badge>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <div className="text-xs uppercase text-muted-foreground">Est. Percentile</div>
                  <div className="text-lg font-semibold">{a.gam_percentile ?? 0}th</div>
                </div>
              </div>
            </Card>
          </div>
        )}

        {/* Per section */}
        <div className="mt-8 space-y-6">
          {Object.entries(byModule).map(([mid, rows]) => {
            const mod = MODULES[mid as keyof typeof MODULES];
            const correct = rows.filter((r) => r.is_correct).length;
            const skipped = rows.filter((r) => !r.selected_option_id).length;
            const incorrect = rows.length - correct - skipped;
            const acc = ((correct / rows.length) * 100).toFixed(0);
            const avgT = Math.round(
              rows.reduce((s, r) => s + (r.time_spent_seconds || 0), 0) / Math.max(1, rows.length),
            );
            return (
              <Card key={mid} className="p-6 shadow-card">
                <div className="mb-4 flex flex-wrap items-center justify-between gap-2">
                  <div className="text-lg font-semibold">
                    {mod?.icon} {mod?.label ?? mid}
                  </div>
                  <div className="flex flex-wrap gap-2 text-xs">
                    <Badge variant="secondary">Correct {correct}</Badge>
                    <Badge variant="secondary">Incorrect {incorrect}</Badge>
                    <Badge variant="secondary">Skipped {skipped}</Badge>
                    <Badge variant="secondary">Accuracy {acc}%</Badge>
                    <Badge variant="secondary">Avg {avgT}s/Q</Badge>
                  </div>
                </div>
                <div className="space-y-3">
                  {rows.map((r, i) => {
                    const q: any = r.question;
                    const ok = r.is_correct;
                    return (
                      <div key={r.id} className="rounded-xl border p-4">
                        <div className="mb-2 flex flex-wrap items-center justify-between gap-2">
                          <div className="flex items-center gap-2 text-xs text-muted-foreground">
                            <span className="font-medium text-foreground">Q{i + 1}</span>
                            <Badge variant="outline" className="capitalize">
                              {q.difficulty}
                            </Badge>
                            {ok === true ? (
                              <span className="inline-flex items-center gap-1 text-success">
                                <CheckCircle2 className="h-3 w-3" /> Correct
                              </span>
                            ) : ok === false ? (
                              <span className="inline-flex items-center gap-1 text-destructive">
                                <XCircle className="h-3 w-3" /> Incorrect
                              </span>
                            ) : (
                              <span className="text-muted-foreground">Skipped</span>
                            )}
                          </div>
                          <SourcePopover source={q.source} />
                        </div>
                        <div className="mb-2 whitespace-pre-wrap text-sm">{q.prompt_text}</div>

                        {q.visual_data ? (
                          <div className="mt-4">
                            <ReviewQuestionDialog 
                              question={q} 
                              userAnswer={r.selected_option_id ?? null}
                            >
                              <Button variant="outline" size="sm" className="w-full sm:w-auto">
                                <Eye className="mr-2 h-4 w-4" />
                                Review Visual Question
                              </Button>
                            </ReviewQuestionDialog>
                          </div>
                        ) : (
                          <div className="grid gap-1 text-xs">
                            <div>
                              Your answer:{" "}
                              <span
                                className={
                                  ok
                                    ? "text-success"
                                    : r.selected_option_id
                                      ? "text-destructive"
                                      : "text-muted-foreground"
                                }
                              >
                                {r.selected_option_id
                                  ? (q.options.find((o: any) => o.id === r.selected_option_id)
                                      ?.text ?? r.selected_option_id)
                                  : "Skipped"}
                              </span>
                            </div>
                            <div>
                              Correct:{" "}
                              <span className="text-success">
                                {q.options.find((o: any) => o.id === q.correct_option_id)?.text}
                              </span>
                            </div>
                          </div>
                        )}

                        {!q.visual_data && q.explanation_text && (
                          <div className="mt-3 rounded-lg bg-secondary/50 p-3 text-xs text-muted-foreground">
                            {q.explanation_text}
                          </div>
                        )}
                      </div>
                    );
                  })}
                </div>
              </Card>
            );
          })}
        </div>

        {a.mode === "complete_mock" && (
          <div className="mt-8 rounded-lg border border-primary/20 bg-primary/5 px-5 py-4 text-sm text-foreground">
            <strong>Note:</strong> This score is an estimated practice score designed to approximate the official dMAT reporting format. The official dMAT scaled score and percentile are calculated centrally by the TestDaF Institute using a proprietary normalization process.
          </div>
        )}

        <div className="mt-8 flex flex-wrap justify-center gap-3">
          <Button asChild variant="outline">
            <Link to="/">Back to home</Link>
          </Button>
          <Button asChild>
            <Link to="/mock/complete">Take another mock</Link>
          </Button>
        </div>
      </div>
    </PublicLayout>
  );
}

function BigStat({ label, value }: { label: string; value: string }) {
  return (
    <Card className="p-5 shadow-card">
      <div className="text-xs uppercase tracking-wide text-muted-foreground">{label}</div>
      <div className="mt-1 text-2xl font-semibold">{value}</div>
    </Card>
  );
}
