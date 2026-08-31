import { useEffect, useRef } from "react";
import { useLocation } from "@tanstack/react-router";
import { adsConfig } from "@/config/ads";

export function MonetagIntegration() {
  const initialized = useRef(false);
  const location = useLocation();

  useEffect(() => {
    // STRICT ALLOWLIST
    // Monetag MultiTag is allowed ONLY on these exact public pages.
    const ADS_ALLOWED_ROUTES = [
      "/",
      "/about",
      "/feedback",
      "/privacy-policy",
      "/terms-and-conditions",
      "/cookie-policy",
      "/disclaimer"
    ];

    const path = location.pathname;
    const isAllowedRoute = ADS_ALLOWED_ROUTES.includes(path);

    // Only run if Monetag is enabled, running on the client, and we ARE exactly on an allowlisted route
    if (
      !adsConfig.adsEnabled || 
      !adsConfig.monetagEnabled || 
      typeof window === "undefined" || 
      initialized.current ||
      !isAllowedRoute
    ) {
      return;
    }

    // Check if the script container is already in the DOM
    if (document.getElementById("monetag-container")) return;

    initialized.current = true;

    const container = document.createElement("div");
    container.id = "monetag-container";
    // Hide the container to ensure it doesn't break layout
    container.style.display = "none";
    container.style.visibility = "hidden";
    container.style.width = "0";
    container.style.height = "0";

    /*
     * ==========================================
     * MONETAG CONFIGURATION POINT
     * ==========================================
     * To enable Monetag:
     * 1. Set `monetagEnabled: true` in `src/config/ads.ts`
     * 2. Paste your EXACT Monetag tag code provided in your dashboard below.
     * Do NOT modify the code Monetag provides.
     * ==========================================
     */
    const monetagRawHtml = `
      <script src="https://quge5.com/88/tag.min.js" data-zone="275091" async data-cfasync="false"></script>
    `;

    if (monetagRawHtml.trim() && !monetagRawHtml.includes("PASTE MONETAG SCRIPT TAGS HERE")) {
      try {
        const tempDiv = document.createElement("div");
        tempDiv.innerHTML = monetagRawHtml.trim();
        
        // Recreate script tags so the browser evaluates and executes them
        Array.from(tempDiv.childNodes).forEach((node) => {
          if (node.nodeName.toLowerCase() === "script") {
            const oldScript = node as HTMLScriptElement;
            const newScript = document.createElement("script");
            
            // Copy all attributes (like src, data-cfasync, etc.)
            Array.from(oldScript.attributes).forEach((attr) => 
              newScript.setAttribute(attr.name, attr.value)
            );
            
            // Copy inline script content if any
            if (oldScript.innerHTML) {
              newScript.text = oldScript.innerHTML;
            }
            
            container.appendChild(newScript);
          } else {
            container.appendChild(node.cloneNode(true));
          }
        });

        document.body.appendChild(container);
      } catch (error) {
        console.error("[dMAT Practice Pro] Monetag initialization error:", error);
      }
    }

    return () => {
      // Remove the container when unmounting (e.g., navigating to Admin route or ExamLayout)
      const el = document.getElementById("monetag-container");
      if (el) {
        el.remove();
      }
      initialized.current = false;

      // Aggressively clean up any lingering elements injected by Monetag to guarantee active tests are ad-free
      try {
        const adSelectors = [
          'script[src*="monetag"]',
          'script[src*="realsrv"]',
          'script[src*="quge5.com"]',
          'iframe[src*="monetag"]',
          'iframe[src*="realsrv"]',
          'iframe[src*="quge5.com"]',
        ];
        document.querySelectorAll(adSelectors.join(', ')).forEach(node => node.remove());
        
        // Remove any vignette overlays or popunder triggers that might have been added to body
        // Monetag often uses specific classes or ids, but we can't know for sure, so we remove the scripts.
        // We can also clear all global event listeners if possible, but removing scripts and iframes is usually enough.
      } catch (e) {
        console.error("Error during Monetag cleanup:", e);
      }
    };
  }, [location.pathname]);

  return null;
}
