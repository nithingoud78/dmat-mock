import { memo, type FC } from "react";
import { cn } from "@/lib/utils";

// ── Types ───────────────────────────────────────────────────────────────────
export interface GeneralAcademicData {
  type: "general_academic";
  subtype?:
    | "reading_comprehension"
    | "logical_reasoning"
    | "data_interpretation"
    | "applied_problem_solving";
  /** Optional passage shown above the question (used by reading comprehension) */
  passage?: string;
  /** Optional table data for data interpretation */
  table?: {
    headers: string[];
    rows: string[][];
  };
}

// ── Full General Academic Renderer ─────────────────────────────────────────
interface GeneralAcademicRendererProps {
  data: GeneralAcademicData;
  /** The full question prompt text */
  promptText?: string;
}

export const GeneralAcademicRenderer: FC<GeneralAcademicRendererProps> = memo(
  ({ data, promptText }) => {
    const subtypeLabel: Record<NonNullable<GeneralAcademicData["subtype"]>, string> = {
      reading_comprehension: "Reading Comprehension",
      logical_reasoning: "Logical Reasoning",
      data_interpretation: "Data Interpretation",
      applied_problem_solving: "Applied Problem Solving",
    };

    return (
      <div className="space-y-5">
        {/* Subtype badge */}
        {data.subtype && (
          <div className="inline-block rounded-md border border-primary/20 bg-primary/5 px-2.5 py-1 text-xs font-medium text-primary">
            {subtypeLabel[data.subtype]}
          </div>
        )}

        {/* Passage block (for reading comprehension) */}
        {data.passage && (
          <div className="rounded-xl border bg-secondary/40 p-4">
            <p className="mb-2 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
              Passage
            </p>
            <div className="max-h-56 overflow-y-auto pr-1 text-sm leading-relaxed text-foreground">
              {data.passage}
            </div>
          </div>
        )}

        {/* Data table (for data interpretation) */}
        {data.table && (
          <div className="overflow-x-auto rounded-xl border">
            <table className="w-full text-sm">
              <thead className="bg-secondary/50 text-left text-xs font-medium uppercase tracking-wide text-muted-foreground">
                <tr>
                  {data.table.headers.map((h, i) => (
                    <th key={i} className="px-4 py-2.5 font-semibold">
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {data.table.rows.map((row, ri) => (
                  <tr key={ri} className="border-t">
                    {row.map((cell, ci) => (
                      <td key={ci} className="px-4 py-2 text-foreground">
                        {cell}
                      </td>
                    ))}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}

        {/* Question prompt */}
        {promptText && (
          <div className="whitespace-pre-wrap text-sm leading-relaxed text-foreground">
            {promptText}
          </div>
        )}
      </div>
    );
  },
);

GeneralAcademicRenderer.displayName = "GeneralAcademicRenderer";
