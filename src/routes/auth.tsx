import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { useAuth } from "@/lib/auth";
import { toast } from "sonner";

export const Route = createFileRoute("/auth")({
  head: () => ({
    meta: [
      { title: "Sign in — dMAT Practice Pro" },
      { name: "description", content: "Sign in to save your practice attempts and results." },
      { name: "robots", content: "noindex" },
    ],
  }),
  component: AuthPage,
});

function AuthPage() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [busy, setBusy] = useState(false);

  useEffect(() => {
    if (user) navigate({ to: "/" });
  }, [user, navigate]);

  const signIn = async () => {
    setBusy(true);
    const { error } = await supabase.auth.signInWithPassword({ email, password });
    setBusy(false);
    if (error) return toast.error(error.message);
    toast.success("Signed in");
    navigate({ to: "/" });
  };

  return (
    <div className="flex min-h-screen items-center justify-center bg-secondary/40 px-4">
      <Card className="w-full max-w-md p-8 shadow-card">
        <Link
          to="/"
          className="mb-6 inline-block text-xs text-muted-foreground hover:text-foreground"
        >
          ← Back to home
        </Link>
        <h1 className="text-2xl font-semibold">Admin Login</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Sign in to access the dMAT Practice Pro admin dashboard.
        </p>
        <div className="space-y-4 pt-6">
          <div className="space-y-2">
            <Label>Email</Label>
            <Input type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
          </div>
          <div className="space-y-2">
            <Label>Password</Label>
            <Input type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
          </div>
          <Button onClick={signIn} disabled={busy} className="w-full">
            {busy ? "…" : "Sign in"}
          </Button>
        </div>
      </Card>
    </div>
  );
}
