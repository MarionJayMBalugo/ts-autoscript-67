# 1. Configuration Paths
$basePath = "C:\Users\mbalugo\Documents\automation scripts"
$SourcePath = "$basePath\DeloreanServer\www\default"
$BackupRoot = "$basePath\Archived\backups"
$DateSuffix = Get-Date -Format "yyyyMMdd"
$TargetFolderName = "default-preupgrade-$DateSuffix"
$DestinationPath = Join-Path -Path $BackupRoot -ChildPath $TargetFolderName

Write-Host "--- Starting High-Speed Folder Copy ---" -ForegroundColor Cyan

# 2. Pre-Check Source
if (!(Test-Path $SourcePath)) {
    Write-Host "CRITICAL ERROR: Source folder not found at $SourcePath" -ForegroundColor Red
    Pause; exit
}

# 3. Create Destination Root if missing
if (!(Test-Path $BackupRoot)) {
    New-Item -Path $BackupRoot -ItemType Directory -Force | Out-Null
}

# 4. Execute Multi-threaded Copy (Robocopy)
Write-Host "Copying to: $DestinationPath" -ForegroundColor Yellow

# Parameters explained:
# /E      : Copies all subdirectories, including empty ones.
# /MT:32  : Multi-threaded; copies up to 32 files simultaneously for speed.
# /R:3    : Retries 3 times if a file is locked or "in use".
# /W:5    : Waits 5 seconds between retries.
# /NP     : No Progress; hides the percentage for individual files (improves speed).
# /NFL    : No File List; keeps the console clean by not listing every single file name.
# /NDL    : No Directory List; hides directory names from the console output.

$RoboParams = @("$SourcePath", "$DestinationPath", "/E", "/MT:32", "/R:3", "/W:5", "/NP", "/NFL", "/NDL")

robocopy @RoboParams

# 5. Result Reporting
# Robocopy exit codes 0-7 are considered successful.
if ($LASTEXITCODE -lt 8) {
    Write-Host "`nSUCCESS: Copy complete. That was much faster than File Explorer!" -ForegroundColor Green
} else {
    Write-Host "`nERROR: One or more files could not be copied. Robocopy Exit Code: $LASTEXITCODE" -ForegroundColor Red
    Write-Host "Tip: Ensure no other programs are using files in the 'default' folder." -ForegroundColor Yellow
}

Pause