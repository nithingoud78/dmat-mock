import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { Info } from "lucide-react";

export interface SourceMeta {
  id: string;
  name: string;
  publisher?: string | null;
  edition?: string | null;
  year?: string | null;
  page?: string | null;
  license_note?: string | null;
  url?: string | null;
  question_type?: string | null;
  note?: string | null;
}

export function SourcePopover({ source }: { source: SourceMeta | null }) {
  if (!source) return null;
  return (
    <Popover>
      <PopoverTrigger asChild>
        <button
          type="button"
          className="inline-flex items-center gap-1 rounded-md border bg-secondary px-2 py-1 text-xs text-muted-foreground hover:bg-accent/40"
          aria-label="Source info"
        >
          <Info className="h-3 w-3" /> Source
        </button>
      </PopoverTrigger>
      <PopoverContent className="w-80 text-xs">
        <div className="space-y-1.5">
          <div className="text-sm font-semibold text-foreground">{source.name}</div>
          {source.publisher && <Row k="Publisher" v={source.publisher} />}
          {source.edition && <Row k="Edition" v={source.edition} />}
          {source.year && <Row k="Year" v={source.year} />}
          {source.page && <Row k="Page" v={source.page} />}
          {source.question_type && <Row k="Type" v={source.question_type} />}
          {source.license_note && <Row k="License" v={source.license_note} />}
          {source.note && <Row k="Note" v={source.note} />}
          {source.url && (
            <a
              href={source.url}
              target="_blank"
              rel="noreferrer"
              className="mt-1 block text-primary hover:underline"
            >
              {source.url}
            </a>
          )}
        </div>
      </PopoverContent>
    </Popover>
  );
}

function Row({ k, v }: { k: string; v: string }) {
  return (
    <div className="flex gap-2">
      <span className="w-16 shrink-0 text-muted-foreground">{k}</span>
      <span className="text-foreground">{v}</span>
    </div>
  );
}
