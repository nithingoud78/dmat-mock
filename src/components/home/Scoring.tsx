import { Card } from "@/components/ui/card";
import { AlertTriangle } from "lucide-react";

export function Scoring() {
  return (
    <section>
      <Card className="p-7 shadow-card border-l-4 border-l-primary">
        <h2 className="text-lg font-semibold">Scoring System</h2>
        <p className="mt-2 text-sm text-muted-foreground mb-4">
          The dMAT translates your raw accuracy into standardized statistical metrics to allow German universities to compare you fairly against other applicants.
        </p>
        <div className="grid sm:grid-cols-2 gap-6">
          <div>
            <h4 className="font-semibold text-sm mb-1">Scaled Score (0–200)</h4>
            <p className="text-sm text-muted-foreground">Your raw number of correct answers is converted to a scaled score running from 0 to 200, where the average test-taker is mathematically calibrated to 100.</p>
          </div>
          <div>
            <h4 className="font-semibold text-sm mb-1">Percentile Rank</h4>
            <p className="text-sm text-muted-foreground">Indicates the percentage of participants you outperformed. A percentile rank of 70 means you scored equal to or better than 70% of all candidates.</p>
          </div>
        </div>
        <div className="mt-4 p-3 bg-secondary/30 rounded-lg flex gap-3 items-start">
          <AlertTriangle className="h-5 w-5 text-amber-500 shrink-0" />
          <p className="text-xs text-muted-foreground">
            <strong>Important Disclaimer:</strong> There is no official "passing mark" for the dMAT. German universities set their own cutoffs. 
            The scoring provided on this platform is an <strong>Estimated Practice Score</strong>. The official normalization algorithm is proprietary and performed centrally by the TestDaF Institute in Germany.
          </p>
        </div>
      </Card>
    </section>
  );
}
