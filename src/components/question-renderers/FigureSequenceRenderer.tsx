import { memo, type FC } from "react";
import { cn } from "@/lib/utils";

// ── Types ──────────────────────────────────────────────────────────────────
export interface FigureObject {
  shape: "triangle" | "circle" | "square" | "diamond" | "pentagon" | "star";
  row: number;
  col: number;
  rotation?: number; // degrees clockwise
  color?: string;
  fill?: string; // explicit fill color (overrides color)
  size?: number; // 0–1 proportion of cell
}

export interface FigureFrame {
  objects: FigureObject[];
}

export interface FigureSequenceData {
  type: "figure_sequence";
  grid_size?: number; // default 4
  frames: FigureFrame[];
  blank_count?: number; // How many "?" placeholders to show (default 1)
  options?: Array<{
    id: string;
    objects?: FigureObject[];
    frames?: FigureFrame[]; // Support multi-frame options
  }>;
}

// ── Constants ──────────────────────────────────────────────────────────────
const DEFAULT_GRID = 4;
const CELL_SIZE = 48;
const COLORS = {
  primary: "#5F73FF",
  secondary: "#111827",
  amber: "#F59E0B",
  red: "#EF4444",
  green: "#22C55E",
  ink: "#111827",
} as const;

function resolveColor(color?: string): string {
  if (!color) return COLORS.primary;
  return (COLORS as Record<string, string>)[color] ?? color;
}

// ── Shape renderers ────────────────────────────────────────────────────────
function renderShape(obj: FigureObject, cellSize: number) {
  const size = (obj.size ?? 0.55) * cellSize;
  const half = cellSize / 2;
  const color = resolveColor(obj.color ?? obj.fill);
  const rotate = obj.rotation ?? 0;
  const transform = `rotate(${rotate} ${half} ${half})`;

  switch (obj.shape) {
    case "triangle": {
      const h = size * 0.866;
      const pts = [
        `${half},${half - h / 2}`,
        `${half - size / 2},${half + h / 2}`,
        `${half + size / 2},${half + h / 2}`,
      ].join(" ");
      return <polygon points={pts} fill={color} transform={transform} />;
    }
    case "circle":
      return <circle cx={half} cy={half} r={size / 2} fill={color} transform={transform} />;
    case "square": {
      const s = size * 0.75;
      return (
        <rect
          x={half - s / 2}
          y={half - s / 2}
          width={s}
          height={s}
          fill={color}
          transform={transform}
        />
      );
    }
    case "diamond": {
      const r = size / 2;
      const pts = `${half},${half - r} ${half + r},${half} ${half},${half + r} ${half - r},${half}`;
      return <polygon points={pts} fill={color} transform={transform} />;
    }
    case "pentagon": {
      const r = size / 2;
      const pts = Array.from({ length: 5 }, (_, i) => {
        const angle = (i * 72 - 90) * (Math.PI / 180);
        return `${half + r * Math.cos(angle)},${half + r * Math.sin(angle)}`;
      }).join(" ");
      return <polygon points={pts} fill={color} transform={transform} />;
    }
    case "star": {
      const outer = size / 2;
      const inner = outer * 0.4;
      const pts = Array.from({ length: 10 }, (_, i) => {
        const r = i % 2 === 0 ? outer : inner;
        const angle = (i * 36 - 90) * (Math.PI / 180);
        return `${half + r * Math.cos(angle)},${half + r * Math.sin(angle)}`;
      }).join(" ");
      return <polygon points={pts} fill={color} transform={transform} />;
    }
    default:
      return null;
  }
}

// ── Single Grid ────────────────────────────────────────────────────────────
interface GridProps {
  frame: FigureFrame;
  gridSize?: number;
  cellSize?: number;
  className?: string;
}

export function FigureGrid({
  frame,
  gridSize = DEFAULT_GRID,
  cellSize = CELL_SIZE,
  className,
}: GridProps) {
  const total = gridSize * cellSize;
  return (
    <svg
      width={total}
      height={total}
      viewBox={`0 0 ${total} ${total}`}
      className={cn("rounded border border-[#E5E7EB] bg-white", className)}
      aria-hidden="true"
    >
      {/* Grid lines */}
      {Array.from({ length: gridSize + 1 }, (_, i) => (
        <g key={`gl-${i}`}>
          <line
            x1={i * cellSize}
            y1={0}
            x2={i * cellSize}
            y2={total}
            stroke="#E5E7EB"
            strokeWidth={1}
          />
          <line
            x1={0}
            y1={i * cellSize}
            x2={total}
            y2={i * cellSize}
            stroke="#E5E7EB"
            strokeWidth={1}
          />
        </g>
      ))}
      {/* Objects */}
      {frame.objects.map((obj, idx) => (
        <g key={idx} transform={`translate(${obj.col * cellSize}, ${obj.row * cellSize})`}>
          {renderShape(obj, cellSize)}
        </g>
      ))}
    </svg>
  );
}

// ── Sequence Strip ─────────────────────────────────────────────────────────
interface SequenceProps {
  frames: FigureFrame[];
  gridSize?: number;
  cellSize?: number;
  /** If true, last frame shows a "?" placeholder */
  showQuestion?: boolean;
  blankCount?: number;
}

export function FigureSequenceStrip({
  frames,
  gridSize = DEFAULT_GRID,
  cellSize = CELL_SIZE,
  showQuestion = true,
  blankCount = 1,
}: SequenceProps) {
  const total = gridSize * cellSize;
  return (
    <div className="flex flex-wrap items-center gap-3">
      {frames.map((frame, i) => (
        <div key={i} className="flex items-center gap-3">
          <FigureGrid frame={frame} gridSize={gridSize} cellSize={cellSize} />
          {(i < frames.length - 1 || showQuestion) && (
            <span className="text-lg text-[#6B7280]" aria-hidden="true">
              →
            </span>
          )}
        </div>
      ))}
      {showQuestion && Array.from({ length: blankCount }).map((_, i) => (
        <div key={`blank-${i}`} className="flex items-center gap-3">
          <svg
            width={total}
            height={total}
            viewBox={`0 0 ${total} ${total}`}
            className="rounded border border-dashed border-[#5F73FF] bg-[#EEF2FF]"
            aria-label="Question frame"
          >
            {Array.from({ length: gridSize + 1 }, (_, j) => (
              <g key={`ql-${j}`}>
                <line
                  x1={j * cellSize}
                  y1={0}
                  x2={j * cellSize}
                  y2={total}
                  stroke="#C7D2FE"
                  strokeWidth={1}
                />
                <line
                  x1={0}
                  y1={j * cellSize}
                  x2={total}
                  y2={j * cellSize}
                  stroke="#C7D2FE"
                  strokeWidth={1}
                />
              </g>
            ))}
            <text
              x={total / 2}
              y={total / 2 + 8}
              textAnchor="middle"
              fontSize="36"
              fontWeight="700"
              fill="#5F73FF"
              fontFamily="Inter, sans-serif"
            >
              ?
            </text>
          </svg>
          {i < blankCount - 1 && (
            <span className="text-lg text-[#6B7280]" aria-hidden="true">
              →
            </span>
          )}
        </div>
      ))}
    </div>
  );
}

// ── Option Grid ────────────────────────────────────────────────────────────
interface OptionGridProps {
  optionId: string;
  objects?: FigureObject[];
  frames?: FigureFrame[];
  gridSize?: number;
  cellSize?: number;
  selected?: boolean;
  correct?: boolean;
  wrong?: boolean;
  disabled?: boolean;
  onClick?: () => void;
}

export function OptionGrid({
  optionId,
  objects,
  frames,
  gridSize = DEFAULT_GRID,
  cellSize = CELL_SIZE,
  selected,
  correct,
  wrong,
  disabled,
  onClick,
}: OptionGridProps) {
  return (
    <button
      onClick={disabled ? undefined : onClick}
      disabled={disabled}
      className={cn(
        "flex flex-col items-center gap-1.5 rounded-xl border-2 p-2 transition-all duration-150",
        !selected &&
          !correct &&
          !wrong &&
          "border-[#E5E7EB] bg-white hover:border-[#5F73FF] hover:bg-[#EEF2FF]",
        selected && !correct && !wrong && "border-[#5F73FF] bg-[#EEF2FF]",
        correct && "border-[#22C55E] bg-[#F0FDF4]",
        wrong && "border-[#EF4444] bg-[#FEF2F2]",
        disabled && "cursor-not-allowed opacity-70",
      )}
      aria-pressed={selected}
      aria-label={`Option ${optionId.toUpperCase()}`}
    >
      <div className="flex items-center gap-2">
        {frames && frames.length > 0 ? (
          frames.map((frame, idx) => (
            <div key={idx} className="flex items-center gap-2">
              <FigureGrid frame={frame} gridSize={gridSize} cellSize={cellSize} />
              {idx < frames.length - 1 && (
                <span className="text-sm text-[#6B7280]">→</span>
              )}
            </div>
          ))
        ) : (
          objects && <FigureGrid frame={{ objects }} gridSize={gridSize} cellSize={cellSize} />
        )}
      </div>
      <span
        className={cn(
          "text-xs font-semibold",
          correct
            ? "text-[#22C55E]"
            : wrong
              ? "text-[#EF4444]"
              : selected
                ? "text-[#5F73FF]"
                : "text-[#6B7280]",
        )}
      >
        {optionId.toUpperCase()}
      </span>
    </button>
  );
}

// ── Full Figure Sequence Renderer ──────────────────────────────────────────
interface FigureSequenceRendererProps {
  data: FigureSequenceData;
  selectedOptionId?: string | null;
  correctOptionId?: string;
  showFeedback?: boolean;
  disabled?: boolean;
  onSelect?: (optionId: string) => void;
}

export const FigureSequenceRenderer: FC<FigureSequenceRendererProps> = memo(
  ({
    data,
    selectedOptionId,
    correctOptionId,
    showFeedback = false,
    disabled = false,
    onSelect,
  }) => {
    const gridSize = data.grid_size ?? DEFAULT_GRID;
    const cellSize = gridSize <= 3 ? 56 : 44;

    return (
      <div className="space-y-5">
        {/* Sequence strip */}
        <div className="overflow-x-auto pb-2">
          <FigureSequenceStrip
            frames={data.frames}
            gridSize={gridSize}
            cellSize={cellSize}
            showQuestion={true}
            blankCount={data.blank_count}
          />
        </div>

        {/* Options */}
        {data.options && data.options.length > 0 && (
          <div>
            <p className="mb-3 text-xs font-medium uppercase tracking-wide text-[#6B7280]">
              Choose the next figure{data.blank_count && data.blank_count > 1 ? "s" : ""}
            </p>
            <div className="flex flex-wrap gap-3">
              {data.options.map((opt) => {
                const isSelected = selectedOptionId === opt.id;
                const isCorrect = showFeedback && correctOptionId === opt.id;
                const isWrong = showFeedback && isSelected && correctOptionId !== opt.id;
                return (
                  <OptionGrid
                    key={opt.id}
                    optionId={opt.id}
                    objects={opt.objects}
                    frames={opt.frames}
                    gridSize={gridSize}
                    cellSize={cellSize}
                    selected={isSelected}
                    correct={isCorrect}
                    wrong={isWrong}
                    disabled={disabled}
                    onClick={() => onSelect?.(opt.id)}
                  />
                );
              })}
            </div>
          </div>
        )}
      </div>
    );
  },
);

FigureSequenceRenderer.displayName = "FigureSequenceRenderer";
