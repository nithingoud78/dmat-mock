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

function shuffle(array) {
  const arr = [...array];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

function generateEasy() {
  // A + B = X
  // A - B = Y
  const a = randInt(10, 30);
  const b = randInt(5, 20);
  
  const x = a + b;
  const y = a - b;

  const promptText = `A + B = ${x}\nA - B = ${y}\n\nWhat numbers do A and B correspond to?`;
  
  const correct = `A=${a}, B=${b}`;
  const d1 = `A=${a-1}, B=${b+1}`;
  const d2 = `A=${a+1}, B=${b-1}`;
  const d3 = `A=${a}, B=${b-2}`;

  const explanation = `Using substitution and elimination, we can solve for the variables. A=${a}, B=${b}`;

  return { promptText, correct, distractors: [d1, d2, d3], explanation, difficulty: 'easy', subtopic: 'basic_equations' };
}

function generateMedium() {
  // A + B = X
  // B + C = Y
  // A + C = Z
  const a = randInt(5, 20);
  const b = randInt(5, 20);
  const c = randInt(5, 20);

  const x = a + b;
  const y = b + c;
  const z = a + c;

  const promptText = `A + B = ${x}\nB + C = ${y}\nA + C = ${z}\n\nWhat numbers do A, B and C correspond to?`;

  const correct = `A=${a}, B=${b}, C=${c}`;
  const d1 = `A=${a+1}, B=${b-1}, C=${c}`;
  const d2 = `A=${a}, B=${b+1}, C=${c-1}`;
  const d3 = `A=${a-1}, B=${b}, C=${c+1}`;

  const explanation = `Using substitution and elimination, we can solve for the variables. A=${a}, B=${b}, C=${c}`;

  return { promptText, correct, distractors: [d1, d2, d3], explanation, difficulty: 'medium', subtopic: 'substitution_methods' };
}

function generateHard() {
  // A + B = X
  // B - C = Y
  // C + D = Z
  // D = W
  const d = randInt(5, 25);
  const c = randInt(5, 20);
  const b = randInt(c + 1, c + 15); // Ensure Y is positive
  const a = randInt(5, 20);

  const x = a + b;
  const y = b - c;
  const z = c + d;
  const w = d;

  const promptText = `A + B = ${x}\nB - C = ${y}\nC + D = ${z}\nD = ${w}\n\nWhat numbers do A, B, C and D correspond to?`;

  const correct = `A=${a}, B=${b}, C=${c}, D=${d}`;
  const d1 = `A=${a+1}, B=${b}, C=${c-1}, D=${d}`;
  const d2 = `A=${a}, B=${b-1}, C=${c}, D=${d}`;
  const d3 = `A=${a}, B=${b+1}, C=${c+1}, D=${d}`;

  const explanation = `Using substitution and elimination, we can solve for the variables. A=${a}, B=${b}, C=${c}, D=${d}`;

  return { promptText, correct, distractors: [d1, d2, d3], explanation, difficulty: 'hard', subtopic: 'system_of_equations' };
}

function generateQuestion(difficulty) {
  let qData;
  if (difficulty === 'easy') qData = generateEasy();
  else if (difficulty === 'medium') qData = generateMedium();
  else qData = generateHard();

  const optionsRaw = [
    { text: qData.correct, isCorrect: true },
    { text: qData.distractors[0], isCorrect: false },
    { text: qData.distractors[1], isCorrect: false },
    { text: qData.distractors[2], isCorrect: false },
  ];

  const shuffled = shuffle(optionsRaw);
  const optionIds = ['a', 'b', 'c', 'd'];
  let correctOptionId = 'a';

  const optionsFormatted = shuffled.map((o, i) => {
    if (o.isCorrect) correctOptionId = optionIds[i];
    return { id: optionIds[i], text: o.text };
  });

  return {
    id: uuid(),
    module: 'math_equation',
    prompt_text: qData.promptText,
    options: optionsFormatted,
    correct_option_id: correctOptionId,
    explanation_text: qData.explanation,
    difficulty: qData.difficulty,
    source: 'procedural_gen_2026',
    time_estimate_seconds: 75,
    visual_data: null,
    subtopic: qData.subtopic
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
  const medium = generateBatch(1, 'medium');
  console.log(JSON.stringify(medium[0], null, 2));
}
