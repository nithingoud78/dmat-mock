import { useEffect } from "react";
import type { ReactNode } from "react";

export function ExamLayout({ children }: { children: ReactNode }) {
  useEffect(() => {
    // ----------------------------------------------------------------------
    // URGENT SECURITY / AD-BLOCKING MEASURE
    // ----------------------------------------------------------------------
    // Monetag's MultiTag uses popunders that attach persistent global onClick 
    // handlers to the window/document. Because this is an SPA, these handlers 
    // survive React unmounts and route transitions.
    // To absolutely guarantee zero popunders during an active test, we hijack 
    // window.open for the duration of the exam.
    // ----------------------------------------------------------------------
    if (typeof window === 'undefined') return;

    const originalOpen = window.open;

    window.open = function (...args) {
      console.warn("[dMAT Practice Pro] Blocked Monetag popunder attempt during active exam.");
      return null;
    };

    return () => {
      // Restore original behavior when leaving the exam
      window.open = originalOpen;
    };
  }, []);

  return (
    <div className="min-h-screen bg-background">
      <main className="min-h-screen pb-16 pt-6">{children}</main>
    </div>
  );
}
