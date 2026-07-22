import { createFileRoute } from "@tanstack/react-router";
import { PracticeModulePage } from "@/components/PracticeModulePage";

export const Route = createFileRoute("/practice/subject-module")({
  head: () => ({
    meta: [
      { title: "General Academic — dMAT Practice Pro" },
      {
        name: "description",
        content:
          "Practice the General Academic section of the dMAT: reading comprehension, logical reasoning, data interpretation and applied problem solving.",
      },
    ],
  }),
  component: GeneralAcademicPracticePage,
});

function GeneralAcademicPracticePage() {
  return <PracticeModulePage moduleId="general_academic" />;
}
