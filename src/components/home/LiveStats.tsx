import { Card } from "@/components/ui/card";

export function LiveStats({
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
    <section className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
      <Card className="flex flex-col items-center justify-center p-6 text-center shadow-card bg-card/60 backdrop-blur-sm border-primary/20">
        <div className="text-3xl font-bold text-primary">{stats.figure.toLocaleString()}</div>
        <div className="mt-1 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
          Figure Questions
        </div>
      </Card>
      <Card className="flex flex-col items-center justify-center p-6 text-center shadow-card bg-card/60 backdrop-blur-sm border-primary/20">
        <div className="text-3xl font-bold text-primary">{stats.math.toLocaleString()}</div>
        <div className="mt-1 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
          Math Questions
        </div>
      </Card>
      <Card className="flex flex-col items-center justify-center p-6 text-center shadow-card bg-card/60 backdrop-blur-sm border-primary/20">
        <div className="text-3xl font-bold text-primary">{stats.latin.toLocaleString()}</div>
        <div className="mt-1 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
          Latin Questions
        </div>
      </Card>
      <Card className="flex flex-col items-center justify-center p-6 text-center shadow-card bg-card/60 backdrop-blur-sm border-primary/20">
        <div className="text-3xl font-bold text-primary">{stats.general.toLocaleString()}</div>
        <div className="mt-1 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
          General Academic Qs
        </div>
      </Card>
    </section>
  );
}
