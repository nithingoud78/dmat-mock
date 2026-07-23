import { memo, type FC } from "react";
import { cn } from "@/lib/utils";

// ── Types ──────────────────────────────────────────────────────────────────
export interface LatinSquareData {
  type: "latin_square";
  size: number;
  symbols: string[];
  grid: string[][]; // "" = empty cell, "?" = target cell
  target_cell: { row: number; col: number };
}

// ── Grid Component ─────────────────────────────────────────────────────────
interface LatinSquareGridProps {
  data: LatinSquareData;
  revealAnswer?: string;
  className?: string;
}

export function LatinSquareGrid({ data, revealAnswer, className }: LatinSquareGridProps) {
  const size = data.size ?? data.grid?.length ?? 4;

  return (
    <div className={cn("overflow-x-auto", className)}>
      <div
        className="inline-grid gap-0 rounded-lg overflow-hidden border border-border shadow-sm"
        style={{ gridTemplateColumns: `repeat(${size}, 52px)` }}
        role="grid"
        aria-label="Latin Square puzzle grid"
      >
        {(data.grid ?? []).map((row, rIdx) =>
          row.map((cell, cIdx) => {
            const isTarget =
              rIdx === data.target_cell?.row && cIdx === data.target_cell?.col;
            const displayCell =
              cell === "?" && revealAnswer ? revealAnswer : cell;
            const isEmpty = !displayCell && !isTarget;

            return (
              <div
                key={`${rIdx}-${cIdx}`}
                role="gridcell"
                aria-label={
                  isTarget
                    ? `Target cell: ${displayCell || "?"}`
                    : cell
                    ? `${cell}`
                    : "empty"
                }
                className={cn(
                  "flex items-center justify-center",
                  "h-[52px] w-[52px]",
                  "text-lg font-bold select-none font-mono",
                  "border-r border-b border-border",
                  rIdx === 0 && "border-t",
                  cIdx === 0 && "border-l",
                  isTarget
                    ? "bg-primary/10 text-primary ring-2 ring-inset ring-primary/40"
                    : "bg-card text-foreground",
                  isEmpty && "opacity-0",
                )}
              >
                {isTarget ? (displayCell || "?") : (displayCell || "")}
              </div>
            );
          }),
        )}
      </div>
    </div>
  );
}

// ── Full Latin Square Renderer ─────────────────────────────────────────────
interface LatinSquareRendererProps {
  data: LatinSquareData;
}

export const LatinSquareRenderer: FC<LatinSquareRendererProps> = memo(({ data }) => {
  if (!data?.grid || !Array.isArray(data.grid)) {
    return (
      <div className="rounded-lg border border-destructive/30 bg-destructive/5 p-4 text-sm text-destructive">
        Latin Square data could not be rendered.
      </div>
    );
  }

  return (
    <div className="space-y-4">
      <p className="text-xs font-medium uppercase tracking-wide text-muted-foreground">
        Each symbol ({(data.symbols ?? []).join(", ")}) appears exactly once per row and column.
        Find the missing symbol for the highlighted cell ({"\u00a0?\u00a0"}).
      </p>
      <LatinSquareGrid data={data} />
    </div>
  );
});

LatinSquareRenderer.displayName = "LatinSquareRenderer";


