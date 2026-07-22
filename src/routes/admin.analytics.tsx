import { createFileRoute } from "@tanstack/react-router";
import { useMemo, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { Card } from "@/components/ui/card";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { supabase } from "@/integrations/supabase/client";
import { MODULES } from "@/lib/modules";
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid } from "recharts";

export const Route = createFileRoute("/admin/analytics")({
  head: () => ({
    meta: [
      { title: "Admin · Analytics — dMAT Practice Pro" },
      { name: "robots", content: "noindex" },
    ],
  }),
  component: AdminAnalytics,
});

type Range = "1" | "7" | "30" | "all";

function AdminAnalytics() {
  const [range, setRange] = useState<Range>("7");

  const since = useMemo(() => {
    if (range === "all") return null;
    const d = new Date();
    d.setDate(d.getDate() - (range === "1" ? 0 : parseInt(range)));
    if (range === "1") d.setHours(0, 0, 0, 0);
    return d.toISOString();
  }, [range]);

  const { data } = useQuery({
    queryKey: ["analytics", range],
    queryFn: async () => {
      let ap = supabase.from("test_attempts").select("*");
      if (since) ap = ap.gte("started_at", since);
      const { data: attempts = [] } = await ap;
      const { count: totalUsers = 0 } = await supabase
        .from("profiles")
        .select("id", { count: "exact", head: true });
      return { attempts: attempts ?? [], totalUsers: totalUsers ?? 0 };
    },
  });

  const attempts = data?.attempts ?? [];
  const started = attempts.length;
  const completed = attempts.filter((a: any) => a.status === "submitted").length;
  const avgScore = completed
    ? Math.round(
        attempts
          .filter((a: any) => a.score != null)
          .reduce((s: number, a: any) => s + (a.score || 0), 0) / completed,
      )
    : 0;
  const avgDuration = completed
    ? Math.round(
        attempts
          .filter((a: any) => a.duration_seconds)
          .reduce((s: number, a: any) => s + (a.duration_seconds || 0), 0) / completed,
      )
    : 0;
  const completionRate = started ? Math.round((completed / started) * 100) : 0;

  const byModule = Object.keys(MODULES).map((mid) => {
    const rows = attempts.filter((a: any) => a.module === mid);
    return {
      name: MODULES[mid as keyof typeof MODULES].label.split(" ")[0],
      Started: rows.length,
      Completed: rows.filter((r: any) => r.status === "submitted").length,
    };
  });
  const mostPracticed = [...byModule].sort((a, b) => b.Started - a.Started)[0];

  return (
    <>
      <div className="mx-auto max-w-6xl p-6 md:p-8">
        <div className="mb-6 flex flex-wrap items-center justify-between gap-3">
          <h1 className="text-2xl font-semibold">Analytics</h1>
          <div className="w-40">
            <Select value={range} onValueChange={(v: Range) => setRange(v)}>
              <SelectTrigger>
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="1">Today</SelectItem>
                <SelectItem value="7">Last 7 days</SelectItem>
                <SelectItem value="30">Last 30 days</SelectItem>
                <SelectItem value="all">All time</SelectItem>
              </SelectContent>
            </Select>
          </div>
        </div>

        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          <Stat label="Total users" value={String(data?.totalUsers ?? 0)} />
          <Stat label="Tests started" value={String(started)} />
          <Stat label="Tests completed" value={`${completed} (${completionRate}%)`} />
          <Stat label="Avg score" value={`${avgScore}/200`} />
        </div>

        <div className="mt-6 grid gap-6 lg:grid-cols-3">
          <Card className="p-6 shadow-card lg:col-span-2">
            <div className="mb-4 text-sm font-semibold">Attempts by module</div>
            <div className="h-64">
              <ResponsiveContainer width="100%" height="100%">
                <BarChart data={byModule}>
                  <CartesianGrid strokeDasharray="3 3" stroke="var(--color-border)" />
                  <XAxis dataKey="name" stroke="var(--color-muted-foreground)" fontSize={12} />
                  <YAxis
                    stroke="var(--color-muted-foreground)"
                    fontSize={12}
                    allowDecimals={false}
                  />
                  <Tooltip />
                  <Bar dataKey="Started" fill="var(--color-primary)" radius={[8, 8, 0, 0]} />
                  <Bar dataKey="Completed" fill="var(--color-success)" radius={[8, 8, 0, 0]} />
                </BarChart>
              </ResponsiveContainer>
            </div>
          </Card>
          <Card className="p-6 shadow-card">
            <div className="text-sm font-semibold">Highlights</div>
            <ul className="mt-4 space-y-3 text-sm">
              <li>
                <span className="text-muted-foreground">Most practiced:</span>{" "}
                <span className="font-medium">{mostPracticed?.name ?? "—"}</span>
              </li>
              <li>
                <span className="text-muted-foreground">Avg completion time:</span>{" "}
                {Math.round(avgDuration / 60)} min
              </li>
              <li>
                <span className="text-muted-foreground">Completion rate:</span> {completionRate}%
              </li>
            </ul>
          </Card>
        </div>

        <Card className="mt-6 p-6 shadow-card">
          <div className="mb-3 text-sm font-semibold">Recent activity</div>
          <div className="divide-y">
            {attempts.slice(0, 15).map((a: any) => (
              <div
                key={a.id}
                className="flex flex-wrap items-center justify-between gap-2 py-3 text-sm"
              >
                <div>
                  <span className="font-medium">
                    {a.mode === "complete_mock" ? "Complete Mock" : `Section: ${a.module}`}
                  </span>
                  <span className="ml-2 text-xs text-muted-foreground">
                    {new Date(a.started_at).toLocaleString()}
                  </span>
                </div>
                <div className="text-xs text-muted-foreground">
                  {a.status === "submitted"
                    ? `Score ${a.score}/200 · ${a.accuracy}%`
                    : "In progress"}
                </div>
              </div>
            ))}
            {attempts.length === 0 && (
              <div className="py-6 text-center text-sm text-muted-foreground"></div>
            )}
          </div>
        </Card>
      </div>
    </>
  );
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <Card className="p-5 shadow-card">
      <div className="text-xs uppercase tracking-wide text-muted-foreground">{label}</div>
      <div className="mt-1 text-2xl font-semibold">{value}</div>
    </Card>
  );
}
