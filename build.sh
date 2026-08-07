#!/bin/bash

output="theme.css"
srcDir="src"

# find all .css files under src/ sorted alphabetically
mapfile -t files < <(find "$srcDir" -type f -name "*.css" | sort)

parts=()
for file in "${files[@]}"; do
    echo "  + ${file#$srcDir/}"
    parts+=("$(cat "$file")")
done

result=$(IFS=$'\n\n'; echo "${parts[*]}")
echo -n "$result" > "$output"

lineCount=$(wc -l < "$output")
echo ""
echo "Built $output ($lineCount lines)"