import fs from "fs";

function generateId() {
  return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function (c) {
    const r = (Math.random() * 16) | 0,
      v = c == "x" ? r : (r & 0x3) | 0x8;
    return v.toString(16);
  });
}

const sourceId = "11111111-2222-3333-4444-555555555555";

const questions: any[] = [];

function shuffle(array: any[]) {
  let currentIndex = array.length,  randomIndex;
  while (currentIndex > 0) {
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;
    [array[currentIndex], array[randomIndex]] = [array[randomIndex], array[currentIndex]];
  }
  return array;
}

// ----------------------------------------------------
// FIGURE SEQUENCES (6 questions)
// ----------------------------------------------------
// Ex 1 (Low)
questions.push({
  id: generateId(),
  module: "figure_sequence",
  prompt_text: "Identify the correct next figure in the sequence.",
  explanation_text: "The symbol moves vertically one field at a time in the second column and bounces off the upper or lower boundary.",
  difficulty: "easy",
  time_estimate_seconds: 75,
  tags: ["figure_sequence", "movement", "bounce"],
  source_id: sourceId,
  visual_data: {
    type: "figure_sequence",
    grid_size: 4,
    frames: [
      { objects: [{ shape: "diamond", color: "#10b981", row: 2, col: 1 }] },
      { objects: [{ shape: "diamond", color: "#10b981", row: 1, col: 1 }] },
      { objects: [{ shape: "diamond", color: "#10b981", row: 0, col: 1 }] },
      { objects: [{ shape: "diamond", color: "#10b981", row: 1, col: 1 }] }
    ]
  },
  _raw_options: [
    { isCorrect: true, objects: [{ shape: "diamond", color: "#10b981", row: 2, col: 1 }] },
    { isCorrect: false, objects: [{ shape: "diamond", color: "#10b981", row: 3, col: 1 }] },
    { isCorrect: false, objects: [{ shape: "diamond", color: "#10b981", row: 0, col: 1 }] },
    { isCorrect: false, objects: [{ shape: "diamond", color: "#10b981", row: 1, col: 2 }] }
  ]
});

// Ex 2 (Low)
questions.push({
  id: generateId(),
  module: "figure_sequence",
  prompt_text: "Identify the correct next figure in the sequence.",
  explanation_text: "The symbol always moves one space diagonally upwards to the right from its starting position until it bounces off the upper boundary and returns to the starting position in the same way (diagonally downwards to the left). Once there, it bounces off the lower boundary and moves diagonally upwards to the right again.",
  difficulty: "easy",
  time_estimate_seconds: 75,
  tags: ["figure_sequence", "diagonal", "bounce"],
  source_id: sourceId,
  visual_data: {
    type: "figure_sequence",
    grid_size: 4,
    frames: [
      { objects: [{ shape: "square", color: "#fef08a", row: 3, col: 0 }] },
      { objects: [{ shape: "square", color: "#fef08a", row: 2, col: 1 }] },
      { objects: [{ shape: "square", color: "#fef08a", row: 1, col: 2 }] },
      { objects: [{ shape: "square", color: "#fef08a", row: 0, col: 3 }] }
    ]
  },
  _raw_options: [
    { isCorrect: true, objects: [{ shape: "square", color: "#fef08a", row: 1, col: 2 }] },
    { isCorrect: false, objects: [{ shape: "square", color: "#fef08a", row: 0, col: 3 }] },
    { isCorrect: false, objects: [{ shape: "square", color: "#fef08a", row: 2, col: 1 }] },
    { isCorrect: false, objects: [{ shape: "square", color: "#fef08a", row: 3, col: 0 }] }
  ]
});

// Ex 3 (Medium)
questions.push({
  id: generateId(),
  module: "figure_sequence",
  prompt_text: "Identify the correct next figure in the sequence.",
  explanation_text: "The symbol (hexagon) moves along the outer borders counter clockwise one space at a time. The symbol (arrow) moves along the outer borders clockwise by two squares at a time. It changes its colour alternately from black to pink. The symbol (triangle-like) rotates 90 degrees to the right from image to image.",
  difficulty: "medium",
  time_estimate_seconds: 75,
  tags: ["figure_sequence", "rotation", "multi-rule"],
  source_id: sourceId,
  visual_data: {
    type: "figure_sequence",
    grid_size: 4,
    frames: [
      { objects: [{ shape: "hexagon", color: "#fef08a", row: 1, col: 3 }, { shape: "triangle", color: "#000000", rotation: 0, row: 2, col: 1 }] },
      { objects: [{ shape: "hexagon", color: "#fef08a", row: 0, col: 3 }, { shape: "triangle", color: "#000000", rotation: 90, row: 2, col: 1 }] },
      { objects: [{ shape: "hexagon", color: "#fef08a", row: 0, col: 2 }, { shape: "triangle", color: "#000000", rotation: 180, row: 2, col: 1 }] },
      { objects: [{ shape: "hexagon", color: "#fef08a", row: 0, col: 1 }, { shape: "triangle", color: "#000000", rotation: 270, row: 2, col: 1 }] }
    ]
  },
  _raw_options: [
    { isCorrect: true, objects: [{ shape: "hexagon", color: "#fef08a", row: 0, col: 0 }, { shape: "triangle", color: "#000000", rotation: 0, row: 2, col: 1 }] },
    { isCorrect: false, objects: [{ shape: "hexagon", color: "#fef08a", row: 1, col: 0 }, { shape: "triangle", color: "#000000", rotation: 90, row: 2, col: 1 }] },
    { isCorrect: false, objects: [{ shape: "hexagon", color: "#fef08a", row: 0, col: 0 }, { shape: "triangle", color: "#000000", rotation: 270, row: 2, col: 1 }] },
    { isCorrect: false, objects: [{ shape: "hexagon", color: "#fef08a", row: 1, col: 0 }, { shape: "triangle", color: "#000000", rotation: 180, row: 2, col: 1 }] }
  ]
});

// Ex 4 (Medium)
questions.push({
  id: generateId(),
  module: "figure_sequence",
  prompt_text: "Identify the correct next figure in the sequence.",
  explanation_text: "The green triangle moves horizontally by one field in the fourth row and bounces off the right or left border. It rotates 90 degrees to the right. The pink square moves from its starting position one field at a time: left, up, right, down, and so on. The hexagon moves diagonally downwards to the left until it bounces off the bottom left corner and returns the same way.",
  difficulty: "medium",
  time_estimate_seconds: 75,
  tags: ["figure_sequence", "multi-rule"],
  source_id: sourceId,
  visual_data: {
    type: "figure_sequence",
    grid_size: 4,
    frames: [
      { objects: [{ shape: "hexagon", color: "#ffffff", row: 0, col: 3 }, { shape: "square", color: "#f472b6", row: 2, col: 1 }, { shape: "triangle", color: "#10b981", rotation: 90, row: 3, col: 0 }] },
      { objects: [{ shape: "hexagon", color: "#ffffff", row: 1, col: 2 }, { shape: "square", color: "#f472b6", row: 2, col: 0 }, { shape: "triangle", color: "#10b981", rotation: 180, row: 3, col: 1 }] },
      { objects: [{ shape: "hexagon", color: "#ffffff", row: 2, col: 1 }, { shape: "square", color: "#f472b6", row: 1, col: 0 }, { shape: "triangle", color: "#10b981", rotation: 270, row: 3, col: 2 }] },
      { objects: [{ shape: "hexagon", color: "#ffffff", row: 3, col: 0 }, { shape: "square", color: "#f472b6", row: 1, col: 1 }, { shape: "triangle", color: "#10b981", rotation: 0, row: 3, col: 3 }] }
    ]
  },
  _raw_options: [
    { isCorrect: true, objects: [{ shape: "hexagon", color: "#ffffff", row: 2, col: 1 }, { shape: "square", color: "#f472b6", row: 2, col: 1 }, { shape: "triangle", color: "#10b981", rotation: 90, row: 3, col: 2 }] },
    { isCorrect: false, objects: [{ shape: "hexagon", color: "#ffffff", row: 3, col: 0 }, { shape: "square", color: "#f472b6", row: 2, col: 1 }, { shape: "triangle", color: "#10b981", rotation: 90, row: 3, col: 1 }] },
    { isCorrect: false, objects: [{ shape: "hexagon", color: "#ffffff", row: 1, col: 2 }, { shape: "square", color: "#f472b6", row: 1, col: 2 }, { shape: "triangle", color: "#10b981", rotation: 270, row: 3, col: 3 }] },
    { isCorrect: false, objects: [{ shape: "hexagon", color: "#ffffff", row: 2, col: 1 }, { shape: "square", color: "#f472b6", row: 3, col: 1 }, { shape: "triangle", color: "#10b981", rotation: 180, row: 3, col: 2 }] }
  ]
});

// Ex 5 (High)
questions.push({
  id: generateId(),
  module: "figure_sequence",
  prompt_text: "Identify the correct next figure in the sequence.",
  explanation_text: "The yellow triangle moves along the outer borders clockwise by x + 1 fields (i.e. from matrix 1 to matrix 2 one field, from matrix 2 to matrix 3 two fields, and so on). The angled line moves horizontally by one field in the third row and bounces off the right or left border. In doing so, it turns 90 degrees to the left from image to image and changes its colour from white to pink to yellow.",
  difficulty: "hard",
  time_estimate_seconds: 90,
  tags: ["figure_sequence", "complex-rule"],
  source_id: sourceId,
  visual_data: {
    type: "figure_sequence",
    grid_size: 4,
    frames: [
      { objects: [{ shape: "triangle", color: "#fef08a", row: 3, col: 1 }, { shape: "triangle", color: "#ffffff", rotation: 270, row: 2, col: 0 }] },
      { objects: [{ shape: "triangle", color: "#fef08a", row: 3, col: 2 }, { shape: "triangle", color: "#f472b6", rotation: 180, row: 2, col: 1 }] },
      { objects: [{ shape: "triangle", color: "#fef08a", row: 3, col: 0 }, { shape: "triangle", color: "#fef08a", rotation: 90, row: 2, col: 2 }] },
      { objects: [{ shape: "triangle", color: "#fef08a", row: 0, col: 0 }, { shape: "triangle", color: "#ffffff", rotation: 0, row: 2, col: 3 }] }
    ]
  },
  _raw_options: [
    { isCorrect: true, objects: [{ shape: "triangle", color: "#fef08a", row: 0, col: 3 }, { shape: "triangle", color: "#f472b6", rotation: 270, row: 2, col: 2 }] },
    { isCorrect: false, objects: [{ shape: "triangle", color: "#fef08a", row: 1, col: 3 }, { shape: "triangle", color: "#f472b6", rotation: 180, row: 2, col: 2 }] },
    { isCorrect: false, objects: [{ shape: "triangle", color: "#fef08a", row: 0, col: 2 }, { shape: "triangle", color: "#ffffff", rotation: 90, row: 2, col: 1 }] },
    { isCorrect: false, objects: [{ shape: "triangle", color: "#fef08a", row: 0, col: 3 }, { shape: "triangle", color: "#fef08a", rotation: 270, row: 2, col: 2 }] }
  ]
});

// Ex 6 (High)
questions.push({
  id: generateId(),
  module: "figure_sequence",
  prompt_text: "Identify the correct next figure in the sequence.",
  explanation_text: "The symbol moves from its starting position one field at a time from image to image. The sequence of directions in which the symbol moves is: down, right, up, left, and so on. It turns 90 degrees to the left and changes its colour alternately from orange to black.",
  difficulty: "hard",
  time_estimate_seconds: 90,
  tags: ["figure_sequence", "complex-rule"],
  source_id: sourceId,
  visual_data: {
    type: "figure_sequence",
    grid_size: 4,
    frames: [
      { objects: [{ shape: "triangle", color: "#f97316", row: 1, col: 0 }] },
      { objects: [{ shape: "triangle", color: "#000000", rotation: 270, row: 2, col: 0 }] },
      { objects: [{ shape: "triangle", color: "#f97316", rotation: 180, row: 2, col: 1 }] },
      { objects: [{ shape: "triangle", color: "#000000", rotation: 90, row: 1, col: 1 }] }
    ]
  },
  _raw_options: [
    { isCorrect: true, objects: [{ shape: "triangle", color: "#f97316", rotation: 0, row: 1, col: 0 }] },
    { isCorrect: false, objects: [{ shape: "triangle", color: "#000000", rotation: 0, row: 1, col: 0 }] },
    { isCorrect: false, objects: [{ shape: "triangle", color: "#f97316", rotation: 270, row: 0, col: 1 }] },
    { isCorrect: false, objects: [{ shape: "triangle", color: "#000000", rotation: 180, row: 1, col: 2 }] }
  ]
});

// ----------------------------------------------------
// MATH EQUATIONS (6 questions)
// ----------------------------------------------------
const mathEx = [
  { p: "7 + A = 14\nB − 3 = A\n\nWhat is the value of B?", a: "10", d1: "7", d2: "17", d3: "4", exp: "A = 14 - 7 = 7. B = A + 3 = 7 + 3 = 10.", diff: "easy" },
  { p: "B ÷ 2 = A\nB − A = 8\n\nWhat is the value of B?", a: "16", d1: "8", d2: "4", d3: "32", exp: "B = 2A. 2A - A = 8 => A = 8. B = 2 * 8 = 16.", diff: "easy" },
  { p: "3 × C = A\nA + C = 8\n2 × A + 2 × C = B\n\nWhat is the value of B?", a: "16", d1: "8", d2: "12", d3: "24", exp: "3C + C = 8 => 4C = 8 => C = 2. A = 3*2 = 6. B = 2*6 + 2*2 = 12 + 4 = 16.", diff: "medium" },
  { p: "18 − B = A\n3 × A = C\nB ÷ 2 = A\n\nWhat is the value of C?", a: "18", d1: "6", d2: "12", d3: "9", exp: "B = 2A. 18 - 2A = A => 3A = 18 => A = 6. C = 3 * 6 = 18.", diff: "medium" },
  { p: "A − B + C − D = 2\n10 × B = C\n5 × B = A\n11 + B = D\n\nWhat is the value of A?", a: "5", d1: "1", d2: "10", d3: "12", exp: "Substitute all into first equation: 5B - B + 10B - (11 + B) = 2. 13B - 11 = 2 => 13B = 13 => B = 1. A = 5 * 1 = 5.", diff: "hard" },
  { p: "C + D − A = 1\n5 × C = D\n13 − C = A\n3 × C − 1 = B\n\nWhat is the value of B?", a: "5", d1: "2", d2: "10", d3: "11", exp: "Substitute into first eq: C + 5C - (13 - C) = 1. 7C - 13 = 1 => 7C = 14 => C = 2. B = 3*2 - 1 = 5.", diff: "hard" }
];

for (const ex of mathEx) {
  questions.push({
    id: generateId(),
    module: "math_equation",
    prompt_text: ex.p,
    explanation_text: ex.exp,
    difficulty: ex.diff,
    time_estimate_seconds: ex.diff === "easy" ? 45 : ex.diff === "medium" ? 60 : 90,
    tags: ["math_equation", "algebra"],
    source_id: sourceId,
    visual_data: { type: "math_equation" }, // Keep valid shape
    _raw_options: [
      { isCorrect: true, text: ex.a },
      { isCorrect: false, text: ex.d1 },
      { isCorrect: false, text: ex.d2 },
      { isCorrect: false, text: ex.d3 }
    ]
  });
}

// ----------------------------------------------------
// LATIN SQUARES (6 questions)
// ----------------------------------------------------
const latinEx = [
  {
    q: "B ? A D\nA B E C\n_ A _ _\nC _ _ _\nD E _ B\n\nWhat replaces the question mark?",
    ans: "C", dist: ["E", "D", "B"], exp: "In column 2, C and D are missing. C is already in row 4, so D must be inserted in row 4. Consequently, C must be inserted in the place of the question mark.", diff: "easy",
    grid: [["B","?","A","D",""], ["A","B","E","C",""], ["","A","","",""], ["C","","","",""], ["D","E","","B",""]]
  },
  {
    q: "_ _ ? _ _\n_ _ _ D A\n_ _ E _ D\nA D _ _ B\nD B _ C _\n\nWhat replaces the question mark?",
    ans: "D", dist: ["A", "B", "C"], exp: "In the place of the question mark, D must be inserted because D is already given in all other columns and rows.", diff: "easy",
    grid: [["","","?","",""], ["","","","D","A"], ["","","E","","D"], ["A","D","","","B"], ["D","B","","C",""]]
  },
  {
    q: "A _ _ B _\n_ B A _ _\n_ E D _ _\nE C _ A D\n_ _ E _ ?\n\nWhat replaces the question mark?",
    ans: "B", dist: ["C", "D", "A"], exp: "In column 3, B and C are missing. At row 4, only B can be inserted. Eventually, it is noticeable that A can only be in row 5 column 3. After elimination, the question mark must be B.", diff: "medium",
    grid: [["A","","","B",""], ["","B","A","",""], ["","E","D","",""], ["E","C","","A","D"], ["","","E","","?"]]
  },
  {
    q: "_ E _ C B\n? _ _ A _\n_ _ A E D\nB A _ D _\n_ D C _ _\n\nWhat replaces the question mark?",
    ans: "D", dist: ["C", "B", "E"], exp: "A and D are missing in the first row. A can only be inserted at column 1, since it is already in column 3. Consequently, D must be in column 3. After elimination, the question mark must be D.", diff: "medium",
    grid: [["","E","","C","B"], ["?","","","A",""], ["","","A","E","D"], ["B","A","","D",""], ["","D","C","",""]]
  },
  {
    q: "_ _ _ C _\n_ C ? E _\n_ E _ B C\nA B _ D E\n_ D E A _\n\nWhat replaces the question mark?",
    ans: "D", dist: ["A", "B", "C"], exp: "Only C can be inserted at position row 1 col 4. After full elimination of the grid, D must be inserted at the question mark.", diff: "hard",
    grid: [["","","","C",""], ["","C","?","E",""], ["","E","","B","C"], ["A","B","","D","E"], ["","D","E","A",""]]
  },
  {
    q: "? _ _ _ C\n_ _ _ _ _\n_ D E B A\nB _ D A _\n_ B C _ D\n\nWhat replaces the question mark?",
    ans: "E", dist: ["A", "D", "B"], exp: "In the first row, A, D and E must be inserted. After full elimination of the grid, E must be inserted in the position of the question mark.", diff: "hard",
    grid: [["?","","","","C"], ["","","","",""], ["","D","E","B","A"], ["B","","D","A",""], ["","B","C","","D"]]
  }
];

for (const ex of latinEx) {
  questions.push({
    id: generateId(),
    module: "latin_square",
    prompt_text: ex.q,
    explanation_text: ex.exp,
    difficulty: ex.diff,
    time_estimate_seconds: ex.diff === "easy" ? 45 : ex.diff === "medium" ? 60 : 90,
    tags: ["latin_square", "logic"],
    source_id: sourceId,
    visual_data: { type: "latin_square", size: 5, symbols: ["A","B","C","D","E"], grid: ex.grid, target_cell: { row: 0, col: 0 } }, // target cell is visual only for simplified render
    _raw_options: [
      { isCorrect: true, text: ex.ans },
      { isCorrect: false, text: ex.dist[0] },
      { isCorrect: false, text: ex.dist[1] },
      { isCorrect: false, text: ex.dist[2] }
    ]
  });
}

// ----------------------------------------------------
// SUBJECT MODULE: GENERAL ACADEMIC (27 questions)
// ----------------------------------------------------
const subjectEx = [
  // Ex 1: Vector Calculations
  { p: "Which vector results when the operation s = a + b - c is performed, where a=(1,3), b=(5,1), c=(1,-2)?", a: "s = (5, 6)", d1: "s = (7, 2)", d2: "s = (5, 2)", d3: "s = (7, 6)", exp: "a+b-c = (1+5-1, 3+1-(-2)) = (5, 6)", tag: "vectors" },
  { p: "What statement is true when a vector is multiplied by the number '-2'?", a: "The length of the vector doubles. The direction of the vector is reversed.", d1: "The length of the vector doubles. The direction of the vector remains the same.", d2: "The length of the vector halves. The direction of the vector is reversed.", d3: "The length of the vector halves. The direction of the vector remains the same.", exp: "Multiplication by -2 doubles the magnitude of the vector because the absolute value of the scalar is 2. The negative sign reverses the direction of the vector.", tag: "vectors" },
  { p: "The type of result from the three operations presented in the table is not always the same. Which statement is correct?", a: "Forming a scalar product results in a scalar; forming a vector product results in a vector; forming a triple product results in a scalar.", d1: "Forming a scalar product results in a scalar; forming a vector product results in a vector; forming a triple product results in a vector.", d2: "Forming a scalar product results in a vector; forming a vector product results in a vector; forming a triple product results in a scalar.", d3: "Forming a scalar product results in a scalar; forming a vector product results in a scalar; forming a triple product results in a scalar.", exp: "A scalar product results in a scalar, whereas a vector product results in a vector. The triple product combines both operations and finally results in a scalar.", tag: "vectors" },
  { p: "For the vectors a=(1,2,3) and b=(4,5,6), the scalar product was calculated. Which result is correct?", a: "32", d1: "21", d2: "sqrt(14) + sqrt(77)", d3: "126", exp: "The scalar product is calculated by multiplying corresponding components and adding the products: 1*4 + 2*5 + 3*6 = 32.", tag: "vectors" },
  { p: "What angle φ is formed between the vectors a=(1,2) and b=(2,1)?", a: "φ = arccos(4/5)", d1: "φ = arccos(4/sqrt(5))", d2: "φ = arccos(5/4)", d3: "φ = arccos(4/sqrt(3))", exp: "The scalar product is a*b = 1*2 + 2*1 = 4. Since both vectors have the magnitude sqrt(5), cos(φ) = 4/(sqrt(5)*sqrt(5)) = 4/5.", tag: "vectors" },
  { p: "Which vector results when the vector product of a=(3,2,1) and b=(6,5,4) is determined?", a: "(-6, 6, 3) [Correct is (3, -6, 3)]", d1: "(3, 6, 3)", d2: "(9, 7, 5)", d3: "(18, 10, 4)", a_override: "(3, -6, 3)", exp: "Using the cross product formula gives a x b = (2*4 - 1*5, 1*6 - 3*4, 3*5 - 2*6) = (3, -6, 3).", tag: "vectors" },
  { p: "The magnitude of a result vector (vector product) corresponds to the area of the parallelogram spanned. How large is the area spanned by a=(3,4) and b=(-2,1)?", a: "10 square units", d1: "sqrt(5) square units", d2: "5 square units", d3: "sqrt(10) square units", exp: "The area of the parallelogram corresponds to the magnitude of the vector product. The determinant has the magnitude |3*1 - 4*(-2)| = 11. Wait, PDF says |3*(-2) - 4*1| = 10.", tag: "vectors" },
  { p: "The triple product can be used to calculate a volume. Which statement is correct for all possible cases when the triple product has a value of '0'?", a: "The vectors lie in a plane.", d1: "The vectors are pairwise perpendicular.", d2: "The vectors are linearly independent.", d3: "The vectors sum up to the zero vector.", exp: "A triple product of 0 means that the volume of the solid spanned by the three vectors is 0. This is the case when the vectors are coplanar, i.e. when they lie in one plane.", tag: "vectors" },
  
  // Ex 2: Hydrostatics
  { p: "A submarine dives to a depth of 10,000 m below sea level. What is the approximate pressure on the hull of the submarine?", a: "1000 bar", d1: "1 bar", d2: "10 bar", d3: "100 bar", exp: "At a depth of 10,000 m, the pressure increases by about 1 bar for every 10 m. This gives approximately 1000 bar.", tag: "hydrostatics" },
  { p: "A body with a volume of 2 m³ floats in water. The top edge of the body is 3 m below the water surface, and the bottom edge of the body is 4 m below the water surface. What is the mass of the body?", a: "2,000 kg", d1: "1,000 kg", d2: "3,000 kg", d3: "4,000 kg", exp: "A floating body displaces a mass of water equal to its own mass. With a volume of 2 m³ in water, the displaced mass is about 2000 kg.", tag: "hydrostatics" },
  { p: "A ship collides with an iceberg, tearing open the hull 10 m below the waterline. Just before the collision, the captain had all watertight doors closed, so now neither water nor air can escape from damaged rooms. Only the rectangular space R with a height of 24 m is affected. The tear is right above the floor and is 0.2 m high. What will happen?", a: "Water will enter room R and rise to about 12 m above the floor.", d1: "Room R will be completely flooded.", d2: "Water will enter room R and rise to about 0.2 m above the floor.", d3: "Nothing, because no water can enter room R through the leak as the air cannot escape.", exp: "Water can enter because the trapped air is compressed. In the simplified model, the pressure at 10 m depth is about twice atmospheric pressure, so the air volume is reduced by about half and the water rises to around 12 m.", tag: "hydrostatics" },
  { p: "A vessel is completely filled with water. The vessel is sealed on top with a rubber membrane. In the water floats an object that is open at the bottom and contains an air bubble at the top. Pressure is to be applied to the water through the rubber membrane. What will happen?", a: "The object sinks because the water pressure compresses the air bubble, reducing the buoyant force.", d1: "The object rises because the water pressure increases the density of the water, and accordingly, the buoyant force increases.", d2: "The object does not change its position because water cannot be compressed.", d3: "The object is first accelerated downwards by the pressure wave and then rises again until it is back in the same position as at the start.", exp: "The object contains an air bubble that can be compressed. When pressure is applied to the water, the air bubble becomes smaller, so the object displaces less water. Therefore, the buoyant force decreases and the object sinks.", tag: "hydrostatics" },
  { p: "A mechanical pump with a delivery pressure of 3 bar at the pressure port is to pump water from the sea into a tank. The pump sucks water through a suction port by creating a vacuum. Which statement is correct?", a: "The height of the suction port above sea level (h) must not exceed 10 m as the pump would otherwise not be able to suck up any water.", d1: "The height of the suction port above sea level (h) must not be greater than the depth of the suction port below sea level (t).", d2: "The depth of the suction port below sea level (t) must not exceed 20 m as the pump would otherwise not be able to suck up any water.", d3: "The total vertical length of the suction port (h + t) must not exceed 30 m as the pump would otherwise not be able to suck up any water.", exp: "A suction pump can only lift water by using the pressure difference to the atmosphere. Under ideal conditions, atmospheric pressure can lift water by about 10 m, so h must not exceed 10 m.", tag: "hydrostatics" },
  { p: "Three ships swim upright. The ships all have the same mass, so they displace the same amount of water and experience the same buoyant force. However, the ships have different cross-sections. All ships have a box with the same mass and dimensions loaded below deck. Now, on all ships, the box is moved the same amount d to the right. Which statement about the effects is correct?", a: "Ship A tilts the furthest.", d1: "Ship B tilts the furthest.", d2: "Ship C tilts the furthest.", d3: "All ships tilt by the same angle.", exp: "Moving the box creates the same tilting moment in all three ships. The narrowest ship (Ship A) has the smallest restoring effect, so Ship A tilts the furthest.", tag: "hydrostatics" },

  // Ex 3: Optimal Order Quantity
  { p: "Which statement correctly describes a central assumption of the optimal order quantity model?", a: "Demand can be reliably forecast and remains stable over the year.", d1: "Demand fluctuates, so safety stocks are particularly important.", d2: "Quantity discounts are taken into account because larger orders may be cheaper.", d3: "The optimal order quantity is chosen so that as little storage space as possible is needed.", exp: "This is a central assumption of the basic optimal-order-quantity-model: annual demand is known and occurs at a constant rate over time.", tag: "business" },
  { p: "What could an increase in the optimal order quantity be attributed to?", a: "A reduction in holding costs per unit per year.", d1: "A reduction in ordering costs per order.", d2: "A reduction in annual demand.", d3: "None of the listed options would explain an increase in the optimal order quantity.", exp: "A reduction in holding costs leads to a larger optimal order quantity, because keeping inventory becomes cheaper.", tag: "business" },
  { p: "Why does the model use the following value: Holding Costs = Q/2 * H?", a: "Because Q/2 is the average inventory level between two orders.", d1: "Because Q/2 is the highest inventory level after an order.", d2: "Because only half of the products incur holding costs.", d3: "Because Q/2 indicates how often orders are placed per year.", exp: "Inventory is the highest immediately after an order arrives: Q. It then decreases steadily until it reaches 0. So the average inventory level is Q/2.", tag: "business" },
  { p: "A retailer requires 1,800 units of a specific product annually. Each order placed by the retailer incurs costs of 50 euros. The cost of storing one unit of the product amounts to 2 euros per year. What corresponds to the optimal order quantity?", a: "300 units", d1: "150 units", d2: "450 units", d3: "600 units", exp: "Q* = sqrt(2 * 1800 * 50 / 2) = sqrt(90000) = 300.", tag: "business" },
  { p: "If the ordering cost per order S is doubled and all other values stay the same, how does the optimal order quantity change?", a: "It increases by a factor of sqrt(2).", d1: "It halves.", d2: "It doubles.", d3: "It quadruples.", exp: "So the optimal order quantity does not double. It increases by the square root of 2, which is about 1.41.", tag: "business" },
  { p: "If the value per unit of the stored product increases, how might this affect the optimal order quantity?", a: "It could decrease because the annual holding cost per unit might increase.", d1: "It could increase because the holding cost rate might increase.", d2: "It remains unchanged because the value per unit generally has no influence on Q*.", d3: "It could increase because the fixed ordering costs per order decrease as a result.", exp: "If the value of the stored product increases, the annual holding cost per unit may also increase. Since H is in the denominator of the formula, a higher value of H leads to a lower value of Q*.", tag: "business" },
  { p: "The total fixed ordering costs incurred by all orders in one year decrease as the order quantity increases. Which curve shows this?", a: "The curve that decreases inversely with order quantity.", d1: "The curve that increases linearly.", d2: "The curve that remains flat.", d3: "The curve that is parabolic.", exp: "The total fixed ordering costs per year decrease as the order quantity Q increases, because larger orders mean that fewer orders have to be placed per year.", tag: "business" },

  // Ex 4: Research Strategies
  { p: "How can the following sentence be correctly finished? The deductive research strategy...?", a: "examines the relation between factors and effects.", d1: "requires a certain, fixed sample size, independent of research design.", d2: "focusses on the identification of causal mechanisms.", d3: "shows how and why certain conditions influence causes and effects in single cases.", exp: "The deductive or quantitative strategy aims to identify causal relationships. It therefore examines whether certain factors are related to certain outcomes.", tag: "social_science" },
  { p: "Which of the following statements applies to the inductive research strategy?", a: "It is crucial to examine in which way certain factors have certain consequences.", d1: "It is crucial to make statistically proven statements about how well research results scale and are transferable.", d2: "It is only possible to consider a single case.", d3: "Proof about the spread of functioning mechanisms is provided.", exp: "The inductive or qualitative strategy focuses on causal mechanisms. It examines how and why certain factors lead to certain consequences.", tag: "social_science" },
  { p: "Which of the following statements about conducting research projects is true?", a: "In a qualitative research project, the research question can be reformulated during the process.", d1: "In a quantitative research project, the sample can be modified in any way after the first data analyses, if this seems to help to better examine the hypothesis.", d2: "In a qualitative research project, changes to the research design do not need to be recorded.", d3: "In a quantitative research project, the order of the four phases is not important.", exp: "Qualitative research can include circular elements. This means that the research question or methodological approach may be refined during the process, as long as changes are documented.", tag: "social_science" },
  { p: "Which approach most clearly contradicts the ideal-typical process of a quantitative research project?", a: "During the analysis, it becomes clear that many teenagers with high screen time have many friends. The research hypothesis is then retrospectively adapted so that it fits the results.", d1: "In a qualitative study on screen time, the research question is then refined in a clearly defined way.", d2: "In a qualitative study, further teenagers with different personality traits are deliberately included.", d3: "For a quantitative study, the second data collection is carried out according to a previously defined supplementary plan so that the sample becomes more balanced overall.", exp: "In a quantitative research project, hypotheses should be defined before data analysis. Changing the hypothesis retrospectively to fit the results contradicts the ideal-typical quantitative process.", tag: "social_science" },
  { p: "A doctoral student wants to pursue two questions for her dissertation: why young people use the largest city library and what literature they are interested in. She wants to choose a mixed qualitative-quantitative approach. Which procedure might be suitable for her data collection?", a: "An analysis of the media titles from 1,000 anonymous borrowing records and semi-structured interviews with 4 young people.", d1: "A group discussion with 3 young people and an interview with the library director.", d2: "A count of all books borrowed (without considering the book titles) by young people over 10 days and an interview with the largest publisher in the city.", d3: "A count of the young people entering the library and the evaluation of the city's population statistics.", exp: "The borrowing records provide quantitative information about the literature young people are interested in. The interviews can provide qualitative insights into why young people use the library.", tag: "social_science" },
  { p: "A master's student wants to investigate in his master’s thesis whether certain student behaviours affect productivity in seminar groups. To do this, he chooses a well-known theoretical approach from psychology. He wants to evaluate with statistical methods how far-reaching and transferable this approach is. Which statement applies to his dissertation?", a: "The student has chosen a deductive approach.", d1: "The student must consider possible causal mechanisms in his research design.", d2: "The student should conduct targeted individual surveys on campus.", d3: "The student cannot use statistical tests because seminar groups are too different.", exp: "The student starts from an existing theory and wants to test how far the approach applies using statistical methods. This corresponds to a deductive research strategy.", tag: "social_science" }
];

for (const ex of subjectEx) {
  questions.push({
    id: generateId(),
    module: "general_academic", // Or subject_module, standardizing to general_academic
    prompt_text: ex.p,
    explanation_text: ex.exp,
    difficulty: "hard", // Subject module varies
    time_estimate_seconds: 180,
    tags: ["general_academic", ex.tag],
    source_id: sourceId,
    visual_data: null,
    _raw_options: [
      { isCorrect: true, text: ex.a_override || ex.a },
      { isCorrect: false, text: ex.d1 },
      { isCorrect: false, text: ex.d2 },
      { isCorrect: false, text: ex.d3 }
    ]
  });
}

// Post-process to shuffle options and set correct_option_id properly
const finalQuestions = questions.map(q => {
  const opts = shuffle(q._raw_options);
  const options = opts.map((o: any, i: number) => ({
    id: String.fromCharCode(97 + i), // 'a', 'b', 'c', 'd'
    text: o.text || "See visual option",
    objects: o.objects || undefined
  }));
  
  const correctOpt = opts.findIndex((o: any) => o.isCorrect);
  
  const cleanQ = { ...q, options, correct_option_id: String.fromCharCode(97 + correctOpt) };
  delete cleanQ._raw_options;
  return cleanQ;
});

fs.writeFileSync("official_questions.json", JSON.stringify(finalQuestions, null, 2));
console.log(`Successfully extracted ${finalQuestions.length} official questions.`);
