import { Link, useRouterState } from "@tanstack/react-router";
import {
  Home,
  PuzzleIcon,
  DivideIcon,
  Grid3x3,
  BookOpen,
  Target,
  LogIn,
  LogOut,
  ShieldCheck,
  GraduationCap,
  MessageSquare,
} from "lucide-react";
import type { ReactNode } from "react";
import {
  Sidebar,
  SidebarContent,
  SidebarGroup,
  SidebarGroupContent,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarProvider,
  SidebarTrigger,
  SidebarFooter,
  SidebarHeader,
} from "@/components/ui/sidebar";
import { Badge } from "@/components/ui/badge";
import { useAuth } from "@/lib/auth";
import { Button } from "@/components/ui/button";

const items = [
  { title: "Home", url: "/", icon: Home },
  { title: "Figure Sequences", url: "/practice/figure-sequences", icon: PuzzleIcon },
  { title: "Mathematical Equations", url: "/practice/mathematical-equations", icon: DivideIcon },
  { title: "Latin Squares", url: "/practice/latin-squares", icon: Grid3x3 },
  { title: "Subject Module", url: "/practice/subject-module", icon: BookOpen },
  { title: "Complete Mock", url: "/mock/complete", icon: Target },
  { title: "Feedback", url: "/feedback", icon: MessageSquare },
] as const;

function AppSidebar() {
  const pathname = useRouterState({ select: (r) => r.location.pathname });
  const { user, isAdmin, signOut } = useAuth();

  return (
    <Sidebar>
      <SidebarHeader className="border-b px-5 py-5">
        <Link to="/" className="flex items-center gap-2.5">
          <div className="grid h-9 w-9 place-items-center rounded-xl bg-primary text-primary-foreground text-sm font-bold shadow-sm">
            <GraduationCap className="h-5 w-5" />
          </div>
          <div className="min-w-0">
            <div className="text-sm font-semibold leading-tight text-foreground">
              dMAT Practice Pro
            </div>
            <div className="text-xs text-muted-foreground">Personal exam prep</div>
          </div>
        </Link>
      </SidebarHeader>

      <SidebarContent className="px-2 py-3">
        <SidebarGroup>
          <SidebarGroupContent>
            <SidebarMenu>
              {items.map((item) => {
                const active =
                  item.url === "/"
                    ? pathname === "/"
                    : pathname === item.url || pathname.startsWith(item.url + "/");
                return (
                  <SidebarMenuItem key={item.url}>
                    <SidebarMenuButton asChild isActive={active} className="h-10">
                      <Link to={item.url} className="flex items-center gap-3">
                        <item.icon className="h-4 w-4 shrink-0" />
                        <span className="truncate">{item.title}</span>
                        {/* "comingSoon" badge removed */}
                        {item.url === "/mock/complete" && (
                          <Badge className="ml-auto text-[10px] font-medium bg-primary/15 text-primary border-primary/30">
                            Free
                          </Badge>
                        )}
                      </Link>
                    </SidebarMenuButton>
                  </SidebarMenuItem>
                );
              })}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>

      {user && isAdmin && (
        <SidebarFooter className="border-t p-3">
          <div className="space-y-2">
            <Button asChild variant="outline" size="sm" className="w-full justify-start">
              <Link to="/admin/home">
                <ShieldCheck className="mr-2 h-4 w-4" /> Admin
              </Link>
            </Button>
            <div className="flex items-center justify-between gap-2 px-2 text-xs text-muted-foreground">
              <span className="truncate">{user.email}</span>
              <button
                onClick={signOut}
                className="text-foreground hover:text-primary transition-colors"
                aria-label="Sign out"
              >
                <LogOut className="h-4 w-4" />
              </button>
            </div>
          </div>
        </SidebarFooter>
      )}
    </Sidebar>
  );
}

export function PublicLayout({ children }: { children: ReactNode }) {
  return (
    <SidebarProvider>
      <div className="flex min-h-screen w-full bg-background">
        <AppSidebar />
        <div className="flex min-w-0 flex-1 flex-col">
          <header className="sticky top-0 z-30 flex h-14 items-center gap-3 border-b bg-background/80 px-4 backdrop-blur supports-[backdrop-filter]:bg-background/60">
            <SidebarTrigger className="shrink-0" />
            <div className="flex items-center gap-2 min-w-0">
              <span className="text-sm font-semibold text-foreground truncate">
                dMAT Practice Pro
              </span>
              <Badge variant="secondary" className="text-[10px] shrink-0">
                2026 format
              </Badge>
            </div>
            <div className="ml-auto flex items-center gap-2">
              <a
                href="https://www.d-mat.de"
                target="_blank"
                rel="noreferrer"
                className="hidden text-xs text-muted-foreground hover:text-foreground transition-colors sm:block"
              >
                Official: d-mat.de ↗
              </a>
            </div>
          </header>
          <main className="flex-1">{children}</main>
          <footer className="border-t px-6 py-4 text-xs text-muted-foreground">
            dMAT Practice Pro is an independent personal-use tool. Not affiliated with g.a.s.t. or
            APS.
          </footer>
        </div>
      </div>
    </SidebarProvider>
  );
}
