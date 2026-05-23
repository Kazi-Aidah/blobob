#!/bin/bash

output="theme.css"
srcDir="src"

files=(
    "style-settings.css"
    "theme-colors.css"
    "ribbon.css"
    "tabs.css"
    "tab-positions.css"
    "active-line.css"
    "inline-title.css"
    "text-formatting.css"
    "bullets.css"
    "checkboxes.css"
    "elements.css"
    "buttons.css"
    "buttons/global-radius.css"
    "buttons/button-animations.css"
    "buttons/button-styles.css"
    "buttons/clickable-icons.css"
    "buttons/icon-styles.css"
    "buttons/select.css"
    "modals.css"
    "navigation.css"
    "folders.css"
    "file-exp.css"
    "properties.css"
    "cssclasses.css"
    "settings-tabs.css"
    "statusbar.css"
    "toggles.css"
    "plugin-support.css"
    "hidden.css"
)

parts=()

for file in "${files[@]}"; do
    path="$srcDir/$file"
    if [ -f "$path" ]; then
        parts+=("$(cat "$path")")
        echo "  + $file"
    else
        echo "Warning: Missing $path"
    fi
done

result=$(IFS=$'\n\n'; echo "${parts[*]}")
echo -n "$result" > "$output"

lineCount=$(wc -l < "$output")
echo ""
echo "Built $output ($lineCount lines)"
