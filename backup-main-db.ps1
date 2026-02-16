# 1. Configuration
$WindowsDumpPath = "C:\Program Files\MariaDB 10.6\bin\mysqldump.exe" 
$DockerContainer = "wai-web-db-1"
$DatabaseName    = "platform"
$MySqlUser       = "root"
$EnvFilePath     = "C:\Users\mbalugo\Documents\automation scripts\.env"

# 2. Setup Output Paths
$BackupDir       = "C:\Users\mbalugo\Documents\automation scripts\Archived\backups\SQL"
$Timestamp       = Get-Date -Format 'yyyyMMdd_HHmmss'
$FullOutputPath  = Join-Path $BackupDir "$DatabaseName-full-$Timestamp.sql"
$ErrorLog        = Join-Path $BackupDir "dump_error_log.txt"

if (!(Test-Path $BackupDir)) { New-Item -ItemType Directory $BackupDir -Force | Out-Null }

# 3. Read Password from .env
if (Test-Path $EnvFilePath) {
    $EnvLine = Get-Content $EnvFilePath | Where-Object { $_ -match "^DB_PASSWORD=" }
    $MySqlPass = if ($EnvLine) { $EnvLine.Split("=")[1].Trim().Trim("'").Trim('"') } else { "password" }
}

# 4. Execution Logic
try {
    Write-Host "--- Initiating Monitored Backup for: $DatabaseName ---" -ForegroundColor Cyan
    $StartTime = Get-Date

    $DumpArgs = @("--user=$MySqlUser", "--single-transaction", "--routines", "--triggers", "--events", "--max_allowed_packet=1G", $DatabaseName)

    if (Test-Path $WindowsDumpPath) {
        $env:MYSQL_PWD = $MySqlPass 
        $Process = Start-Process -FilePath $WindowsDumpPath -ArgumentList $DumpArgs -NoNewWindow -PassThru -RedirectStandardOutput $FullOutputPath -RedirectStandardError $ErrorLog
    } else {
        $DockerArgs = @("exec", "-e", "MYSQL_PWD=$MySqlPass", $DockerContainer, "mysqldump") + $DumpArgs
        $Process = Start-Process -FilePath "docker" -ArgumentList $DockerArgs -NoNewWindow -PassThru -RedirectStandardOutput $FullOutputPath -RedirectStandardError $ErrorLog
    }

    # 5. Monitoring Loop
    while (!$Process.HasExited) {
        $CurrentProc = Get-Process -Id $Process.Id -ErrorAction SilentlyContinue
        if ($CurrentProc) {
            $Mem = [Math]::Round($CurrentProc.WorkingSet64 / 1MB, 2)
            Write-Host -NoNewline "`r[ACTIVE] RAM: $Mem MB | Elapsed: $((Get-Date) - $StartTime | Select-Object -ExpandProperty Seconds)s    " -ForegroundColor Yellow
        }
        Start-Sleep -Seconds 1
    }

    # IMPORTANT: Wait for buffers to flush to disk
    Write-Host "`nFinalizing file..." -ForegroundColor Gray
    Start-Sleep -Seconds 3 

    # 6. Rigorous Final Verification
    if (Test-Path $FullOutputPath) {
        $FileSize = (Get-Item $FullOutputPath).Length
        # Scan last 20 lines for the success string
        $FooterCheck = Get-Content $FullOutputPath -Tail 20 -ErrorAction SilentlyContinue
        
        if ($FooterCheck -match "-- Dump completed on") {
            Write-Host "SUCCESS: Integrity Verified." -ForegroundColor Green
            Write-Host "File Size: $([Math]::Round($FileSize / 1MB, 2)) MB" -ForegroundColor White
            if (Test-Path $ErrorLog) { Remove-Item $ErrorLog }
        } else {
            Write-Host "CRITICAL FAILURE: Integrity Check Failed." -ForegroundColor Red
            Write-Host "The string '-- Dump completed on' was not found in the file footer." -ForegroundColor Yellow
            Write-Host "File Size: $([Math]::Round($FileSize / 1KB, 2)) KB" -ForegroundColor White
        }
    }
} catch {
    Write-Host "SCRIPT ERROR: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    $env:MYSQL_PWD = $null
}

Pause