import { createFileRoute } from "@tanstack/react-router";
import { PracticeModulePage } from "@/components/PracticeModulePage";

export const Route = createFileRoute("/practice/figure-sequences")({
  head: () => ({
    meta: [
      { title: "Figure Sequences Practice — dMAT Practice Pro" },
      {
        name: "description",
        content: "Practice dMAT Figure Sequence questions with timed and untimed modes.",
      },
      { property: "og:title", content: "Figure Sequences Practice" },
      {
        property: "og:description",
        content: "Timed and untimed Figure Sequence drills for the dMAT.",
      },
    ],
  }),
  component: () => <PracticeModulePage moduleId="figure_sequence" />,
});
