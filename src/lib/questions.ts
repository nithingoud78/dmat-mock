import { supabase } from "@/integrations/supabase/client";
import type { Question } from "@/lib/test-types";
import type { ModuleId } from "@/lib/modules";
import { shuffleArray } from "@/lib/utils";
import { getSeenQuestionIdsAsync, clearSeenQuestionsAsync } from "@/lib/history";
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
  
  const allQs = data ?? [];
  if (allQs.length === 0) return [];

  // Get unseen questions
  const seen = await getSeenQuestionIdsAsync();
  const unseenQs = allQs.filter(q => !seen.has(q.id));
  const seenQs = allQs.filter(q => seen.has(q.id));

  // If we don't have enough unseen questions to fulfill the limit, 
  // clear the history for this module's IDs so they can cycle again.
  const targetCount = opts.limit ?? allQs.length;
  if (unseenQs.length < targetCount) {
    await clearSeenQuestionsAsync(allQs.map(q => q.id));
  }

  // Shuffle pools independently
  const shuffledUnseen = shuffleArray(unseenQs);
  const shuffledSeen = shuffleArray(seenQs);

  // Combine unseen first, then fallback to seen
  const combined = [...shuffledUnseen, ...shuffledSeen];
  const sliced = combined.slice(0, targetCount);

  // Validate duplicate IDs (Safety net)
  const uniqueIds = new Set(sliced.map(q => q.id));
  if (uniqueIds.size !== sliced.length) {
    console.error("Duplicate questions detected in fetchQuestions selection!");
  }

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

  const allQs = data ?? [];
  if (allQs.length === 0) return [];

  const seen = await getSeenQuestionIdsAsync();
  const unseenQs = allQs.filter(q => !seen.has(q.id));
  const seenQs = allQs.filter(q => seen.has(q.id));

  if (unseenQs.length < criteria.count) {
    await clearSeenQuestionsAsync(allQs.map(q => q.id));
  }

  const shuffledUnseen = shuffleArray(unseenQs);
  const shuffledSeen = shuffleArray(seenQs);

  const combined = [...shuffledUnseen, ...shuffledSeen];
  const sliced = combined.slice(0, criteria.count);

  return sliced.map(mapQuestionRow);
}
