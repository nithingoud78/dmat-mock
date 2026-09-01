import { useEffect, useRef, useState } from "react";
import { useLocation } from "@tanstack/react-router";
import { adsConfig } from "@/config/ads";
import { AlertTriangle, RefreshCw } from "lucide-react";
import { supabase } from "@/integrations/supabase/client";

type AdState = "checking_global_state" | "checking" | "allowed" | "blocked" | "idle";

export function MonetagIntegration() {
  const initialized = useRef(false);
  const location = useLocation();
  const [adState, setAdState] = useState<AdState>("idle");

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
      !isAllowedRoute
    ) {
      setAdState("idle");
      return;
    }

    // If we've already initialized for this route, don't run again.
    if (document.getElementById("monetag-container")) {
      return;
    }

    setAdState("checking_global_state");
    
    let isMounted = true;
    let fallbackTimeout: NodeJS.Timeout;
    
    const initializeMonetag = async () => {
      try {
        const { data, error } = await supabase.rpc('get_effective_site_settings');
        
        if (!isMounted) return;

        if (error) {
          console.error("[dMAT Practice Pro] Failed to fetch global ad settings:", error);
          // Fail open so we don't break the site due to DB issue, but assume allowed
          setAdState("allowed");
          return;
        }

        // Check the effective setting
        if (data && data.length > 0 && data[0].ads_enabled === false) {
          // Global ads are OFF. Do not initialize Monetag or the ad-block gate.
          setAdState("idle");
          return;
        }

        // Global ads are ON. Proceed with normal injection.
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

        if (monetagRawHtml.trim() && !monetagRawHtml.includes("PASTE MONETAG SCRIPT TAGS HERE")) {
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

    return () => {
      isMounted = false;
      clearTimeout(fallbackTimeout);
      const el = document.getElementById("monetag-container");
      if (el) {
        el.remove();
      }
      initialized.current = false;

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
      } catch (e) {
        console.error("Error during Monetag cleanup:", e);
      }
    };
  }, [location.pathname]);

  useEffect(() => {
    if (adState === "blocked") {
      const handleKeyDown = (e: KeyboardEvent) => {
        e.preventDefault();
        e.stopPropagation();
      };
      
      document.body.style.overflow = 'hidden';
      document.addEventListener('keydown', handleKeyDown, { capture: true });
      
      return () => {
        document.body.style.overflow = '';
        document.removeEventListener('keydown', handleKeyDown, { capture: true });
      };
    } else {
      document.body.style.overflow = '';
    }
  }, [adState]);

  if (adState !== "blocked") {
    return null;
  }

  return (
    <div 
      className="fixed inset-0 z-[9999] flex items-center justify-center bg-background/95 backdrop-blur-sm p-4 pointer-events-auto"
      onKeyDown={(e) => {
        e.preventDefault();
        e.stopPropagation();
      }}
    >
      <div 
        className="w-full max-w-md rounded-2xl border bg-card p-6 shadow-xl"
        role="alertdialog"
        aria-modal="true"
      >
        <div className="flex flex-col items-center text-center space-y-4">
          <div className="flex h-12 w-12 items-center justify-center rounded-full bg-destructive/10 text-destructive">
            <AlertTriangle className="h-6 w-6" />
          </div>
          
          <div className="space-y-2">
            <h2 className="text-xl font-semibold tracking-tight text-foreground">
              Please Disable Your Ad Blocker
            </h2>
            <p className="text-sm text-muted-foreground leading-relaxed">
              Ads help us keep dMAT Practice Pro free. Please disable your ad blocker to continue using the website.
            </p>
            <p className="text-sm text-muted-foreground leading-relaxed mt-2">
              After turning off your ad blocker, please refresh the page.
            </p>
          </div>

          <button
            onClick={() => window.location.reload()}
            className="inline-flex h-10 w-full items-center justify-center rounded-md bg-primary px-8 text-sm font-medium text-primary-foreground shadow transition-colors hover:bg-primary/90 focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring"
          >
            <RefreshCw className="mr-2 h-4 w-4" />
            Refresh Page
          </button>
        </div>
      </div>
    </div>
  );
}
