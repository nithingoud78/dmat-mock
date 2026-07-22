import { supabase } from "@/integrations/supabase/client";
import type { Question } from "@/lib/test-types";
import type { ModuleId } from "@/lib/modules";

function mapQuestionRow(r: any): Question {
  return {
    id: r.id,
    module: r.module,
    prompt_text: r.prompt_text,
    image_url: r.image_url,
    options: Array.isArray(r.options) ? r.options : [],
    correct_option_id: r.correct_option_id,
    explanation_text: r.explanation_text,
    difficulty: r.difficulty,
    source: r.source,
    time_estimate_seconds: r.time_estimate_seconds,
    visual_data: r.visual_data ?? null,
    subtopic: r.subtopic ?? null,
    question_type: r.question_type ?? null,
    verified: r.verified ?? false,
    approved: r.approved ?? false,
    internal_notes: r.internal_notes ?? null,
    solution_steps: r.solution_steps ?? null,
  };
}

export async function fetchQuestions(
  module: ModuleId,
  opts: { difficulty?: "easy" | "medium" | "hard" | "all"; limit?: number } = {},
): Promise<Question[]> {
  let query = supabase.from("questions").select("*, source:sources(*)").eq("module", module);
  if (opts.difficulty && opts.difficulty !== "all") query = query.eq("difficulty", opts.difficulty);
  const { data, error } = await query;
  if (error) throw error;
  const shuffled = (data ?? []).sort(() => Math.random() - 0.5);
  const sliced = opts.limit ? shuffled.slice(0, opts.limit) : shuffled;
  return sliced.map(mapQuestionRow);
}

export async function fetchQuestionsByIds(ids: string[]): Promise<Question[]> {
  if (ids.length === 0) return [];
  const { data, error } = await supabase
    .from("questions")
    .select("*, source:sources(*)")
    .in("id", ids);
  if (error) throw error;
  const map = new Map((data ?? []).map((r: any) => [r.id, r]));
  return ids
    .map((id) => map.get(id))
    .filter(Boolean)
    .map(mapQuestionRow);
}

export async function buildCustomTest(criteria: {
  modules: ModuleId[];
  difficulty: "easy" | "medium" | "hard" | "all";
  count: number;
}): Promise<Question[]> {
  let query = supabase.from("questions").select("*, source:sources(*)");

  if (criteria.modules.length > 0) {
    query = query.in("module", criteria.modules);
  }
  if (criteria.difficulty !== "all") {
    query = query.eq("difficulty", criteria.difficulty);
  }

  const { data, error } = await query;
  if (error) throw error;

  // Simple randomization and limit for now
  const shuffled = (data ?? []).sort(() => Math.random() - 0.5);
  return shuffled.slice(0, criteria.count).map(mapQuestionRow);
}
