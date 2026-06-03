#!/bin/bash

output="theme.css"
srcDir="src"

files=(
    "base/style-settings.css"
    "base/theme-colors.css"
    "base/elements.css"
    "base/toggles.css"
    "base/inputs.css"
    "layout/ribbon.css"
    "layout/statusbar.css"
    "layout/titlebar.css"
    "layout/mobile.css"
    "layout/navigation.css"
    "layout/modals.css"
    "layout/menu.css"
    "layout/file-exp.css"
    "layout/folders.css"
    "layout/tabs.css"
    "layout/tab-positions.css"
    "layout/tabs-compact.css"
    "layout/settings-tabs.css"
    "editor/active-line.css"
    "editor/inline-title.css"
    "editor/text-formatting.css"
    "editor/properties.css"
    "editor/canvas.css"
    "markdown/checkboxes.css"
    "markdown/bullets.css"
    "markdown/blockquotes.css"
    "markdown/callouts.css"
    "markdown/tables.css"
    "markdown/links.css"
    "markdown/codes.css"
    "markdown/embeds.css"
    "components/buttons/global-radius.css"
    "components/buttons/button-animations.css"
    "components/buttons/button-styles.css"
    "components/buttons/icon-styles.css"
    "components/buttons/select.css"
    "others/cssclasses.css"
    "others/plugin-support.css"
    "others/hidden.css"
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
