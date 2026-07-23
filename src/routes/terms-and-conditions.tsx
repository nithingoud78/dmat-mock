import { createFileRoute } from "@tanstack/react-router";
import { PublicLayout } from "@/components/PublicLayout";
import { Footer } from "@/components/Footer";
import { AdSlot } from "@/components/ads/AdSlot";
import { adsConfig } from "@/config/ads";
import { CMSProvider, useCMS } from "@/lib/cms";
import { LEGAL_DEFAULTS } from "@/lib/legal-defaults";

export const Route = createFileRoute("/terms-and-conditions")({
  component: TermsAndConditionsPageWrapper,
});

function TermsAndConditionsPageWrapper() {
  return (
    <CMSProvider page="terms-and-conditions">
      <TermsAndConditionsPage />
    </CMSProvider>
  );
}

function TermsAndConditionsPage() {
  const { get } = useCMS("content");

  const defaultHtml = LEGAL_DEFAULTS["terms-and-conditions"];

  return (
    <PublicLayout>
      <div className="mx-auto max-w-4xl px-4 py-12 md:px-8 space-y-8">
        <h1 className="text-4xl font-bold tracking-tight">Terms and Conditions</h1>

        <AdSlot placement={adsConfig.placements.TopBanner} />

        <div
          className="prose prose-sm md:prose-base dark:prose-invert max-w-none"
          dangerouslySetInnerHTML={{ __html: get("body", defaultHtml) }}
        />

        <AdSlot placement={adsConfig.placements.ContentBottom} />
      </div>
      <Footer />
    </PublicLayout>
  );
}
