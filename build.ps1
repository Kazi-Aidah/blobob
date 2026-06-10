#!/usr/bin/env pwsh

$output = "theme.css"
$srcDir = "src"

# Get all .css files recursively, sort by full path for deterministic order
$files = Get-ChildItem -Path $srcDir -Recurse -Filter "*.css" | Sort-Object FullName

$parts = @()

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $parts += $content
    Write-Host "  + $($file.FullName.Replace($srcDir, '').TrimStart('\'))"
}

$result = $parts -join "`n`n"
[System.IO.File]::WriteAllText($output, $result, [System.Text.Encoding]::UTF8)

$lineCount = (Get-Content $output).Count
Write-Host ""
Write-Host "Built $output ($lineCount lines) from $($files.Count) CSS files"