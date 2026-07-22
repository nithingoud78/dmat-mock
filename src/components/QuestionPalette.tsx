import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import type { SectionState } from "@/lib/test-types";

export function QuestionPalette({
  section,
  onJump,
}: {
  section: SectionState;
  onJump: (i: number) => void;
}) {
  return (
    <div className="rounded-2xl border bg-card p-4 shadow-card">
      <div className="mb-3 text-sm font-semibold">Question palette</div>
      <div className="grid grid-cols-6 gap-2 sm:grid-cols-8 lg:grid-cols-5">
        {section.questions.map((q, i) => {
          const answered = !!section.answers[q.id];
          const marked = !!section.marked[q.id];
          const current = section.currentIdx === i;
          return (
            <button
              key={q.id}
              onClick={() => onJump(i)}
              className={cn(
                "h-9 rounded-lg border text-xs font-medium transition-colors",
                current
                  ? "border-primary bg-primary text-primary-foreground"
                  : marked
                    ? "border-warning/40 bg-warning/15 text-foreground"
                    : answered
                      ? "border-success/40 bg-success/15 text-foreground"
                      : "border-border bg-background text-muted-foreground hover:bg-secondary",
              )}
              aria-label={`Go to question ${i + 1}`}
            >
              {i + 1}
            </button>
          );
        })}
      </div>
      <div className="mt-4 space-y-2 text-xs text-muted-foreground">
        <Legend color="bg-success" label="Answered" />
        <Legend color="bg-warning" label="Marked for Review" />
        <Legend color="bg-background border border-border" label="Skipped" />
        <Legend color="bg-primary" label="Current" />
      </div>
    </div>
  );
}

function Legend({ color, label }: { color: string; label: string }) {
  return (
    <div className="flex items-center gap-2">
      <span className={cn("h-3 w-3 rounded-full", color)} />
      <span>{label}</span>
    </div>
  );
}

export function PaletteButton({ label, onClick }: { label: string; onClick: () => void }) {
  return (
    <Button variant="outline" size="sm" onClick={onClick}>
      {label}
    </Button>
  );
}
