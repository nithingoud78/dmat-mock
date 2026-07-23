import { Card } from "@/components/ui/card";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";

export function FAQ() {
  return (
    <section>
      <Card className="p-7 shadow-card">
        <h2 className="text-lg font-semibold mb-4">Frequently Asked Questions</h2>
        <Accordion type="single" collapsible className="w-full">
          <AccordionItem value="q1">
            <AccordionTrigger className="text-sm font-medium text-left">Is there negative marking?</AccordionTrigger>
            <AccordionContent className="text-sm text-muted-foreground">No. Guessing is explicitly encouraged by the official guidelines if you do not know the answer.</AccordionContent>
          </AccordionItem>
          <AccordionItem value="q2">
            <AccordionTrigger className="text-sm font-medium text-left">Can I use a calculator or scratch paper?</AccordionTrigger>
            <AccordionContent className="text-sm text-muted-foreground">No. External aids, calculators, and note-taking are strictly forbidden. All logic and math must be solved mentally.</AccordionContent>
          </AccordionItem>
          <AccordionItem value="q3">
            <AccordionTrigger className="text-sm font-medium text-left">What are the passing marks?</AccordionTrigger>
            <AccordionContent className="text-sm text-muted-foreground">There are no passing marks. Your certificate will show a percentile, and universities decide independently if your percentile meets their admission criteria.</AccordionContent>
          </AccordionItem>
          <AccordionItem value="q4">
            <AccordionTrigger className="text-sm font-medium text-left">Will APS reject me for a low dMAT score?</AccordionTrigger>
            <AccordionContent className="text-sm text-muted-foreground">No. APS India uses the dMAT to document your aptitude. A low dMAT score does not automatically lead to refusal of the APS certificate itself.</AccordionContent>
          </AccordionItem>
          <AccordionItem value="q5">
            <AccordionTrigger className="text-sm font-medium text-left">How long is the dMAT valid?</AccordionTrigger>
            <AccordionContent className="text-sm text-muted-foreground">The official dMAT certificate has unlimited validity.</AccordionContent>
          </AccordionItem>
        </Accordion>
      </Card>
    </section>
  );
}
