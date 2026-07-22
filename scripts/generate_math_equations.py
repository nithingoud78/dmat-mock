import random
import uuid
import json
import os
import hashlib

# Ensure migration directory exists
os.makedirs("supabase/migrations", exist_ok=True)
output_file = "supabase/migrations/20260723000005_batch1_math_equations.sql"

def generate_equation_system():
    # Variables A, B, C, D (some subset)
    num_vars = random.choice([2, 3, 4])
    vars_used = ['A', 'B', 'C', 'D'][:num_vars]
    
    # Random integer solutions between 1 and 20
    solution = {var: random.randint(1, 20) for var in vars_used}
    
    equations = []
    
    # We need exactly `num_vars` equations to make it solvable.
    # To mimic official style, we use basic operations: +, -, *, /
    
    if num_vars == 2:
        # e.g., A + B = X, A - B = Y
        # or A * 2 = B, A + B = X
        templates = [
            lambda s: (f"{vars_used[0]} + {vars_used[1]} = {s[vars_used[0]] + s[vars_used[1]]}", "basic_equations"),
            lambda s: (f"{vars_used[1]} - {vars_used[0]} = {s[vars_used[1]] - s[vars_used[0]]}", "basic_equations"),
            lambda s: (f"2 × {vars_used[0]} = {vars_used[1]}" if s[vars_used[1]] == 2 * s[vars_used[0]] else f"{vars_used[0]} + {vars_used[1]} = {s[vars_used[0]] + s[vars_used[1]]}", "multiplication_division"),
            lambda s: (f"{vars_used[1]} ÷ 2 = {vars_used[0]}" if s[vars_used[1]] % 2 == 0 and s[vars_used[1]] // 2 == s[vars_used[0]] else f"{vars_used[1]} - {vars_used[0]} = {s[vars_used[1]] - s[vars_used[0]]}", "multiplication_division")
        ]
        
        # Force a valid system by just picking two distinct relationships
        eq1 = f"{vars_used[0]} + {vars_used[1]} = {solution[vars_used[0]] + solution[vars_used[1]]}"
        eq2 = f"{vars_used[0]} - {vars_used[1]} = {solution[vars_used[0]] - solution[vars_used[1]]}"
        
        diff = "easy"
        subtopic = "basic_equations"
        
    elif num_vars == 3:
        eq1 = f"{vars_used[0]} + {vars_used[1]} = {solution[vars_used[0]] + solution[vars_used[1]]}"
        eq2 = f"{vars_used[1]} + {vars_used[2]} = {solution[vars_used[1]] + solution[vars_used[2]]}"
        eq3 = f"{vars_used[0]} + {vars_used[2]} = {solution[vars_used[0]] + solution[vars_used[2]]}"
        diff = "medium"
        subtopic = "substitution_methods"
    else:
        eq1 = f"{vars_used[0]} + {vars_used[1]} = {solution[vars_used[0]] + solution[vars_used[1]]}"
        eq2 = f"{vars_used[1]} + {vars_used[2]} = {solution[vars_used[1]] + solution[vars_used[2]]}"
        eq3 = f"{vars_used[2]} + {vars_used[3]} = {solution[vars_used[2]] + solution[vars_used[3]]}"
        eq4 = f"{vars_used[0]} + {vars_used[3]} = {solution[vars_used[0]] + solution[vars_used[3]]}"
        # To ensure unique solution for 4 vars, we need linearly independent equations
        # Let's use a chain
        eq1 = f"{vars_used[0]} + {vars_used[1]} = {solution[vars_used[0]] + solution[vars_used[1]]}"
        eq2 = f"{vars_used[1]} - {vars_used[2]} = {solution[vars_used[1]] - solution[vars_used[2]]}"
        eq3 = f"{vars_used[2]} + {vars_used[3]} = {solution[vars_used[2]] + solution[vars_used[3]]}"
        eq4 = f"{vars_used[0]} - {vars_used[3]} = {solution[vars_used[0]] - solution[vars_used[3]]}"
        # Still might not be independent, let's just use explicit assignments for some to guarantee solvable
        eq4 = f"{vars_used[3]} = {solution[vars_used[3]]}"
        
        diff = "hard"
        subtopic = "system_of_equations"

    if num_vars == 2:
        equations = [eq1, eq2]
    elif num_vars == 3:
        equations = [eq1, eq2, eq3]
    else:
        equations = [eq1, eq2, eq3, eq4]

    prompt = "\n".join(equations) + f"\n\nWhat numbers do {', '.join(vars_used[:-1])} and {vars_used[-1]} correspond to?"
    
    # Generate distractors
    options = []
    correct_text = ", ".join([f"{k}={v}" for k, v in solution.items()])
    options.append({"id": "a", "text": correct_text})
    
    while len(options) < 4:
        # Create a plausible distractor by slightly modifying one or two values
        dist_solution = solution.copy()
        var_to_change = random.choice(vars_used)
        dist_solution[var_to_change] += random.choice([-2, -1, 1, 2])
        if dist_solution[var_to_change] < 1:
            dist_solution[var_to_change] = 1
            
        dist_text = ", ".join([f"{k}={v}" for k, v in dist_solution.items()])
        if not any(opt["text"] == dist_text for opt in options):
            options.append({"id": chr(97 + len(options)), "text": dist_text})
            
    # The correct option is always 'a' initially, let's shuffle
    random.shuffle(options)
    # Reassign ids
    for i, opt in enumerate(options):
        if opt["text"] == correct_text:
            correct_id = chr(97 + i)
        opt["id"] = chr(97 + i)
        
    explanation = "Using substitution and elimination, we can solve for the variables. " + correct_text
    
    return {
        "prompt": prompt,
        "options": json.dumps(options),
        "correct_id": correct_id,
        "explanation": explanation,
        "difficulty": diff,
        "subtopic": subtopic
    }

def main():
    num_questions = 100
    
    sql_statements = []
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("-- Migration: Batch 1 - 100 Programmatically Generated Mathematical Equations")
    sql_statements.append("-- ==============================================================================\n")
    sql_statements.append("INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, subtopic, question_type, content_hash) VALUES")
    
    values = []
    for i in range(num_questions):
        q = generate_equation_system()
        
        # Generate a valid UUID by using a deterministic hash of an index to ensure valid hex
        hash_hex = hashlib.md5(f"math_batch1_{i}".encode()).hexdigest()
        q_id = f"{hash_hex[:8]}-{hash_hex[8:12]}-{hash_hex[12:16]}-{hash_hex[16:20]}-{hash_hex[20:32]}"
        
        val = f"('{q_id}', 'math_equation', '{q['prompt']}', '{q['options']}'::jsonb, '{q['correct_id']}', '{q['explanation']}', '{q['difficulty']}', 'aaaaaaaa-0000-0000-0000-000000000001', 75, '{q['subtopic']}', 'system_of_equations', 'math_batch1_{i}')"
        values.append(val)
        
    sql_statements.append(",\n".join(values))
    sql_statements.append("\nON CONFLICT (id) DO NOTHING;\n")
    
    with open(output_file, "w", encoding="utf-8") as f:
        f.write("\n".join(sql_statements))
        
    print(f"Successfully generated {num_questions} mathematical equation questions in {output_file}")

if __name__ == "__main__":
    main()
