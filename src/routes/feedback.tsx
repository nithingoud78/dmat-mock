import { createFileRoute } from "@tanstack/react-router";
import { useState } from "react";
import { PublicLayout } from "@/components/PublicLayout";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { Send, CheckCircle2 } from "lucide-react";
import { AdSlot } from "@/components/ads/AdSlot";
import { adsConfig } from "@/config/ads";
import { Footer } from "@/components/Footer";

export const Route = createFileRoute("/feedback")({
  head: () => ({
    meta: [{ title: "Feedback — dMAT Practice Pro" }],
  }),
  component: FeedbackPage,
});

const CATEGORIES = [
  "General Feedback",
  "Bug Report",
  "Feature Request",
  "Question Issue",
  "Content Issue",
  "Other",
];

function FeedbackPage() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [category, setCategory] = useState(CATEGORIES[0]);
  const [message, setMessage] = useState("");
  const [loading, setLoading] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    const trimmedMessage = message.trim();
    if (!trimmedMessage) {
      toast.error("Feedback message is required.");
      return;
    }
    if (trimmedMessage.length < 10) {
      toast.error("Feedback message must be at least 10 characters.");
      return;
    }
    if (trimmedMessage.length > 3000) {
      toast.error("Feedback message is too long (max 3000 chars).");
      return;
    }

    setLoading(true);

    try {
      const { error } = await supabase.from("feedback").insert({
        name: name.trim() || null,
        email: email.trim() || null,
        category,
        message: trimmedMessage,
      });

      if (error) {
        throw error;
      }

      setSubmitted(true);
      toast.success("Feedback submitted successfully!");
    } catch (err: any) {
      toast.error(err.message || "Failed to submit feedback.");
    } finally {
      setLoading(false);
    }
  };

  const resetForm = () => {
    setName("");
    setEmail("");
    setCategory(CATEGORIES[0]);
    setMessage("");
    setSubmitted(false);
  };

  return (
    <PublicLayout>
      <div className="mx-auto max-w-2xl px-4 py-8 md:py-12">
        <div className="mb-8 space-y-2">
          <h1 className="text-3xl font-bold tracking-tight">Feedback</h1>
          <p className="text-muted-foreground text-lg">
            Help us improve dMAT Practice Pro by sharing your feedback, suggestions, bug reports, or feature requests.
          </p>
        </div>

        {submitted ? (
          <Card className="p-8 text-center border-primary/20 shadow-card">
            <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
              <CheckCircle2 className="h-8 w-8 text-primary" />
            </div>
            <h2 className="text-2xl font-semibold mb-2">Thank You!</h2>
            <p className="text-muted-foreground mb-6">
              Your feedback has been successfully submitted and will be reviewed by our team.
            </p>
            <Button onClick={resetForm} variant="outline">
              Submit Another Response
            </Button>
          </Card>
        ) : (
          <Card className="shadow-card">
            <CardContent className="pt-6">
              <form onSubmit={handleSubmit} className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <Label htmlFor="name">Name (optional)</Label>
                    <Input
                      id="name"
                      placeholder="Your name"
                      value={name}
                      onChange={(e) => setName(e.target.value)}
                      maxLength={100}
                    />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="email">Email (optional)</Label>
                    <Input
                      id="email"
                      type="email"
                      placeholder="your.email@example.com"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      maxLength={255}
                    />
                  </div>
                </div>

                <div className="space-y-2">
                  <Label htmlFor="category">Category</Label>
                  <Select value={category} onValueChange={setCategory}>
                    <SelectTrigger>
                      <SelectValue placeholder="Select a category" />
                    </SelectTrigger>
                    <SelectContent>
                      {CATEGORIES.map((cat) => (
                        <SelectItem key={cat} value={cat}>
                          {cat}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>

                <div className="space-y-2">
                  <div className="flex items-center justify-between">
                    <Label htmlFor="message">Feedback <span className="text-destructive">*</span></Label>
                    <span className="text-xs text-muted-foreground">
                      {message.length} / 3000
                    </span>
                  </div>
                  <Textarea
                    id="message"
                    placeholder="Tell us what you think..."
                    className="min-h-[150px] resize-y"
                    value={message}
                    onChange={(e) => setMessage(e.target.value)}
                    required
                  />
                </div>

                <Button type="submit" className="w-full" disabled={loading}>
                  {loading ? "Submitting..." : (
                    <>
                      <Send className="mr-2 h-4 w-4" />
                      Submit Feedback
                    </>
                  )}
                </Button>
              </form>
            </CardContent>
          </Card>
        )}

        <AdSlot placement={adsConfig.placements.ContentBottom} className="mt-12" />
      </div>
      <Footer />
    </PublicLayout>
  );
}
