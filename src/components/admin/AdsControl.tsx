import { useState, useEffect } from "react";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { toast } from "sonner";
import { Loader2, ShieldCheck, ShieldAlert } from "lucide-react";
import { Badge } from "@/components/ui/badge";

export function AdsControl() {
  const [loading, setLoading] = useState(true);
  const [updating, setUpdating] = useState(false);
  const [adsEnabled, setAdsEnabled] = useState(true);
  const [adsDisabledAt, setAdsDisabledAt] = useState<string | null>(null);
  const [timeLeft, setTimeLeft] = useState<string>("");

  const fetchSettings = async () => {
    try {
      const { data, error } = await supabase.rpc('get_effective_site_settings');
      
      if (error) throw error;
      
      if (data && data.length > 0) {
        setAdsEnabled(data[0].ads_enabled);
        setAdsDisabledAt(data[0].ads_disabled_at);
      }
    } catch (err: any) {
      console.error("Failed to fetch ads settings:", err);
      toast.error("Error fetching settings", {
        description: err.message,
      });
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchSettings();
  }, []);

  useEffect(() => {
    let interval: NodeJS.Timeout;
    
    if (!adsEnabled && adsDisabledAt) {
      interval = setInterval(() => {
        const disabledTime = new Date(adsDisabledAt).getTime();
        const expireTime = disabledTime + 60 * 60 * 1000; // 1 hour
        const now = new Date().getTime();
        const diff = expireTime - now;
        
        if (diff <= 0) {
          // Expired - fetch fresh state (should auto-revert via RPC)
          setTimeLeft("");
          fetchSettings();
          clearInterval(interval);
        } else {
          const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
          const seconds = Math.floor((diff % (1000 * 60)) / 1000);
          setTimeLeft(`${minutes}m ${seconds}s`);
        }
      }, 1000);
    }
    
    return () => {
      if (interval) clearInterval(interval);
    };
  }, [adsEnabled, adsDisabledAt]);

  const toggleAds = async (enable: boolean) => {
    setUpdating(true);
    try {
      const { data, error } = await supabase
        .from('site_settings')
        .update({
          ads_enabled: enable,
          ads_disabled_at: enable ? null : new Date().toISOString()
        })
        .eq('id', 'global')
        .select();

      if (error) throw error;

      if (data && data.length > 0) {
        setAdsEnabled(data[0].ads_enabled);
        setAdsDisabledAt(data[0].ads_disabled_at);
        toast.success(enable ? "Ads Enabled" : "Ads Disabled", {
          description: enable 
            ? "Advertisements are now active for all users." 
            : "Advertisements have been turned off and will auto-enable in 1 hour.",
        });
      }
    } catch (err: any) {
      console.error("Failed to update ads settings:", err);
      toast.error("Update failed", {
        description: err.message,
      });
    } finally {
      setUpdating(false);
    }
  };

  if (loading) {
    return (
      <Card>
        <CardHeader>
          <CardTitle>Advertisements</CardTitle>
          <CardDescription>Loading ad settings...</CardDescription>
        </CardHeader>
        <CardContent className="flex items-center justify-center p-6">
          <Loader2 className="h-6 w-6 animate-spin text-muted-foreground" />
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <div>
            <CardTitle>Advertisements</CardTitle>
            <CardDescription>Global monetization control</CardDescription>
          </div>
          <Badge variant={adsEnabled ? "default" : "destructive"} className="text-sm">
            STATUS: {adsEnabled ? "ON" : "OFF"}
          </Badge>
        </div>
      </CardHeader>
      <CardContent>
        <div className="flex flex-col space-y-4">
          <div className="flex items-start space-x-3 text-sm">
            {adsEnabled ? (
              <ShieldCheck className="h-5 w-5 text-green-500 mt-0.5" />
            ) : (
              <ShieldAlert className="h-5 w-5 text-red-500 mt-0.5" />
            )}
            <div>
              {adsEnabled ? (
                <p>
                  Advertisements are currently <strong>active</strong> on allowlisted public pages. 
                  Users with ad-blockers will be prompted to disable them.
                </p>
              ) : (
                <div className="space-y-2">
                  <p>
                    Ads are temporarily <strong>disabled</strong> for all users. 
                    No advertisements will initialize anywhere, and the ad-block gate is suspended.
                  </p>
                  {timeLeft && (
                    <p className="font-medium text-destructive">
                      Automatically re-enable in: {timeLeft}
                    </p>
                  )}
                </div>
              )}
            </div>
          </div>
          
          <div className="pt-2">
            {adsEnabled ? (
              <Button 
                variant="destructive" 
                onClick={() => toggleAds(false)}
                disabled={updating}
              >
                {updating && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                Turn Ads OFF
              </Button>
            ) : (
              <Button 
                variant="default" 
                onClick={() => toggleAds(true)}
                disabled={updating}
              >
                {updating && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                Turn Ads ON
              </Button>
            )}
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
