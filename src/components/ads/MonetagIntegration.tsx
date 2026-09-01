import { useEffect, useRef, useState } from "react";
import { createPortal } from "react-dom";
import { useLocation } from "@tanstack/react-router";
import { adsConfig } from "@/config/ads";
import { AlertTriangle, RefreshCw } from "lucide-react";
import { supabase } from "@/integrations/supabase/client";

type AdState = "checking_global_state" | "checking" | "allowed" | "blocked" | "idle";

/**
 * AUTHORITATIVE AD ROUTE ALLOWLIST
 *
 * Monetag MUST ONLY initialize on these exact seven routes.
 * Any pathname NOT present in this Set → ads OFF, gate OFF, no detection.
 *
 * This Set is the single source of truth for all ad routing decisions.
 * Do NOT use startsWith, includes, or any pattern match.
 */
const ADS_ALLOWED_ROUTES = new Set([
  "/",
  "/about",
  "/feedback",
  "/privacy-policy",
  "/terms-and-conditions",
  "/cookie-policy",
  "/disclaimer",
]);

/**
 * Removes all DOM resources created by our Monetag integration.
 * Called on cleanup (route leave) and on idle state transitions.
 * Only removes elements that belong to our integration — does not
 * touch unrelated application scripts or iframes.
 */
function cleanupMonetagResources(): void {
  try {
    // Remove our container div
    const container = document.getElementById("monetag-container");
    if (container) container.remove();

    // Remove any Monetag scripts / iframes injected by the MultiTag loader.
    // These selectors target only Monetag-owned domains.
    const adSelectors = [
      'script[src*="quge5.com"]',
      'script[src*="monetag"]',
      'script[src*="realsrv"]',
      'script[src*="adsprofitter"]',
      'iframe[src*="quge5.com"]',
      'iframe[src*="monetag"]',
      'iframe[src*="realsrv"]',
    ];
    document
      .querySelectorAll(adSelectors.join(", "))
      .forEach((node) => node.remove());
  } catch (e) {
    console.error("[dMAT Practice Pro] Error during Monetag cleanup:", e);
  }
}

export function MonetagIntegration() {
  const initialized = useRef(false);
  const location = useLocation();
  const [adState, setAdState] = useState<AdState>("idle");
  const refreshButtonRef = useRef<HTMLButtonElement>(null);

  // ─── Main initialization effect — re-runs on every pathname change ────────
  useEffect(() => {
    const path = location.pathname;

    // ── AUTHORITATIVE ROUTE BOUNDARY ─────────────────────────────────────────
    // If the current path is NOT in the allowlist, ensure idle state and bail.
    // This covers practice/*, mock/*, auth, admin/*, and any unknown route.
    if (!ADS_ALLOWED_ROUTES.has(path)) {
      setAdState("idle");
      // Clean up any resources left from a previous allowed route visit
      // (handles the SPA navigation case: / → /practice/figure-sequences)
      cleanupMonetagResources();
      initialized.current = false;
      return;
    }

    // ── LOCAL CONFIG GUARD ────────────────────────────────────────────────────
    // Respect the local ads config flags before any network calls.
    if (
      !adsConfig.adsEnabled ||
      !adsConfig.monetagEnabled ||
      typeof window === "undefined"
    ) {
      setAdState("idle");
      return;
    }

    // ── ALREADY INITIALIZED GUARD ─────────────────────────────────────────────
    // If Monetag is already running for this allowed-route visit, don't re-init.
    // IMPORTANT: we only skip if we are STILL on an allowed route AND already
    // initialized. We do NOT skip on the way out (that is handled above).
    if (initialized.current && document.getElementById("monetag-container")) {
      return;
    }

    setAdState("checking_global_state");

    let isMounted = true;
    let fallbackTimeout: NodeJS.Timeout;

    const initializeMonetag = async () => {
      try {
        const { data, error } = await supabase.rpc("get_effective_site_settings");

        if (!isMounted) return;

        if (error) {
          console.error(
            "[dMAT Practice Pro] Failed to fetch global ad settings:",
            error
          );
          // Fail open on DB error — don't break the site, assume ads allowed
          setAdState("allowed");
          return;
        }

        // Global ads are OFF — respect admin setting
        if (data && data.length > 0 && data[0].ads_enabled === false) {
          setAdState("idle");
          return;
        }

        // ── Global ads are ON — proceed with Monetag injection ───────────────
        initialized.current = true;
        setAdState("checking");

        const container = document.createElement("div");
        container.id = "monetag-container";
        container.style.display = "none";
        container.style.visibility = "hidden";
        container.style.width = "0";
        container.style.height = "0";

        const monetagRawHtml = `
          <script src="https://quge5.com/88/tag.min.js" data-zone="275091" async data-cfasync="false"></script>
        `;

        if (
          monetagRawHtml.trim() &&
          !monetagRawHtml.includes("PASTE MONETAG SCRIPT TAGS HERE")
        ) {
          const tempDiv = document.createElement("div");
          tempDiv.innerHTML = monetagRawHtml.trim();

          let targetScriptFound = false;

          Array.from(tempDiv.childNodes).forEach((node) => {
            if (node.nodeName.toLowerCase() === "script") {
              const oldScript = node as HTMLScriptElement;
              const newScript = document.createElement("script");

              Array.from(oldScript.attributes).forEach((attr) =>
                newScript.setAttribute(attr.name, attr.value)
              );

              if (oldScript.innerHTML) {
                newScript.text = oldScript.innerHTML;
              }

              if (newScript.src && newScript.src.includes("quge5.com")) {
                targetScriptFound = true;
                newScript.onload = () => {
                  clearTimeout(fallbackTimeout);
                  if (isMounted) setAdState("allowed");
                };
                newScript.onerror = () => {
                  clearTimeout(fallbackTimeout);
                  if (isMounted) setAdState("blocked");
                };
              }

              container.appendChild(newScript);
            } else {
              container.appendChild(node.cloneNode(true));
            }
          });

          document.body.appendChild(container);

          if (targetScriptFound) {
            // Fallback: if neither onload nor onerror fires within 4.5s,
            // treat as blocked (e.g. DNS-level filtering that hangs requests)
            fallbackTimeout = setTimeout(() => {
              if (isMounted && initialized.current) {
                setAdState("blocked");
              }
            }, 4500);
          } else {
            if (isMounted) setAdState("allowed");
          }
        } else {
          if (isMounted) setAdState("allowed");
        }
      } catch (error) {
        console.error("[dMAT Practice Pro] Monetag initialization error:", error);
        if (isMounted) setAdState("allowed");
      }
    };

    initializeMonetag();

    // ── Cleanup: runs when pathname changes or component unmounts ─────────────
    return () => {
      isMounted = false;
      clearTimeout(fallbackTimeout);
      initialized.current = false;
      cleanupMonetagResources();
    };
  }, [location.pathname]);

  // ─── Interaction blocking when gate is active ─────────────────────────────
  useEffect(() => {
    if (adState !== "blocked") {
      return;
    }

    // Mark the React root as inert — this completely blocks all pointer events,
    // keyboard focus, and assistive-technology access to the background content.
    // The gate portal is a sibling of #root in document.body, so it remains
    // fully interactive.
    const appRoot = document.getElementById("root");
    if (appRoot) {
      appRoot.setAttribute("inert", "");
    }

    // Keyboard guard at the capture phase:
    //   Escape  → blocked (no hidden dismiss path)
    //   Tab     → focus-trapped on the Refresh button
    //   Other   → pass through (Enter/Space for the button still work)
    const handleKeyDown = (e: KeyboardEvent) => {
      if (e.key === "Escape") {
        e.preventDefault();
        e.stopPropagation();
        return;
      }
      if (e.key === "Tab") {
        e.preventDefault();
        e.stopPropagation();
        refreshButtonRef.current?.focus();
        return;
      }
    };

    document.addEventListener("keydown", handleKeyDown, { capture: true });

    // Move initial focus to the Refresh button
    const focusTimer = setTimeout(() => {
      refreshButtonRef.current?.focus();
    }, 50);

    return () => {
      if (appRoot) {
        appRoot.removeAttribute("inert");
      }
      document.removeEventListener("keydown", handleKeyDown, { capture: true });
      clearTimeout(focusTimer);
    };
  }, [adState]);

  if (adState !== "blocked") {
    return null;
  }

  // ─── Render via portal — gate is a sibling of #root ──────────────────────
  // This lets us safely apply `inert` to #root without affecting the gate.
  const gate = (
    <>
      {/*
        Layer 1 — glass interaction-blocking overlay
        Covers the entire viewport. Captures all stray pointer/touch events.
        Light translucent background + mild blur keeps the page recognizable.
      */}
      <div
        aria-hidden="true"
        style={{
          position: "fixed",
          inset: 0,
          zIndex: 9998,
          backgroundColor: "rgba(255, 255, 255, 0.25)",
          backdropFilter: "blur(6px)",
          WebkitBackdropFilter: "blur(6px)",
          pointerEvents: "auto",
        }}
      />

      {/*
        Layer 2 — modal card
        Viewport-fixed center: position:fixed relative to viewport, not document.
        Stays centered regardless of page scroll position.
      */}
      <div
        role="alertdialog"
        aria-modal="true"
        aria-labelledby="adblock-gate-title"
        aria-describedby="adblock-gate-desc"
        style={{
          position: "fixed",
          top: "50%",
          left: "50%",
          transform: "translate(-50%, -50%)",
          zIndex: 9999,
          width: "100%",
          maxWidth: "26rem",
          padding: "1rem",
          pointerEvents: "auto",
          boxSizing: "border-box",
        }}
      >
        <div
          className="rounded-2xl border bg-card p-6 shadow-xl"
          style={{ pointerEvents: "auto" }}
        >
          <div className="flex flex-col items-center text-center space-y-4">
            {/* Icon */}
            <div className="flex h-12 w-12 items-center justify-center rounded-full bg-destructive/10 text-destructive">
              <AlertTriangle className="h-6 w-6" />
            </div>

            {/* Text */}
            <div className="space-y-2">
              <h2
                id="adblock-gate-title"
                className="text-xl font-semibold tracking-tight text-foreground"
              >
                Please Disable Your Ad Blocker
              </h2>
              <p
                id="adblock-gate-desc"
                className="text-sm text-muted-foreground leading-relaxed"
              >
                Ads help us keep dMAT Practice Pro free. Please disable your ad
                blocker or private DNS to continue using the website.
              </p>
              <p className="text-sm text-muted-foreground leading-relaxed">
                After turning off your ad blocker or private DNS, please refresh
                the page.
              </p>
            </div>

            {/* Refresh button — the ONLY interactive control while gate is active */}
            <button
              ref={refreshButtonRef}
              onClick={() => window.location.reload()}
              className="inline-flex h-10 w-full items-center justify-center rounded-md bg-primary px-8 text-sm font-medium text-primary-foreground shadow transition-colors hover:bg-primary/90 focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring"
            >
              <RefreshCw className="mr-2 h-4 w-4" />
              Refresh Page
            </button>
          </div>
        </div>
      </div>
    </>
  );

  // Mount portal directly into document.body — sibling of #root
  return typeof document !== "undefined"
    ? createPortal(gate, document.body)
    : null;
}
