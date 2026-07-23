import { createClient } from "@supabase/supabase-js";
import fs from "fs";

const env = fs.readFileSync(".env", "utf8");
const urlMatch = env.match(/VITE_SUPABASE_URL="([^"]+)"/);
const keyMatch = env.match(/VITE_SUPABASE_PUBLISHABLE_KEY="([^"]+)"/);

const supabase = createClient(urlMatch[1], keyMatch[1]);

async function run() {
  const { data, error } = await supabase.from("mock_sets").select("id, label, module_breakdown");
  if (error) { console.error(error); return; }
  console.log("Mock sets:", data.length);
  if (data.length > 0) {
    console.log(data[0]);
  }
}
run();
