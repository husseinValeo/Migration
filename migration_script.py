import re

# Define the word to count and the end word
word_to_count = "if"
end_word = "end"

# Open the file for reading
with open('test files 1\HvVolt.txt', 'r') as file:
    # Read the content of the file line by line
    lines = file.readlines()

# Define the pattern to match whole words
pattern = rf'\b{word_to_count}\b'
end_pattern = rf'\b{end_word}\b'

# Define a pattern to extract the condition of "if" statements
condition_pattern = re.compile(r'\bif\b\s*\((.*?)\)')

# List to store conditions
conditions = []

# Iterate over the lines and search for matches
i = 0
while i < len(lines):
    line = lines[i]
    if re.search(pattern, line):
        print(f"Found '{word_to_count}' in line {i+1}: {line.strip()}")
        
        # Extract the condition of the "if" statement
        match = condition_pattern.search(line)
        if match:
            condition = match.group(1)
            conditions.append(condition)
            print(f"Condition: {condition}")
        
        # Print lines until "end" is encountered
        i += 1
        while i < len(lines) and not re.search(end_pattern, lines[i]):
            print(f"Line {i+1}: {lines[i].strip()}")
            i += 1
        # Print the "end" line
        if i < len(lines) and re.search(end_pattern, lines[i]):
            print(f"Line {i+1}: {lines[i].strip()}")
    i += 1

# Print all extracted conditions
print("\nExtracted conditions:")
for condition in conditions:
    print(condition)