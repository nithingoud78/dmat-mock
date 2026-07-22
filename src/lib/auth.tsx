import { createContext, useContext, useEffect, useState, type ReactNode } from "react";
import type { Session, User } from "@supabase/supabase-js";
import { supabase } from "@/integrations/supabase/client";
import { useQueryClient } from "@tanstack/react-query";

interface AuthState {
  session: Session | null;
  user: User | null;
  isAdmin: boolean;
  loading: boolean;
  signOut: () => Promise<void>;
}

const AuthCtx = createContext<AuthState>({
  session: null,
  user: null,
  isAdmin: false,
  loading: true,
  signOut: async () => {},
});

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null);
  const [isAdmin, setIsAdmin] = useState(false);
  const [loading, setLoading] = useState(true);
  const qc = useQueryClient();

  useEffect(() => {
    let mounted = true;

    const checkAdmin = async (userId: string | undefined) => {
      if (!userId) {
        setIsAdmin(false);
        return;
      }
      // First, try to check if the user is already an admin
      const { data: hasRole, error: roleError } = await supabase.rpc("has_role", {
        _user_id: userId,
        _role: "admin",
      });

      // If not an admin, attempt to run the bootstrap process
      // The bootstrap function is a SECURITY DEFINER that securely checks if the
      // user's email is in the authorized admin list and promotes them if so.
      if (!hasRole) {
        const { data: didBootstrap, error: bootstrapError } = await supabase.rpc(
          "bootstrap_admin" as any,
        );

        if (bootstrapError) {
          console.error("Bootstrap error:", bootstrapError);
        } else if (didBootstrap) {
          console.log("Successfully bootstrapped admin privileges!");
          if (mounted) setIsAdmin(true);
          return;
        }
      }

      if (roleError) {
        console.error("Error checking admin status:", roleError);
      }

      if (mounted) setIsAdmin(!!hasRole);
    };

    const { data: sub } = supabase.auth.onAuthStateChange((event, s) => {
      if (!mounted) return;
      setSession(s);
      if (event === "SIGNED_IN" || event === "SIGNED_OUT" || event === "USER_UPDATED") {
        setTimeout(() => checkAdmin(s?.user?.id), 0);
        if (event !== "SIGNED_OUT") qc.invalidateQueries();
      }
    });

    supabase.auth.getSession().then(({ data }) => {
      if (!mounted) return;
      setSession(data.session);
      checkAdmin(data.session?.user?.id).finally(() => {
        if (mounted) setLoading(false);
      });
    });

    return () => {
      mounted = false;
      sub.subscription.unsubscribe();
    };
  }, [qc]);

  const signOut = async () => {
    await qc.cancelQueries();
    qc.clear();
    await supabase.auth.signOut();
  };

  return (
    <AuthCtx.Provider value={{ session, user: session?.user ?? null, isAdmin, loading, signOut }}>
      {children}
    </AuthCtx.Provider>
  );
}

export const useAuth = () => useContext(AuthCtx);
