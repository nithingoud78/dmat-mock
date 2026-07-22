import { useState, useRef } from "react";
import Papa from "papaparse";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card } from "@/components/ui/card";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Upload, AlertCircle, CheckCircle2 } from "lucide-react";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { MODULE_ORDER, type ModuleId } from "@/lib/modules";

type CsvRow = {
  module: string;
  difficulty: string;
  subtopic?: string;
  question_type?: string;
  prompt_text: string;
  option_a?: string;
  option_b?: string;
  option_c?: string;
  option_d?: string;
  correct_option_id: string; // 'a', 'b', 'c', 'd'
  explanation_text: string;
  source_id?: string;
  time_estimate_seconds?: string;
  tags?: string;
  visual_data?: string;
  internal_notes?: string;
  solution_steps?: string;
};

type ValidatedRow = {
  raw: CsvRow;
  parsedData: any;
  isValid: boolean;
  errors: string[];
  content_hash: string;
};

async function generateHash(str: string): Promise<string> {
  const encoder = new TextEncoder();
  const data = encoder.encode(str);
  const hashBuffer = await crypto.subtle.digest("SHA-256", data);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  return hashArray.map((b) => b.toString(16).padStart(2, "0")).join("");
}

export function BulkImporter({ onImported }: { onImported: () => void }) {
  const [file, setFile] = useState<File | null>(null);
  const [rows, setRows] = useState<ValidatedRow[]>([]);
  const [isProcessing, setIsProcessing] = useState(false);
  const [isUploading, setIsUploading] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const handleFile = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files.length > 0) {
      setFile(e.target.files[0]);
    }
  };

  const processFile = async () => {
    if (!file) return;
    setIsProcessing(true);

    Papa.parse<CsvRow>(file, {
      header: true,
      skipEmptyLines: true,
      complete: async (results) => {
        const validated: ValidatedRow[] = [];
        // Extract existing hashes to check for duplicates in DB
        const { data: existingHashes } = await supabase.from("questions").select("content_hash");
        const hashSet = new Set(existingHashes?.map((r) => r.content_hash) || []);

        for (const row of results.data) {
          const errors: string[] = [];

          if (!row.module || !MODULE_ORDER.includes(row.module as ModuleId)) {
            errors.push(`Invalid module: ${row.module}`);
          }
          if (!["easy", "medium", "hard"].includes(row.difficulty)) {
            errors.push(`Invalid difficulty: ${row.difficulty}`);
          }
          if (!row.prompt_text) errors.push("Missing prompt_text");
          if (!row.correct_option_id) errors.push("Missing correct_option_id");
          if (!row.explanation_text) errors.push("Missing explanation_text");

          const options = [];
          if (row.option_a) options.push({ id: "a", text: row.option_a });
          if (row.option_b) options.push({ id: "b", text: row.option_b });
          if (row.option_c) options.push({ id: "c", text: row.option_c });
          if (row.option_d) options.push({ id: "d", text: row.option_d });

          if (options.length === 0 && !row.visual_data) {
            // For general academic/math there might be visual options, but usually we need something.
            errors.push("No options provided");
          }

          let visualDataParsed = null;
          if (row.visual_data) {
            try {
              visualDataParsed = JSON.parse(row.visual_data);
            } catch (e) {
              errors.push("Invalid JSON in visual_data");
            }
          }

          let solutionStepsParsed = null;
          if (row.solution_steps) {
            try {
              solutionStepsParsed = JSON.parse(row.solution_steps);
            } catch (e) {
              errors.push("Invalid JSON in solution_steps");
            }
          }

          // Generate Content Hash
          const hashString = `${row.prompt_text}|${JSON.stringify(options)}|${row.explanation_text}`;
          const content_hash = await generateHash(hashString);

          if (hashSet.has(content_hash)) {
            errors.push("Duplicate question (hash match in database)");
          }

          // Track within this batch to prevent duplicates in the same CSV
          hashSet.add(content_hash);

          const parsedData = {
            module: row.module,
            difficulty: row.difficulty,
            subtopic: row.subtopic || null,
            question_type: row.question_type || null,
            prompt_text: row.prompt_text,
            options,
            correct_option_id: row.correct_option_id,
            explanation_text: row.explanation_text,
            time_estimate_seconds: parseInt(row.time_estimate_seconds || "60", 10),
            tags: row.tags ? row.tags.split(",").map((s) => s.trim()) : [],
            visual_data: visualDataParsed,
            source_id: row.source_id || null, // Assuming UUID is provided, in reality might need lookup
            content_hash,
            imported_from: "csv",
            internal_notes: row.internal_notes || null,
            solution_steps: solutionStepsParsed,
          };

          validated.push({
            raw: row,
            parsedData,
            isValid: errors.length === 0,
            errors,
            content_hash,
          });
        }

        setRows(validated);
        setIsProcessing(false);
      },
    });
  };

  const uploadValidRows = async () => {
    const validRows = rows.filter((r) => r.isValid).map((r) => r.parsedData);
    if (validRows.length === 0) return;

    setIsUploading(true);
    const { error } = await supabase.from("questions").insert(validRows as any);
    setIsUploading(false);

    if (error) {
      toast.error(`Import failed: ${error.message}`);
    } else {
      toast.success(`Successfully imported ${validRows.length} questions`);
      setRows([]);
      setFile(null);
      if (fileInputRef.current) fileInputRef.current.value = "";
      onImported();
    }
  };

  return (
    <Card className="p-6">
      <div className="flex flex-col gap-4">
        <h3 className="text-lg font-semibold">Bulk Import Questions</h3>
        <p className="text-sm text-muted-foreground">
          Upload a CSV file containing questions. Required headers: module, difficulty, prompt_text,
          correct_option_id, explanation_text.
        </p>

        <div className="flex items-center gap-4">
          <Input
            type="file"
            accept=".csv"
            onChange={handleFile}
            ref={fileInputRef}
            className="w-auto"
          />
          <Button onClick={processFile} disabled={!file || isProcessing}>
            {isProcessing ? "Processing..." : "Validate CSV"}
          </Button>
        </div>

        {rows.length > 0 && (
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <span className="text-sm font-medium">
                {rows.filter((r) => r.isValid).length} valid,{" "}
                {rows.filter((r) => !r.isValid).length} invalid
              </span>
              <Button
                onClick={uploadValidRows}
                disabled={isUploading || rows.filter((r) => r.isValid).length === 0}
              >
                {isUploading
                  ? "Importing..."
                  : `Import ${rows.filter((r) => r.isValid).length} Valid Questions`}
              </Button>
            </div>

            <div className="rounded-md border max-h-80 overflow-auto">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Status</TableHead>
                    <TableHead>Module</TableHead>
                    <TableHead>Prompt</TableHead>
                    <TableHead>Errors</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {rows.map((r, i) => (
                    <TableRow key={i} className={!r.isValid ? "bg-destructive/10" : ""}>
                      <TableCell>
                        {r.isValid ? (
                          <CheckCircle2 className="h-4 w-4 text-success" />
                        ) : (
                          <AlertCircle className="h-4 w-4 text-destructive" />
                        )}
                      </TableCell>
                      <TableCell className="font-mono text-xs">{r.raw.module}</TableCell>
                      <TableCell className="truncate max-w-xs">{r.raw.prompt_text}</TableCell>
                      <TableCell className="text-xs text-destructive">
                        {r.errors.join(", ")}
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          </div>
        )}
      </div>
    </Card>
  );
}
