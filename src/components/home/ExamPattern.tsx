import { Card } from "@/components/ui/card";
import { Sparkles } from "lucide-react";

export function ExamPattern() {
  return (
    <section>
      <Card className="overflow-hidden shadow-card flex flex-col h-full">
        <div className="border-b p-6 bg-secondary/20">
          <h2 className="text-lg font-semibold flex items-center gap-2">
            <span className="h-2 w-2 rounded-full bg-primary" /> Official Exam Pattern
          </h2>
          <p className="mt-1 text-xs text-muted-foreground">
            The exact format of the real g.a.s.t. test.
          </p>
        </div>
        <div className="overflow-x-auto grow">
          <table className="w-full text-sm">
            <thead className="bg-secondary/40 text-left text-xs uppercase tracking-wide text-muted-foreground">
              <tr>
                <th className="px-6 py-3 font-medium">Module / Subtest</th>
                <th className="px-6 py-3 font-medium">Questions</th>
                <th className="px-6 py-3 font-medium">Time</th>
              </tr>
            </thead>
            <tbody>
              <tr className="border-t bg-muted/20">
                <td colSpan={3} className="px-6 py-2 text-xs font-bold text-foreground">Core Module</td>
              </tr>
              <tr className="border-t">
                <td className="px-6 py-3 font-medium text-foreground pl-10">Figure Sequences</td>
                <td className="px-6 py-3 text-muted-foreground">20</td>
                <td className="px-6 py-3 text-muted-foreground">25 min</td>
              </tr>
              <tr className="border-t">
                <td className="px-6 py-3 font-medium text-foreground pl-10">Mathematical Equations</td>
                <td className="px-6 py-3 text-muted-foreground">20</td>
                <td className="px-6 py-3 text-muted-foreground">25 min</td>
              </tr>
              <tr className="border-t">
                <td className="px-6 py-3 font-medium text-foreground pl-10">Latin Squares</td>
                <td className="px-6 py-3 text-muted-foreground">20</td>
                <td className="px-6 py-3 text-muted-foreground">25 min</td>
              </tr>
              <tr className="border-t bg-muted/20">
                <td colSpan={3} className="px-6 py-2 text-xs font-bold text-foreground">Subject Module</td>
              </tr>
              <tr className="border-t">
                <td className="px-6 py-3 font-medium text-foreground pl-10">General Academic Module</td>
                <td className="px-6 py-3 text-muted-foreground">Not specified in official materials</td>
                <td className="px-6 py-3 text-muted-foreground">90 min</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div className="border-t bg-secondary/40 px-6 py-4 space-y-2">
          <p className="text-xs text-muted-foreground">
            The exam is computer-based, strictly timed, and delivered in English.
          </p>
          <p className="text-xs font-semibold text-primary">
            Important Note
          </p>
          <p className="text-xs text-muted-foreground">
            The Core Module officially contains 60 questions (20 Figure Sequences, 20 Mathematical Equations, and 20 Latin Squares). The official public documentation does not specify the exact number of questions in the General Academic Module. Only the 90-minute duration and question format have been officially published.
          </p>
        </div>
      </Card>

    </section>
  );
}
