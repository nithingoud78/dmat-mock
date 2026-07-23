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

// Generate base latin square
function generateBaseSquare(size) {
  const sq = [];
  for (let r = 0; r < size; r++) {
    const row = [];
    for (let c = 0; c < size; c++) {
      row.push((r + c) % size);
    }
    sq.push(row);
  }
  return sq;
}

// Shuffle rows, cols, and symbols
function randomizeSquare(sq, size) {
  let rs = [...Array(size).keys()];
  let cs = [...Array(size).keys()];
  let syms = [...Array(size).keys()];
  
  rs = shuffle(rs);
  cs = shuffle(cs);
  syms = shuffle(syms);
  
  const res = [];
  for (let r = 0; r < size; r++) {
    const row = [];
    for (let c = 0; c < size; c++) {
      row.push(syms[sq[rs[r]][cs[c]]]);
    }
    res.push(row);
  }
  return res;
}

function copyGrid(grid) {
  return grid.map(r => [...r]);
}

// Simple deduction solver
function solveGrid(grid, size) {
  let progress = true;
  const g = copyGrid(grid);
  
  while (progress) {
    progress = false;
    for (let r = 0; r < size; r++) {
      for (let c = 0; c < size; c++) {
        if (g[r][c] !== null) continue;
        
        const possible = new Set([...Array(size).keys()]);
        for (let i = 0; i < size; i++) {
          if (g[r][i] !== null) possible.delete(g[r][i]);
          if (g[i][c] !== null) possible.delete(g[i][c]);
        }
        
        if (possible.size === 1) {
          g[r][c] = Array.from(possible)[0];
          progress = true;
        }
      }
    }
  }
  
  return g;
}

function canSolveTarget(grid, size, targetR, targetC) {
  const solved = solveGrid(grid, size);
  return solved[targetR][targetC] !== null;
}

function generatePuzzle(size, difficulty) {
  const base = generateBaseSquare(size);
  const solution = randomizeSquare(base, size);
  
  // Choose random symbols
  const allSymbolSets = [
    ['A', 'B', 'C', 'D', 'E'],
    ['1', '2', '3', '4', '5'],
    ['+', '-', 'x', '/', '='],
    ['α', 'β', 'γ', 'δ', 'ε']
  ];
  const symbolSet = randChoice(allSymbolSets).slice(0, size);
  
  const targetR = randInt(0, size - 1);
  const targetC = randInt(0, size - 1);
  const targetVal = solution[targetR][targetC];
  
  // Start with full grid (except target)
  let puzzle = copyGrid(solution);
  puzzle[targetR][targetC] = null;
  
  // Create list of positions to try removing
  const pos = [];
  for (let r = 0; r < size; r++) {
    for (let c = 0; c < size; c++) {
      if (r !== targetR || c !== targetC) pos.push({r, c});
    }
  }
  const shuffledPos = shuffle(pos);
  
  let removedCount = 0;
  for (const p of shuffledPos) {
    const backup = puzzle[p.r][p.c];
    puzzle[p.r][p.c] = null;
    
    if (!canSolveTarget(puzzle, size, targetR, targetC)) {
      // Revert if it becomes unsolvable
      puzzle[p.r][p.c] = backup;
    } else {
      removedCount++;
    }
  }
  
  // Depending on difficulty, we might want to put some back to make it easier
  if (difficulty === 'easy') {
    // Put back ~30% of removed
    const toRestore = Math.floor(removedCount * 0.3);
    let restored = 0;
    for (const p of pos) {
      if (puzzle[p.r][p.c] === null && restored < toRestore) {
        puzzle[p.r][p.c] = solution[p.r][p.c];
        restored++;
      }
    }
  }
  
  // Format grid
  const finalGrid = [];
  for (let r = 0; r < size; r++) {
    const row = [];
    for (let c = 0; c < size; c++) {
      if (r === targetR && c === targetC) row.push('?');
      else if (puzzle[r][c] === null) row.push('');
      else row.push(symbolSet[puzzle[r][c]]);
    }
    finalGrid.push(row);
  }
  
  return {
    solutionGrid: solution.map(row => row.map(v => symbolSet[v])),
    finalGrid,
    symbolSet,
    targetR,
    targetC,
    targetVal: symbolSet[targetVal]
  };
}

function randChoice(arr) {
  return arr[randInt(0, arr.length - 1)];
}

function generateQuestion(difficulty) {
  const size = (difficulty === 'easy' || difficulty === 'medium') ? 4 : randChoice([4, 5]);
  const p = generatePuzzle(size, difficulty);
  
  const optionsRaw = p.symbolSet.map(s => ({
    id: s.toLowerCase(),
    text: s,
    isCorrect: s === p.targetVal
  }));
  
  // We need exactly 4 options. If size is 5, drop one incorrect option.
  let finalOpts = optionsRaw;
  if (size === 5) {
    const correctOpt = optionsRaw.find(o => o.isCorrect);
    const incorrectOpts = optionsRaw.filter(o => !o.isCorrect);
    finalOpts = [correctOpt, ...shuffle(incorrectOpts).slice(0, 3)];
  }
  
  const shuffled = shuffle(finalOpts);
  const optionIds = ['a', 'b', 'c', 'd'];
  let correctOptionId = 'a';

  const optionsFormatted = shuffled.map((o, i) => {
    if (o.isCorrect) correctOptionId = optionIds[i];
    return { id: optionIds[i], text: o.text };
  });

  const visualData = {
    type: "latin_square",
    size: size,
    symbols: p.symbolSet,
    grid: p.finalGrid,
    target_cell: { row: p.targetR, col: p.targetC }
  };
  
  const explanation = `In a Latin Square, each symbol must appear exactly once in each row and column. By deducing which symbols cannot go in the empty cells based on existing symbols in the same row or column, we can determine the target cell (?) must be ${p.targetVal}.`;

  return {
    id: uuid(),
    module: 'latin_square',
    prompt_text: 'Which symbol replaces the question mark?',
    options: optionsFormatted,
    correct_option_id: correctOptionId,
    explanation_text: explanation,
    difficulty: difficulty,
    source: 'procedural_gen_2026',
    time_estimate_seconds: 75,
    visual_data: visualData,
    subtopic: `${size}x${size} Grid`
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
  const sample = generateBatch(1, 'hard');
  console.log(JSON.stringify(sample[0], null, 2));
}
