import { Card } from "@/components/ui/card";

export function AboutDMAT() {
  return (
    <section className="grid gap-5 md:grid-cols-2">
      <Card className="p-7 shadow-card">
        <h2 className="text-lg font-semibold">What is the dMAT?</h2>
        <p className="mt-3 text-sm leading-relaxed text-muted-foreground">
          The Digital Master Assessment Test (dMAT) is a standardized academic aptitude test for Master's applicants from India. 
          Introduced as an additional element in the APS documentation process starting from 2026, it enables a fair comparison of 
          applicants across different national education systems. It is administered by g.a.s.t. and evaluated centrally at the TestDaF Institute in Bochum.
        </p>
      </Card>
      <Card className="p-7 shadow-card">
        <h2 className="text-lg font-semibold">dMAT vs APS Certificate</h2>
        <p className="mt-3 text-sm leading-relaxed text-muted-foreground">
          While the APS Certificate verifies the authenticity of your academic documents, the dMAT Certificate provides a standardized academic aptitude test result. 
          For affected fields, the dMAT is mandatory to obtain the APS Certificate. However, a low dMAT score does not automatically lead to APS refusal—German universities independently decide how they use the percentile rank for admissions.
        </p>
      </Card>
    </section>
  );
}
