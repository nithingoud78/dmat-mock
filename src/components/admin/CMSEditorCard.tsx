import { useState } from "react";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";

export interface CMSField {
  key: string;
  label: string;
  type: "text" | "textarea";
  defaultValue: string;
}

interface CMSEditorCardProps {
  page: string;
  section: string;
  title: string;
  fields: CMSField[];
  currentData: Record<string, string>;
  onSaved: () => void;
}

export function CMSEditorCard({ page, section, title, fields, currentData, onSaved }: CMSEditorCardProps) {
  const [isEditing, setIsEditing] = useState(false);
  const [values, setValues] = useState<Record<string, string>>(currentData);
  const [isSaving, setIsSaving] = useState(false);

  const handleSave = async () => {
    setIsSaving(true);
    try {
      for (const field of fields) {
        const content = values[field.key] ?? field.defaultValue;
        if (!content.trim()) {
          toast.error(`${field.label} cannot be empty.`);
          setIsSaving(false);
          return;
        }

        const { error } = await supabase
          .from("site_content")
          .upsert({
            page,
            section,
            key: field.key,
            content
          }, { onConflict: "page,section,key" });
          
        if (error) throw error;
      }
      toast.success(`${title} saved successfully`);
      setIsEditing(false);
      onSaved();
    } catch (e: any) {
      toast.error(e.message || "Failed to save content");
    } finally {
      setIsSaving(false);
    }
  };

  const handleCancel = () => {
    setValues(currentData);
    setIsEditing(false);
  };

  return (
    <Card className="mb-6 relative overflow-hidden group">
      <CardHeader className="flex flex-row items-center justify-between bg-muted/30 pb-4 border-b">
        <CardTitle className="text-lg">{title}</CardTitle>
        {!isEditing && (
          <Button variant="outline" size="sm" onClick={() => setIsEditing(true)}>
            Edit
          </Button>
        )}
      </CardHeader>
      <CardContent className="pt-6 space-y-4">
        {fields.map((f) => {
          const val = values[f.key] ?? f.defaultValue;
          return (
            <div key={f.key} className="space-y-1.5">
              <Label className="text-xs font-bold text-muted-foreground uppercase tracking-wider">{f.label}</Label>
              {isEditing ? (
                f.type === "textarea" ? (
                  <Textarea
                    value={val}
                    onChange={(e) => setValues({ ...values, [f.key]: e.target.value })}
                    className="min-h-[100px]"
                  />
                ) : (
                  <Input
                    value={val}
                    onChange={(e) => setValues({ ...values, [f.key]: e.target.value })}
                  />
                )
              ) : (
                <div className="text-sm p-3 bg-muted/20 rounded-md border text-foreground/80 whitespace-pre-wrap">
                  {val}
                </div>
              )}
            </div>
          );
        })}

        {isEditing && (
          <div className="flex justify-end gap-2 pt-4 mt-2 border-t">
            <Button variant="ghost" onClick={handleCancel} disabled={isSaving}>Cancel</Button>
            <Button onClick={handleSave} disabled={isSaving}>{isSaving ? "Saving..." : "Save"}</Button>
          </div>
        )}
      </CardContent>
    </Card>
  );
}
