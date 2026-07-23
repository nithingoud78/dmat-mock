import fs from 'fs';
import path from 'path';
import crypto from 'crypto';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

function uuid() {
  return crypto.randomUUID();
}

function randInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function randChoice(arr) {
  return arr[randInt(0, arr.length - 1)];
}

function shuffle(array) {
  const arr = [...array];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

const SHAPES = ["triangle", "circle", "square", "diamond", "pentagon", "star"];
const COLORS = ["primary", "secondary", "amber", "red", "green", "ink"];
const GRID_SIZE = 4;

function generateRule() {
  const shape = randChoice(SHAPES);
  const startRow = randInt(1, GRID_SIZE);
  const startCol = randInt(1, GRID_SIZE);
  
  // Movement Type
  const moveTypes = ['horizontal', 'vertical', 'diagonal', 'none'];
  const moveType = randChoice(moveTypes);
  
  let rowDir = 0;
  let colDir = 0;
  if (moveType === 'horizontal') {
    colDir = randChoice([-1, 1]);
  } else if (moveType === 'vertical') {
    rowDir = randChoice([-1, 1]);
  } else if (moveType === 'diagonal') {
    rowDir = randChoice([-1, 1]);
    colDir = randChoice([-1, 1]);
  }

  // Progression: constant or x+1
  const progression = randChoice(['constant', 'x+1', 'constant']); // Bias to constant
  const baseSpeed = randInt(1, 2);

  // Boundary logic: bounce or wrap
  // The official rules say bounce or continue along boundary. We'll do bounce.
  const boundary = 'bounce';

  // Transformation
  const hasRotation = randChoice([true, false]) && shape !== 'circle';
  const rotationStep = hasRotation ? randChoice([45, 90, -45, -90]) : 0;
  
  const hasColorChange = randChoice([true, false, false]);
  let colorCycle = [];
  if (hasColorChange) {
    colorCycle = [randChoice(COLORS), randChoice(COLORS)];
    if (randChoice([true, false])) colorCycle.push(randChoice(COLORS));
  } else {
    colorCycle = [randChoice(COLORS)];
  }

  return {
    shape,
    startRow,
    startCol,
    rowDir,
    colDir,
    progression,
    baseSpeed,
    boundary,
    rotationStep,
    colorCycle
  };
}

function stepObject(obj, rule, stepIndex) {
  let speed = rule.baseSpeed;
  if (rule.progression === 'x+1') {
    speed = rule.baseSpeed + stepIndex;
  }
  
  let newRow = obj.row;
  let newCol = obj.col;
  let rDir = obj.rowDir;
  let cDir = obj.colDir;

  for (let s = 0; s < speed; s++) {
    newRow += rDir;
    newCol += cDir;

    if (rule.boundary === 'bounce') {
      if (newRow < 1) { newRow = 2; rDir *= -1; }
      if (newRow > GRID_SIZE) { newRow = GRID_SIZE - 1; rDir *= -1; }
      if (newCol < 1) { newCol = 2; cDir *= -1; }
      if (newCol > GRID_SIZE) { newCol = GRID_SIZE - 1; cDir *= -1; }
    }
  }

  return {
    shape: obj.shape,
    row: newRow,
    col: newCol,
    rowDir: rDir,
    colDir: cDir,
    rotation: (obj.rotation + rule.rotationStep) % 360,
    colorIndex: (obj.colorIndex + 1) % rule.colorCycle.length,
    colorCycle: rule.colorCycle
  };
}

function generateSequence(numFigures) {
  const rules = [];
  let currentObjects = [];

  for (let i = 0; i < numFigures; i++) {
    const r = generateRule();
    rules.push(r);
    currentObjects.push({
      shape: r.shape,
      row: r.startRow,
      col: r.startCol,
      rowDir: r.rowDir,
      colDir: r.colDir,
      rotation: 0,
      colorIndex: 0,
      colorCycle: r.colorCycle
    });
  }

  const frames = [];
  for (let f = 0; f < 4; f++) {
    const frameObj = currentObjects.map(o => ({
      shape: o.shape,
      row: o.row,
      col: o.col,
      rotation: o.rotation,
      color: o.colorCycle[o.colorIndex]
    }));
    frames.push({ objects: frameObj });

    // step
    currentObjects = currentObjects.map((o, i) => stepObject(o, rules[i], f));
  }

  return { frames, rules };
}

function generateDistractor(correctFrame, rules, mistakeType) {
  // Deep copy
  const dist = JSON.parse(JSON.stringify(correctFrame));
  
  if (mistakeType === 'no_rotation') {
    // Revert rotation to previous frame (Frame 3)
    // Wait, the correct frame is Frame 4, so it has 3 steps of rotation.
    // If mistake is no rotation, we just subtract a step.
    dist.objects.forEach((o, i) => {
      o.rotation = (o.rotation - rules[i].rotationStep + 360) % 360;
    });
  } else if (mistakeType === 'wrong_bounce') {
    // Tweak position
    dist.objects.forEach((o, i) => {
       if (rules[i].rowDir !== 0 || rules[i].colDir !== 0) {
         o.row = Math.max(1, Math.min(GRID_SIZE, o.row + (rules[i].rowDir !== 0 ? 1 : 0)));
       }
    });
  } else if (mistakeType === 'forgot_x_plus_1') {
    // If progression was x+1, just step normally (constant)
    // This is complex to calculate accurately backwards, so let's just shift a position
    dist.objects.forEach((o, i) => {
      o.col = Math.max(1, Math.min(GRID_SIZE, o.col - 1));
    });
  } else if (mistakeType === 'wrong_color') {
    dist.objects.forEach((o, i) => {
      const allColors = [...COLORS];
      o.color = randChoice(allColors.filter(c => c !== o.color));
    });
  } else {
    // random jitter
    const tgt = randChoice(dist.objects);
    tgt.row = Math.max(1, Math.min(GRID_SIZE, tgt.row + randChoice([-1, 1])));
  }

  // Ensure it's not identical
  if (JSON.stringify(dist) === JSON.stringify(correctFrame)) {
    dist.objects[0].color = 'red'; // fallback
  }

  return dist;
}

function generateQuestion(difficulty) {
  let numFigures = 1;
  let diffStr = 'easy';
  if (difficulty === 'medium') { numFigures = 2; diffStr = 'medium'; }
  if (difficulty === 'hard') { numFigures = 3; diffStr = 'hard'; }

  const { frames, rules } = generateSequence(numFigures);
  
  const correctFrame = frames[3];
  
  const optA = correctFrame;
  const optB = generateDistractor(correctFrame, rules, 'no_rotation');
  const optC = generateDistractor(correctFrame, rules, 'wrong_bounce');
  const optD = generateDistractor(correctFrame, rules, 'wrong_color');

  const optionsRaw = [optA, optB, optC, optD];
  const optionsShuffled = shuffle(optionsRaw);
  const correctIdx = optionsShuffled.indexOf(optA);
  const optionIds = ['A', 'B', 'C', 'D'];

  const optionsFormatted = optionsShuffled.map((o, i) => ({
    id: optionIds[i],
    text: `Option ${optionIds[i]}`,
    objects: o.objects
  }));

  const correctOptionId = optionIds[correctIdx];

  const visualData = {
    type: "figure_sequence",
    grid_size: GRID_SIZE,
    frames: [frames[0], frames[1], frames[2]],
    options: optionsFormatted
  };

  let explanation = `The correct answer is ${correctOptionId}. `;
  rules.forEach((r, idx) => {
    explanation += `\nFigure ${idx + 1} (${r.shape}): `;
    if (r.rowDir === 0 && r.colDir === 0) explanation += `Remains stationary. `;
    else {
      let dirStr = '';
      if (r.rowDir === -1) dirStr += 'Up';
      if (r.rowDir === 1) dirStr += 'Down';
      if (r.colDir === -1) dirStr += (dirStr ? ' and Left' : 'Left');
      if (r.colDir === 1) dirStr += (dirStr ? ' and Right' : 'Right');
      explanation += `Moves ${dirStr} by ${r.baseSpeed} step(s) per frame`;
      if (r.progression === 'x+1') explanation += ` (increasing by 1 step each frame, i.e., x+1 progression). `;
      else explanation += `. `;
      if (r.boundary === 'bounce') explanation += `It bounces off the walls. `;
    }
    if (r.rotationStep !== 0) explanation += `It rotates ${r.rotationStep} degrees each frame. `;
    if (r.colorCycle.length > 1) explanation += `Its color cycles between ${r.colorCycle.join(', ')}. `;
  });

  return {
    id: uuid(),
    module: 'figure_sequence',
    prompt_text: 'Which figure completes the sequence?',
    options: optionsFormatted.map(o => ({ id: o.id, text: o.text })),
    correct_option_id: correctOptionId,
    explanation_text: explanation.trim(),
    difficulty: diffStr,
    source: 'procedural_gen_2026',
    time_estimate_seconds: 75,
    visual_data: visualData,
    subtopic: numFigures > 1 ? 'Multiple Figures' : 'Single Figure'
  };
}

export function generateBatch(count, difficulty) {
  const qs = [];
  for (let i = 0; i < count; i++) {
    qs.push(generateQuestion(difficulty));
  }
  return qs;
}

if (process.argv[1] === __filename) {
  const easy = generateBatch(10, 'easy');
  console.log(JSON.stringify(easy[0], null, 2));
}
