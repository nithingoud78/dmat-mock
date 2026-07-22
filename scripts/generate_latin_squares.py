import random
import uuid
import json
import os
import hashlib
import copy

# Ensure migration directory exists
os.makedirs("supabase/migrations", exist_ok=True)
output_file = "supabase/migrations/20260723000006_batch2_latin_squares.sql"

def generate_full_latin_square():
    # Base 5x5
    base = [
        ['A', 'B', 'C', 'D', 'E'],
        ['B', 'C', 'D', 'E', 'A'],
        ['C', 'D', 'E', 'A', 'B'],
        ['D', 'E', 'A', 'B', 'C'],
        ['E', 'A', 'B', 'C', 'D']
    ]
    # Shuffle rows
    random.shuffle(base)
    # Shuffle columns
    base = [list(x) for x in zip(*base)]
    random.shuffle(base)
    base = [list(x) for x in zip(*base)]
    # Shuffle symbols
    symbols = ['A', 'B', 'C', 'D', 'E']
    shuffled_symbols = symbols.copy()
    random.shuffle(shuffled_symbols)
    mapping = {symbols[i]: shuffled_symbols[i] for i in range(5)}
    
    square = []
    for r in range(5):
        row = []
        for c in range(5):
            row.append(mapping[base[r][c]])
        square.append(row)
    return square

def is_valid(grid, r, c, val):
    for i in range(5):
        if grid[r][i] == val or grid[i][c] == val:
            return False
    return True

def count_solutions_for_target(grid, target_r, target_c, target_val):
    # We want to know if the target cell is forced to be target_val.
    # To do this, we try all OTHER possible values for the target cell.
    # If ANY other value leads to a valid completely filled grid (or just a valid partial solution that doesn't violate rules), 
    # then the target is not uniquely determined. 
    # Actually, a full solver to check uniqueness of the ENTIRE grid is safer.
    solutions = []
    
    def solve(g, r, c):
        if len(solutions) > 1: return
        if r == 5:
            solutions.append(copy.deepcopy(g))
            return
        if c == 5:
            solve(g, r+1, 0)
            return
        if g[r][c] != '':
            solve(g, r, c+1)
            return
            
        for val in ['A', 'B', 'C', 'D', 'E']:
            if is_valid(g, r, c, val):
                g[r][c] = val
                solve(g, r, c+1)
                g[r][c] = ''
                
    g_copy = copy.deepcopy(grid)
    solve(g_copy, 0, 0)
    return len(solutions)

def create_puzzle(difficulty):
    while True:
        full = generate_full_latin_square()
        target_r, target_c = random.randint(0, 4), random.randint(0, 4)
        target_val = full[target_r][target_c]
        
        # Start with all cells filled
        puzzle = copy.deepcopy(full)
        puzzle[target_r][target_c] = '?'
        
        # List of other cells
        cells = [(r, c) for r in range(5) for c in range(5) if (r, c) != (target_r, target_c)]
        random.shuffle(cells)
        
        removed_count = 0
        target_removals = 12 if difficulty == 'easy' else (15 if difficulty == 'medium' else 18)
        
        for r, c in cells:
            if removed_count >= target_removals:
                break
            temp = puzzle[r][c]
            puzzle[r][c] = ''
            
            # Check if puzzle still has exactly one solution
            if count_solutions_for_target(puzzle, target_r, target_c, target_val) == 1:
                removed_count += 1
            else:
                puzzle[r][c] = temp
                
        if removed_count >= target_removals - 2: # accept slightly fewer removals if it's hard to find
            return puzzle, target_val

def format_grid(grid):
    lines = []
    for row in grid:
        # Pad cells to align nicely
        formatted_row = [cell if cell != '' else '_' for cell in row]
        lines.append(" | ".join(formatted_row))
    return "\n".join(lines)

def main():
    num_questions = 100
    
    sql_statements = []
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("-- Migration: Batch 2 - 100 Programmatically Generated Latin Squares")
    sql_statements.append("-- ==============================================================================\n")
    sql_statements.append("INSERT INTO public.questions (id, module, prompt_text, options, correct_option_id, explanation_text, difficulty, source_id, time_estimate_seconds, subtopic, question_type, content_hash) VALUES")
    
    values = []
    difficulties = ['easy', 'medium', 'hard']
    
    for i in range(num_questions):
        diff = random.choice(difficulties)
        puzzle, target_val = create_puzzle(diff)
        
        grid_str = format_grid(puzzle)
        prompt = f"In the following 5x5 Latin square, each of the letters A, B, C, D, and E must appear exactly once in each row and each column.\n\n{grid_str}\n\nWhich letter belongs in the cell marked with '?'?"
        
        options = []
        letters = ['A', 'B', 'C', 'D', 'E']
        correct_id = ''
        for idx, letter in enumerate(letters):
            options.append({"id": chr(97 + idx), "text": letter})
            if letter == target_val:
                correct_id = chr(97 + idx)
                
        explanation = f"By applying the rules of Latin squares (no duplicate letters in any row or column), the cell marked '?' is uniquely forced to be {target_val}. You can deduce this by observing the row and column constraints that eliminate all other possibilities."
        
        # Escape single quotes for SQL
        prompt_sql = prompt.replace("'", "''")
        explanation_sql = explanation.replace("'", "''")
        options_sql = json.dumps(options).replace("'", "''")
        
        hash_hex = hashlib.md5(f"latin_batch2_{i}".encode()).hexdigest()
        q_id = f"{hash_hex[:8]}-{hash_hex[8:12]}-{hash_hex[12:16]}-{hash_hex[16:20]}-{hash_hex[20:32]}"
        
        val = f"('{q_id}', 'latin_square', '{prompt_sql}', '{options_sql}'::jsonb, '{correct_id}', '{explanation_sql}', '{diff}', 'aaaaaaaa-0000-0000-0000-000000000001', 75, 'standard_5x5', 'logical_deduction', 'latin_batch2_{i}')"
        values.append(val)
        
    sql_statements.append(",\n".join(values))
    sql_statements.append("\nON CONFLICT (id) DO NOTHING;\n")
    
    with open(output_file, "w", encoding="utf-8") as f:
        f.write("\n".join(sql_statements))
        
    print(f"Successfully generated {num_questions} Latin square questions in {output_file}")

if __name__ == "__main__":
    main()
