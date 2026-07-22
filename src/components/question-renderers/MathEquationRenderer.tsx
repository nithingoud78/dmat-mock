import { memo, type FC } from "react";
import { cn } from "@/lib/utils";

// ── Types ──────────────────────────────────────────────────────────────────
export interface MathEquationData {
  type: "math_equation";
  variables?: string[];
  equations: string[];
  ask: string; // e.g. "B" or "What is B?"
  constraints?: string; // e.g. "Each letter is an integer between 1 and 20"
}

// ── Full Math Equation Renderer ────────────────────────────────────────────
interface MathEquationRendererProps {
  data: MathEquationData;
}

export const MathEquationRenderer: FC<MathEquationRendererProps> = memo(({ data }) => {
  return (
    <div className="space-y-5">
      {/* Constraints note */}
      {data.constraints && <p className="text-xs text-muted-foreground">{data.constraints}</p>}

      {/* Equation block */}
      <div
        className="inline-block rounded-xl border border-border bg-secondary/30 px-5 py-4"
        role="math"
        aria-label={`System of equations: ${data.equations.join("; ")}`}
      >
        <div
          className="space-y-1.5"
          style={{ fontFamily: "'IBM Plex Mono', 'Courier New', monospace" }}
        >
          {data.equations.map((eq, i) => (
            <div key={i} className="text-base font-semibold leading-snug text-foreground">
              {eq}
            </div>
          ))}
        </div>
      </div>

      {/* Question */}
      <div className="text-base font-semibold text-foreground">
        {data.ask.includes("?") ? data.ask : `What is ${data.ask}?`}
      </div>
    </div>
  );
});

MathEquationRenderer.displayName = "MathEquationRenderer";
