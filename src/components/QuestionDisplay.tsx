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
}

/**
 * Smart dispatcher that selects the correct visual renderer based on the
 * question module and visual_data type.
 *
 * Falls back to plain prompt_text rendering if no visual_data is present.
 */
export const QuestionDisplay: FC<QuestionDisplayProps> = memo(({ question }) => {
  const vd = question.visual_data as Record<string, unknown> | null | undefined;

  // ── Figure Sequence ──────────────────────────────────────────────────────
  if (question.module === "figure_sequence" && vd?.type === "figure_sequence") {
    return (
      <div>
        {question.prompt_text && (
          <p className="mb-4 text-base leading-relaxed text-foreground">{question.prompt_text}</p>
        )}
        <FigureSequenceRenderer data={vd as unknown as FigureSequenceData} />
      </div>
    );
  }

  // ── Latin Square ─────────────────────────────────────────────────────────
  if (question.module === "latin_square" && vd?.type === "latin_square") {
    return (
      <div>
        {question.prompt_text && (
          <p className="mb-4 text-base leading-relaxed text-foreground">{question.prompt_text}</p>
        )}
        <LatinSquareRenderer data={vd as unknown as LatinSquareData} />
      </div>
    );
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
