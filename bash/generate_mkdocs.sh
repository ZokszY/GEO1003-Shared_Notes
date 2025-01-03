#!/bin/bash

# Input and output files
output_file="../mkdocs.yml"

# Read existing mkdocs.yml content up to "nav:" into a variable
existing_content=$(sed '/^nav:/q' "$output_file")

# Define static parts of the new mkdocs.yml file
cat <<EOF >"$output_file"
$existing_content
  - Concise notes:
EOF

# Function to extract the first header from a markdown file
extract_title() {
    local file="$1"
    local fallback="Unknown Title"

    if [[ -f "$file" ]]; then
        # Extract the first markdown header (starting with '#')
        local title
        title=$(grep -m 1 '^#' "$file" | sed 's/^#\+ *//' | sed 's/ *$//')

        # If title is empty, return the fallback
        if [[ -z "$title" ]]; then
            echo "$fallback"
        else
            echo "$title"
        fi
    else
        echo "$fallback" # Fallback if the file doesn't exist
    fi
}


# Function to generate nav structure
generate_nav_section() {
    local input_file="$1"
    local prefix="$2"
    # Process example files
    while read -r filename || [[ -n "$filename" ]]; do
        basename="${filename%.*}"
        title=$(extract_title "$filename")
        title=${title/:/ -} # Replace ':' with ' -' to avoid YAML syntax issues
        level_count=$(echo "$filename" | tr -cd '/' | wc -c)
        if [[ "$filename" == */title.md ]]; then
            level_count=$(($level_count - 1))
        fi
        spaces=$(printf "%*s" $((2 * level_count)) "")
        if [[ "$filename" == */title.md ]]; then
            echo "${spaces}- $title:" >>"$output_file"
        else
            echo "${spaces}- $title: \"$basename${prefix}.md\"" >>"$output_file"
        fi
    done <"$input_file"
    if [ "$input_file" = "notes.txt" ]; then
        echo "    - PDF version: \"pdf/notes${prefix}.pdf\"" >>"$output_file"
    fi
}

# Generate "Concise version" nav
generate_nav_section "notes.txt" ""

# Add separator for "Long version"
cat <<EOF >>"$output_file"
  - Long notes:
EOF

# Generate "Long version" nav
generate_nav_section "notes.txt" "-long"

# Add separator for "Books notes"
cat <<EOF >>"$output_file"
  - Exams overview: content/exams_overview.md
  - Books notes:
EOF

# Generate "Books notes" nav
generate_nav_section "books.txt" ""

echo "mkdocs.yml generated successfully!"
