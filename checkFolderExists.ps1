# 1. Define the Root Directory
$BasePath = "C:\Users\mbalugo\Documents\automation scripts"

# 2. Define Subfolders (Relative to the Base Path)
$SubFolders = @(
    "tms-dos",
    "tms-dos-data",
    "tms-dos-data\apache-configuration",
    "tms-dos-data\mariadb-confiuration",
    "tms-dos-data\ssl-cert",
    "tms-tools",
    "Archived",
    "Archived\code",
    "Archived\auto_backups"
)

Write-Host "--- Auditing Default Folders in the Server Environment ---" -ForegroundColor Cyan
Write-Host "Base Path: $BasePath`n" -ForegroundColor Gray

# 3. Loop and Construct Paths Safely
foreach ($Sub in $SubFolders) {
    $FullPath = Join-Path -Path $BasePath -ChildPath $Sub

    try {
        if (Test-Path $FullPath) {
            # Folder is present
            Write-Host " [EXIST]   " -NoNewline -ForegroundColor Green
            Write-Host "$FullPath"
        } else {
            # Folder is missing (This is the update you requested)
            Write-Host " [MISSING] " -NoNewline -ForegroundColor Red
            Write-Host "$FullPath"
        }
    } catch {
        Write-Host " [ERROR]   " -NoNewline -ForegroundColor DarkRed
        Write-Host "$FullPath - $_"
    }
}

Write-Host "`nAudit Complete." -ForegroundColor Cyan
Pause