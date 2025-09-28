param (
    [string]$ZipName = "game.love"
)

$GitIgnoreFile = ".gitignore"

# Check for git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git is not installed or not in PATH."
    exit 1
}

# Check for .gitignore file
if (-not (Test-Path $GitIgnoreFile)) {
    Write-Error ".gitignore not found."
    exit 1
}

# Use git to get the list of files to include
$IncludedFiles = git ls-files --cached --others --exclude-standard

# Create a temp folder
$TempDir = Join-Path $env:TEMP ("zip_temp_" + [guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $TempDir -Force | Out-Null

# Copy included files to the temp directory preserving folder structure
foreach ($File in $IncludedFiles) {
    $Source = Join-Path (Get-Location) $File
    $Destination = Join-Path $TempDir $File
    $DestinationDir = Split-Path $Destination -Parent
    if (-not (Test-Path $DestinationDir)) {
        New-Item -ItemType Directory -Path $DestinationDir -Force | Out-Null
    }
    Copy-Item -Path $Source -Destination $Destination -Force
}

# Remove existing zip if exists
if (Test-Path $ZipName) {
    Remove-Item $ZipName -Force
}

# Compress using PowerShell’s native tool
Compress-Archive -Path "$TempDir\*" -DestinationPath $ZipName -CompressionLevel Optimal

# Clean up
Remove-Item -Recurse -Force $TempDir

Write-Host "Created archive: $ZipName"
