import { createFileRoute } from "@tanstack/react-router";
import { useMemo, useState } from "react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Checkbox } from "@/components/ui/checkbox";
import { Switch } from "@/components/ui/switch";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Badge } from "@/components/ui/badge";
import {
  Dialog,
  DialogContent,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Trash2, Pencil, Plus, Upload, Eye, Copy, ChevronLeft, ChevronRight } from "lucide-react";
import { toast } from "sonner";
import { supabase } from "@/integrations/supabase/client";
import { MODULES, MODULE_ORDER, type ModuleId } from "@/lib/modules";
import { BulkImporter } from "@/components/admin/BulkImporter";
import { QuestionDisplay } from "@/components/QuestionDisplay";
import type { Question } from "@/lib/test-types";

export const Route = createFileRoute("/admin/questions")({
  head: () => ({
    meta: [
      { title: "Admin · Questions — dMAT Practice Pro" },
      { name: "robots", content: "noindex" },
    ],
  }),
  component: AdminQuestions,
});

type Difficulty = "easy" | "medium" | "hard";
type Source = {
  id: string;
  name: string;
  publisher?: string;
  edition?: string;
  year?: string;
  license_note?: string;
  note?: string;
  question_type?: string;
  url?: string;
};
type QuestionRow = {
  id: string;
  module: ModuleId;
  prompt_text: string;
  image_url: string | null;
  options: { id: string; text: string }[];
  correct_option_id: string;
  explanation_text: string;
  difficulty: Difficulty;
  source_id: string;
  tags: string[];
  time_estimate_seconds: number;
  visual_data?: any;
  subtopic?: string | null;
  question_type?: string | null;
  verified?: boolean;
  approved?: boolean;
  internal_notes?: string | null;
  solution_steps?: any;
  content_hash?: string | null;
};

function AdminQuestions() {
  const qc = useQueryClient();
  const [moduleFilter, setModuleFilter] = useState<ModuleId | "all">("all");
  const [diffFilter, setDiffFilter] = useState<"all" | Difficulty>("all");
  const [srcFilter, setSrcFilter] = useState<string>("all");
  const [page, setPage] = useState(0);
  const pageSize = 50;

  const [editing, setEditing] = useState<QuestionRow | null>(null);
  const [previewing, setPreviewing] = useState<QuestionRow | null>(null);
  const [srcOpen, setSrcOpen] = useState(false);
  const [bulkOpen, setBulkOpen] = useState(false);
  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set());

  const { data: sources = [] } = useQuery({
    queryKey: ["sources"],
    queryFn: async () => {
      const { data } = await supabase.from("sources").select("*").order("name");
      return (data ?? []) as Source[];
    },
  });

  const { data: qData = { questions: [], count: 0 }, isLoading } = useQuery({
    queryKey: ["admin_questions", moduleFilter, diffFilter, srcFilter, page],
    queryFn: async () => {
      let q = supabase
        .from("questions")
        .select("*", { count: "exact" })
        .order("created_at", { ascending: false })
        .range(page * pageSize, (page + 1) * pageSize - 1);

      if (moduleFilter !== "all") q = q.eq("module", moduleFilter);
      if (diffFilter !== "all") q = q.eq("difficulty", diffFilter);
      if (srcFilter !== "all") q = q.eq("source_id", srcFilter);

      const { data, count } = await q;
      return { questions: (data ?? []) as unknown as QuestionRow[], count: count ?? 0 };
    },
  });

  const { questions, count } = qData;
  const totalPages = Math.ceil(count / pageSize);
  const sourceMap = useMemo(() => new Map(sources.map((s) => [s.id, s])), [sources]);

  const newQuestion = (): QuestionRow => ({
    id: "",
    module: "figure_sequence",
    prompt_text: "",
    image_url: null,
    options: [
      { id: "a", text: "" },
      { id: "b", text: "" },
      { id: "c", text: "" },
      { id: "d", text: "" },
    ],
    correct_option_id: "a",
    explanation_text: "",
    difficulty: "medium",
    source_id: sources[0]?.id ?? "",
    tags: [],
    time_estimate_seconds: 75,
    visual_data: null,
    subtopic: "",
    question_type: "",
    verified: false,
    approved: false,
    internal_notes: "",
    solution_steps: null,
  });

  const del = async (id: string) => {
    if (!confirm("Delete this question?")) return;
    const { error } = await supabase.from("questions").delete().eq("id", id);
    if (error) toast.error(error.message);
    else {
      toast.success("Deleted");
      qc.invalidateQueries({ queryKey: ["admin_questions"] });
      setSelectedIds((prev) => {
        const next = new Set(prev);
        next.delete(id);
        return next;
      });
    }
  };

  const bulkDelete = async () => {
    if (selectedIds.size === 0) return;
    if (!confirm(`Delete ${selectedIds.size} selected questions?`)) return;

    const { error } = await supabase.from("questions").delete().in("id", Array.from(selectedIds));
    if (error) toast.error(error.message);
    else {
      toast.success(`Deleted ${selectedIds.size} questions`);
      setSelectedIds(new Set());
      qc.invalidateQueries({ queryKey: ["admin_questions"] });
    }
  };

  const duplicate = async (q: QuestionRow) => {
    const payload = { ...q };
    delete (payload as any).id;
    // Add a marker so it's obviously duplicated
    payload.internal_notes = (payload.internal_notes || "") + " [DUPLICATED]";
    payload.content_hash = null; // nullify hash to allow insertion
    const { error } = await supabase.from("questions").insert(payload as any);
    if (error) toast.error(error.message);
    else {
      toast.success("Question duplicated");
      qc.invalidateQueries({ queryKey: ["admin_questions"] });
    }
  };

  const toggleSelectAll = (checked: boolean) => {
    if (checked) {
      setSelectedIds(new Set(questions.map((q) => q.id)));
    } else {
      setSelectedIds(new Set());
    }
  };

  const toggleSelect = (id: string, checked: boolean) => {
    setSelectedIds((prev) => {
      const next = new Set(prev);
      if (checked) next.add(id);
      else next.delete(id);
      return next;
    });
  };

  return (
    <>
      <div className="mx-auto max-w-7xl p-6 md:p-8">
        <div className="mb-6 flex flex-wrap items-center justify-between gap-3">
          <div>
            <h1 className="text-2xl font-semibold">Question bank</h1>
            <p className="text-sm text-muted-foreground">{count} total question(s)</p>
          </div>
          <div className="flex flex-wrap gap-2">
            <Button variant="outline" onClick={() => setSrcOpen(true)}>
              Manage sources
            </Button>
            <Button variant="outline" onClick={() => setBulkOpen(!bulkOpen)}>
              <Upload className="mr-1 h-4 w-4" /> Bulk import
            </Button>
            <Button onClick={() => setEditing(newQuestion())}>
              <Plus className="mr-1 h-4 w-4" /> New question
            </Button>
          </div>
        </div>

        {bulkOpen && (
          <div className="mb-6">
            <BulkImporter
              onImported={() => {
                setBulkOpen(false);
                qc.invalidateQueries({ queryKey: ["admin_questions"] });
              }}
            />
          </div>
        )}

        <Card className="p-4 shadow-card">
          <div className="mb-4 grid gap-3 sm:grid-cols-3">
            <div>
              <Label className="text-xs">Module</Label>
              <Select
                value={moduleFilter}
                onValueChange={(v: any) => {
                  setModuleFilter(v);
                  setPage(0);
                }}
              >
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All modules</SelectItem>
                  {MODULE_ORDER.map((m) => (
                    <SelectItem key={m} value={m}>
                      {MODULES[m].label}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label className="text-xs">Difficulty</Label>
              <Select
                value={diffFilter}
                onValueChange={(v: any) => {
                  setDiffFilter(v);
                  setPage(0);
                }}
              >
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All</SelectItem>
                  <SelectItem value="easy">Easy</SelectItem>
                  <SelectItem value="medium">Medium</SelectItem>
                  <SelectItem value="hard">Hard</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label className="text-xs">Source</Label>
              <Select
                value={srcFilter}
                onValueChange={(v) => {
                  setSrcFilter(v);
                  setPage(0);
                }}
              >
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All sources</SelectItem>
                  {sources.map((s) => (
                    <SelectItem key={s.id} value={s.id}>
                      {s.name}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          </div>

          {selectedIds.size > 0 && (
            <div className="mb-4 flex items-center gap-4 rounded-md bg-secondary px-4 py-2">
              <span className="text-sm font-medium">{selectedIds.size} selected</span>
              <Button size="sm" variant="destructive" onClick={bulkDelete}>
                <Trash2 className="mr-2 h-4 w-4" /> Delete Selected
              </Button>
            </div>
          )}

          <div className="overflow-x-auto">
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead className="w-12">
                    <Checkbox
                      checked={questions.length > 0 && selectedIds.size === questions.length}
                      onCheckedChange={toggleSelectAll}
                    />
                  </TableHead>
                  <TableHead>Prompt / Subtopic</TableHead>
                  <TableHead>Module</TableHead>
                  <TableHead>Difficulty</TableHead>
                  <TableHead>Status</TableHead>
                  <TableHead className="w-[180px]" />
                </TableRow>
              </TableHeader>
              <TableBody>
                {isLoading ? (
                  <TableRow>
                    <TableCell colSpan={6} className="text-center py-8">
                      Loading...
                    </TableCell>
                  </TableRow>
                ) : questions.length === 0 ? (
                  <TableRow>
                    <TableCell colSpan={6} className="text-center py-8 text-muted-foreground">
                      No questions found.
                    </TableCell>
                  </TableRow>
                ) : (
                  questions.map((q) => (
                    <TableRow key={q.id}>
                      <TableCell>
                        <Checkbox
                          checked={selectedIds.has(q.id)}
                          onCheckedChange={(checked) => toggleSelect(q.id, checked as boolean)}
                        />
                      </TableCell>
                      <TableCell className="max-w-xs">
                        <div className="truncate font-medium">{q.prompt_text}</div>
                        {q.subtopic && (
                          <div className="text-xs text-muted-foreground truncate mt-1">
                            {q.subtopic}
                          </div>
                        )}
                      </TableCell>
                      <TableCell>
                        <Badge variant="outline">{MODULES[q.module]?.label}</Badge>
                      </TableCell>
                      <TableCell className="capitalize">{q.difficulty}</TableCell>
                      <TableCell>
                        <div className="flex gap-1">
                          {q.verified && (
                            <Badge
                              variant="secondary"
                              className="bg-blue-100 text-blue-800 border-none"
                            >
                              Verified
                            </Badge>
                          )}
                          {q.approved && (
                            <Badge
                              variant="secondary"
                              className="bg-green-100 text-green-800 border-none"
                            >
                              Approved
                            </Badge>
                          )}
                        </div>
                      </TableCell>
                      <TableCell className="text-right">
                        <Button
                          size="icon"
                          variant="ghost"
                          onClick={() => setPreviewing(q)}
                          title="Preview"
                        >
                          <Eye className="h-4 w-4 text-muted-foreground" />
                        </Button>
                        <Button
                          size="icon"
                          variant="ghost"
                          onClick={() => duplicate(q)}
                          title="Duplicate"
                        >
                          <Copy className="h-4 w-4 text-muted-foreground" />
                        </Button>
                        <Button
                          size="icon"
                          variant="ghost"
                          onClick={() => setEditing(q)}
                          title="Edit"
                        >
                          <Pencil className="h-4 w-4" />
                        </Button>
                        <Button
                          size="icon"
                          variant="ghost"
                          onClick={() => del(q.id)}
                          title="Delete"
                        >
                          <Trash2 className="h-4 w-4 text-destructive" />
                        </Button>
                      </TableCell>
                    </TableRow>
                  ))
                )}
              </TableBody>
            </Table>
          </div>

          {totalPages > 1 && (
            <div className="mt-4 flex items-center justify-between border-t pt-4">
              <span className="text-sm text-muted-foreground">
                Page {page + 1} of {totalPages}
              </span>
              <div className="flex gap-2">
                <Button
                  variant="outline"
                  size="sm"
                  disabled={page === 0}
                  onClick={() => setPage(page - 1)}
                >
                  <ChevronLeft className="h-4 w-4 mr-1" /> Prev
                </Button>
                <Button
                  variant="outline"
                  size="sm"
                  disabled={page >= totalPages - 1}
                  onClick={() => setPage(page + 1)}
                >
                  Next <ChevronRight className="h-4 w-4 ml-1" />
                </Button>
              </div>
            </div>
          )}
        </Card>
      </div>

      {editing && (
        <QuestionEditor
          initial={editing}
          sources={sources}
          onClose={() => setEditing(null)}
          onSaved={() => {
            setEditing(null);
            qc.invalidateQueries({ queryKey: ["admin_questions"] });
          }}
        />
      )}

      {previewing && (
        <Dialog open onOpenChange={() => setPreviewing(null)}>
          <DialogContent className="max-w-4xl max-h-[90vh] overflow-y-auto">
            <DialogHeader>
              <DialogTitle>Question Preview</DialogTitle>
            </DialogHeader>
            <div className="mt-4 p-6 border rounded-xl bg-card shadow-sm">
              <QuestionDisplay question={previewing as unknown as Question} />
              <div className="mt-6 grid gap-2.5 sm:grid-cols-2">
                {previewing.options.map((opt) => {
                  const isCorrect = previewing.correct_option_id === opt.id;
                  return (
                    <div
                      key={opt.id}
                      className={`flex items-start gap-3 rounded-xl border p-4 text-left text-sm ${
                        isCorrect ? "border-success/50 bg-success/10" : "border-border bg-card"
                      }`}
                    >
                      <span
                        className={`grid h-6 w-6 shrink-0 place-items-center rounded-full border text-xs font-semibold ${
                          isCorrect ? "border-success bg-success text-white" : "border-border"
                        }`}
                      >
                        {opt.id.toUpperCase()}
                      </span>
                      <span className="text-foreground">{opt.text}</span>
                    </div>
                  );
                })}
              </div>
            </div>
            <DialogFooter>
              <Button onClick={() => setPreviewing(null)}>Close Preview</Button>
            </DialogFooter>
          </DialogContent>
        </Dialog>
      )}

      <SourcesDialog
        open={srcOpen}
        onOpenChange={setSrcOpen}
        sources={sources}
        onChanged={() => qc.invalidateQueries({ queryKey: ["sources"] })}
      />
    </>
  );
}

function QuestionEditor({
  initial,
  sources,
  onClose,
  onSaved,
}: {
  initial: QuestionRow;
  sources: Source[];
  onClose: () => void;
  onSaved: () => void;
}) {
  const [q, setQ] = useState<QuestionRow>(initial);
  const [busy, setBusy] = useState(false);
  const [previewTab, setPreviewTab] = useState(false);

  const uploadImage = async (file: File) => {
    const path = `q-${Date.now()}-${file.name.replace(/[^a-z0-9.]/gi, "_")}`;
    const { error } = await supabase.storage
      .from("question-images")
      .upload(path, file, { upsert: true });
    if (error) {
      toast.error(error.message);
      return;
    }
    const { data } = await supabase.storage
      .from("question-images")
      .createSignedUrl(path, 60 * 60 * 24 * 365);
    if (data?.signedUrl) setQ({ ...q, image_url: data.signedUrl });
  };

  const save = async () => {
    if (!q.source_id) return toast.error("Pick a source");
    if (!q.prompt_text.trim()) return toast.error("Prompt is required");
    setBusy(true);
    const payload = {
      module: q.module,
      prompt_text: q.prompt_text,
      image_url: q.image_url,
      options: q.options,
      correct_option_id: q.correct_option_id,
      explanation_text: q.explanation_text,
      difficulty: q.difficulty,
      source_id: q.source_id,
      tags: q.tags,
      time_estimate_seconds: q.time_estimate_seconds,
      visual_data: q.visual_data,
      subtopic: q.subtopic || null,
      question_type: q.question_type || null,
      verified: q.verified,
      approved: q.approved,
      internal_notes: q.internal_notes || null,
      solution_steps: q.solution_steps || null,
      content_hash: null, // Server trigger handles hashing ideally, or we let it be null. To detect duplicates strictly, we could hash it here, but skipping for now on manual edits.
    };
    const { error } = q.id
      ? await supabase.from("questions").update(payload).eq("id", q.id)
      : await supabase.from("questions").insert(payload);
    setBusy(false);
    if (error) toast.error(error.message);
    else {
      toast.success("Saved");
      onSaved();
    }
  };

  return (
    <Dialog open onOpenChange={onClose}>
      <DialogContent className="max-h-[90vh] max-w-4xl overflow-y-auto">
        <DialogHeader>
          <div className="flex items-center justify-between">
            <DialogTitle>{q.id ? "Edit question" : "New question"}</DialogTitle>
            <div className="flex items-center gap-4 mr-8">
              <div className="flex items-center gap-2">
                <Switch checked={previewTab} onCheckedChange={setPreviewTab} id="preview-mode" />
                <Label htmlFor="preview-mode" className="text-xs">
                  Live Preview
                </Label>
              </div>
              <div className="flex items-center gap-2">
                <Checkbox
                  checked={q.verified}
                  onCheckedChange={(c) => setQ({ ...q, verified: !!c })}
                  id="q-ver"
                />
                <Label htmlFor="q-ver" className="text-xs">
                  Verified
                </Label>
              </div>
              <div className="flex items-center gap-2">
                <Checkbox
                  checked={q.approved}
                  onCheckedChange={(c) => setQ({ ...q, approved: !!c })}
                  id="q-app"
                />
                <Label htmlFor="q-app" className="text-xs">
                  Approved
                </Label>
              </div>
            </div>
          </div>
        </DialogHeader>

        {previewTab ? (
          <div className="p-4 bg-muted/50 rounded-xl min-h-[400px]">
            <QuestionDisplay question={q as unknown as Question} />
            <div className="mt-6 grid gap-2.5 sm:grid-cols-2">
              {q.options.map((opt) => {
                const isCorrect = q.correct_option_id === opt.id;
                return (
                  <div
                    key={opt.id}
                    className={`flex items-start gap-3 rounded-xl border p-4 text-left text-sm ${
                      isCorrect ? "border-success/50 bg-success/10" : "border-border bg-card"
                    }`}
                  >
                    <span
                      className={`grid h-6 w-6 shrink-0 place-items-center rounded-full border text-xs font-semibold ${
                        isCorrect ? "border-success bg-success text-white" : "border-border"
                      }`}
                    >
                      {opt.id.toUpperCase()}
                    </span>
                    <span className="text-foreground">{opt.text}</span>
                  </div>
                );
              })}
            </div>
          </div>
        ) : (
          <div className="space-y-4">
            <div className="grid gap-3 sm:grid-cols-3">
              <div>
                <Label>Module</Label>
                <Select value={q.module} onValueChange={(v: ModuleId) => setQ({ ...q, module: v })}>
                  <SelectTrigger>
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    {MODULE_ORDER.map((m) => (
                      <SelectItem key={m} value={m}>
                        {MODULES[m].label}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
              <div>
                <Label>Difficulty</Label>
                <Select
                  value={q.difficulty}
                  onValueChange={(v: Difficulty) => setQ({ ...q, difficulty: v })}
                >
                  <SelectTrigger>
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="easy">Easy</SelectItem>
                    <SelectItem value="medium">Medium</SelectItem>
                    <SelectItem value="hard">Hard</SelectItem>
                  </SelectContent>
                </Select>
              </div>
              <div>
                <Label>Time est. (sec)</Label>
                <Input
                  type="number"
                  value={q.time_estimate_seconds}
                  onChange={(e) =>
                    setQ({ ...q, time_estimate_seconds: parseInt(e.target.value) || 60 })
                  }
                />
              </div>
            </div>
            <div className="grid gap-3 sm:grid-cols-3">
              <div>
                <Label>Source</Label>
                <Select value={q.source_id} onValueChange={(v) => setQ({ ...q, source_id: v })}>
                  <SelectTrigger>
                    <SelectValue placeholder="Pick source" />
                  </SelectTrigger>
                  <SelectContent>
                    {sources.map((s) => (
                      <SelectItem key={s.id} value={s.id}>
                        {s.name}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
              <div>
                <Label>Subtopic</Label>
                <Input
                  value={q.subtopic || ""}
                  onChange={(e) => setQ({ ...q, subtopic: e.target.value })}
                  placeholder="e.g. Algebra"
                />
              </div>
              <div>
                <Label>Question Type</Label>
                <Input
                  value={q.question_type || ""}
                  onChange={(e) => setQ({ ...q, question_type: e.target.value })}
                  placeholder="e.g. Multiple Choice"
                />
              </div>
            </div>

            <div>
              <Label>Prompt / Text</Label>
              <Textarea
                rows={4}
                value={q.prompt_text}
                onChange={(e) => setQ({ ...q, prompt_text: e.target.value })}
              />
            </div>

            <div className="grid gap-3 sm:grid-cols-2">
              <div>
                <Label>Image URL (optional)</Label>
                <Input
                  value={q.image_url ?? ""}
                  onChange={(e) => setQ({ ...q, image_url: e.target.value || null })}
                  placeholder="https://..."
                />
                <Label className="mt-2 block">Or Upload Image</Label>
                <Input
                  type="file"
                  accept="image/*"
                  onChange={(e) => {
                    if (e.target.files && e.target.files[0]) uploadImage(e.target.files[0]);
                  }}
                />
              </div>
              <div>
                <Label>Visual Data (JSON)</Label>
                <Textarea
                  className="font-mono text-xs"
                  rows={4}
                  value={q.visual_data ? JSON.stringify(q.visual_data, null, 2) : ""}
                  onChange={(e) => {
                    try {
                      const parsed = e.target.value ? JSON.parse(e.target.value) : null;
                      setQ({ ...q, visual_data: parsed });
                    } catch {
                      /* ignore parse error */
                    }
                  }}
                  placeholder='{"type":"math_equation", ...}'
                />
              </div>
            </div>

            <div className="grid gap-3 sm:grid-cols-2">
              <Label>Options (mark the correct one)</Label>
              {q.options.map((opt, i) => (
                <div key={opt.id} className="flex items-center gap-2">
                  <button
                    type="button"
                    onClick={() => setQ({ ...q, correct_option_id: opt.id })}
                    className={`grid h-8 w-8 place-items-center rounded-full border text-xs font-semibold ${
                      q.correct_option_id === opt.id
                        ? "border-success bg-success text-white"
                        : "border-border"
                    }`}
                  >
                    {opt.id.toUpperCase()}
                  </button>
                  <Input
                    value={opt.text}
                    onChange={(e) => {
                      const next = [...q.options];
                      next[i] = { ...opt, text: e.target.value };
                      setQ({ ...q, options: next });
                    }}
                  />
                </div>
              ))}
            </div>

            <div className="grid gap-3 sm:grid-cols-2">
              <div>
                <Label>Explanation</Label>
                <Textarea
                  rows={3}
                  value={q.explanation_text}
                  onChange={(e) => setQ({ ...q, explanation_text: e.target.value })}
                />
              </div>
              <div>
                <Label>Solution Steps (JSON array optional)</Label>
                <Textarea
                  className="font-mono text-xs"
                  rows={3}
                  value={q.solution_steps ? JSON.stringify(q.solution_steps, null, 2) : ""}
                  onChange={(e) => {
                    try {
                      const parsed = e.target.value ? JSON.parse(e.target.value) : null;
                      setQ({ ...q, solution_steps: parsed });
                    } catch {
                      /* ignore parse error */
                    }
                  }}
                  placeholder='["Step 1", "Step 2"]'
                />
              </div>
            </div>

            <div className="grid gap-3 sm:grid-cols-2">
              <div>
                <Label>Tags (comma-separated)</Label>
                <Input
                  value={q.tags.join(", ")}
                  onChange={(e) =>
                    setQ({
                      ...q,
                      tags: e.target.value
                        .split(",")
                        .map((s) => s.trim())
                        .filter(Boolean),
                    })
                  }
                />
              </div>
              <div>
                <Label>Internal Notes</Label>
                <Input
                  value={q.internal_notes || ""}
                  onChange={(e) => setQ({ ...q, internal_notes: e.target.value })}
                  placeholder="Not visible to students"
                />
              </div>
            </div>
          </div>
        )}

        <DialogFooter>
          <Button variant="outline" onClick={onClose}>
            Cancel
          </Button>
          <Button onClick={save} disabled={busy}>
            {busy ? "Saving…" : "Save"}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}

function SourcesDialog({
  open,
  onOpenChange,
  sources,
  onChanged,
}: {
  open: boolean;
  onOpenChange: (o: boolean) => void;
  sources: Source[];
  onChanged: () => void;
}) {
  const [draft, setDraft] = useState<Partial<Source>>({});

  const create = async () => {
    if (!draft.name) return toast.error("Name required");
    const { error } = await supabase.from("sources").insert(draft as any);
    if (error) toast.error(error.message);
    else {
      toast.success("Created");
      setDraft({});
      onChanged();
    }
  };

  const del = async (id: string) => {
    if (!confirm("Delete source?")) return;
    const { error } = await supabase.from("sources").delete().eq("id", id);
    if (error) toast.error(error.message);
    else {
      toast.success("Deleted");
      onChanged();
    }
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-h-[80vh] overflow-y-auto">
        <DialogHeader>
          <DialogTitle>Sources</DialogTitle>
        </DialogHeader>
        <div className="mb-4 grid gap-3 rounded border p-4 sm:grid-cols-2">
          <div>
            <Label className="text-xs">Name</Label>
            <Input
              value={draft.name ?? ""}
              onChange={(e) => setDraft({ ...draft, name: e.target.value })}
            />
          </div>
          <div>
            <Label className="text-xs">Publisher</Label>
            <Input
              value={draft.publisher ?? ""}
              onChange={(e) => setDraft({ ...draft, publisher: e.target.value })}
            />
          </div>
          <div className="sm:col-span-2 text-right">
            <Button onClick={create} size="sm">
              Add source
            </Button>
          </div>
        </div>
        <Table>
          <TableBody>
            {sources.map((s) => (
              <TableRow key={s.id}>
                <TableCell className="font-medium">{s.name}</TableCell>
                <TableCell className="text-muted-foreground">{s.publisher}</TableCell>
                <TableCell className="text-right">
                  <Button size="icon" variant="ghost" onClick={() => del(s.id)}>
                    <Trash2 className="h-4 w-4 text-destructive" />
                  </Button>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </DialogContent>
    </Dialog>
  );
}
