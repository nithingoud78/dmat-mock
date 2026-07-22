import { createFileRoute } from "@tanstack/react-router";
import { PracticeModulePage } from "@/components/PracticeModulePage";

export const Route = createFileRoute("/practice/mathematical-equations")({
  head: () => ({
    meta: [
      { title: "Mathematical Equations Practice — dMAT Practice Pro" },
      {
        name: "description",
        content: "Practice dMAT Mathematical Equations with real exam pacing.",
      },
      { property: "og:title", content: "Mathematical Equations Practice" },
      {
        property: "og:description",
        content: "Timed math equation drills for the dMAT — no calculator.",
      },
    ],
  }),
  component: () => <PracticeModulePage moduleId="math_equation" />,
});
