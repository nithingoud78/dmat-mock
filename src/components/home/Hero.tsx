import { Link } from "@tanstack/react-router";
import { Button } from "@/components/ui/button";
import { ArrowRight, Sparkles } from "lucide-react";

export function Hero() {
  return (
    <section className="rounded-3xl border bg-card p-8 shadow-card sm:p-12">
      <div className="inline-flex items-center gap-2 rounded-full border bg-secondary px-3 py-1 text-xs font-medium text-secondary-foreground">
        <Sparkles className="h-3.5 w-3.5" /> Built for the 2026 dMAT format
      </div>
      <h1 className="mt-5 text-3xl font-semibold tracking-tight text-foreground sm:text-5xl">
        Master the dMAT. Secure your APS.
      </h1>
      <p className="mt-4 max-w-2xl text-base text-muted-foreground sm:text-lg">
        The definitive preparation platform for the Digital Master Assessment Test (dMAT). 
        Practice with mathematically accurate procedural generations of the official g.a.s.t. question formats.
      </p>
      <div className="mt-8 flex flex-wrap gap-3">
        <Button asChild size="lg">
          <Link to="/mock/complete">
            Start Complete Mock <ArrowRight className="ml-2 h-4 w-4" />
          </Link>
        </Button>
        <Button asChild size="lg" variant="outline">
          <a href="#modules">Practice by Section</a>
        </Button>
      </div>
    </section>
  );
}
