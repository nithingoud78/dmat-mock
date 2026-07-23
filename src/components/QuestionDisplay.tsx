import { memo, type FC } from "react";
import type { Question } from "@/lib/test-types";
import {
  FigureSequenceRenderer,
  type FigureSequenceData,
} from "./question-renderers/FigureSequenceRenderer";
import {
  LatinSquareRenderer,
  type LatinSquareData,
} from "./question-renderers/LatinSquareRenderer";
import {
  MathEquationRenderer,
  type MathEquationData,
} from "./question-renderers/MathEquationRenderer";
import {
  GeneralAcademicRenderer,
  type GeneralAcademicData,
} from "./question-renderers/GeneralAcademicRenderer";

interface QuestionDisplayProps {
  question: Question;
  selectedOptionId?: string | null;
  correctOptionId?: string;
  showFeedback?: boolean;
  disabled?: boolean;
  onSelect?: (optionId: string) => void;
}

/**
 * Normalizes missing visual_data for Latin Squares by parsing ASCII patterns.
 */
function parseLatinSquareText(text: string): (LatinSquareData & { wasParsed?: boolean }) | null {
  if (!text) return null;
  const lines = text.split('\n').map(l => l.trim()).filter(l => l.length > 0);
  
  // Format 1: A | _ | C | ?
  const gridLines = lines.filter(l => l.includes('|'));
  if (gridLines.length >= 3) {
    const grid: string[][] = [];
    let targetCell = { row: 0, col: 0 };
    const symbols = new Set<string>();
    
    gridLines.forEach((line, rIdx) => {
      const cells = line.split('|').map(c => c.trim());
      grid.push(cells);
      cells.forEach((cell, cIdx) => {
        if (cell === '?' || cell === '¿') targetCell = { row: rIdx, col: cIdx };
        else if (cell !== '_' && cell !== '' && cell !== '-') symbols.add(cell);
      });
    });
    
    if (grid.length > 0 && grid.every(r => r.length === grid[0].length)) {
      return {
        type: "latin_square",
        size: grid[0].length,
        symbols: Array.from(symbols).sort(),
        grid: grid.map(r => r.map(c => (c === '_' || c === '-' ? '' : c))),
        target_cell: targetCell,
        wasParsed: true,
      };
    }
  }
  
  // Format 2: Row1 = A B C D
  const rowLines = lines.filter(l => l.toLowerCase().startsWith('row'));
  if (rowLines.length >= 3) {
    const grid: string[][] = [];
    let targetCell = { row: 0, col: 0 };
    const symbols = new Set<string>();
    
    rowLines.forEach((line, rIdx) => {
      const parts = line.split('=');
      if (parts.length > 1) {
        const cells = parts[1].trim().split(/\s+/);
        grid.push(cells);
        cells.forEach((cell, cIdx) => {
          if (cell === '?' || cell === '¿') targetCell = { row: rIdx, col: cIdx };
          else if (cell !== '_' && cell !== '' && cell !== '-') symbols.add(cell);
        });
      }
    });
    
    if (grid.length > 0 && grid.every(r => r.length === grid[0].length)) {
      return {
        type: "latin_square",
        size: grid[0].length,
        symbols: Array.from(symbols).sort(),
        grid: grid.map(r => r.map(c => (c === '_' || c === '-' ? '' : c))),
        target_cell: targetCell,
        wasParsed: true,
      };
    }
  }

  return null;
}

/**
 * Smart dispatcher that selects the correct visual renderer based on the
 * question module and visual_data type.
 *
 * Falls back to plain prompt_text rendering if no visual_data is present.
 */
export const QuestionDisplay: FC<QuestionDisplayProps> = memo(({ 
  question, 
  selectedOptionId, 
  correctOptionId, 
  showFeedback, 
  disabled, 
  onSelect 
}) => {
  const vd = question.visual_data as Record<string, unknown> | null | undefined;

  // ── Figure Sequence ──────────────────────────────────────────────────────
  if (question.module === "figure_sequence" && vd?.type === "figure_sequence") {
    return (
      <div>
        {question.prompt_text && (
          <p className="mb-4 text-base leading-relaxed text-foreground">{question.prompt_text}</p>
        )}
        <FigureSequenceRenderer 
          data={vd as unknown as FigureSequenceData} 
          selectedOptionId={selectedOptionId}
          correctOptionId={correctOptionId}
          showFeedback={showFeedback}
          disabled={disabled}
          onSelect={onSelect}
        />
      </div>
    );
  }

  // ── Latin Square ─────────────────────────────────────────────────────────
  if (question.module === "latin_square") {
    let lsData = vd as (LatinSquareData & { wasParsed?: boolean }) | null | undefined;
    
    // Normalization layer: if no structured visual data, try parsing prompt text
    if (!lsData || lsData.type !== "latin_square") {
      lsData = parseLatinSquareText(question.prompt_text || "");
    }

    if (lsData) {
      return (
        <div>
          {question.prompt_text && !lsData.wasParsed && (
            <p className="mb-4 text-base leading-relaxed text-foreground">{question.prompt_text}</p>
          )}
          <LatinSquareRenderer data={lsData} />
        </div>
      );
    }
  }

  // ── Math Equation ────────────────────────────────────────────────────────
  if (question.module === "math_equation" && vd?.type === "math_equation") {
    return <MathEquationRenderer data={vd as unknown as MathEquationData} />;
  }

  // ── General Academic ─────────────────────────────────────────────────────
  if (question.module === "general_academic" && vd?.type === "general_academic") {
    return (
      <GeneralAcademicRenderer
        data={vd as unknown as GeneralAcademicData}
        promptText={question.prompt_text}
      />
    );
  }

  // ── Fallback: plain text + standard option buttons ───────────────────────
  return (
    <div>
      <div className="min-h-[80px] whitespace-pre-wrap text-base leading-relaxed text-foreground">
        {question.prompt_text}
      </div>
      {question.image_url && (
        <img
          src={question.image_url}
          alt="Question figure"
          className="mt-4 max-h-80 rounded-xl border object-contain"
        />
      )}
    </div>
  );
});

QuestionDisplay.displayName = "QuestionDisplay";
