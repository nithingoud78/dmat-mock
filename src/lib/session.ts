const SESSION_KEY = "dmat_session_token";

/**
 * Gets the existing anonymous session token from localStorage,
 * or creates and saves a new one (UUID v4) if none exists.
 */
export function getOrCreateSessionToken(): string {
  if (typeof window === "undefined") return crypto.randomUUID();
  let token = localStorage.getItem(SESSION_KEY);
  if (!token) {
    token = crypto.randomUUID();
    localStorage.setItem(SESSION_KEY, token);
  }
  return token;
}

/**
 * Returns the session token if it already exists, or null.
 */
export function getSessionToken(): string | null {
  if (typeof window === "undefined") return null;
  return localStorage.getItem(SESSION_KEY);
}

/**
 * Computes a deterministic mock set index from the session token.
 * The same session will always get the same set.
 */
export function sessionToMockSetIndex(sessionToken: string, totalSets: number): number {
  if (totalSets <= 0) return 0;
  // Sum char codes modulo totalSets for a simple but consistent hash
  const hash = sessionToken
    .replace(/-/g, "")
    .split("")
    .reduce((acc, ch) => acc + ch.charCodeAt(0), 0);
  return hash % totalSets;
}
