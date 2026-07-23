const SEEN_QUESTIONS_KEY = "dmat_seen_questions";

/**
 * Gets the set of all previously seen question IDs from localStorage.
 */
export function getSeenQuestionIds(): Set<string> {
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

/**
 * Adds new question IDs to the seen history.
 */
export function markQuestionsAsSeen(ids: string[]): void {
  if (typeof window === "undefined" || ids.length === 0) return;
  const seen = getSeenQuestionIds();
  let added = false;
  for (const id of ids) {
    if (!seen.has(id)) {
      seen.add(id);
      added = true;
    }
  }
  if (added) {
    localStorage.setItem(SEEN_QUESTIONS_KEY, JSON.stringify(Array.from(seen)));
  }
}

/**
 * Clears the history for a specific set of IDs.
 * Use this when a module pool is completely exhausted to reset it.
 */
export function clearSeenQuestions(idsToClear: string[]): void {
  if (typeof window === "undefined" || idsToClear.length === 0) return;
  const seen = getSeenQuestionIds();
  const toClear = new Set(idsToClear);
  const remaining = Array.from(seen).filter((id) => !toClear.has(id));
  localStorage.setItem(SEEN_QUESTIONS_KEY, JSON.stringify(remaining));
}

