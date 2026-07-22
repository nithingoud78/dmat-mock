import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/admin/home")({
  component: AdminHomePlaceholder,
});

function AdminHomePlaceholder() {
  return (
    <div className="p-6 md:p-8 max-w-4xl mx-auto">
      <h1 className="text-3xl font-semibold tracking-tight">Homepage Editor</h1>
      <div className="mt-6 rounded-md border border-dashed p-8 text-center text-muted-foreground">
        The Homepage Editor component has not been implemented yet.
      </div>
    </div>
  );
}
