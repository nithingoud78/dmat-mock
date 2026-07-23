export type ModuleId = "figure_sequence" | "math_equation" | "latin_square" | "general_academic";

export const MODULES: Record<
  ModuleId,
  {
    id: ModuleId;
    label: string;
    slug: string;
    questions: number; // Internal logic limit for mock generation
    displayQuestions: string; // What the user sees officially
    minutes: number;
    icon: string;
    description: string;
  }
> = {
  figure_sequence: {
    id: "figure_sequence",
    label: "Figure Sequences",
    slug: "figure-sequences",
    questions: 20,
    displayQuestions: "20",
    minutes: 25,
    icon: "🧩",
    description:
      "Identify the rule governing a sequence of abstract figures and pick the next one. Trains visual pattern recognition and multi-rule tracking.",
  },
  math_equation: {
    id: "math_equation",
    label: "Mathematical Equations",
    slug: "mathematical-equations",
    questions: 20,
    displayQuestions: "20",
    minutes: 25,
    icon: "➗",
    description:
      "Solve equations under time pressure — algebra, exponents, ratios, quick arithmetic. No calculator allowed on the real exam.",
  },
  latin_square: {
    id: "latin_square",
    label: "Latin Squares",
    slug: "latin-squares",
    questions: 20,
    displayQuestions: "20",
    minutes: 25,
    icon: "🔲",
    description:
      "Fill in an n×n grid where every row and column contains each symbol exactly once. Trains constraint reasoning and elimination.",
  },
  general_academic: {
    id: "general_academic",
    label: "General Academic",
    slug: "general-academic",
    questions: 25,
    displayQuestions: "~25 (estimated)",
    minutes: 90,
    icon: "📚",
    description:
      "Reading comprehension, logical reasoning, data interpretation and applied problem solving — the fourth section of the complete dMAT.",
  },
};

/** Core Module order for the Complete Mock (4 sections + 30-min break after section 3) */
export const MODULE_ORDER: ModuleId[] = [
  "figure_sequence",
  "math_equation",
  "latin_square",
  "general_academic",
];

export function moduleBySlug(slug: string): ModuleId | undefined {
  return MODULE_ORDER.find((m) => MODULES[m].slug === slug);
}
