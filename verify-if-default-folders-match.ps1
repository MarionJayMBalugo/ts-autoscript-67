# 1. Configuration Paths
$basePath = "C:\Users\mbalugo\Documents\automation scripts"
$SourcePath = "$basePath\DeloreanServer\www\default"
$BackupRoot = "$basePath\Archived\backups"
$DateSuffix = Get-Date -Format "yyyyMMdd"
$TargetFolderName = "default-preupgrade-$DateSuffix"
$DestinationPath = Join-Path -Path $BackupRoot -ChildPath $TargetFolderName

Write-Host "--- Comparing Source and Backup ---" -ForegroundColor Cyan

# 2. Run Robocopy in List Mode (/L)
# We remove /NJH and /NJS so we can see the summary table
$params = @($SourcePath, $DestinationPath, "/E", "/L", "/NJH", "/NJS", "/NP")
robocopy @params

# 3. Use the Exit Code to determine if they match
# Robocopy Exit Code 0 means "No changes, folders are identical"
if ($LASTEXITCODE -eq 0) {
    Write-Host "`SUCCESS: Folders match perfectly! No differences found." -ForegroundColor Green
} elseif ($LASTEXITCODE -lt 8) {
    Write-Host "`NOTICE: There are differences between the folders." -ForegroundColor Yellow
    Write-Host "This usually means some files are extra, newer, or missing in the backup."
} else {
    Write-Host "`ERROR: Robocopy could not complete the comparison." -ForegroundColor Red
}

Pause