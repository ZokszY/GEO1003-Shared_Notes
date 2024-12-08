#!/bin/bash

# Input file containing the list of chapters
input_file="notes.txt"

# Temporary file to store the modified list
temp_file=$(mktemp)

# Process each line in the input file
while IFS= read -r line; do
    # Extract the base name and the extension
    base_name="${line%.*}"    
    # Create the modified filename
    modified_line="${base_name}-long.md"
    echo "$modified_line" >> "$temp_file"
done < "$input_file"

# Run Pandoc with the modified list of files
mkdir -p pdf
pandoc --from=markdown+rebase_relative_paths -s -o pdf/notes-long.pdf --metadata-file=metadata.yaml --toc --pdf-engine=pdflatex $(cat "$temp_file")

# Clean up the temporary file
rm "$temp_file"