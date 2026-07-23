import { useEffect, useRef } from "react";
import { adsConfig, AdPlacement } from "@/config/ads";
import { cn } from "@/lib/utils";

interface AdSlotProps {
  placement: AdPlacement;
  slotId?: string; // The AdSense data-ad-slot ID
  className?: string;
  style?: React.CSSProperties;
}

export function AdSlot({ placement, slotId, className, style }: AdSlotProps) {
  const adRef = useRef<HTMLModElement>(null);

  useEffect(() => {
    if (adsConfig.adsEnabled && adsConfig.adsenseEnabled && adRef.current) {
      try {
        // @ts-ignore
        (window.adsbygoogle = window.adsbygoogle || []).push({});
      } catch (e) {
        console.error("AdSense error:", e);
      }
    }
  }, [placement]);

  // If ads are completely disabled, render nothing
  if (!adsConfig.adsEnabled) {
    return null;
  }

  // Determine placeholder height based on common ad dimensions to prevent layout shifts
  let defaultHeight = "min-h-[100px]"; // Banner
  if (placement === adsConfig.placements.Sidebar || placement === adsConfig.placements.ContentMiddle) {
    defaultHeight = "min-h-[250px]"; // Medium rectangle
  }

  if (adsConfig.adsenseEnabled) {
    return (
      <div className={cn("my-6 flex justify-center w-full overflow-hidden", defaultHeight, className)} style={style}>
        <ins
          ref={adRef}
          className="adsbygoogle"
          style={{ display: "block" }}
          data-ad-client={adsConfig.publisherId}
          data-ad-slot={slotId || ""}
          data-ad-format="auto"
          data-full-width-responsive="true"
        />
      </div>
    );
  }

  // Placeholder Mode
  return (
    <div className={cn("my-6 w-full flex items-center justify-center", defaultHeight, className)} style={style}>
      <div className="w-full h-full min-h-inherit border-2 border-dashed border-primary/20 rounded-lg bg-muted/30 p-6 flex flex-col items-center justify-center text-center">
        <div className="text-xs font-bold uppercase tracking-widest text-primary/40 mb-2">Advertisement</div>
        <h4 className="text-sm font-semibold text-muted-foreground mb-1">Google AdSense Placeholder</h4>
        <p className="text-xs text-muted-foreground/70 max-w-xs">
          This space will display educational advertisements after domain approval.
        </p>
      </div>
    </div>
  );
}
