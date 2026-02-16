# 1. Configuration
$WindowsDumpPath = "C:\Program Files\MariaDB 10.6\bin\mysqldump.exe" 
$DockerContainer = "wai-web-db-1"
$DatabaseName    = "platform_dw"
$MySqlUser       = "root"
$MySqlPass       = "password" # Ensure this is correct
$BackupDir       = "C:\Users\mbalugo\Documents\automation scripts\Archived\backups\SQL"
$FileName        = "$DatabaseName-schema-$(Get-Date -Format 'yyyyMMdd').sql"
$FullOutputPath  = Join-Path -Path $BackupDir -ChildPath $FileName

# 2. Setup Environment
if (Test-Path $WindowsDumpPath) { $CommandType = "Native" }
elseif ((docker inspect -f '{{.State.Running}}' $DockerContainer 2>$null) -eq "true") { $CommandType = "Docker" }
else { Write-Host "ERROR: Environment not ready." -ForegroundColor Red; exit }

if (!(Test-Path $BackupDir)) { New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null }

# 3. Execution & Monitoring
try {
    Write-Host "--- Initiating Monitored Schema Export ---" -ForegroundColor Cyan
    $Stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

    # We use an array for arguments to prevent the "Usage" error
    $CommonArgs = @(
        "--user=$MySqlUser",
        "--password=$MySqlPass",
        "--no-data",
        "--add-drop-table",
        "--create-options",
        "--routines",
        "--triggers",
        $DatabaseName
    )

    if ($CommandType -eq "Native") {
        Write-Host "Running Native MariaDB Dump..." -ForegroundColor Gray
        & $WindowsDumpPath @CommonArgs | Out-File $FullOutputPath -Encoding utf8
    } else {
        Write-Host "Running Docker MySQL Dump..." -ForegroundColor Gray
        # Splatting the arguments for Docker exec
        docker exec $DockerContainer mysqldump @CommonArgs | Out-File $FullOutputPath -Encoding utf8
    }

    $Stopwatch.Stop()

    # 4. Verification
    if (Test-Path $FullOutputPath) {
        $FileAttrib = Get-Item $FullOutputPath
        if ($FileAttrib.Length -gt 100) { # Schemas are small but usually > 100 bytes
            Write-Host "SUCCESS: Export finished." -ForegroundColor Green
            Write-Host "File: $($FileAttrib.Name) ($([Math]::Round($FileAttrib.Length / 1KB, 2)) KB)"
            Write-Host "Time: $($Stopwatch.Elapsed.Seconds) seconds"
        } else {
            Write-Host "ERROR: File is nearly empty. Check if Database '$DatabaseName' exists." -ForegroundColor Red
        }
    }
} catch {
    Write-Host "CRITICAL FAILURE: $($_.Exception.Message)" -ForegroundColor Red
}

Pause