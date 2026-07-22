import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useEffect, useRef, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { PublicLayout } from "@/components/PublicLayout";
import { ExamLayout } from "@/components/ExamLayout";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { TestRunner } from "@/components/TestRunner";
import { MODULES, MODULE_ORDER, type ModuleId } from "@/lib/modules";
import { fetchQuestions } from "@/lib/questions";
import type { SectionState, Question } from "@/lib/test-types";
import { useAuth } from "@/lib/auth";
import { getOrCreateSessionToken, sessionToMockSetIndex } from "@/lib/session";
import { formatMMSS } from "@/lib/time";
import { toast } from "sonner";
import {
  AlertTriangle,
  ArrowRight,
  CheckCircle2,
  Clock,
  Coffee,
  FileText,
  Play,
} from "lucide-react";
import { cn } from "@/lib/utils";

export const Route = createFileRoute("/mock/complete")({
  head: () => ({
    meta: [
      { title: "Complete Mock — dMAT Practice Pro" },
      {
        name: "description",
        content:
          "Full dMAT simulation: four sections, real timing, 30-minute break, no going back.",
      },
      { name: "robots", content: "noindex" },
    ],
  }),
  component: CompleteMock,
});

interface HomeContent {
  mock_instructions: { title: string; items: string[] };
}

/** Break duration in seconds (30 minutes) */
const BREAK_SECONDS = 30 * 60;

/** Index of the section AFTER which the break occurs (0-indexed) */
const BREAK_AFTER_SECTION_INDEX = 2; // after Latin Squares (index 2), before General Academic (index 3)

type Phase =
  | "instructions"
  | "loading"
  | "running"
  | "transition" // between sections
  | "break" // 30-min break
  | "done";

function CompleteMock() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const [phase, setPhase] = useState<Phase>("instructions");
  const [sections, setSections] = useState<SectionState[]>([]);
  const [current, setCurrent] = useState(0);
  const [attemptId, setAttemptId] = useState<string | undefined>();
  const [sessionToken] = useState(() => getOrCreateSessionToken());
  const [breakSecondsLeft, setBreakSecondsLeft] = useState(BREAK_SECONDS);
  const breakIntervalRef = useRef<number | undefined>(undefined);

  // ── Fetch instructions from CMS ─────────────────────────────────────────
  const { data: instr } = useQuery({
    queryKey: ["mock_instructions"],
    queryFn: async () => {
      const { data } = await supabase
        .from("homepage_content")
        .select("content")
        .eq("id", 1)
        .maybeSingle();
      return (
        (data?.content as HomeContent | null)?.mock_instructions ?? {
          title: "Before you begin the Complete Mock",
          items: [
            "This is a full dMAT simulation: Figure Sequences (25 min) → Mathematical Equations (25 min) → Latin Squares (25 min) → 30-min Break → General Academic (90 min).",
            "Each section is independently timed. When the timer hits zero, that section auto-submits.",
            "No calculator. No going back to a previous section. Guessing has no penalty.",
            "Stay on this tab. Leaving the tab is logged for your own analytics.",
            "Total active testing time: ~165 minutes plus a 30-minute scheduled break.",
          ],
        }
      );
    },
  });

  // ── Before-unload guard during exam ─────────────────────────────────────
  useEffect(() => {
    if (phase !== "running" && phase !== "transition" && phase !== "break") return;
    const h = (e: BeforeUnloadEvent) => {
      e.preventDefault();
      e.returnValue = "";
    };
    window.addEventListener("beforeunload", h);
    return () => window.removeEventListener("beforeunload", h);
  }, [phase]);

  // ── Break countdown ──────────────────────────────────────────────────────
  useEffect(() => {
    if (phase !== "break") {
      if (breakIntervalRef.current) {
        clearInterval(breakIntervalRef.current);
        breakIntervalRef.current = undefined;
      }
      return;
    }
    breakIntervalRef.current = window.setInterval(() => {
      setBreakSecondsLeft((s) => {
        if (s <= 1) {
          clearInterval(breakIntervalRef.current);
          startNextSection();
          return 0;
        }
        return s - 1;
      });
    }, 1000);
    return () => {
      if (breakIntervalRef.current) clearInterval(breakIntervalRef.current);
    };
  }, [phase]);

  // ── Start exam ───────────────────────────────────────────────────────────
  const start = async () => {
    setPhase("loading");

    // Try to fetch a deterministic mock set for Core Module sections
    const mockIndex = sessionToMockSetIndex(sessionToken, 100) + 1;
    const { data: mockSet } = await supabase
      .from("mock_sets")
      .select("*")
      .eq("label", `Mock Set ${mockIndex}`)
      .maybeSingle();

    const built: SectionState[] = [];

    for (const mid of MODULE_ORDER) {
      const mod = MODULES[mid];
      let qs: Question[] = [];

      if (mockSet && mid !== "general_academic") {
        // Core Module: use mock set question IDs
        const modBreakdown = mockSet.module_breakdown as Record<string, string[]>;
        const qIds = (modBreakdown[mid] || []).slice(0, mod.questions);
        if (qIds.length > 0) {
          const { data } = await supabase
            .from("questions")
            .select("*, source:sources(*)")
            .in("id", qIds);
          if (data && data.length > 0) {
            const idOrder = qIds;
            qs = (data as unknown as Question[]).sort(
              (a, b) => idOrder.indexOf(a.id) - idOrder.indexOf(b.id),
            );
          }
        }
      }

      // Fallback: fetch random questions if mock set not available or GA module
      if (qs.length === 0) {
        qs = await fetchQuestions(mid, { limit: mod.questions });
      }

      if (qs.length === 0) {
        toast.error(`No questions found for ${mod.label}. Please try again later.`);
        setPhase("instructions");
        return;
      }

      built.push({
        moduleId: mid,
        moduleLabel: mod.label,
        questions: qs,
        answers: {},
        marked: {},
        timePerQ: {},
        currentIdx: 0,
        secondsLeft: mod.minutes * 60,
        totalSeconds: mod.minutes * 60,
        submitted: false,
      });
    }

    const allIds = built.flatMap((s) => s.questions.map((q) => q.id));

    if (user) {
      const { data, error } = await supabase
        .from("test_attempts")
        .insert({
          user_id: user.id,
          mode: "complete_mock",
          total_questions: allIds.length,
          question_ids: allIds,
        })
        .select("id")
        .single();
      if (error) {
        toast.error("Failed to create attempt: " + error.message);
        setPhase("instructions");
        return;
      }
      setAttemptId(data.id);
    } else {
      const { data, error } = await supabase
        .from("anon_attempts")
        .insert({
          session_token: sessionToken,
          mode: "complete_mock",
          total_questions: allIds.length,
          question_ids: allIds,
        })
        .select("id")
        .single();
      if (!error && data) setAttemptId(String(data.id));
    }

    setSections(built);
    setCurrent(0);
    setPhase("running");
  };

  // ── Section state updates ────────────────────────────────────────────────
  const updateCurrent = (s: SectionState) => {
    setSections((prev) => prev.map((x, i) => (i === current ? s : x)));
  };

  const submitCurrent = async (finalSection: SectionState) => {
    const next = sections.map((x, i) => (i === current ? finalSection : x));
    setSections(next);

    const isLastSection = current + 1 >= next.length;
    if (isLastSection) {
      await finalize(next);
    } else if (current === BREAK_AFTER_SECTION_INDEX) {
      // Show break screen before General Academic
      setBreakSecondsLeft(BREAK_SECONDS);
      setCurrent(current + 1);
      setPhase("break");
    } else {
      // Show transition screen
      setCurrent(current + 1);
      setPhase("transition");
    }
  };

  const startNextSection = () => {
    setPhase("running");
  };

  // ── Finalize (compute results + navigate) ────────────────────────────────
  const finalize = async (all: SectionState[]) => {
    let correct = 0,
      incorrect = 0,
      skipped = 0;
    const answerMap: Record<string, string | null> = {};
    let durationSec = 0;

    for (const s of all) {
      for (const q of s.questions) {
        const a = s.answers[q.id];
        if (!a) skipped++;
        else if (a === q.correct_option_id) correct++;
        else incorrect++;
        answerMap[q.id] = a ?? null;
      }
      durationSec += s.totalSeconds - Math.max(0, s.secondsLeft);
    }

    const total = correct + incorrect + skipped;
    const score = Math.round((correct / Math.max(1, total)) * 200);
    const accuracy = total ? +((correct / total) * 100).toFixed(2) : 0;

    let tabSwitches = 0;
    if (attemptId) {
      const { count } = await supabase
        .from("tab_switch_events")
        .select("*", { count: "exact", head: true })
        .eq("attempt_id", attemptId);
      tabSwitches = count ?? 0;
    }

    if (user && attemptId) {
      const answerRows = all.flatMap((s) =>
        s.questions.map((q) => ({
          attempt_id: attemptId,
          question_id: q.id,
          selected_option_id: s.answers[q.id] ?? null,
          is_correct: s.answers[q.id] ? s.answers[q.id] === q.correct_option_id : null,
          marked_for_review: !!s.marked[q.id],
          time_spent_seconds: s.timePerQ[q.id] || 0,
          answered_at: s.answers[q.id] ? new Date().toISOString() : null,
        })),
      );
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
      await supabase.from("attempt_answers").insert(answerRows);
      setPhase("done");
      navigate({ to: "/mock/result/$attemptId", params: { attemptId } });
    } else {
      if (attemptId) {
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
            answers: answerMap,
          })
          .eq("id", attemptId);
      }
      setPhase("done");
      navigate({
        to: "/mock/session-result",
        search: {
          c: correct,
          i: incorrect,
          s: skipped,
          score,
          time: durationSec,
          switches: tabSwitches,
          sections: JSON.stringify(
            all.map((sec) => ({
              moduleId: sec.moduleId,
              moduleLabel: sec.moduleLabel,
              correct: sec.questions.filter((q) => sec.answers[q.id] === q.correct_option_id)
                .length,
              total: sec.questions.length,
            })),
          ),
        },
      });
    }
  };

  // ════════════════════════════════════════════════════════════════
  // RENDER PHASES
  // ════════════════════════════════════════════════════════════════

  // ── Instructions ────────────────────────────────────────────────────────
  if (phase === "instructions") {
    return (
      <PublicLayout>
        <div className="mx-auto max-w-3xl px-4 py-10 md:px-8">
          <div className="text-sm text-muted-foreground">Complete Mock</div>
          <h1 className="mt-1 text-3xl font-semibold tracking-tight">
            {instr?.title ?? "Before you begin"}
          </h1>

          {/* Section overview — 4 sections */}
          <div className="mt-6 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
            {MODULE_ORDER.map((mid, idx) => {
              const mod = MODULES[mid as ModuleId];
              return (
                <Card
                  key={mid}
                  className={cn(
                    "p-4 shadow-card",
                    mid === "general_academic" && "border-primary/30 bg-primary/5",
                  )}
                >
                  <div className="text-xl">{mod.icon}</div>
                  <div className="mt-2 font-semibold text-sm">{mod.label}</div>
                  <div className="mt-1 flex items-center gap-2 text-xs text-muted-foreground">
                    <Clock className="h-3 w-3" /> {mod.minutes} min
                    <FileText className="ml-1 h-3 w-3" /> {mod.questions} Qs
                  </div>
                  {idx === BREAK_AFTER_SECTION_INDEX && (
                    <div className="mt-2 flex items-center gap-1 text-[10px] font-medium text-warning">
                      <Coffee className="h-3 w-3" /> 30-min break follows
                    </div>
                  )}
                </Card>
              );
            })}
          </div>

          <Card className="mt-6 p-7 shadow-card">
            <div className="mb-4 flex items-center gap-2 rounded-lg border border-warning/30 bg-warning/10 px-3 py-2 text-xs text-foreground">
              <AlertTriangle className="h-4 w-4 text-warning" />
              You cannot revisit a section once its timer ends.
            </div>
            <ul className="space-y-3">
              {(instr?.items ?? []).map((t, i) => (
                <li key={i} className="flex gap-3 text-sm text-muted-foreground">
                  <span className="mt-1.5 h-1.5 w-1.5 shrink-0 rounded-full bg-primary" />
                  <span>{t}</span>
                </li>
              ))}
            </ul>
            <div className="mt-1 text-xs text-muted-foreground">
              {!user && "No sign-in required. Your session is tracked anonymously."}
            </div>
            <Button size="lg" className="mt-8 w-full font-semibold" onClick={start}>
              <Play className="mr-2 h-4 w-4" /> Begin Mock Test
            </Button>
          </Card>
        </div>
      </PublicLayout>
    );
  }

  // ── Loading ──────────────────────────────────────────────────────────────
  if (phase === "loading") {
    return (
      <ExamLayout>
        <div className="mx-auto max-w-7xl px-4 py-6 md:px-8">
          <div className="mb-5 flex items-center justify-between">
            <div className="h-6 w-1/3 animate-pulse rounded bg-secondary" />
            <div className="h-10 w-24 animate-pulse rounded-full bg-secondary" />
          </div>
          <div className="grid gap-6 lg:grid-cols-[1fr_300px]">
            <div className="min-h-[450px] animate-pulse rounded-xl bg-card shadow-card" />
            <div className="hidden h-96 animate-pulse rounded-xl bg-card shadow-card lg:block" />
          </div>
        </div>
      </ExamLayout>
    );
  }

  // ── Transition (between sections) ────────────────────────────────────────
  if (phase === "transition" && sections[current]) {
    const prevSection = sections[current - 1];
    const nextSection = sections[current];
    const prevMod = MODULES[prevSection.moduleId as ModuleId];
    const nextMod = MODULES[nextSection.moduleId as ModuleId];
    const prevCorrect = prevSection.questions.filter(
      (q) => prevSection.answers[q.id] === q.correct_option_id,
    ).length;

    return (
      <PublicLayout>
        <div className="mx-auto max-w-lg px-4 py-16 md:px-8">
          <Card className="p-8 shadow-card text-center">
            <div className="mx-auto flex h-14 w-14 items-center justify-center rounded-2xl bg-success/10">
              <CheckCircle2 className="h-7 w-7 text-success" />
            </div>
            <div className="mt-5 text-lg font-semibold">
              {prevMod.icon} {prevMod.label} Complete
            </div>
            <div className="mt-2 text-3xl font-bold text-primary">
              {prevCorrect}
              <span className="text-lg font-normal text-muted-foreground">
                /{prevSection.questions.length} correct
              </span>
            </div>

            <div className="my-8 border-t" />

            <div className="text-sm font-medium text-muted-foreground">Up next</div>
            <div className="mt-2 text-xl font-semibold">
              {nextMod.icon} {nextMod.label}
            </div>
            <div className="mt-1 text-xs text-muted-foreground">
              {nextMod.questions} questions · {nextMod.minutes} minutes
            </div>

            <Button size="lg" className="mt-8 w-full font-semibold" onClick={startNextSection}>
              Start {nextMod.label} <ArrowRight className="ml-2 h-4 w-4" />
            </Button>
          </Card>
        </div>
      </PublicLayout>
    );
  }

  // ── Break Screen ─────────────────────────────────────────────────────────
  if (phase === "break" && sections[current]) {
    const nextMod = MODULES[sections[current].moduleId as ModuleId];
    const breakMinutes = Math.floor(breakSecondsLeft / 60);
    const breakIsAlmostOver = breakSecondsLeft <= 60;

    return (
      <PublicLayout>
        <div className="mx-auto max-w-lg px-4 py-16 md:px-8">
          <Card className="p-8 shadow-card text-center">
            <div className="mx-auto flex h-14 w-14 items-center justify-center rounded-2xl bg-warning/10">
              <Coffee className="h-7 w-7 text-warning" />
            </div>
            <h2 className="mt-5 text-2xl font-semibold">Scheduled Break</h2>
            <p className="mt-2 text-sm text-muted-foreground">
              You have completed the Core Module. Take a break before the General Academic section.
            </p>

            <div
              className={cn(
                "mt-8 rounded-2xl border px-8 py-6",
                breakIsAlmostOver
                  ? "border-destructive/30 bg-destructive/5"
                  : "border-border bg-secondary/30",
              )}
            >
              <div className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
                Break time remaining
              </div>
              <div
                className={cn(
                  "mt-2 font-mono text-5xl font-bold tabular-nums",
                  breakIsAlmostOver ? "text-destructive" : "text-foreground",
                )}
              >
                {formatMMSS(breakSecondsLeft)}
              </div>
              <div className="mt-1 text-xs text-muted-foreground">
                {breakMinutes > 0 ? `Auto-continues in ${breakMinutes} min` : "Starting now…"}
              </div>
            </div>

            <div className="mt-6 rounded-xl border bg-secondary/30 p-4 text-left text-sm">
              <div className="mb-2 font-semibold">About the General Academic section</div>
              <ul className="space-y-1.5 text-xs text-muted-foreground">
                <li className="flex gap-2">
                  <span className="mt-1 h-1.5 w-1.5 shrink-0 rounded-full bg-primary" />
                  {nextMod.questions} questions over {nextMod.minutes} minutes
                </li>
                <li className="flex gap-2">
                  <span className="mt-1 h-1.5 w-1.5 shrink-0 rounded-full bg-primary" />
                  Covers reading comprehension, logical reasoning, and data interpretation
                </li>
                <li className="flex gap-2">
                  <span className="mt-1 h-1.5 w-1.5 shrink-0 rounded-full bg-primary" />
                  Read passages carefully — most errors come from rushing
                </li>
              </ul>
            </div>

            <Button
              variant="outline"
              size="lg"
              className="mt-8 w-full"
              onClick={() => {
                if (breakIntervalRef.current) clearInterval(breakIntervalRef.current);
                startNextSection();
              }}
            >
              Skip break — Start {nextMod.label} now
            </Button>
          </Card>
        </div>
      </PublicLayout>
    );
  }

  // ── Running ──────────────────────────────────────────────────────────────
  if (phase === "running" && sections[current]) {
    const s = sections[current];
    return (
      <ExamLayout>
        <TestRunner
          mode="complete_mock_section"
          section={s}
          attemptId={user ? attemptId : undefined}
          onUpdate={updateCurrent}
          onSubmit={submitCurrent}
          headerTitle={`Complete Mock — ${s.moduleLabel}`}
          headerSubtitle="This section auto-submits at 0:00. You cannot go back."
          currentSectionIndex={current}
          totalSections={sections.length}
        />
      </ExamLayout>
    );
  }

  return (
    <PublicLayout>
      <div className="p-10 text-center text-muted-foreground">Finalizing your results…</div>
    </PublicLayout>
  );
}
