import { Card } from "@/components/ui/card";

export function Timeline() {
  return (
    <section>
      <Card className="p-7 shadow-card">
        <h2 className="text-lg font-semibold mb-6">Official Exam Timeline</h2>
        <div className="flex flex-col md:flex-row gap-4 items-center justify-between text-center relative">
          <div className="absolute top-1/2 left-0 w-full h-1 bg-secondary hidden md:block -z-10 -translate-y-1/2"></div>
          
          <div className="bg-card border p-3 rounded-xl shadow-sm z-10 w-full md:w-auto">
            <div className="text-xs font-bold text-primary mb-1">Check-in</div>
            <div className="text-[10px] text-muted-foreground">ID Verification</div>
          </div>
          <div className="bg-card border-2 border-primary p-3 rounded-xl shadow-sm z-10 w-full md:w-auto">
            <div className="text-xs font-bold text-primary mb-1">Core Module</div>
            <div className="text-[10px] text-muted-foreground">75 mins + 4 mins transition</div>
          </div>
          <div className="bg-secondary/50 border p-3 rounded-xl shadow-sm z-10 w-full md:w-auto">
            <div className="text-xs font-bold text-muted-foreground mb-1">Break</div>
            <div className="text-[10px] text-muted-foreground">30 Minutes</div>
          </div>
          <div className="bg-card border-2 border-primary p-3 rounded-xl shadow-sm z-10 w-full md:w-auto">
            <div className="text-xs font-bold text-primary mb-1">Subject Module</div>
            <div className="text-[10px] text-muted-foreground">General Academic (90 mins)</div>
          </div>
          <div className="bg-card border p-3 rounded-xl shadow-sm z-10 w-full md:w-auto">
            <div className="text-xs font-bold text-primary mb-1">Completion</div>
            <div className="text-[10px] text-muted-foreground">~3.5 Total Hours</div>
          </div>
        </div>
      </Card>
    </section>
  );
}
