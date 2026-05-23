#!/usr/bin/env pwsh

$output = "theme.css"
$srcDir = "src"

$files = @(
    "style-settings.css",
    "theme-colors.css",
    "ribbon.css",
    "tabs.css",
    "tab-positions.css",
    "active-line.css",
    "inline-title.css",
    "text-formatting.css",
    "bullets.css",
    "checkboxes.css",
    "elements.css",
    "buttons.css",
    "buttons/global-radius.css",
    "buttons/button-animations.css",
    "buttons/button-styles.css",
    "buttons/clickable-icons.css",
    "buttons/icon-styles.css",
    "buttons/select.css",
    "modals.css",
    "navigation.css",
    "folders.css",
    "file-exp.css",
    "properties.css",
    "cssclasses.css",
    "settings-tabs.css",
    "statusbar.css",
    "toggles.css",
    "plugin-support.css",
    "hidden.css"
)

$parts = @()

foreach ($file in $files) {
    $path = Join-Path $srcDir $file
    if (Test-Path $path) {
        $content = Get-Content $path -Raw -Encoding UTF8
        $parts += $content
        Write-Host "  + $file"
    } else {
        Write-Warning "Missing: $path"
    }
}

$result = $parts -join "`n`n"
[System.IO.File]::WriteAllText($output, $result, [System.Text.Encoding]::UTF8)

$lineCount = (Get-Content $output).Count
Write-Host ""
Write-Host "Built $output ($lineCount lines)"
