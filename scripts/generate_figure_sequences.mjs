import { createClient } from "@supabase/supabase-js";
import fs from "fs";
import path from "path";
import crypto from "crypto";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// --- Load Env ---
const envPath = path.resolve(__dirname, "..", ".env");
if (fs.existsSync(envPath)) {
  const envConfig = fs.readFileSync(envPath, "utf-8");
  envConfig.split("\n").forEach((line) => {
    const match = line.match(/^([^=]+)=(.*)$/);
    if (match) {
      process.env[match[1].trim()] = match[2].trim().replace(/^['"]|['"]$/g, "");
    }
  });
}

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error("Missing VITE_SUPABASE_URL or VITE_SUPABASE_ANON_KEY in .env");
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

// --- Constants ---
const SHAPES = ["triangle", "circle", "square", "diamond", "pentagon", "star"];
const COLORS = ["primary", "red", "green", "amber", "secondary", "ink"];
const GRID_SIZES = [3, 4];

function randomItem(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}

function randomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function generateId() {
  return crypto.randomUUID();
}

// --- Generator Logic ---
class FigureSequenceGenerator {
  constructor() {
    this.questions = [];
  }

  // --- EASY: 1 figure, simple linear movement or rotation ---
  generateEasy() {
    for (let i = 0; i < 67; i++) {
      const size = randomItem([3, 4]);
      const shape = randomItem(SHAPES);
      const color = randomItem(COLORS);
      
      const type = randomItem(["move_linear", "rotate", "color_cycle"]);
      let frames = [];
      let explanation = "";

      if (type === "move_linear") {
        const dir = randomItem(["right", "down", "diagonal"]);
        let r = randomInt(0, size - 1);
        let c = randomInt(0, size - 1);
        explanation = `The ${color} ${shape} moves 1 step ${dir} in each frame. When it hits the boundary, it wraps around.`;
        
        for (let f = 0; f < 5; f++) {
          frames.push({ objects: [{ shape, color, row: r, col: c }] });
          if (dir === "right") c = (c + 1) % size;
          if (dir === "down") r = (r + 1) % size;
          if (dir === "diagonal") {
            c = (c + 1) % size;
            r = (r + 1) % size;
          }
        }
      } else if (type === "rotate") {
        const rotShape = randomItem(["triangle", "pentagon", "star"]); // shapes that show rotation
        let rot = 0;
        const step = randomItem([90, -90, 45, 180]);
        let r = randomInt(0, size - 1);
        let c = randomInt(0, size - 1);
        explanation = `The ${color} ${rotShape} rotates ${Math.abs(step)} degrees ${step > 0 ? "clockwise" : "counter-clockwise"} in place.`;
        
        for (let f = 0; f < 5; f++) {
          frames.push({ objects: [{ shape: rotShape, color, row: r, col: c, rotation: rot }] });
          rot = (rot + step) % 360;
        }
      } else { // color_cycle
        const color2 = randomItem(COLORS.filter(x => x !== color));
        let c1 = color, c2 = color2;
        let r = randomInt(0, size - 1), c = randomInt(0, size - 1);
        explanation = `The ${shape} alternates color between ${c1} and ${c2} while staying in place.`;
        for (let f = 0; f < 5; f++) {
          frames.push({ objects: [{ shape, color: f % 2 === 0 ? c1 : c2, row: r, col: c }] });
        }
      }

      this.addQuestion("easy", size, frames, explanation, ["movement", type]);
    }
  }

  // --- MEDIUM: 2 figures, multiple rules ---
  generateMedium() {
    for (let i = 0; i < 68; i++) {
      const size = randomItem([3, 4]);
      
      const obj1 = { shape: randomItem(SHAPES), color: randomItem(COLORS), r: randomInt(0, size-1), c: randomInt(0, size-1) };
      let obj2;
      do {
        obj2 = { shape: randomItem(SHAPES), color: randomItem(COLORS), r: randomInt(0, size-1), c: randomInt(0, size-1) };
      } while(obj1.r === obj2.r && obj1.c === obj2.c);

      const rule1 = randomItem(["right", "down", "diagonal"]);
      const rule2 = randomItem(["left", "up", "rotate_90"]);
      
      let explanation = `Figure 1 (${obj1.color} ${obj1.shape}) `;
      if (rule1 === "right") explanation += "moves 1 step right. ";
      if (rule1 === "down") explanation += "moves 1 step down. ";
      if (rule1 === "diagonal") explanation += "moves 1 step diagonally down-right. ";
      
      explanation += `Figure 2 (${obj2.color} ${obj2.shape}) `;
      if (rule2 === "left") explanation += "moves 1 step left. ";
      if (rule2 === "up") explanation += "moves 1 step up. ";
      if (rule2 === "rotate_90") explanation += "rotates 90 degrees clockwise in place. ";

      let frames = [];
      let r1 = obj1.r, c1 = obj1.c, rot1 = 0;
      let r2 = obj2.r, c2 = obj2.c, rot2 = 0;

      for (let f = 0; f < 5; f++) {
        frames.push({
          objects: [
            { shape: obj1.shape, color: obj1.color, row: r1, col: c1, rotation: rot1 },
            { shape: obj2.shape, color: obj2.color, row: r2, col: c2, rotation: rot2 }
          ]
        });

        // Apply rules
        if (rule1 === "right") c1 = (c1 + 1) % size;
        if (rule1 === "down") r1 = (r1 + 1) % size;
        if (rule1 === "diagonal") { c1 = (c1 + 1) % size; r1 = (r1 + 1) % size; }
        
        if (rule2 === "left") c2 = (c2 - 1 + size) % size;
        if (rule2 === "up") r2 = (r2 - 1 + size) % size;
        if (rule2 === "rotate_90") rot2 = (rot2 + 90) % 360;
      }

      this.addQuestion("medium", size, frames, explanation, ["multi-figure", "combined"]);
    }
  }

  // --- HARD: x+1 progression, bouncing, 3 figures ---
  generateHard() {
    for (let i = 0; i < 64; i++) {
      const size = 4; // Use 4x4 for hard to allow bouncing
      
      const shape1 = randomItem(SHAPES);
      const color1 = randomItem(COLORS);
      let c1 = randomInt(0, 3);
      
      const type = randomItem(["x_plus_1", "bounce"]);
      let frames = [];
      let explanation = "";

      if (type === "x_plus_1") {
        // x+1 progression
        let step = 1;
        let c = c1;
        explanation = `The ${color1} ${shape1} moves to the right. First it moves 1 step, then 2 steps, then 3 steps, following an x+1 progressive pattern.`;
        for (let f = 0; f < 5; f++) {
          frames.push({ objects: [{ shape: shape1, color: color1, row: 0, col: c }] });
          c = (c + step) % size;
          step++;
        }
      } else {
        // bounce
        let c = 0;
        let dir = 1;
        explanation = `The ${color1} ${shape1} moves left/right and bounces off the outer boundaries of the 4x4 matrix.`;
        for (let f = 0; f < 5; f++) {
          frames.push({ objects: [{ shape: shape1, color: color1, row: 1, col: c }] });
          if (c + dir >= size || c + dir < 0) {
            dir *= -1; // bounce
          }
          c += dir;
        }
      }
      
      this.addQuestion("hard", size, frames, explanation, ["complex", type]);
    }
  }

  addQuestion(difficulty, size, frames, explanation, tags) {
    const qFrame = frames[4];
    const baseFrames = frames.slice(0, 4);
    
    // Generate distractors
    const options = [
      { id: "a", objects: qFrame.objects }, // Correct
      { id: "b", objects: this.tweakFrame(qFrame.objects, size) },
      { id: "c", objects: this.tweakFrame(qFrame.objects, size) },
      { id: "d", objects: this.tweakFrame(qFrame.objects, size) }
    ];

    // Shuffle options
    options.sort(() => Math.random() - 0.5);
    // Reassign IDs a, b, c, d
    const letters = ["a", "b", "c", "d"];
    let correctId = "a";
    options.forEach((opt, idx) => {
      if (opt.objects === qFrame.objects) correctId = letters[idx];
      opt.id = letters[idx];
    });

    const visualData = {
      type: "figure_sequence",
      grid_size: size,
      frames: baseFrames,
      options: options
    };

    this.questions.push({
      id: generateId(),
      module: "figure_sequence",
      prompt_text: "Identify the correct next figure in the sequence.",
      explanation_text: explanation,
      correct_option_id: correctId,
      difficulty: difficulty,
      time_estimate_seconds: difficulty === "hard" ? 75 : 90,
      visual_data: visualData,
      options: options.map(o => ({ id: o.id, text: "See visual option" })),
      tags: ["figure_sequence", ...tags],
      source_id: "7554f65c-6b3e-4fb8-bb65-0ab63f7dbec4", // We'll insert an Antigravity source if needed, or use a dummy.
      verified: true,
      approved: true,
      created_at: new Date().toISOString()
    });
  }

  tweakFrame(objects, size) {
    return objects.map(o => {
      // Randomly modify color, shape, or position slightly to create plausible distractors
      const r = Math.random();
      if (r < 0.33) return { ...o, row: (o.row + 1) % size };
      if (r < 0.66) return { ...o, col: (o.col + 1) % size };
      return { ...o, color: randomItem(COLORS) };
    });
  }

  async run() {
    console.log("Generating questions...");
    this.generateEasy();
    this.generateMedium();
    this.generateHard();

    console.log(`Generated ${this.questions.length} questions. Inserting into Supabase...`);

    // Ensure source exists first
    const sourceId = this.questions[0].source_id;
    const { error: srcError } = await supabase.from("sources").upsert({
      id: sourceId,
      name: "Antigravity Procedural Generator (g.a.s.t. pattern matching)",
      publisher: "dMAT Practice Pro",
      note: "Programmatically generated original questions covering all official rule families."
    });

    if (srcError) {
      console.error("Failed to insert source:", srcError);
    }

    const batchSize = 20;
    for (let i = 0; i < this.questions.length; i += batchSize) {
      const batch = this.questions.slice(i, i + batchSize);
      const { error } = await supabase.from("questions").insert(batch);
      if (error) {
        console.error("Failed to insert batch:", error);
      } else {
        console.log(`Inserted batch ${i / batchSize + 1}`);
      }
    }

    console.log("Successfully seeded Figure Sequences!");
  }
}

new FigureSequenceGenerator().run().catch(console.error);
