import { Link, useNavigate, useRouterState } from "@tanstack/react-router";
import { useEffect, type ReactNode } from "react";
import { useAuth } from "@/lib/auth";
import { Button } from "@/components/ui/button";
import { BarChart3, FileQuestion, Home, LogOut, ShieldCheck, LayoutDashboard, MessageSquare } from "lucide-react";
import { cn } from "@/lib/utils";

export function AdminLayout({ children }: { children: ReactNode }) {
  const { user, isAdmin, loading, signOut } = useAuth();
  const navigate = useNavigate();
  const pathname = useRouterState({ select: (r) => r.location.pathname });

  useEffect(() => {
    if (loading) return;
    if (!user) navigate({ to: "/auth" });
    else if (!isAdmin) navigate({ to: "/" });
  }, [loading, user, isAdmin, navigate]);

  if (loading || !user || !isAdmin) {
    return (
      <div className="flex min-h-screen items-center justify-center text-sm text-muted-foreground">
        Checking access…
      </div>
    );
  }

  const items = [
    { to: "/admin/dashboard", label: "Dashboard", icon: LayoutDashboard },
    { to: "/admin/homepage", label: "Homepage Editor", icon: Home },
    { to: "/admin/legal", label: "Legal Pages", icon: FileQuestion },
    { to: "/admin/questions", label: "Questions", icon: FileQuestion },
    { to: "/admin/analytics", label: "Analytics", icon: BarChart3 },
    { to: "/admin/feedback", label: "Feedback", icon: MessageSquare },
  ] as const;

  return (
    <div className="flex min-h-screen bg-secondary/40">
      <aside className="hidden w-64 shrink-0 border-r bg-card md:block">
        <div className="flex items-center gap-2 border-b px-5 py-5">
          <div className="grid h-9 w-9 place-items-center rounded-xl bg-primary text-primary-foreground text-sm font-bold">
            <ShieldCheck className="h-4 w-4" />
          </div>
          <div>
            <div className="text-sm font-semibold">Admin</div>
            <div className="text-xs text-muted-foreground">dMAT Practice Pro</div>
          </div>
        </div>
        <nav className="p-3">
          {items.map((it) => {
            const active = pathname.startsWith(it.to);
            return (
              <Link
                key={it.to}
                to={it.to}
                className={cn(
                  "flex items-center gap-3 rounded-lg px-3 py-2 text-sm",
                  active
                    ? "bg-primary text-primary-foreground"
                    : "text-foreground hover:bg-secondary",
                )}
              >
                <it.icon className="h-4 w-4" /> {it.label}
              </Link>
            );
          })}
        </nav>
        <div className="mt-4 border-t p-3">
          <Button variant="outline" size="sm" className="w-full justify-start" onClick={signOut}>
            <LogOut className="mr-2 h-4 w-4" /> Sign out
          </Button>
          <Button asChild variant="ghost" size="sm" className="mt-2 w-full justify-start">
            <Link to="/">← Back to app</Link>
          </Button>
        </div>
      </aside>
      <main className="min-w-0 flex-1">{children}</main>
    </div>
  );
}
