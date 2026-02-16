# 1. Define the Root Directory
$BasePath = "C:\Users\mbalugo\Documents\automation scripts"

# 2. Define Subfolders (Relative to the Base Path)
$SubFolders = @(
    "tms-dos",
    "tms-dos-data",
    "tms-dos-data\apache-configuration",
    "tms-dos-data\mariadb-confiuration",
    "tms-tools",
    "Archived",
    "Archived\code",
    "Archived\auto_backups"
)

Write-Host "--- Creating Default Folders ---" -ForegroundColor Cyan

# 3. Loop and Construct Paths Safely
foreach ($Sub in $SubFolders) {
    # Join-Path combines the base and the subfolder correctly
    $FullPath = Join-Path -Path $BasePath -ChildPath $Sub

    try {
        if (Test-Path $FullPath) {
            Write-Host " [EXIST] " -NoNewline -ForegroundColor Yellow
            Write-Host "$FullPath"
        } else {
            New-Item -Path $FullPath -ItemType Directory -Force | Out-Null
            Write-Host " [NEW]   " -NoNewline -ForegroundColor Green
            Write-Host "$FullPath"
        }
    } catch {
        Write-Host " [ERROR] " -NoNewline -ForegroundColor Red
        Write-Host "$FullPath - $_"
    }
}

Write-Host "`nSetup Complete." -ForegroundColor Cyan
Pause