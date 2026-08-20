import { Link } from "@tanstack/react-router";
import { Button } from "@/components/ui/button";
import { ArrowRight, Sparkles } from "lucide-react";
import { useCMS } from "@/lib/cms";

export function Hero() {
  const { get } = useCMS("hero");

  return (
    <section className="rounded-3xl border bg-card p-8 shadow-card sm:p-12">
      <div className="inline-flex items-center gap-2 rounded-full border bg-secondary px-3 py-1 text-xs font-medium text-secondary-foreground">
        <Sparkles className="h-3.5 w-3.5" /> {get("badge", "Built for the 2026 dMAT format")}
      </div>
      
      <h1 className="mt-5 text-3xl font-semibold tracking-tight text-foreground sm:text-5xl">
        {get("title_1", "Master the dMAT. Secure your APS.")}
      </h1>
      
      <p className="mt-4 max-w-2xl text-base text-muted-foreground sm:text-lg">
        {get("subtitle", "The definitive preparation platform for the Digital Master Assessment Test (dMAT). Practice with officially-aligned g.a.s.t. question formats.")}
      </p>
      
      <div className="mt-8 flex flex-wrap gap-3">
        <Button asChild size="lg">
          <Link to="/mock/complete">
            {get("primary_btn", "Start Complete Mock")} <ArrowRight className="ml-2 h-4 w-4" />
          </Link>
        </Button>
        <Button asChild size="lg" variant="outline">
          <a href="#modules">{get("secondary_btn", "Practice by Section")}</a>
        </Button>
      </div>
    </section>
  );
}
