import { useState, useEffect } from "react";
import { createFileRoute } from "@tanstack/react-router";
// Removed AdminLayout import as it's provided by the parent admin route
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { RichTextEditor } from "@/components/admin/RichTextEditor";
import { LEGAL_DEFAULTS } from "@/lib/legal-defaults";

export const Route = createFileRoute("/admin/legal")({
  component: AdminLegalCMS,
});

const LEGAL_PAGES = [
  { id: "about", title: "About" },
  { id: "privacy-policy", title: "Privacy Policy" },
  { id: "terms-and-conditions", title: "Terms & Conditions" },
  { id: "disclaimer", title: "Disclaimer" },
  { id: "cookie-policy", title: "Cookie Policy" },
];

function AdminLegalCMS() {
  const [activePage, setActivePage] = useState(LEGAL_PAGES[0].id);
  const [content, setContent] = useState("");
  const [isSaving, setIsSaving] = useState(false);
  const [lastUpdated, setLastUpdated] = useState<string | null>(null);

  useEffect(() => {
    async function loadContent() {
      const { data, error } = await supabase
        .from("site_content")
        .select("content, updated_at")
        .eq("page", activePage)
        .eq("section", "content")
        .eq("key", "body")
        .maybeSingle();

      if (data) {
        setContent(data.content);
        setLastUpdated(data.updated_at);
      } else {
        setContent(LEGAL_DEFAULTS[activePage] || ""); // Default if empty
        setLastUpdated(null);
      }
    }
    loadContent();
  }, [activePage]);

  const handleSave = async () => {
    setIsSaving(true);
    try {
      const { error } = await supabase
        .from("site_content")
        .upsert({
          page: activePage,
          section: "content",
          key: "body",
          content
        }, { onConflict: "page,section,key" });
        
      if (error) throw error;
      
      toast.success(`${LEGAL_PAGES.find(p => p.id === activePage)?.title} saved successfully`);
      setLastUpdated(new Date().toISOString());
    } catch (e: any) {
      toast.error(e.message || "Failed to save content");
    } finally {
      setIsSaving(false);
    }
  };

  return (
    <div className="mx-auto max-w-5xl p-6">
      <div className="mb-8">
        <h1 className="text-3xl font-bold tracking-tight">Legal Pages CMS</h1>
        <p className="text-muted-foreground mt-1">Manage static and legal page content.</p>
      </div>

        <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
          <div className="md:col-span-1 space-y-2">
            {LEGAL_PAGES.map((p) => (
              <Button
                key={p.id}
                variant={activePage === p.id ? "default" : "ghost"}
                className="w-full justify-start"
                onClick={() => setActivePage(p.id)}
              >
                {p.title}
              </Button>
            ))}
          </div>

          <div className="md:col-span-3">
            <Card>
              <CardHeader className="bg-muted/30 pb-4 border-b flex flex-row items-center justify-between">
                <div>
                  <CardTitle>{LEGAL_PAGES.find(p => p.id === activePage)?.title}</CardTitle>
                  {lastUpdated && (
                    <div className="text-xs text-muted-foreground mt-1 font-normal">
                      Last Updated: {new Date(lastUpdated).toLocaleString()}
                    </div>
                  )}
                </div>
                <div className="flex gap-2">
                  <Button variant="outline" onClick={() => setContent("")} disabled={isSaving}>Clear</Button>
                  <Button onClick={handleSave} disabled={isSaving}>
                    {isSaving ? "Saving..." : "Save Changes"}
                  </Button>
                </div>
              </CardHeader>
              <CardContent className="p-0">
                <RichTextEditor value={content} onChange={setContent} />
              </CardContent>
            </Card>
          </div>
        </div>
      </div>
  );
}
