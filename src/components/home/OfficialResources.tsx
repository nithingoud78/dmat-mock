import { Card } from "@/components/ui/card";
import { ExternalLink } from "lucide-react";

export function OfficialResources() {
  return (
    <section>
      <Card className="p-7 shadow-card bg-secondary/10">
        <h2 className="text-lg font-semibold mb-4">Official Resources</h2>
        <ul className="flex flex-wrap gap-4">
          <li>
            <a href="https://aps-india.de/dmat/" target="_blank" rel="noreferrer" className="inline-flex items-center gap-2 text-sm text-primary hover:underline">
              APS India dMAT Page <ExternalLink className="h-3.5 w-3.5" />
            </a>
          </li>
          <li>
            <a href="https://www.d-mat.de/en/" target="_blank" rel="noreferrer" className="inline-flex items-center gap-2 text-sm text-primary hover:underline">
              Official dMAT Website <ExternalLink className="h-3.5 w-3.5" />
            </a>
          </li>
          <li>
            <a href="https://www.gast.de/" target="_blank" rel="noreferrer" className="inline-flex items-center gap-2 text-sm text-primary hover:underline">
              g.a.s.t. Website <ExternalLink className="h-3.5 w-3.5" />
            </a>
          </li>
          <li>
            <a href="https://www.d-mat.de/wp-content/uploads/2026/07/260716_dMAT_General-Academic-Module_Preparatoy-Materials_EN.pdf" target="_blank" rel="noreferrer" className="inline-flex items-center gap-2 text-sm text-primary hover:underline">
              Official Preparatory PDF <ExternalLink className="h-3.5 w-3.5" />
            </a>
          </li>
        </ul>
      </Card>
    </section>
  );
}
