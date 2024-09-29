import os
import re
def pattern_extraction(file_path):
    if_word = "if"
    end_word = "end"

    with open(file_path , 'r') as file:
        lines = file.readlines()

    if_pattern = rf'\b{if_word}\b'
    end_pattern = rf'\b{end_word}\b'
    condition_pattern = re.compile(r'\bif\b\s*\((.*?)\)')

    conditions = []
    if_end_blocks = []

    i = 0
    for i in range(len(lines)):
        line = lines[i]
        if re.search(if_pattern, line):
            match = condition_pattern.search(line)
            if match:
                condition = match.group(1)
                conditions.append(condition)
            block_lines = []
            i += 1
            while i < len(lines) and not re.search(end_pattern, lines[i]):
                block_lines.append(lines[i].strip())
                i += 1
            if i < len(lines) and re.search(end_pattern, lines[i]):
                block_lines.append(lines[i].strip())
            if_end_blocks.append(block_lines)
        i += 1
    return conditions, if_end_blocks
def clened_conditions_and_if_end_block(conditions, if_end_block):
    cleaned_conditions = [condition.replace('(', '').replace(')', '').replace(';', '').replace('t','current_sample_time_val') for condition in conditions]
    cleaned_if_end_block = [[f"MCDDHMM_{line.replace('verify', '').replace('(', '').replace(')', '').replace(';', '')}" for line in block] for block in if_end_block]
    return cleaned_conditions, cleaned_if_end_block
os.system('cls')
file_path = input('Enter file path: ')

file_name = file_path.split('\\')[-1]  # Get the last part after the last backslash
name_without_extension = file_name.split('.')[0]  # Split by '.' and take the first part
path_without_file_name = '\\'.join(file_path.split('\\')[:-1])  # Join all parts except the last one

output_file_name = "MCDDHMM_" + name_without_extension + "_GlobalAssess"
output_file_path = os.path.join(path_without_file_name, output_file_name)



conditions,if_end_block=pattern_extraction(file_path)
conditions_fianl,if_end_block_final=clened_conditions_and_if_end_block(conditions,if_end_block)
cleaned_if_end_block_final = []
for block in if_end_block_final:
    cleaned_block = []
    for line in block:
        # Remove "verify"
        line = line.replace("verify", "")
        # Remove "== number"
        line = re.sub(r"==\s*\d+", "", line)
        # Remove brackets
        line = line.replace("(", "").replace(")", "")
        cleaned_block.append(line.strip())
    cleaned_if_end_block_final.append(cleaned_block)


final_cleaned_if_end_block = []
for block in cleaned_if_end_block_final:
    cleaned_block = [line.replace("MCDDHMM_", "") for line in block]
    final_cleaned_if_end_block.append(cleaned_block)

with open('used_text/intro.txt', 'r') as original_file:
    intro_header = original_file.read()

with open('used_text\class.text', 'r') as original_file:
    class_header = original_file.read()

with open('used_text\method.txt', 'r') as original_file:
    method_header = original_file.read()

with open('used_text/function.txt', 'r') as original_file:
    function_header = original_file.read()

with open('used_text/if.txt', 'r') as original_file:
    if_header = original_file.read()

with open('used_text/elseif.txt', 'r') as original_file:
    elseif_header = original_file.read()

with open('used_text/ifif.txt', 'r') as original_file:
    ifif_header = original_file.read()

with open('used_text/else.txt', 'r') as original_file:
    else_header = original_file.read()

with open('used_text/elseelse.txt', 'r') as original_file:
    elseelse_header = original_file.read()

with open('used_text/endend.txt', 'r') as original_file:
    endend_header = original_file.read()

with open('used_text/end.txt', 'r') as original_file:
    end_header = original_file.read()

with open('used_text/passed.txt', 'r') as original_file:
    passed_header = original_file.read()

with open('used_text/failed.txt', 'r') as original_file:
    failed_header = original_file.read()

with open('used_text/time.txt', 'r') as original_file:
    time_header = original_file.read()

with open('used_text/description.txt', 'r') as original_file:
    description_header = original_file.read()

with open('used_text/final.txt', 'r') as copy_file:
    final_header = copy_file.read()

with open(output_file_path, 'w') as copy_file:
    copy_file.write(intro_header)
    copy_file.write("\n")
    copy_file.write(class_header)
    copy_file.write("MCDDHMM_"+name_without_extension)
    copy_file.write("\n")
    copy_file.write(method_header)
    copy_file.write("\n")
    copy_file.write(function_header)
    copy_file.write("\n")
    copy_file.write(time_header)
    copy_file.write("\n")

    for i in range(len(if_end_block_final[0])-1):
        copy_file.write("            "+cleaned_if_end_block_final[0][i] + " = signals("+final_cleaned_if_end_block[0][i]+")")
        copy_file.write("\n")
    copy_file.write(if_header)
    copy_file.write("("+conditions_fianl[0]+")")
    copy_file.write("\n")
    copy_file.write(ifif_header)
    copy_file.write(" (")
    for i in range(0,len(if_end_block_final[0])-1):
        copy_file.write(if_end_block_final[0][i])
        if i<len(if_end_block_final[0])-2:
            copy_file.write(" && ")
    copy_file.write(")")
    copy_file.write("\n")
    copy_file.write(passed_header)
    copy_file.write("\n")
    copy_file.write(else_header)
    copy_file.write("\n")
    copy_file.write(failed_header)
    copy_file.write("\n")
    copy_file.write(endend_header)
    copy_file.write("\n")
    for i in range(1,len(conditions_fianl)):
        copy_file.write(elseif_header)
        copy_file.write("("+conditions_fianl[i]+")")
        copy_file.write("\n")
        copy_file.write(ifif_header)
        copy_file.write(" (")
        for j in range(0,len(if_end_block_final[i])-1):
            copy_file.write(if_end_block_final[i][j])
            if j<len(if_end_block_final[i])-2:
                copy_file.write(" && ")
        copy_file.write(")")
        copy_file.write("\n")
        copy_file.write(passed_header)
        copy_file.write("\n")
        copy_file.write(else_header)
        copy_file.write("\n")
        copy_file.write(failed_header)
        copy_file.write("\n")
        copy_file.write(endend_header)
        copy_file.write("\n")
    
    copy_file.write(elseelse_header)
    copy_file.write("\n")
    copy_file.write(failed_header)
    copy_file.write("\n")
    copy_file.write(end_header)
    copy_file.write("\n")
    copy_file.write(description_header)
    for i in range(len(if_end_block_final[0])-1):
        copy_file.write(cleaned_if_end_block_final[0][i])
        if i<len(if_end_block_final[i])-2:
            copy_file.write(',')
    copy_file.write("'}")
    copy_file.write("\n")
    copy_file.write(final_header)

    


# Define the original file path and the new extension
new_extension = '.m'

# Split the file name and its extension
file_name, file_extension = os.path.splitext(output_file_name)

# Create the new file path with the new extension
new_file_path = os.path.join(path_without_file_name, file_name + new_extension)

# Rename the file
os.rename(output_file_path, new_file_path)

print(f"File renamed to: {new_file_path}")

