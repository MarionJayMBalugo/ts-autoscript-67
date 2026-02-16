# 1. Configuration Paths
$BasePath = "C:\Users\mbalugo\Documents\automation scripts"
$EnvFilePath = Join-Path -Path $BasePath -ChildPath ".env"
$BackupDir = Join-Path -Path $BasePath -ChildPath "Archived\auto_backups"
$Timestamp = Get-Date -Format "yyyy-MM-dd_HHmm"

# 2. Safety Check and Initial Backup
if (!(Test-Path $EnvFilePath)) {
    Write-Host "Error: .env file not found at $EnvFilePath" -ForegroundColor Red
    Pause
    exit
}

# CREATE SAFETY COPY OF .ENV BEFORE EDITING
Copy-Item $EnvFilePath "$EnvFilePath.bak" -Force
Write-Host "Safety backup created: .env.bak" -ForegroundColor Gray

# 3. Interactive .env Editing Section
$Lines = Get-Content -Path $EnvFilePath
$NewLines = @()
$Config = @{} 

Write-Host "--- STEP 1: Update .env Configuration ---" -ForegroundColor Cyan
foreach ($Line in $Lines) {
    if ($Line -match "^([^#\s][^=]*)=(.*)$") {
        $Key = $Matches[1].Trim(); $Value = $Matches[2].Trim()
        
        Write-Host "Variable: " -NoNewline -ForegroundColor White
        Write-Host "$Key " -NoNewline -ForegroundColor Yellow
        Write-Host "| Current: " -NoNewline -ForegroundColor White
        Write-Host "[$Value]" -ForegroundColor Cyan
        
        $UserInput = Read-Host "Enter new value (Leave blank to keep). Type 'abort' to cancel without saving"

        if ($UserInput -ieq "abort") {
            Write-Host "`nOperation cancelled. No changes were saved to .env." -ForegroundColor Red
            Pause
            exit # This stops the script before it hits the save line
        }

        $FinalValue = if ($UserInput -ne "") { $UserInput } else { $Value }
        $NewLines += "$Key=$FinalValue"
        $Config[$Key] = $FinalValue 
        
        if ($UserInput -ne "") { Write-Host " -> Updated" -ForegroundColor Green }
    } else { 
        $NewLines += $Line 
    }
}

# Save updated content
$NewLines | Set-Content -Path $EnvFilePath -Force
Write-Host "`nConfiguration Saved Successfully.`n" -ForegroundColor Green
Pause