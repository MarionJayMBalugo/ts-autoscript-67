# 1. Configuration
$WindowsDumpPath = "C:\Program Files\MariaDB 10.6\bin\mysqldump.exe" 
$DockerContainer = "wai-web-db-1"
$DatabaseName    = "platform"
$TableName       = "users" # Specify the table you want to extract
$EnvFilePath     = "C:\Users\mbalugo\Documents\automation scripts\.env"

# 2. Setup Output Paths
$BackupDir       = "C:\Users\mbalugo\Documents\automation scripts\Archived\backups\SQL"
$Timestamp       = Get-Date -Format 'yyyyMMdd_HHmmss'
$FullOutputPath  = Join-Path $BackupDir "$DatabaseName-$TableName-$Timestamp.sql"
$ErrorLog        = Join-Path $BackupDir "table_dump_error_log.txt"

if (!(Test-Path $BackupDir)) { New-Item -ItemType Directory $BackupDir -Force | Out-Null }

# 3. Read Password from .env
if (Test-Path $EnvFilePath) {
    $EnvLine = Get-Content $EnvFilePath | Where-Object { $_ -match "^DB_PASSWORD=" }
    $MySqlPass = if ($EnvLine) { $EnvLine.Split("=")[1].Trim().Trim("'").Trim('"') } else { "password" }
}

# 4. Execution Logic
try {
    Write-Host "--- Initiating Table Backup: [$DatabaseName].[$TableName] ---" -ForegroundColor Cyan
    $StartTime = Get-Date

    # Arguments: Added $TableName after $DatabaseName to target a specific table
    $DumpArgs = @(
        "--user=$MySqlUser", 
        "--single-transaction", 
        "--routines", 
        "--triggers", 
        "--events", 
        "--max_allowed_packet=1G", 
        $DatabaseName,
        $TableName
    )

    if (Test-Path $WindowsDumpPath) {
        $env:MYSQL_PWD = $MySqlPass 
        $Process = Start-Process -FilePath $WindowsDumpPath -ArgumentList $DumpArgs -NoNewWindow -PassThru `
            -RedirectStandardOutput $FullOutputPath -RedirectStandardError $ErrorLog
    } else {
        $DockerArgs = @("exec", "-e", "MYSQL_PWD=$MySqlPass", $DockerContainer, "mysqldump") + $DumpArgs
        $Process = Start-Process -FilePath "docker" -ArgumentList $DockerArgs -NoNewWindow -PassThru `
            -RedirectStandardOutput $FullOutputPath -RedirectStandardError $ErrorLog
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

    Write-Host "`nFinalizing and checking for SQL errors..." -ForegroundColor Gray
    Start-Sleep -Seconds 3 # Safety buffer for file flushing

    # 6. Advanced Verification: Integrity + SQL Error Parsing
    $HasSqlError = $false
    if (Test-Path $ErrorLog) {
        $LogContent = Get-Content $ErrorLog
        # Filter out harmless warnings; catch actual errors
        $SqlErrors = $LogContent | Where-Object { $_ -notmatch "password on the command line interface can be insecure" -and $_ -match "error|failed|denied" }
        if ($SqlErrors) { $HasSqlError = $true }
    }

    if (Test-Path $FullOutputPath) {
        $FileSize = (Get-Item $FullOutputPath).Length
        $FooterCheck = Get-Content $FullOutputPath -Tail 20 -ErrorAction SilentlyContinue
        
        # Verify success: No errors in log AND valid footer found
        if (-not $HasSqlError -and $FooterCheck -match "-- Dump completed on") {
            Write-Host "SUCCESS: Table backup verified and SQL-error free." -ForegroundColor Green
            Write-Host "File Size: $([Math]::Round($FileSize / 1KB, 2)) KB" -ForegroundColor White
            if (Test-Path $ErrorLog) { Remove-Item $ErrorLog }
        } else {
            Write-Host "CRITICAL FAILURE: Table dump failed or is incomplete." -ForegroundColor Red
            if ($HasSqlError) {
                Write-Host "Caught SQL Error:" -ForegroundColor Yellow
                $SqlErrors | Write-Host -ForegroundColor White
            }
            if ($FooterCheck -notmatch "-- Dump completed on") {
                Write-Host "Integrity Error: File footer is missing. Table may be truncated." -ForegroundColor Yellow
            }
        }
    }
} catch {
    Write-Host "SCRIPT ERROR: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    $env:MYSQL_PWD = $null
}

Pause