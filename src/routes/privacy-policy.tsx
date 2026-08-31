import { createFileRoute } from "@tanstack/react-router";
import { PublicLayout } from "@/components/PublicLayout";
import { Footer } from "@/components/Footer";
import { CMSProvider, useCMS } from "@/lib/cms";
import { LEGAL_DEFAULTS } from "@/lib/legal-defaults";

export const Route = createFileRoute("/privacy-policy")({
  component: PrivacyPolicyPageWrapper,
});

function PrivacyPolicyPageWrapper() {
  return (
    <CMSProvider page="privacy-policy">
      <PrivacyPolicyPage />
    </CMSProvider>
  );
}

function PrivacyPolicyPage() {
  const { get } = useCMS("content");
  
  const defaultHtml = LEGAL_DEFAULTS["privacy-policy"];

  return (
    <PublicLayout>
      <div className="mx-auto max-w-4xl px-4 py-12 md:px-8 space-y-8">
        <h1 className="text-4xl font-bold tracking-tight">Privacy Policy</h1>
        
                
        <div 
          className="prose prose-sm md:prose-base dark:prose-invert max-w-none"
          dangerouslySetInnerHTML={{ __html: get("body", defaultHtml) }}
        />
        
              </div>
      <Footer />
    </PublicLayout>
  );
}
