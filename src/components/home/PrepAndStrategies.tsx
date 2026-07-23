import { Card } from "@/components/ui/card";

export function PrepAndStrategies() {
  return (
    <section className="grid gap-5 lg:grid-cols-3">
      <Card className="p-7 shadow-card">
        <h2 className="text-lg font-semibold mb-4">Preparation Tips</h2>
        <ul className="space-y-3 text-sm text-muted-foreground">
          <li><strong className="text-foreground">Figure Sequences:</strong> Memorize the rules for bouncing boundaries, x+1 progression, and color cycling.</li>
          <li><strong className="text-foreground">Math Equations:</strong> Master substitution and elimination methods. Rely heavily on integer properties.</li>
          <li><strong className="text-foreground">Latin Squares:</strong> Practice mental elimination. Scan rows and columns simultaneously.</li>
          <li><strong className="text-foreground">General Academic:</strong> Practice reading complex technical texts quickly and scanning figures for anomalies.</li>
        </ul>
      </Card>
      
      <Card className="p-7 shadow-card">
        <h2 className="text-lg font-semibold mb-4">High Scoring Strategies</h2>
        <ul className="space-y-3 text-sm text-muted-foreground">
          <li><strong className="text-foreground">Pacing:</strong> Aim for exactly 75 seconds per task in the Core Module.</li>
          <li><strong className="text-foreground">Skip & Guess:</strong> If a Latin Square or Math Equation takes more than 90 seconds, make an educated guess and move on.</li>
          <li><strong className="text-foreground">Mental Math:</strong> Since rough sheets are forbidden, visualize algebraic substitutions clearly in your head.</li>
        </ul>
      </Card>

      <Card className="p-7 shadow-card">
        <h2 className="text-lg font-semibold mb-4">Common Mistakes</h2>
        <ul className="space-y-3 text-sm text-muted-foreground">
          <li>Failing to notice an x+1 progressive movement pattern in Figure Sequences.</li>
          <li>Wasting 4+ minutes on a single Math Equation, ruining the time budget for the rest of the section.</li>
          <li>Misreading the orientation of a rotating figure.</li>
          <li>Leaving answers blank instead of guessing (no negative marking).</li>
        </ul>
      </Card>
    </section>
  );
}
