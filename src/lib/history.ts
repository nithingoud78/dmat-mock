import { supabase } from "@/integrations/supabase/client";

const SEEN_QUESTIONS_KEY = "dmat_seen_questions";

function getLocalSeen(): Set<string> {
  if (typeof window === "undefined") return new Set();
  try {
    const data = localStorage.getItem(SEEN_QUESTIONS_KEY);
    if (!data) return new Set();
    const arr = JSON.parse(data);
    return Array.isArray(arr) ? new Set(arr) : new Set();
  } catch (e) {
    return new Set();
  }
}

function setLocalSeen(seen: Set<string>) {
  if (typeof window === "undefined") return;
  localStorage.setItem(SEEN_QUESTIONS_KEY, JSON.stringify(Array.from(seen)));
}

/**
 * Gets the set of all previously seen question IDs.
 * Fetches from Supabase if authenticated, else localStorage.
 */
export async function getSeenQuestionIdsAsync(): Promise<Set<string>> {
  const { data: { session } } = await supabase.auth.getSession();
  if (session?.user) {
    const { data } = await supabase.from("profiles").select("seen_questions").eq("id", session.user.id).single();
    return new Set(data?.seen_questions || []);
  }
  return getLocalSeen();
}

/**
 * Adds new question IDs to the seen history.
 */
export async function markQuestionsAsSeenAsync(ids: string[]): Promise<void> {
  if (ids.length === 0) return;
  const { data: { session } } = await supabase.auth.getSession();
  
  if (session?.user) {
    const seen = await getSeenQuestionIdsAsync();
    let added = false;
    for (const id of ids) {
      if (!seen.has(id)) {
        seen.add(id);
        added = true;
      }
    }
    if (added) {
      await supabase.from("profiles").update({ seen_questions: Array.from(seen) }).eq("id", session.user.id);
    }
  } else {
    const seen = getLocalSeen();
    let added = false;
    for (const id of ids) {
      if (!seen.has(id)) {
        seen.add(id);
        added = true;
      }
    }
    if (added) setLocalSeen(seen);
  }
}

/**
 * Clears the history for a specific set of IDs.
 * Use this when a module pool is completely exhausted to reset it.
 */
export async function clearSeenQuestionsAsync(idsToClear: string[]): Promise<void> {
  if (idsToClear.length === 0) return;
  const { data: { session } } = await supabase.auth.getSession();
  
  if (session?.user) {
    const seen = await getSeenQuestionIdsAsync();
    const toClear = new Set(idsToClear);
    const remaining = Array.from(seen).filter((id) => !toClear.has(id));
    await supabase.from("profiles").update({ seen_questions: remaining }).eq("id", session.user.id);
  } else {
    const seen = getLocalSeen();
    const toClear = new Set(idsToClear);
    const remaining = Array.from(seen).filter((id) => !toClear.has(id));
    setLocalSeen(new Set(remaining));
  }
}

/**
 * Clears all seen question history.
 */
export async function clearAllSeenQuestionsAsync(): Promise<void> {
  const { data: { session } } = await supabase.auth.getSession();
  if (session?.user) {
    await supabase.from("profiles").update({ seen_questions: [] }).eq("id", session.user.id);
  } else {
    setLocalSeen(new Set());
  }
}

/**
 * Syncs local history to Supabase on login.
 */
export async function syncHistoryOnLogin(): Promise<void> {
  const { data: { session } } = await supabase.auth.getSession();
  if (!session?.user) return;
  const local = getLocalSeen();
  if (local.size === 0) return;
  
  const { data } = await supabase.from("profiles").select("seen_questions").eq("id", session.user.id).single();
  const remote = new Set(data?.seen_questions || []);
  
  for (const id of local) remote.add(id);
  
  await supabase.from("profiles").update({ seen_questions: Array.from(remote) }).eq("id", session.user.id);
  
  if (typeof window !== "undefined") {
    localStorage.removeItem(SEEN_QUESTIONS_KEY);
  }
}
