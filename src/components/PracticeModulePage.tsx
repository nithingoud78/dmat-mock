import { useState } from "react";
import { Link } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { PublicLayout } from "@/components/PublicLayout";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { supabase } from "@/integrations/supabase/client";
import { MODULES, type ModuleId } from "@/lib/modules";
import { fetchQuestions } from "@/lib/questions";
import type { Question, SectionState } from "@/lib/test-types";
import { TestRunner } from "@/components/TestRunner";
import { useAuth } from "@/lib/auth";
import { getOrCreateSessionToken } from "@/lib/session";
import { markQuestionsAsSeen } from "@/lib/history";
import { ExamLayout } from "@/components/ExamLayout";
import { toast } from "sonner";
import { CheckCircle2, Clock, ListChecks, Play, Timer, XCircle } from "lucide-react";

type Difficulty = "easy" | "medium" | "hard" | "all";

export function PracticeModulePage({ moduleId }: { moduleId: ModuleId }) {
  const mod = MODULES[moduleId];
  const [difficulty, setDifficulty] = useState<Difficulty>("all");
  const [mode, setMode] = useState<"landing" | "loading" | "practice" | "timed">("landing");
  const [section, setSection] = useState<SectionState | null>(null);
  const [attemptId, setAttemptId] = useState<string | undefined>();
  const [finished, setFinished] = useState<{
    score: number;
    total: number;
    correct: number;
    incorrect: number;
    skipped: number;
  } | null>(null);
  const { user } = useAuth();
  const sessionToken = getOrCreateSessionToken();

  const { data: count } = useQuery({
    queryKey: ["qcount", moduleId, difficulty],
    queryFn: async () => {
      let q = supabase
        .from("questions")
        .select("id", { count: "exact", head: true })
        .eq("module", moduleId);
      if (difficulty !== "all") q = q.eq("difficulty", difficulty);
      const { count } = await q;
      return count ?? 0;
    },
  });

  const startSession = async (kind: "practice" | "timed") => {
    setMode("loading");
    const qs = await fetchQuestions(moduleId, { difficulty, limit: mod.questions });
    if (qs.length === 0) {
      toast.error("No questions available for this filter.");
      setMode("landing");
      return;
    }
    markQuestionsAsSeen(qs.map((q) => q.id));
    const seconds = mod.minutes * 60;
    const initial: SectionState = {
      moduleId,
      moduleLabel: mod.label,
      questions: qs,
      answers: {},
      marked: {},
      timePerQ: {},
      currentIdx: 0,
      secondsLeft: kind === "timed" ? seconds : Number.MAX_SAFE_INTEGER,
      totalSeconds: seconds,
      submitted: false,
    };
    setSection(initial);
    setMode(kind);

    if (kind === "timed") {
      if (user) {
        // Authenticated: save to test_attempts
        const { data, error } = await supabase
          .from("test_attempts")
          .insert({
            user_id: user.id,
            mode: "timed_section",
            module: moduleId,
            total_questions: qs.length,
            question_ids: qs.map((q) => q.id),
          })
          .select("id")
          .single();
        if (error) toast.error(error.message);
        else setAttemptId(data.id);
      } else {
        // Anonymous: save to anon_attempts
        const { data, error } = await supabase
          .from("anon_attempts")
          .insert({
            session_token: sessionToken,
            mode: "timed_section",
            module: moduleId,
            total_questions: qs.length,
            question_ids: qs.map((q) => q.id),
          })
          .select("id")
          .single();
        if (!error && data) setAttemptId(String(data.id));
      }
    }
  };

  const finish = async (finalSection: SectionState) => {
    let correct = 0,
      incorrect = 0,
      skipped = 0;
    for (const q of finalSection.questions) {
      const a = finalSection.answers[q.id];
      if (!a) skipped++;
      else if (a === q.correct_option_id) correct++;
      else incorrect++;
    }
    const total = finalSection.questions.length;
    const score = Math.round((correct / Math.max(1, total)) * 200);
    const accuracy = total ? +((correct / total) * 100).toFixed(2) : 0;
    const durationSec = finalSection.totalSeconds - Math.max(0, finalSection.secondsLeft);
    setSection(finalSection);
    setFinished({ score, total, correct, incorrect, skipped });

    if (attemptId) {
      if (user) {
        await supabase
          .from("test_attempts")
          .update({
            submitted_at: new Date().toISOString(),
            status: "submitted",
            score,
            accuracy,
            correct_count: correct,
            incorrect_count: incorrect,
            skipped_count: skipped,
            duration_seconds: durationSec,
          })
          .eq("id", attemptId);
        const rows = finalSection.questions.map((q) => ({
          attempt_id: attemptId,
          question_id: q.id,
          selected_option_id: finalSection.answers[q.id] ?? null,
          is_correct: finalSection.answers[q.id]
            ? finalSection.answers[q.id] === q.correct_option_id
            : null,
          marked_for_review: !!finalSection.marked[q.id],
          time_spent_seconds: finalSection.timePerQ[q.id] || 0,
          answered_at: finalSection.answers[q.id] ? new Date().toISOString() : null,
        }));
        await supabase.from("attempt_answers").insert(rows);
      } else {
        await supabase
          .from("anon_attempts")
          .update({
            submitted_at: new Date().toISOString(),
            status: "submitted",
            score,
            accuracy,
            correct_count: correct,
            incorrect_count: incorrect,
            skipped_count: skipped,
            duration_seconds: durationSec,
          })
          .eq("id", attemptId);
      }
    }
  };

  if (mode === "loading") {
    return (
      <ExamLayout>
        <div className="mx-auto max-w-7xl px-4 py-6 md:px-8">
          <div className="mb-5 flex items-center justify-between">
            <div className="h-6 w-1/3 animate-pulse rounded bg-secondary"></div>
            <div className="h-10 w-24 animate-pulse rounded-full bg-secondary"></div>
          </div>
          <div className="grid gap-6 lg:grid-cols-[1fr_300px]">
            <div className="min-h-[450px] animate-pulse rounded-xl bg-card shadow-card"></div>
            <div className="hidden h-96 animate-pulse rounded-xl bg-card shadow-card lg:block"></div>
          </div>
        </div>
      </ExamLayout>
    );
  }

  if (mode !== "landing" && section && !finished) {
    return (
      <ExamLayout>
        <TestRunner
          mode={mode === "timed" ? "timed_section" : "practice"}
          section={section}
          attemptId={user ? attemptId : undefined}
          onUpdate={setSection}
          onSubmit={finish}
          headerTitle={mod.label}
          headerSubtitle={
            mode === "timed"
              ? "Timed section · exam pace"
              : "Untimed practice · explanations on the fly"
          }
        />
      </ExamLayout>
    );
  }

  if (finished && section) {
    const accuracy =
      finished.total > 0 ? ((finished.correct / finished.total) * 100).toFixed(1) : "0.0";
    return (
      <PublicLayout>
        <div className="mx-auto max-w-3xl px-4 py-10 md:px-8">
          <Card className="p-8 text-center shadow-card">
            <div className="text-sm uppercase tracking-wide text-muted-foreground">
              {mod.label} — Result
            </div>
            <div className="mt-3 text-5xl font-bold text-primary">
              {finished.score}
              <span className="text-xl text-muted-foreground">/200</span>
            </div>
            <div className="mt-2 text-base text-muted-foreground">
              {finished.correct} correct · {finished.incorrect} incorrect · {finished.skipped}{" "}
              skipped
            </div>
            <div className="mt-1 text-sm font-semibold">{accuracy}% accuracy</div>
            <div className="mt-6 flex flex-wrap justify-center gap-2">
              <Button
                onClick={() => {
                  setMode("landing");
                  setSection(null);
                  setFinished(null);
                  setAttemptId(undefined);
                }}
              >
                Practice again
              </Button>
              <Button variant="outline" asChild>
                <Link to="/">Back to home</Link>
              </Button>
            </div>
          </Card>

          {/* Review */}
          <Card className="mt-6 p-6 shadow-card">
            <div className="mb-4 text-sm font-semibold">Question Review</div>
            <div className="space-y-4">
              {section.questions.map((q, i) => {
                const a = section.answers[q.id];
                const ok = a === q.correct_option_id;
                return (
                  <div key={q.id} className="rounded-xl border p-4">
                    <div className="mb-2 flex items-center gap-2 text-xs text-muted-foreground">
                      <span className="font-medium text-foreground">Q{i + 1}</span>
                      <Badge variant="outline" className="capitalize">
                        {q.difficulty}
                      </Badge>
                      {ok ? (
                        <span className="inline-flex items-center gap-1 text-success">
                          <CheckCircle2 className="h-3 w-3" /> Correct
                        </span>
                      ) : a ? (
                        <span className="inline-flex items-center gap-1 text-destructive">
                          <XCircle className="h-3 w-3" /> Incorrect
                        </span>
                      ) : (
                        <span className="text-muted-foreground">Skipped</span>
                      )}
                    </div>
                    <div className="mb-3 whitespace-pre-wrap text-sm text-foreground">
                      {q.prompt_text}
                    </div>
                    <div className="grid gap-1 text-xs">
                      <div>
                        Your answer:{" "}
                        <span
                          className={
                            ok ? "text-success" : a ? "text-destructive" : "text-muted-foreground"
                          }
                        >
                          {a ? (q.options.find((o) => o.id === a)?.text ?? a) : "Skipped"}
                        </span>
                      </div>
                      <div>
                        Correct:{" "}
                        <span className="text-success">
                          {q.options.find((o) => o.id === q.correct_option_id)?.text}
                        </span>
                      </div>
                    </div>
                    {q.explanation_text && (
                      <div className="mt-3 rounded-lg bg-secondary/50 p-3 text-xs text-muted-foreground">
                        {q.explanation_text}
                      </div>
                    )}
                  </div>
                );
              })}
            </div>
          </Card>
        </div>
      </PublicLayout>
    );
  }

  return (
    <PublicLayout>
      <div className="mx-auto max-w-5xl px-4 py-10 md:px-8">
        <div className="mb-2 text-sm text-muted-foreground">Practice module</div>
        <h1 className="text-3xl font-semibold tracking-tight">
          {mod.icon} {mod.label}
        </h1>
        <p className="mt-3 max-w-2xl text-sm text-muted-foreground">{mod.description}</p>

        <div className="mt-6 flex flex-wrap items-center gap-3">
          <Badge variant="secondary" className="gap-1 py-1">
            <ListChecks className="h-3 w-3" /> {count ?? "…"} questions available
          </Badge>
          <Badge variant="secondary" className="gap-1 py-1">
            <Clock className="h-3 w-3" /> {mod.minutes} min · {mod.questions} Qs (real exam)
          </Badge>
        </div>

        <Card className="mt-6 p-6 shadow-card">
          <div className="max-w-xs space-y-2">
            <label className="text-xs font-medium text-muted-foreground">Difficulty filter</label>
            <Select value={difficulty} onValueChange={(v: Difficulty) => setDifficulty(v)}>
              <SelectTrigger>
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All difficulties</SelectItem>
                <SelectItem value="easy">Easy</SelectItem>
                <SelectItem value="medium">Medium</SelectItem>
                <SelectItem value="hard">Hard</SelectItem>
              </SelectContent>
            </Select>
          </div>
          <div className="mt-6 grid gap-3 sm:grid-cols-2">
            <Button size="lg" variant="outline" onClick={() => startSession("practice")}>
              <Play className="mr-2 h-4 w-4" /> Start Practice (untimed)
            </Button>
            <Button size="lg" onClick={() => startSession("timed")}>
              <Timer className="mr-2 h-4 w-4" /> Start Timed Practice ({mod.minutes} min)
            </Button>
          </div>
          <p className="mt-3 text-xs text-muted-foreground">
            No sign-in required. Both practice modes work anonymously.
          </p>
        </Card>
      </div>
    </PublicLayout>
  );
}
