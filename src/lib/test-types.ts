import type { SourceMeta } from "@/components/SourcePopover";

export interface QuestionOption {
  id: string;
  text?: string;
  image_url?: string;
}

export interface Question {
  id: string;
  module: "figure_sequence" | "math_equation" | "latin_square" | "general_academic" | "custom";
  prompt_text: string;
  image_url: string | null;
  options: QuestionOption[];
  correct_option_id: string;
  explanation_text: string;
  difficulty: "easy" | "medium" | "hard";
  source: SourceMeta | null;
  time_estimate_seconds: number;
  /** Structured JSON data for visual rendering (SVG grids, equation blocks, passages, etc.) */
  visual_data?: Record<string, unknown> | null;
  subtopic?: string | null;
  question_type?: string | null;
  tags?: string[];
  verified?: boolean;
  approved?: boolean;
  internal_notes?: string | null;
  solution_steps?: any;
}

export interface SectionState {
  moduleId: "figure_sequence" | "math_equation" | "latin_square" | "general_academic" | "custom";
  moduleLabel: string;
  questions: Question[];
  answers: Record<string, string | null>; // qid -> optionId
  marked: Record<string, boolean>;
  timePerQ: Record<string, number>; // qid -> seconds spent
  currentIdx: number;
  secondsLeft: number;
  totalSeconds: number;
  submitted: boolean;
  submittedAt?: string;
}
