import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import type { Question, SectionState } from "@/lib/test-types";
import { formatMMSS } from "@/lib/time";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { QuestionPalette } from "@/components/QuestionPalette";
import { SourcePopover } from "@/components/SourcePopover";
import { QuestionDisplay } from "@/components/QuestionDisplay";
import { QuestionErrorBoundary } from "@/components/QuestionErrorBoundary";
import { FigureGrid } from "@/components/question-renderers/FigureSequenceRenderer";
import {
  Dialog,
  DialogContent,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogDescription,
} from "@/components/ui/dialog";
import {
  Drawer,
  DrawerContent,
  DrawerTrigger,
  DrawerHeader,
  DrawerTitle,
} from "@/components/ui/drawer";
import { cn } from "@/lib/utils";
import {
  Bookmark,
  CheckCircle2,
  ChevronLeft,
  ChevronRight,
  Clock,
  LayoutGrid,
  XCircle,
  AlertTriangle,
} from "lucide-react";
import { supabase } from "@/integrations/supabase/client";

export type RunnerMode = "practice" | "timed_section" | "complete_mock_section";

interface TestRunnerProps {
  mode: RunnerMode;
  section: SectionState;
  attemptId?: string; // for tab-switch logging in timed modes
  onUpdate: (next: SectionState) => void;
  onSubmit: (finalSection: SectionState) => void;
  headerTitle: string;
  headerSubtitle?: string;
  currentSectionIndex?: number;
  totalSections?: number;
}

export function TestRunner({
  mode,
  section,
  attemptId,
  onUpdate,
  onSubmit,
  headerTitle,
  headerSubtitle,
  currentSectionIndex,
  totalSections,
}: TestRunnerProps) {
  const q = section.questions[section.currentIdx];
  const answered = section.answers[q?.id];
  const isPractice = mode === "practice";
  const isTimed = !isPractice;

  const [showExplanation, setShowExplanation] = useState(false);
  const [confirmSubmit, setConfirmSubmit] = useState(false);
  const [tabWarn, setTabWarn] = useState(false);
  const awaySinceRef = useRef<number | null>(null);
  const perQTickRef = useRef<number>(Date.now());

  // Reset explanation on question change
  useEffect(() => setShowExplanation(false), [section.currentIdx]);

  // Maintain latest section ref for the timer closure to avoid stale state and answer wiping
  const sectionRef = useRef(section);
  useEffect(() => {
    sectionRef.current = section;
  }, [section]);

  // ===== Timer (timed modes only) =====
  useEffect(() => {
    if (!isTimed || sectionRef.current.submitted) return;
    const interval = window.setInterval(() => {
      const current = sectionRef.current;
      onUpdate({ ...current, secondsLeft: current.secondsLeft - 1 });
    }, 1000);
    return () => window.clearInterval(interval);
  }, [isTimed, onUpdate]);

  useEffect(() => {
    if (isTimed && !section.submitted && section.secondsLeft <= 0) {
      const nextSec = recordTime(section);
      onSubmit({ ...nextSec, submitted: true, submittedAt: new Date().toISOString() });
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [section.secondsLeft, isTimed, section.submitted, q]);

  // ===== Per-question elapsed accumulator =====
  useEffect(() => {
    perQTickRef.current = Date.now();
  }, [section.currentIdx]);

  const recordTime = (sec: SectionState) => {
    if (!q) return sec;
    const spent = Math.round((Date.now() - perQTickRef.current) / 1000);
    const prev = sec.timePerQ[q.id] || 0;
    perQTickRef.current = Date.now();
    return { ...sec, timePerQ: { ...sec.timePerQ, [q.id]: prev + spent } };
  };

  // ===== Tab-switch detection (timed modes) =====
  useEffect(() => {
    if (!isTimed || section.submitted) return;
    const onLeave = () => {
      if (!awaySinceRef.current) awaySinceRef.current = Date.now();
    };
    const onReturn = async () => {
      if (awaySinceRef.current) {
        const durationAway = Math.round((Date.now() - awaySinceRef.current) / 1000);
        awaySinceRef.current = null;
        setTabWarn(true);
        if (attemptId) {
          await supabase.from("tab_switch_events").insert({
            attempt_id: attemptId,
            duration_away_seconds: durationAway,
          });
        }
      }
    };
    const onVis = () => {
      if (document.visibilityState === "hidden") onLeave();
      else onReturn();
    };

    document.addEventListener("visibilitychange", onVis);
    window.addEventListener("blur", onLeave);
    window.addEventListener("focus", onReturn);
    return () => {
      document.removeEventListener("visibilitychange", onVis);
      window.removeEventListener("blur", onLeave);
      window.removeEventListener("focus", onReturn);
    };
  }, [isTimed, section.submitted, attemptId]);

  const select = (optionId: string) => {
    if (section.submitted) return;
    const next = { ...section, answers: { ...section.answers, [q.id]: optionId } };
    onUpdate(next);
    if (isPractice) setShowExplanation(true);
  };

  const toggleMark = () => {
    onUpdate({ ...section, marked: { ...section.marked, [q.id]: !section.marked[q.id] } });
  };

  const go = (i: number) => {
    if (i < 0 || i >= section.questions.length) return;
    const nextSec = recordTime(section);
    onUpdate({ ...nextSec, currentIdx: i });
  };

  const submit = useCallback(() => {
    const nextSec = recordTime(section);
    onSubmit({ ...nextSec, submitted: true, submittedAt: new Date().toISOString() });
  }, [section, onSubmit, q]);

  const counts = useMemo(() => {
    let a = 0,
      m = 0,
      s = 0;
    for (const qq of section.questions) {
      if (section.answers[qq.id]) a++;
      else s++;
      if (section.marked[qq.id]) m++;
    }
    return { answered: a, marked: m, skipped: s };
  }, [section]);

  if (!q) return null;

  // All questions now use the standard option grid below.
  const useStandardOptions = true;

  return (
    <div className="mx-auto max-w-7xl px-4 py-6 md:px-8">
      {/* Header */}
      <div className="mb-5 flex flex-wrap items-center justify-between gap-3">
        <div className="min-w-0">
          <div className="text-sm font-semibold text-foreground">{headerTitle}</div>
          {headerSubtitle && <div className="text-xs text-muted-foreground">{headerSubtitle}</div>}
          {typeof currentSectionIndex === "number" && totalSections && (
            <div className="mt-1 text-xs text-muted-foreground">
              Section {currentSectionIndex + 1} of {totalSections}
            </div>
          )}
        </div>
        {isTimed && (
          <div
            className={cn(
              "flex items-center gap-2 rounded-full border bg-card px-4 py-2 text-sm font-semibold shadow-card",
              section.secondsLeft <= 60
                ? "border-destructive/40 text-destructive"
                : "text-foreground",
            )}
          >
            <Clock className="h-4 w-4" />
            {formatMMSS(section.secondsLeft)}
          </div>
        )}
      </div>

      <div className="grid gap-6 lg:grid-cols-[1fr_300px]">
        {/* Question card */}
        <Card className="flex flex-col p-6 shadow-card sm:p-8">
          <div className="mb-4 flex flex-wrap items-center justify-between gap-2">
            <div className="flex items-center gap-3 text-xs text-muted-foreground">
              <span>
                Question{" "}
                <span className="font-semibold text-foreground">{section.currentIdx + 1}</span> /{" "}
                {section.questions.length}
              </span>
              <Badge variant="outline" className="capitalize">
                {q.difficulty}
              </Badge>
            </div>
            <SourcePopover source={q.source} />
          </div>

          {/* Question content — visual or text */}
          <div className="flex flex-col justify-center">
            <QuestionErrorBoundary questionId={q.id} onSkip={() => go(section.currentIdx + 1)}>
              <QuestionDisplay question={q} />
            </QuestionErrorBoundary>
          </div>

          {/* Standard option buttons (for plain text / math with no visual_data) */}
          {useStandardOptions && q.options.length > 0 && (
            <div className="mt-6 grid gap-2.5 sm:grid-cols-2">
              {q.options.map((opt) => {
                const selected = section.answers[q.id] === opt.id;
                const isCorrect = q.correct_option_id === opt.id;
                const showFeedback = isPractice && showExplanation;
                return (
                  <button
                    key={opt.id}
                    onClick={() => select(opt.id)}
                    disabled={section.submitted}
                    aria-pressed={selected}
                    className={cn(
                      "flex items-start gap-3 rounded-xl border p-4 text-left text-sm transition-colors",
                      selected
                        ? "border-primary bg-primary/5"
                        : "border-border bg-card hover:border-primary/40 hover:bg-secondary/60",
                      showFeedback && isCorrect && "border-success/50 bg-success/10",
                      showFeedback &&
                        selected &&
                        !isCorrect &&
                        "border-destructive/50 bg-destructive/10",
                    )}
                  >
                    <span
                      className={cn(
                        "grid h-6 w-6 shrink-0 place-items-center rounded-full border text-xs font-semibold",
                        selected
                          ? "border-primary bg-primary text-primary-foreground"
                          : "border-border",
                      )}
                    >
                      {opt.id.toUpperCase()}
                    </span>
                    <span className="flex-1 text-foreground">
                      {(q.visual_data as any)?.options?.find((o: any) => o.id === opt.id) ? (
                        <div className="flex items-center justify-center py-2">
                          <FigureGrid
                            frame={{
                              objects: (q.visual_data as any).options.find(
                                (o: any) => o.id === opt.id,
                              ).objects,
                            }}
                            gridSize={(q.visual_data as any).grid_size}
                          />
                        </div>
                      ) : (
                        <span
                          className={cn(
                            q.module === "math_equation" || q.module === "latin_square"
                              ? "font-mono text-base"
                              : "",
                          )}
                        >
                          {opt.text}
                        </span>
                      )}
                    </span>
                  </button>
                );
              })}
            </div>
          )}

          {/* Explanation (practice mode) */}
          {isPractice && showExplanation && (
            <div className="mt-5 space-y-4">
              <div className="rounded-xl border bg-secondary/50 p-4 text-sm">
                <div className="mb-2 flex items-center gap-2 font-semibold">
                  {answered === q.correct_option_id ? (
                    <>
                      <CheckCircle2 className="h-4 w-4 text-success" /> Correct!
                    </>
                  ) : (
                    <>
                      <XCircle className="h-4 w-4 text-destructive" /> Not quite
                    </>
                  )}
                </div>
                <div className="text-muted-foreground whitespace-pre-wrap">
                  {q.explanation_text}
                </div>
              </div>

              {/* Enhanced Metadata */}
              <div className="rounded-xl border bg-card p-4 text-xs shadow-sm flex flex-col sm:flex-row justify-between gap-4">
                <div className="space-y-1">
                  <div className="font-semibold text-foreground">Question Info</div>
                  <div className="text-muted-foreground grid grid-cols-[100px_1fr] gap-x-2 gap-y-1">
                    {q.subtopic && (
                      <>
                        <span className="font-medium text-foreground">Subtopic:</span>{" "}
                        <span>{q.subtopic}</span>
                      </>
                    )}
                    {q.question_type && (
                      <>
                        <span className="font-medium text-foreground">Type:</span>{" "}
                        <span>{q.question_type}</span>
                      </>
                    )}
                    <span className="font-medium text-foreground">Time Est:</span>{" "}
                    <span>{q.time_estimate_seconds}s</span>
                    {q.tags && q.tags.length > 0 && (
                      <>
                        <span className="font-medium text-foreground">Tags:</span>{" "}
                        <span>{q.tags.join(", ")}</span>
                      </>
                    )}
                  </div>
                </div>
              </div>
            </div>
          )}

          <div className="mt-6 flex flex-wrap items-center justify-between gap-2 border-t pt-5">
            <Button variant="outline" onClick={toggleMark} className="gap-2">
              <Bookmark
                className={cn("h-4 w-4", section.marked[q.id] && "fill-warning text-warning")}
              />
              {section.marked[q.id] ? "Marked" : "Mark for review"}
            </Button>
            <div className="flex gap-2">
              <Button
                variant="outline"
                onClick={() => go(section.currentIdx - 1)}
                disabled={section.currentIdx === 0}
              >
                <ChevronLeft className="mr-1 h-4 w-4" /> Previous
              </Button>
              {section.currentIdx < section.questions.length - 1 ? (
                <Button onClick={() => go(section.currentIdx + 1)}>
                  Next <ChevronRight className="ml-1 h-4 w-4" />
                </Button>
              ) : (
                <Button onClick={() => setConfirmSubmit(true)}>Submit</Button>
              )}
            </div>
          </div>
        </Card>

        {/* Palette — desktop */}
        <div className="hidden lg:flex flex-col gap-4 lg:sticky lg:top-8 h-fit">
          {/* Pacing Info */}
          {isTimed && (
            <Card className="p-4 shadow-card">
              <div className="text-sm font-semibold mb-3">Time Management</div>
              <div className="space-y-3">
                <div className="flex justify-between items-center text-xs">
                  <span className="text-muted-foreground">Pace</span>
                  <span className={cn(
                    "font-mono font-medium",
                    (q && (section.timePerQ[q.id] || 0) > 75) ? "text-destructive" : "text-foreground"
                  )}>
                    {q ? formatMMSS(section.timePerQ[q.id] || 0) : "0:00"} / 1:15
                  </span>
                </div>
                
                <div className="flex justify-between items-center text-xs">
                  <span className="text-muted-foreground">Avg Pace</span>
                  <span className="font-mono font-medium">
                    {formatMMSS(
                      counts.answered > 0 
                        ? Math.floor(Object.values(section.timePerQ).reduce((a, b) => a + b, 0) / counts.answered) 
                        : 0
                    )} / Q
                  </span>
                </div>

                <div className="flex justify-between items-center text-xs">
                  <span className="text-muted-foreground">Progress</span>
                  <span className="font-mono font-medium">{counts.answered}/{section.questions.length}</span>
                </div>
              </div>
            </Card>
          )}

          <QuestionPalette section={section} onJump={go} />
          <div>
            <Button variant="outline" className="w-full" onClick={() => setConfirmSubmit(true)}>
              Submit section
            </Button>
          </div>
        </div>

        {/* Palette — mobile drawer */}
        <div className="lg:hidden">
          <Drawer>
            <DrawerTrigger asChild>
              <Button variant="outline" className="w-full">
                <LayoutGrid className="mr-2 h-4 w-4" /> Question palette
              </Button>
            </DrawerTrigger>
            <DrawerContent>
              <DrawerHeader>
                <DrawerTitle>Question palette</DrawerTitle>
              </DrawerHeader>
              <div className="px-4 pb-6">
                <QuestionPalette section={section} onJump={go} />
              </div>
            </DrawerContent>
          </Drawer>
        </div>
      </div>

      {/* Submit confirm */}
      <Dialog open={confirmSubmit} onOpenChange={setConfirmSubmit}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle>Submit this section?</DialogTitle>
            <DialogDescription>Review your progress before finalizing.</DialogDescription>
          </DialogHeader>
          <div className="grid grid-cols-3 gap-3 text-center">
            <Stat label="Answered" value={counts.answered} />
            <Stat label="Marked" value={counts.marked} />
            <Stat label="Skipped" value={counts.skipped} />
          </div>
          <DialogFooter>
            <Button variant="outline" onClick={() => setConfirmSubmit(false)}>
              Keep working
            </Button>
            <Button
              onClick={() => {
                setConfirmSubmit(false);
                submit();
              }}
            >
              Submit now
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>

      {/* Tab-switch warning */}
      <Dialog open={tabWarn} onOpenChange={setTabWarn}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle className="flex items-center gap-2 text-warning">
              <AlertTriangle className="h-5 w-5" /> Warning
            </DialogTitle>
            <DialogDescription>
              You switched tabs or lost focus. Your timer is still running. Repeated tab switching
              is logged and may affect your mock experience. Stay focused!
            </DialogDescription>
          </DialogHeader>
          <DialogFooter>
            <Button onClick={() => setTabWarn(false)}>Continue</Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}

function Stat({ label, value }: { label: string; value: number }) {
  return (
    <div className="rounded-xl border bg-secondary/40 p-3">
      <div className="text-2xl font-semibold">{value}</div>
      <div className="text-xs text-muted-foreground">{label}</div>
    </div>
  );
}
