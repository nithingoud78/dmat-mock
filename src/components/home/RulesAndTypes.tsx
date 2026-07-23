import { Card } from "@/components/ui/card";
import { CheckCircle2 } from "lucide-react";

export function RulesAndTypes() {
  return (
    <section className="grid gap-5 md:grid-cols-2">
      <Card className="p-7 shadow-card">
        <h2 className="text-lg font-semibold mb-4">Official Exam Rules</h2>
        <ul className="space-y-3">
          <li className="flex items-start gap-2">
            <CheckCircle2 className="h-4 w-4 text-green-500 mt-0.5 shrink-0" />
            <span className="text-sm text-muted-foreground"><strong>English Only:</strong> The test language is strictly English.</span>
          </li>
          <li className="flex items-start gap-2">
            <CheckCircle2 className="h-4 w-4 text-green-500 mt-0.5 shrink-0" />
            <span className="text-sm text-muted-foreground"><strong>Computer Based:</strong> Administered digitally at appointed centers.</span>
          </li>
          <li className="flex items-start gap-2">
            <CheckCircle2 className="h-4 w-4 text-green-500 mt-0.5 shrink-0" />
            <span className="text-sm text-muted-foreground"><strong>No Calculator:</strong> Mathematical equations must be solved mentally.</span>
          </li>
          <li className="flex items-start gap-2">
            <CheckCircle2 className="h-4 w-4 text-green-500 mt-0.5 shrink-0" />
            <span className="text-sm text-muted-foreground"><strong>No Rough Sheets:</strong> Note-taking is absolutely prohibited.</span>
          </li>
          <li className="flex items-start gap-2">
            <CheckCircle2 className="h-4 w-4 text-green-500 mt-0.5 shrink-0" />
            <span className="text-sm text-muted-foreground"><strong>No Negative Marking:</strong> Guessing is explicitly encouraged if you are stuck.</span>
          </li>
        </ul>
      </Card>

      <Card className="p-7 shadow-card">
        <h2 className="text-lg font-semibold mb-4">Question Types</h2>
        <div className="space-y-4">
          <div>
            <h4 className="text-sm font-semibold">Figure Sequences</h4>
            <p className="text-xs text-muted-foreground">Visual reasoning identifying patterns in moving, rotating, and color-shifting shapes within matrices.</p>
          </div>
          <div>
            <h4 className="text-sm font-semibold">Mathematical Equations</h4>
            <p className="text-xs text-muted-foreground">Solving interdependent systems of equations to find integer values (between 1-20) for letters.</p>
          </div>
          <div>
            <h4 className="text-sm font-semibold">Latin Squares</h4>
            <p className="text-xs text-muted-foreground">Logical deduction to fill a 5x5 grid where each symbol can only appear once per row and column.</p>
          </div>
          <div>
            <h4 className="text-sm font-semibold">General Academic Module</h4>
            <p className="text-xs text-muted-foreground">Academic reading comprehension interpreting figures, charts, tables, and texts spanning Science, Engineering, and Business.</p>
          </div>
        </div>
      </Card>
    </section>
  );
}
