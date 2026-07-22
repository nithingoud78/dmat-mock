import { createFileRoute, Link } from "@tanstack/react-router";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { LayoutDashboard, FileQuestion, Upload, Eye, Wrench } from "lucide-react";

export const Route = createFileRoute("/admin/dashboard")({
  head: () => ({
    meta: [
      { title: "Admin Dashboard — dMAT Practice Pro" },
      { name: "robots", content: "noindex" },
    ],
  }),
  component: AdminDashboard,
});

function AdminDashboard() {
  const links = [
    {
      title: "Question Management",
      description: "Manage, filter, and edit all questions in the bank.",
      icon: <FileQuestion className="h-6 w-6 text-primary" />,
      to: "/admin/questions",
    },
    {
      title: "Bulk Import",
      description: "Import questions using CSV.",
      icon: <Upload className="h-6 w-6 text-primary" />,
      to: "/admin/questions", // The bulk import is handled inside the questions page modal in Phase 2
    },
    {
      title: "Custom Test Builder",
      description: "Build a custom practice session.",
      icon: <Wrench className="h-6 w-6 text-primary" />,
      to: "/practice/custom",
    },
  ];

  return (
    <div className="mx-auto max-w-5xl p-6 md:p-8">
      <h1 className="text-3xl font-semibold tracking-tight">Admin Dashboard</h1>
      <p className="mt-2 text-muted-foreground">
        Welcome to the dMAT Practice Pro Admin Dashboard. From here you can manage all application
        data.
      </p>

      <div className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {links.map((link, idx) => (
          <Card
            key={idx}
            className="flex flex-col justify-between p-6 shadow-card hover:border-primary/50 transition-colors"
          >
            <div>
              <div className="mb-4 inline-flex h-12 w-12 items-center justify-center rounded-xl bg-primary/10">
                {link.icon}
              </div>
              <h2 className="text-xl font-semibold">{link.title}</h2>
              <p className="mt-2 text-sm text-muted-foreground">{link.description}</p>
            </div>
            <Button asChild className="mt-6 w-full" variant="outline">
              <Link to={link.to}>Go to {link.title}</Link>
            </Button>
          </Card>
        ))}
      </div>
    </div>
  );
}
