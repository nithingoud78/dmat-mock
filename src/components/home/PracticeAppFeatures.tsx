import { Card } from "@/components/ui/card";
import { Sparkles, BookOpen, Activity, CheckCircle2, BarChart } from "lucide-react";

export function PracticeAppFeatures() {
  return (
    <section>
      <Card className="overflow-hidden shadow-card border-primary/20">
        <div className="border-b p-6 bg-primary/5">
          <h2 className="text-lg font-semibold text-primary flex items-center gap-2">
            <Sparkles className="h-5 w-5" /> Comprehensive Preparation Platform
          </h2>
          <p className="mt-1 text-sm text-muted-foreground">
            dMAT Practice Pro is engineered to simulate the official g.a.s.t. exam environment while providing advanced analytics to guarantee improvement.
          </p>
        </div>
        <div className="grid md:grid-cols-2 lg:grid-cols-3 divide-y md:divide-y-0 md:divide-x border-b">
          <div className="p-6 space-y-3">
            <div className="h-10 w-10 rounded-full bg-primary/10 flex items-center justify-center text-primary">
              <CheckCircle2 className="h-5 w-5" />
            </div>
            <h3 className="font-semibold">Full-Length Mock Tests</h3>
            <p className="text-sm text-muted-foreground">
              Experience the exact 72-question structure of the Core Module under strict 75-second average time constraints. Our mocks dynamically balance difficulty across all modules.
            </p>
          </div>
          <div className="p-6 space-y-3">
            <div className="h-10 w-10 rounded-full bg-primary/10 flex items-center justify-center text-primary">
              <BookOpen className="h-5 w-5" />
            </div>
            <h3 className="font-semibold">Targeted Practice & Adaptive Difficulty</h3>
            <p className="text-sm text-muted-foreground">
              Drill specific modules continuously. Start with easy patterns and dynamically scale to high-difficulty x+1 multi-rule matrices as your accuracy improves.
            </p>
          </div>
          <div className="p-6 space-y-3">
            <div className="h-10 w-10 rounded-full bg-primary/10 flex items-center justify-center text-primary">
              <Activity className="h-5 w-5" />
            </div>
            <h3 className="font-semibold">Detailed Explanations & Review</h3>
            <p className="text-sm text-muted-foreground">
              Every question includes a comprehensive breakdown of the logical rules, correct substitution logic, and time-saving strategies. Review your mistakes instantly.
            </p>
          </div>
        </div>
        <div className="grid md:grid-cols-2 lg:grid-cols-3 divide-y md:divide-y-0 md:divide-x">
          <div className="p-6 space-y-3">
            <div className="h-10 w-10 rounded-full bg-primary/10 flex items-center justify-center text-primary">
              <BarChart className="h-5 w-5" />
            </div>
            <h3 className="font-semibold">Analytics & Question Statistics</h3>
            <p className="text-sm text-muted-foreground">
              Track your raw score, module accuracy, and estimated percentile ranking. Identify which subtopics consume too much of your time.
            </p>
          </div>
          <div className="p-6 space-y-3">
            <div className="h-10 w-10 rounded-full bg-primary/10 flex items-center justify-center text-primary">
              <Sparkles className="h-5 w-5" />
            </div>
            <h3 className="font-semibold">Instant Access</h3>
            <p className="text-sm text-muted-foreground">
              No account required. Jump straight into practice sessions instantly with anonymous testing.
            </p>
          </div>
          <div className="p-6 space-y-3">
            <div className="h-10 w-10 rounded-full bg-primary/10 flex items-center justify-center text-primary">
              <CheckCircle2 className="h-5 w-5" />
            </div>
            <h3 className="font-semibold">Custom Tests</h3>
            <p className="text-sm text-muted-foreground">
              Generate custom practice sessions targeting exactly the filters, difficulty, and modules you need.
            </p>
          </div>
        </div>
      </Card>
    </section>
  );
}
