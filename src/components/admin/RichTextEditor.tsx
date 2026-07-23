import { useRef, useEffect } from "react";
import { Button } from "@/components/ui/button";
import { Bold, Italic, List, ListOrdered, Link2, Heading1, Heading2 } from "lucide-react";

interface RichTextEditorProps {
  value: string;
  onChange: (html: string) => void;
}

export function RichTextEditor({ value, onChange }: RichTextEditorProps) {
  const editorRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (editorRef.current && editorRef.current.innerHTML !== value) {
      editorRef.current.innerHTML = value;
    }
  }, [value]);

  const exec = (command: string, arg?: string) => {
    document.execCommand(command, false, arg);
    editorRef.current?.focus();
    onChange(editorRef.current?.innerHTML || "");
  };

  const handleInput = () => {
    onChange(editorRef.current?.innerHTML || "");
  };

  return (
    <div className="border rounded-md overflow-hidden bg-background">
      <div className="border-b bg-muted/30 p-1 flex items-center gap-1 flex-wrap">
        <Button variant="ghost" size="icon" className="h-8 w-8" onClick={() => exec('bold')} title="Bold">
          <Bold className="h-4 w-4" />
        </Button>
        <Button variant="ghost" size="icon" className="h-8 w-8" onClick={() => exec('italic')} title="Italic">
          <Italic className="h-4 w-4" />
        </Button>
        <div className="w-px h-4 bg-border mx-1" />
        <Button variant="ghost" size="icon" className="h-8 w-8" onClick={() => exec('formatBlock', 'H2')} title="Heading 2">
          <Heading1 className="h-4 w-4" />
        </Button>
        <Button variant="ghost" size="icon" className="h-8 w-8" onClick={() => exec('formatBlock', 'H3')} title="Heading 3">
          <Heading2 className="h-4 w-4" />
        </Button>
        <div className="w-px h-4 bg-border mx-1" />
        <Button variant="ghost" size="icon" className="h-8 w-8" onClick={() => exec('insertUnorderedList')} title="Bullet List">
          <List className="h-4 w-4" />
        </Button>
        <Button variant="ghost" size="icon" className="h-8 w-8" onClick={() => exec('insertOrderedList')} title="Numbered List">
          <ListOrdered className="h-4 w-4" />
        </Button>
        <div className="w-px h-4 bg-border mx-1" />
        <Button variant="ghost" size="icon" className="h-8 w-8" onClick={() => {
          const url = prompt("Enter link URL:");
          if (url) exec('createLink', url);
        }} title="Insert Link">
          <Link2 className="h-4 w-4" />
        </Button>
      </div>
      <div
        ref={editorRef}
        contentEditable
        onInput={handleInput}
        onBlur={handleInput}
        className="p-4 min-h-[300px] prose prose-sm max-w-none dark:prose-invert focus:outline-none"
      />
    </div>
  );
}
