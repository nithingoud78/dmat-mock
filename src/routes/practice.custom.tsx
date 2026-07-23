import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useState } from "react";
import { PublicLayout } from "@/components/PublicLayout";
import { Card, CardHeader, CardTitle, CardContent, CardFooter } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";
import { Checkbox } from "@/components/ui/checkbox";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Input } from "@/components/ui/input";
import { MODULES, MODULE_ORDER, type ModuleId } from "@/lib/modules";
import { buildCustomTest } from "@/lib/questions";
import type { SectionState } from "@/lib/test-types";
import { TestRunner } from "@/components/TestRunner";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/lib/auth";
import { getOrCreateSessionToken } from "@/lib/session";
import { markQuestionsAsSeen } from "@/lib/history";
import { ExamLayout } from "@/components/ExamLayout";
import { toast } from "sonner";
import { Play } from "lucide-react";

export const Route = createFileRoute("/practice/custom")({
  head: () => ({
    meta: [{ title: "Custom Practice Test — dMAT Practice Pro" }],
  }),
  component: CustomPracticePage,
});

type Difficulty = "easy" | "medium" | "hard" | "all";

function CustomPracticePage() {
  const [modules, setModules] = useState<Set<ModuleId>>(new Set(MODULE_ORDER));
  const [difficulty, setDifficulty] = useState<Difficulty>("all");
  const [count, setCount] = useState<number>(20);
  const [timeLimit, setTimeLimit] = useState<number>(30); // minutes

  const [mode, setMode] = useState<"builder" | "loading" | "running">("builder");
  const [section, setSection] = useState<SectionState | null>(null);
  const [attemptId, setAttemptId] = useState<string | undefined>();
  const [finished, setFinished] = useState<{ score: number; total: number } | null>(null);

  const { user } = useAuth();
  const sessionToken = getOrCreateSessionToken();

  const toggleModule = (m: ModuleId, checked: boolean) => {
    setModules((prev) => {
      const next = new Set(prev);
      if (checked) next.add(m);
      else next.delete(m);
      return next;
    });
  };

  const startCustomTest = async () => {
    if (modules.size === 0) {
      return toast.error("Please select at least one module");
    }
    if (count < 1 || count > 100) {
      return toast.error("Please enter a valid question count (1-100)");
    }

    setMode("loading");

    try {
      const qs = await buildCustomTest({
        modules: Array.from(modules),
        difficulty,
        count,
      });

      if (qs.length === 0) {
        toast.error("No questions found matching your criteria.");
        setMode("builder");
        return;
      }

      if (qs.length < count) {
        toast.info(`Only found ${qs.length} questions matching your criteria.`);
      }

      markQuestionsAsSeen(qs.map(q => q.id));

      const seconds = timeLimit * 60;
      const initial: SectionState = {
        moduleId: "custom",
        moduleLabel: "Custom Practice Test",
        questions: qs,
        answers: {},
        marked: {},
        timePerQ: {},
        currentIdx: 0,
        secondsLeft: seconds,
        totalSeconds: seconds,
        submitted: false,
      };

      setSection(initial);
      setMode("running");

      // Save attempt
      const attemptData = {
        mode: "practice" as const,
        module: null,
        total_questions: qs.length,
        question_ids: qs.map((q) => q.id),
      };

      if (user) {
        const { data } = await supabase
          .from("test_attempts")
          .insert({ ...attemptData, user_id: user.id })
          .select("id")
          .single();
        if (data) setAttemptId(data.id);
      } else {
        const { data } = await supabase
          .from("anon_attempts")
          .insert({ ...attemptData, session_token: sessionToken })
          .select("id")
          .single();
        if (data) setAttemptId(String(data.id));
      }
    } catch (err: any) {
      toast.error(err.message);
      setMode("builder");
    }
  };

  const finish = async (finalSection: SectionState) => {
    let correct = 0;
    for (const q of finalSection.questions) {
      if (finalSection.answers[q.id] === q.correct_option_id) correct++;
    }

    setSection(finalSection);
    setFinished({ score: correct, total: finalSection.questions.length });

    if (attemptId) {
      const payload = {
        submitted_at: new Date().toISOString(),
        status: "submitted" as const,
        score: Math.round((correct / finalSection.questions.length) * 200),
        correct_count: correct,
      };

      if (user) {
        await supabase.from("test_attempts").update(payload).eq("id", attemptId);
        const rows = finalSection.questions.map((q) => ({
          attempt_id: attemptId,
          question_id: q.id,
          selected_option_id: finalSection.answers[q.id] ?? null,
          time_spent_seconds: finalSection.timePerQ[q.id] ?? 0,
        }));
        await supabase.from("attempt_answers").insert(rows);
      } else {
        await supabase
          .from("anon_attempts")
          .update({
            ...payload,
            answers: finalSection.answers,
          })
          .eq("id", attemptId);
      }
    }
  };

  if (mode === "running" && section) {
    return (
      <ExamLayout>
        <TestRunner
          mode="practice"
          section={section}
          attemptId={attemptId}
          headerTitle="Custom Practice Test"
          onUpdate={setSection}
          onSubmit={finish}
        />
      </ExamLayout>
    );
  }

  if (finished) {
    return (
      <PublicLayout>
        <div className="mx-auto max-w-xl px-4 py-12 text-center">
          <h1 className="text-3xl font-bold mb-4">Test Complete!</h1>
          <p className="text-xl mb-8">
            You scored {finished.score} out of {finished.total}.
          </p>
          <div className="flex justify-center gap-4">
            <Button asChild variant="outline">
              <a href="/">Back to Home</a>
            </Button>
            <Button onClick={() => window.location.reload()}>Build Another Test</Button>
            {attemptId && (
              <Button asChild>
                <a href={`/mock/result/${attemptId}`}>View Full Results</a>
              </Button>
            )}
          </div>
        </div>
      </PublicLayout>
    );
  }

  return (
    <PublicLayout>
      <div className="mx-auto max-w-2xl px-4 py-8 md:py-12">
        <Card className="shadow-lg border-2 border-primary/10">
          <CardHeader className="text-center pb-8 border-b bg-muted/30">
            <CardTitle className="text-3xl font-bold text-foreground tracking-tight">
              Smart Practice Builder
            </CardTitle>
            <p className="text-muted-foreground mt-2">
              Generate a personalized custom mock exam based on your criteria.
            </p>
          </CardHeader>
          <CardContent className="pt-8 space-y-8">
            <div className="space-y-4">
              <Label className="text-base font-semibold">Select Modules</Label>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {MODULE_ORDER.map((m) => (
                  <div
                    key={m}
                    className="flex items-center space-x-3 p-3 rounded-lg border bg-card hover:bg-accent/50 transition-colors"
                  >
                    <Checkbox
                      id={`mod-${m}`}
                      checked={modules.has(m)}
                      onCheckedChange={(c) => toggleModule(m, !!c)}
                    />
                    <Label htmlFor={`mod-${m}`} className="cursor-pointer flex-1 font-medium">
                      {MODULES[m].label}
                    </Label>
                  </div>
                ))}
              </div>
            </div>

            <div className="grid sm:grid-cols-2 gap-8">
              <div className="space-y-3">
                <Label className="text-base font-semibold">Difficulty Level</Label>
                <Select value={difficulty} onValueChange={(v: Difficulty) => setDifficulty(v)}>
                  <SelectTrigger className="w-full">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">Mix of all levels</SelectItem>
                    <SelectItem value="easy">Easy only</SelectItem>
                    <SelectItem value="medium">Medium only</SelectItem>
                    <SelectItem value="hard">Hard only</SelectItem>
                  </SelectContent>
                </Select>
              </div>

              <div className="space-y-3">
                <Label className="text-base font-semibold">Number of Questions</Label>
                <Input
                  type="number"
                  min={1}
                  max={100}
                  value={count}
                  onChange={(e) => setCount(parseInt(e.target.value) || 1)}
                  className="w-full"
                />
              </div>
            </div>

            <div className="space-y-3">
              <Label className="text-base font-semibold">Time Limit (Minutes)</Label>
              <Input
                type="number"
                min={1}
                max={180}
                value={timeLimit}
                onChange={(e) => setTimeLimit(parseInt(e.target.value) || 1)}
                className="w-full sm:w-1/2"
              />
            </div>
          </CardContent>
          <CardFooter className="bg-muted/30 pt-6 border-t flex justify-end">
            <Button
              size="lg"
              onClick={startCustomTest}
              disabled={mode === "loading"}
              className="w-full sm:w-auto font-bold px-8"
            >
              {mode === "loading" ? (
                "Generating..."
              ) : (
                <>
                  <Play className="mr-2 h-5 w-5" />
                  Start Custom Test
                </>
              )}
            </Button>
          </CardFooter>
        </Card>
      </div>
    </PublicLayout>
  );
}
