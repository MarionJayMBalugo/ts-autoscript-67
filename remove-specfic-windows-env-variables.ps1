# 1. Configuration: Define the paths to remove
$PathsToRemove = @(
    "D:\DeloreanServer\PHP\7.4",
    "D:\DeloreanServer\Configs\php7",
    "D:\DeloreanServer\MariaDB\bin",
    "C:\Program Files\Eclipse Adoptium\jdk-11.0.14.9-hotspot\bin"
)

$BackupDir = "C:\Users\mbalugo\Documents\automation scripts\Archived\EnvBackups"
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$BackupFile = Join-Path -Path $BackupDir -ChildPath "Env_Backup_$Timestamp.txt"

# 2. Create Backup First
if (!(Test-Path $BackupDir)) { New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null }

Write-Host "--- Backing Up Environment Variables ---" -ForegroundColor Cyan
$Targets = @([System.EnvironmentVariableTarget]::Machine, [System.EnvironmentVariableTarget]::User)

foreach ($Target in $Targets) {
    Add-Content -Path $BackupFile -Value "`n=== SCOPE: $Target ==="
    $Vars = [System.Environment]::GetEnvironmentVariables($Target)
    foreach ($Key in $Vars.Keys) {
        Add-Content -Path $BackupFile -Value "$Key=$($Vars[$Key])"
    }
}
Write-Host "Backup saved to: $BackupFile" -ForegroundColor Gray

# 3. Removal Logic
Write-Host "`n--- Starting Path Removal ---" -ForegroundColor Cyan

foreach ($Target in $Targets) {
    Write-Host "Processing $Target..." -ForegroundColor Gray
    $Variables = [System.Environment]::GetEnvironmentVariables($Target)

    foreach ($VarName in $Variables.Keys) {
        $VarValue = $Variables[$VarName]

        # Handle the PATH variable specifically
        if ($VarName -eq "Path") {
            $CurrentPaths = $VarValue -split ";" | Where-Object { $_ -ne "" }
            $FilteredPaths = $CurrentPaths | Where-Object { $PathsToRemove -notcontains $_ }

            if ($CurrentPaths.Count -ne $FilteredPaths.Count) {
                $NewPathString = $FilteredPaths -join ";"
                [System.Environment]::SetEnvironmentVariable("Path", $NewPathString, $Target)
                Write-Host "  [REMOVED] Cleaned entries from Path" -ForegroundColor Green
            }
        }
        # Handle variables that match the value exactly
        elseif ($PathsToRemove -contains $VarValue) {
            [System.Environment]::SetEnvironmentVariable($VarName, $null, $Target)
            Write-Host "  [DELETED] Variable '$VarName' (Matched Target Path)" -ForegroundColor Green
        }
    }
}

Write-Host "`nCleanup Complete." -ForegroundColor Cyan
Pause