// This file is deprecated and scheduled for deletion.
// The user history feature has been completely removed.
// Please delete this file from the filesystem.

import { createFileRoute, redirect } from "@tanstack/react-router";

export const Route = createFileRoute("/history")({
  beforeLoad: () => {
    throw redirect({ to: "/" });
  },
  component: () => null,
});
