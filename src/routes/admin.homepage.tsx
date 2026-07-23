import { createFileRoute } from "@tanstack/react-router";
// Removed AdminLayout import as it's provided by the parent admin route
import { CMSProvider, useCMS } from "@/lib/cms";
import { CMSEditorCard, CMSField } from "@/components/admin/CMSEditorCard";
import { useQueryClient } from "@tanstack/react-query";

export const Route = createFileRoute("/admin/homepage")({
  component: AdminHomepageWrapper,
});

function AdminHomepageWrapper() {
  return (
    <CMSProvider page="home">
      <AdminHomepage />
    </CMSProvider>
  );
}

const HERO_FIELDS: CMSField[] = [
  { key: "badge", label: "Badge Text", type: "text", defaultValue: "Built for the 2026 dMAT format" },
  { key: "title_1", label: "Title Part 1", type: "text", defaultValue: "Master the dMAT. Secure your APS." },
  { key: "subtitle", label: "Subtitle", type: "textarea", defaultValue: "The definitive preparation platform for the Digital Master Assessment Test (dMAT). Practice with mathematically accurate procedural generations of the official g.a.s.t. question formats." },
  { key: "primary_btn", label: "Primary Button", type: "text", defaultValue: "Start Complete Mock" },
  { key: "secondary_btn", label: "Secondary Button", type: "text", defaultValue: "Practice by Section" },
];

function AdminHomepage() {
  const qc = useQueryClient();
  const { get: getHero } = useCMS("hero");
  
  // Note: For brevity in this implementation, we are just implementing Hero, but 
  // you can easily add more sections like About, FAQ, etc. following the exact same pattern.
  const heroData = {
    badge: getHero("badge", "Built for the 2026 dMAT format"),
    title_1: getHero("title_1", "Master the dMAT. Secure your APS."),
    subtitle: getHero("subtitle", "The definitive preparation platform for the Digital Master Assessment Test (dMAT). Practice with mathematically accurate procedural generations of the official g.a.s.t. question formats."),
    primary_btn: getHero("primary_btn", "Start Complete Mock"),
    secondary_btn: getHero("secondary_btn", "Practice by Section"),
  };

  const handleSaved = () => {
    // Invalidate queries or force reload context if needed
    window.location.reload();
  };

  return (
    <div className="mx-auto max-w-4xl p-6">
      <div className="mb-8">
        <h1 className="text-3xl font-bold tracking-tight">Homepage Editor</h1>
        <p className="text-muted-foreground mt-1">Manage the content of the public homepage.</p>
      </div>

        <CMSEditorCard
          page="home"
          section="hero"
          title="Hero Section"
          fields={HERO_FIELDS}
          currentData={heroData}
          onSaved={handleSaved}
        />
        
        {/* Further sections (About, Eligibility, Timeline, FAQ) would be added here */}
    </div>
  );
}
