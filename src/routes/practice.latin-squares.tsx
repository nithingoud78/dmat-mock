import { createFileRoute } from "@tanstack/react-router";
import { PracticeModulePage } from "@/components/PracticeModulePage";

export const Route = createFileRoute("/practice/latin-squares")({
  head: () => ({
    meta: [
      { title: "Latin Squares Practice — dMAT Practice Pro" },
      {
        name: "description",
        content: "Practice dMAT Latin Square puzzles — constraint reasoning under time.",
      },
      { property: "og:title", content: "Latin Squares Practice" },
      { property: "og:description", content: "Timed Latin Square drills for the dMAT." },
    ],
  }),
  component: () => <PracticeModulePage moduleId="latin_square" />,
});
