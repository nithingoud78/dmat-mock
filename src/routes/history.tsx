import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { PublicLayout } from "@/components/PublicLayout";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { clearAllSeenQuestionsAsync, getSeenQuestionIdsAsync } from "@/lib/history";
import { MODULES } from "@/lib/modules";
import { useAuth } from "@/lib/auth";
import { formatMMSS } from "@/lib/time";
import { toast } from "sonner";
import { Trash2, PlayCircle, Eye, History as HistoryIcon, LogIn, AlertCircle } from "lucide-react";
import { getOrCreateSessionToken } from "@/lib/session";

export const Route = createFileRoute("/history")({
  head: () => ({
    meta: [{ title: "My Progress — dMAT Practice Pro" }],
  }),
  component: HistoryPage,
});

function HistoryPage() {
  const { user } = useAuth();
  const sessionToken = getOrCreateSessionToken();
  const navigate = useNavigate();

  const { data: counts } = useQuery({
    queryKey: ["module-counts"],
    queryFn: async () => {
      const { data } = await supabase.from("questions").select("module");
      const dist: Record<string, number> = {};
      data?.forEach((d) => {
        dist[d.module] = (dist[d.module] || 0) + 1;
      });
      return dist;
    },
  });

  const { data: seenData, refetch: refetchSeen } = useQuery({
    queryKey: ["seen-questions", user?.id],
    queryFn: async () => {
      const ids = Array.from(await getSeenQuestionIdsAsync());
      if (ids.length === 0) return { total: 0, byModule: {} };

      const { data } = await supabase.from("questions").select("module").in("id", ids);
      const byModule: Record<string, number> = {};
      data?.forEach((d) => {
        byModule[d.module] = (byModule[d.module] || 0) + 1;
      });
      return { total: ids.length, byModule };
    },
  });

  const { data: attempts } = useQuery({
    queryKey: ["test-attempts", user?.id, sessionToken],
    queryFn: async () => {
      if (user) {
        const { data } = await supabase
          .from("test_attempts")
          .select("*")
          .eq("user_id", user.id)
          .order("started_at", { ascending: false });
        return data || [];
      } else {
        const { data } = await supabase
          .from("anon_attempts")
          .select("*")
          .eq("session_token", sessionToken)
          .order("started_at", { ascending: false });
        return data || [];
      }
    },
  });

  const handleReset = async () => {
    if (
      confirm(
        "Are you sure you want to reset your practice history? You will see previously completed questions again in practice tests.",
      )
    ) {
      await clearAllSeenQuestionsAsync();
      await refetchSeen();
      toast.success("History has been reset.");
    }
  };

  const resumeTest = (attempt: any) => {
    // If it's a complete mock
    if (attempt.mode === "complete_mock") {
      // Not fully supported to resume complete mock yet, but we can try routing to it if we had a resume route
      toast.info("Resuming complete mocks will be available soon.");
      return;
    }
    // For module specific timed sections
    navigate({ to: `/practice/${MODULES[attempt.module as keyof typeof MODULES]?.slug}` });
  };

  return (
    <PublicLayout>
      <div className="mx-auto max-w-5xl p-6 md:p-8">
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
          <div>
            <h1 className="text-3xl font-semibold tracking-tight">My Progress</h1>
            <p className="mt-2 text-muted-foreground">
              Track your practice history and module coverage.
            </p>
          </div>
          <Button variant="outline" onClick={handleReset} className="text-destructive">
            <Trash2 className="h-4 w-4 mr-2" /> Reset Question History
          </Button>
        </div>

        {!user && (
          <Card className="mt-6 p-4 bg-primary/10 border-primary/20 flex gap-3 items-start">
            <AlertCircle className="h-5 w-5 text-primary shrink-0 mt-0.5" />
            <div className="text-sm">
              <p className="font-medium text-foreground">You are practicing as a guest.</p>
              <p className="text-muted-foreground mt-1">
                Your history is saved in this browser. To save your progress across devices and
                protect against data loss, please sign in.
              </p>
              <Button asChild variant="link" className="p-0 h-auto mt-2">
                <Link to="/auth">Sign in to sync history &rarr;</Link>
              </Button>
            </div>
          </Card>
        )}

        <h2 className="mt-10 text-xl font-semibold mb-4">Module Coverage</h2>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {Object.values(MODULES).map((mod) => {
            const total = counts?.[mod.id] || 0;
            const seen = seenData?.byModule?.[mod.id] || 0;
            const pct = total > 0 ? (seen / total) * 100 : 0;
            return (
              <Card key={mod.id} className="p-6 shadow-card">
                <div className="flex items-center gap-2 font-semibold">
                  <span>{mod.icon}</span> {mod.label}
                </div>
                <div className="mt-4 flex justify-between text-sm text-muted-foreground mb-2">
                  <span>{seen} Attempted</span>
                  <span>{Math.max(0, total - seen)} Unseen</span>
                </div>
                <Progress value={pct} className="h-2" />
                <p className="mt-2 text-xs text-right text-muted-foreground">
                  {pct.toFixed(1)}% Coverage
                </p>
              </Card>
            );
          })}
        </div>

        <h2 className="mt-12 text-xl font-semibold mb-4">Attempt History</h2>
        {attempts && attempts.length > 0 ? (
          <div className="flex flex-col gap-3">
            {attempts.map((attempt) => (
              <Card key={attempt.id} className="p-4 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div>
                  <div className="font-medium flex items-center gap-2">
                    {attempt.mode === "complete_mock" ? (
                      <>
                        <HistoryIcon className="h-4 w-4 text-primary" /> Complete Mock
                      </>
                    ) : (
                      <>
                        <span>{MODULES[attempt.module as keyof typeof MODULES]?.icon}</span>
                        {MODULES[attempt.module as keyof typeof MODULES]?.label} Drill
                      </>
                    )}
                    {attempt.status === "in_progress" && (
                      <span className="text-[10px] uppercase tracking-wider bg-amber-100 text-amber-800 dark:bg-amber-900/30 dark:text-amber-400 px-2 py-0.5 rounded-full font-semibold">
                        In Progress
                      </span>
                    )}
                  </div>
                  <div className="text-sm text-muted-foreground mt-1">
                    {new Date(attempt.started_at).toLocaleDateString()} • {attempt.total_questions}{" "}
                    Questions
                  </div>
                </div>
                <div>
                  {attempt.status === "in_progress" ? (
                    <Button variant="secondary" size="sm" onClick={() => resumeTest(attempt)}>
                      <PlayCircle className="h-4 w-4 mr-2" /> Resume
                    </Button>
                  ) : (
                    <Button asChild variant="outline" size="sm">
                      <Link to={`/mock/result/${attempt.id}`}>
                        <Eye className="h-4 w-4 mr-2" /> View Results
                      </Link>
                    </Button>
                  )}
                </div>
              </Card>
            ))}
          </div>
        ) : (
          <Card className="p-12 text-center text-muted-foreground shadow-sm">
            <HistoryIcon className="h-10 w-10 mx-auto mb-4 opacity-20" />
            <p>You haven't attempted any timed drills or mocks yet.</p>
            <Button asChild variant="outline" className="mt-4">
              <Link to="/">Start Practice</Link>
            </Button>
          </Card>
        )}
      </div>
    </PublicLayout>
  );
}
