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
  revealAnswer?: string; // fill the ? cell with this on reveal
  className?: string;
}

export function LatinSquareGrid({ data, revealAnswer, className }: LatinSquareGridProps) {
  return (
    <div className={cn("overflow-x-auto", className)}>
      <table
        className="border-collapse"
        role="grid"
        aria-label="Latin Square puzzle grid"
        style={{ fontFamily: "'IBM Plex Mono', 'Courier New', monospace" }}
      >
        <tbody>
          {data.grid.map((row, rIdx) => (
            <tr key={rIdx}>
              {row.map((cell, cIdx) => {
                const isTarget = rIdx === data.target_cell.row && cIdx === data.target_cell.col;
                const displayCell = cell === "?" && revealAnswer ? revealAnswer : cell;

                return (
                  <td
                    key={cIdx}
                    className={cn(
                      "w-11 h-11 text-center text-base font-semibold select-none",
                      "border-border",
                      isTarget
                        ? "border-primary bg-primary/10 text-primary"
                        : "border-border bg-card text-foreground",
                      !cell && !isTarget && "text-transparent",
                    )}
                    role="gridcell"
                    aria-label={
                      isTarget
                        ? `Target cell: ${displayCell || "empty"}`
                        : cell
                          ? `${cell}`
                          : "empty"
                    }
                  >
                    {displayCell || ""}
                  </td>
                );
              })}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

// ── Full Latin Square Renderer ─────────────────────────────────────────────
interface LatinSquareRendererProps {
  data: LatinSquareData;
}

export const LatinSquareRenderer: FC<LatinSquareRendererProps> = memo(({ data }) => {
  return (
    <div className="space-y-5">
      {/* Grid */}
      <div>
        <p className="mb-3 text-xs font-medium uppercase tracking-wide text-muted-foreground">
          Each symbol ({data.symbols.join(", ")}) appears exactly once per row and column
        </p>
        <LatinSquareGrid data={data} />
      </div>
    </div>
  );
});

LatinSquareRenderer.displayName = "LatinSquareRenderer";
