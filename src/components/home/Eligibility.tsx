import { Card } from "@/components/ui/card";

export function Eligibility() {
  return (
    <section>
      <Card className="p-7 shadow-card">
        <h2 className="text-lg font-semibold">Who Must Take the dMAT?</h2>
        <p className="mt-2 text-sm text-muted-foreground mb-4">
          The dMAT is mandatory for Master's applicants from India applying for Summer Semester 2027 or later, whose previous degree falls within:
        </p>
        <div className="grid sm:grid-cols-3 gap-4 mb-6">
          <div className="p-4 rounded-lg bg-secondary/30 border text-sm font-medium">Engineering</div>
          <div className="p-4 rounded-lg bg-secondary/30 border text-sm font-medium">Commerce, Accounting, Finance, Economics</div>
          <div className="p-4 rounded-lg bg-secondary/30 border text-sm font-medium">Business / Management</div>
        </div>
        <h3 className="text-sm font-semibold mb-2">Exemptions:</h3>
        <ul className="text-sm text-muted-foreground space-y-1 list-disc pl-5">
          <li>PhD applicants</li>
          <li>Bachelor's program applicants</li>
          <li>Applicants participating in officially confirmed double-degree or exchange programs</li>
          <li>Applicants who shipped complete APS documents before 29 June 2026</li>
          <li>Degrees outside the affected fields (e.g., pure Sciences, Arts, Humanities)</li>
        </ul>
      </Card>
    </section>
  );
}
