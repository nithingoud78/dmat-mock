import { createFileRoute } from "@tanstack/react-router";
import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Eye, Trash2, CheckCircle, MailOpen } from "lucide-react";
import { toast } from "sonner";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
  DialogFooter,
} from "@/components/ui/dialog";

export const Route = createFileRoute("/admin/feedback")({
  head: () => ({
    meta: [{ title: "Admin - Feedback — dMAT Practice Pro" }],
  }),
  component: AdminFeedbackPage,
});

type FeedbackRow = {
  id: string;
  created_at: string;
  name: string | null;
  email: string | null;
  category: string;
  message: string;
  status: string;
};

function AdminFeedbackPage() {
  const queryClient = useQueryClient();
  const [selectedFeedback, setSelectedFeedback] = useState<FeedbackRow | null>(null);
  const [isDialogOpen, setIsDialogOpen] = useState(false);

  const { data: feedbackList, isLoading } = useQuery({
    queryKey: ["admin_feedback"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("feedback")
        .select("*")
        .order("created_at", { ascending: false });
      if (error) throw error;
      return data as FeedbackRow[];
    },
  });

  const updateStatusMutation = useMutation({
    mutationFn: async ({ id, status }: { id: string; status: string }) => {
      const { error } = await supabase
        .from("feedback")
        .update({ status })
        .eq("id", id);
      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin_feedback"] });
      toast.success("Status updated");
    },
    onError: (err: any) => toast.error(err.message),
  });

  const deleteMutation = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase.from("feedback").delete().eq("id", id);
      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin_feedback"] });
      toast.success("Feedback deleted");
      setIsDialogOpen(false);
    },
    onError: (err: any) => toast.error(err.message),
  });

  const handleRowClick = (fb: FeedbackRow) => {
    setSelectedFeedback(fb);
    setIsDialogOpen(true);
  };

  const getStatusBadge = (status: string) => {
    switch (status) {
      case "new":
        return <Badge className="bg-blue-500 hover:bg-blue-600">New</Badge>;
      case "read":
        return <Badge variant="secondary">Read</Badge>;
      case "resolved":
        return <Badge className="bg-green-500 hover:bg-green-600">Resolved</Badge>;
      default:
        return <Badge variant="outline">{status}</Badge>;
    }
  };

  return (
    <div className="p-6 md:p-10 space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-3xl font-bold tracking-tight">Feedback</h1>
      </div>

      <Card>
        <CardHeader className="pb-4">
          <CardTitle className="text-lg">User Submissions</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="rounded-md border">
            <Table>
              <TableHeader>
                <TableRow className="bg-muted/50 hover:bg-muted/50">
                  <TableHead className="w-[120px]">Date</TableHead>
                  <TableHead>Category</TableHead>
                  <TableHead>User</TableHead>
                  <TableHead className="max-w-[300px]">Message Preview</TableHead>
                  <TableHead className="w-[100px]">Status</TableHead>
                  <TableHead className="w-[80px] text-right">Actions</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {isLoading ? (
                  <TableRow>
                    <TableCell colSpan={6} className="h-24 text-center">
                      Loading feedback...
                    </TableCell>
                  </TableRow>
                ) : !feedbackList || feedbackList.length === 0 ? (
                  <TableRow>
                    <TableCell colSpan={6} className="h-24 text-center text-muted-foreground">
                      No feedback submitted yet.
                    </TableCell>
                  </TableRow>
                ) : (
                  feedbackList.map((fb) => (
                    <TableRow 
                      key={fb.id} 
                      className="cursor-pointer hover:bg-muted/50 transition-colors"
                      onClick={() => handleRowClick(fb)}
                    >
                      <TableCell className="text-muted-foreground whitespace-nowrap">
                        {new Date(fb.created_at).toLocaleDateString("en-US", { year: "numeric", month: "short", day: "numeric" })}
                      </TableCell>
                      <TableCell className="font-medium">{fb.category}</TableCell>
                      <TableCell>
                        <div className="text-sm font-medium">{fb.name || "Anonymous"}</div>
                        {fb.email && <div className="text-xs text-muted-foreground">{fb.email}</div>}
                      </TableCell>
                      <TableCell className="max-w-[300px] truncate text-muted-foreground">
                        {fb.message}
                      </TableCell>
                      <TableCell>{getStatusBadge(fb.status)}</TableCell>
                      <TableCell className="text-right">
                        <Button variant="ghost" size="icon" className="h-8 w-8 text-muted-foreground">
                          <Eye className="h-4 w-4" />
                        </Button>
                      </TableCell>
                    </TableRow>
                  ))
                )}
              </TableBody>
            </Table>
          </div>
        </CardContent>
      </Card>

      <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
        <DialogContent className="sm:max-w-[600px]">
          <DialogHeader>
            <DialogTitle className="flex items-center gap-2">
              Feedback Details
              {selectedFeedback && getStatusBadge(selectedFeedback.status)}
            </DialogTitle>
            <DialogDescription>
              Submitted on {selectedFeedback && new Date(selectedFeedback.created_at).toLocaleString("en-US", { month: "long", day: "numeric", year: "numeric", hour: "numeric", minute: "numeric", hour12: true })}
            </DialogDescription>
          </DialogHeader>

          {selectedFeedback && (
            <div className="space-y-6 py-4">
              <div className="grid grid-cols-2 gap-4 rounded-lg bg-muted/50 p-4">
                <div>
                  <div className="text-xs text-muted-foreground font-medium mb-1">Category</div>
                  <div className="text-sm font-semibold">{selectedFeedback.category}</div>
                </div>
                <div>
                  <div className="text-xs text-muted-foreground font-medium mb-1">Status</div>
                  <div className="text-sm capitalize">{selectedFeedback.status}</div>
                </div>
                <div>
                  <div className="text-xs text-muted-foreground font-medium mb-1">Name</div>
                  <div className="text-sm">{selectedFeedback.name || "Anonymous"}</div>
                </div>
                <div>
                  <div className="text-xs text-muted-foreground font-medium mb-1">Email</div>
                  <div className="text-sm">
                    {selectedFeedback.email ? (
                      <a href={`mailto:${selectedFeedback.email}`} className="text-primary hover:underline">
                        {selectedFeedback.email}
                      </a>
                    ) : (
                      "Not provided"
                    )}
                  </div>
                </div>
              </div>

              <div className="space-y-2">
                <div className="text-sm font-semibold">Message</div>
                <div className="rounded-md border p-4 text-sm whitespace-pre-wrap bg-card text-card-foreground">
                  {selectedFeedback.message}
                </div>
              </div>
            </div>
          )}

          <DialogFooter className="flex-col sm:flex-row gap-2 sm:justify-between items-center border-t pt-4">
            <Button
              variant="destructive"
              onClick={() => {
                if (selectedFeedback && confirm("Are you sure you want to delete this feedback?")) {
                  deleteMutation.mutate(selectedFeedback.id);
                }
              }}
              disabled={deleteMutation.isPending}
            >
              <Trash2 className="mr-2 h-4 w-4" />
              Delete
            </Button>

            <div className="flex gap-2 w-full sm:w-auto">
              {selectedFeedback?.status !== "read" && (
                <Button
                  variant="outline"
                  onClick={() => updateStatusMutation.mutate({ id: selectedFeedback!.id, status: "read" })}
                  disabled={updateStatusMutation.isPending}
                  className="flex-1 sm:flex-none"
                >
                  <MailOpen className="mr-2 h-4 w-4" />
                  Mark Read
                </Button>
              )}
              {selectedFeedback?.status !== "resolved" && (
                <Button
                  onClick={() => updateStatusMutation.mutate({ id: selectedFeedback!.id, status: "resolved" })}
                  disabled={updateStatusMutation.isPending}
                  className="flex-1 sm:flex-none"
                >
                  <CheckCircle className="mr-2 h-4 w-4" />
                  Mark Resolved
                </Button>
              )}
            </div>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}
