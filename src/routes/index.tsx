import { createFileRoute } from "@tanstack/react-router";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { PublicLayout } from "@/components/PublicLayout";

import { Hero } from "@/components/home/Hero";
import { LiveStats } from "@/components/home/LiveStats";
import { AboutDMAT } from "@/components/home/AboutDMAT";
import { Eligibility } from "@/components/home/Eligibility";
import { ExamPattern } from "@/components/home/ExamPattern";
import { PracticeAppFeatures } from "@/components/home/PracticeAppFeatures";
import { Timeline } from "@/components/home/Timeline";
import { RulesAndTypes } from "@/components/home/RulesAndTypes";
import { Scoring } from "@/components/home/Scoring";
import { PrepAndStrategies } from "@/components/home/PrepAndStrategies";
import { FAQ } from "@/components/home/FAQ";
import { OfficialResources } from "@/components/home/OfficialResources";
import { Footer } from "@/components/Footer";
import { CMSProvider } from "@/lib/cms";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "dMAT Practice Pro — Serious practice for the g.a.s.t. dMAT" },
      {
        name: "description",
        content:
          "Realistic timed mocks, section drills, and analytics for the g.a.s.t. dMAT used in Germany's APS process.",
      },
      { property: "og:title", content: "dMAT Practice Pro" },
      {
        property: "og:description",
        content: "Realistic timed practice for the dMAT exam.",
      },
    ],
  }),
  component: Home,
});

function Home() {
  const { data: stats } = useQuery({
    queryKey: ["homepage_stats"],
    queryFn: async () => {
      const { count: qCount } = await supabase
        .from("questions")
        .select("*", { count: "exact", head: true });
      const { count: mCount } = await supabase
        .from("mock_sets")
        .select("*", { count: "exact", head: true });
      const { count: aCount } = await supabase
        .from("test_attempts")
        .select("*", { count: "exact", head: true });

      const { count: figCount } = await supabase
        .from("questions")
        .select("*", { count: "exact", head: true })
        .eq("module", "figure_sequence");
      const { count: mathCount } = await supabase
        .from("questions")
        .select("*", { count: "exact", head: true })
        .eq("module", "math_equation");
      const { count: latinCount } = await supabase
        .from("questions")
        .select("*", { count: "exact", head: true })
        .eq("module", "latin_square");
      const { count: gaCount } = await supabase
        .from("questions")
        .select("*", { count: "exact", head: true })
        .eq("module", "general_academic");

      return {
        questions: qCount ?? 0,
        mocks: mCount ?? 0,
        attempts: aCount ?? 0,
        figure: figCount ?? 0,
        math: mathCount ?? 0,
        latin: latinCount ?? 0,
        general: gaCount ?? 0,
      };
    },
  });

  return (
    <CMSProvider page="home">
      <PublicLayout>
        <HomeBody stats={stats || { figure: 0, math: 0, latin: 0, general: 0 }} />
        <Footer />
      </PublicLayout>
    </CMSProvider>
  );
}

function HomeBody({
  stats,
}: {
  stats: {
    figure: number;
    math: number;
    latin: number;
    general: number;
  };
}) {
  return (
    <div className="mx-auto max-w-6xl px-4 py-10 sm:py-14 md:px-8 space-y-8">
      <Hero />
      <LiveStats stats={stats} />
      <AboutDMAT />
      <Eligibility />
      <PracticeAppFeatures />
      <div id="modules" className="scroll-mt-24">
        <ExamPattern />
      </div>
      <Timeline />
      <RulesAndTypes />
      <Scoring />
      <PrepAndStrategies />
      <FAQ />
      <OfficialResources />
    </div>
  );
}
