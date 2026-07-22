import type { ReactNode } from "react";

export function ExamLayout({ children }: { children: ReactNode }) {
  return (
    <div className="min-h-screen bg-background">
      <main className="min-h-screen pb-16 pt-6">{children}</main>
    </div>
  );
}
