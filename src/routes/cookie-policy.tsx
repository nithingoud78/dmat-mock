import { createFileRoute } from "@tanstack/react-router";
import { PublicLayout } from "@/components/PublicLayout";
import { Footer } from "@/components/Footer";
import { CMSProvider, useCMS } from "@/lib/cms";
import { LEGAL_DEFAULTS } from "@/lib/legal-defaults";

export const Route = createFileRoute("/cookie-policy")({
  component: CookiePolicyPageWrapper,
});

function CookiePolicyPageWrapper() {
  return (
    <CMSProvider page="cookie-policy">
      <CookiePolicyPage />
    </CMSProvider>
  );
}

function CookiePolicyPage() {
  const { get } = useCMS("content");

  const defaultHtml = LEGAL_DEFAULTS["cookie-policy"];

  return (
    <PublicLayout>
      <div className="mx-auto max-w-4xl px-4 py-12 md:px-8 space-y-8">
        <h1 className="text-4xl font-bold tracking-tight">Cookie Policy</h1>

        
        <div
          className="prose prose-sm md:prose-base dark:prose-invert max-w-none"
          dangerouslySetInnerHTML={{ __html: get("body", defaultHtml) }}
        />

              </div>
      <Footer />
    </PublicLayout>
  );
}
