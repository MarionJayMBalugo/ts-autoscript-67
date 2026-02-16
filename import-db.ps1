# 1. Configuration
$WindowsMySqlPath = "C:\Program Files\MariaDB 10.6\bin\mysql.exe" 
$DockerContainer  = "wai-web-db-1"
$DatabaseName     = "cmh_prod"
$MySqlUser        = "root"
$EnvFilePath      = "C:\Users\mbalugo\Documents\automation scripts\.env"

# Updated to your specific file path
$ImportFile = "C:\Users\mbalugo\Documents\automation scripts\Archived\backups\SQL\platform-users-20260128_205902.sql"
$ImportFile = "C:\Users\mbalugo\Documents\automation scripts\Archived\backups\SQL\metadata.sql"

# 2. Read Password from .env
if (Test-Path $EnvFilePath) {
    $EnvLine = Get-Content $EnvFilePath | Where-Object { $_ -match "^DB_PASSWORD=" }
    $MySqlPass = if ($EnvLine) { $EnvLine.Split("=")[1].Trim().Trim("'").Trim('"') } else { "password" }
}

# 3. Execution Logic
try {
    if (!(Test-Path $ImportFile)) { Write-Host "ERROR: File not found: $ImportFile" -ForegroundColor Red; Pause; exit }

    Write-Host "--- Initiating Monitored Import: $DatabaseName ---" -ForegroundColor Cyan
    $StartTime = Get-Date

    # We use a specific variable to capture the error stream directly from the process
    $ProcessInfo = New-Object System.Diagnostics.ProcessStartInfo
    $ProcessInfo.FileName = "docker"
    $ProcessInfo.Arguments = "exec -i -e MYSQL_PWD=$MySqlPass $DockerContainer mysql -u $MySqlUser $DatabaseName"
    $ProcessInfo.RedirectStandardInput = $true
    $ProcessInfo.RedirectStandardError = $true
    $ProcessInfo.UseShellExecute = $false
    $ProcessInfo.CreateNoWindow = $true

    $Process = [System.Diagnostics.Process]::Start($ProcessInfo)

    # Feed the file into the standard input stream
    $StreamWriter = $Process.StandardInput
    Get-Content $ImportFile -Raw | foreach { $StreamWriter.WriteLine($_) }
    $StreamWriter.Close()

    # 4. Monitoring Loop
    while (!$Process.HasExited) {
        # Using a generic check as we are using System.Diagnostics.Process
        $Elapsed = (Get-Date) - $StartTime
        Write-Host -NoNewline "`r[IMPORTING] Elapsed: $($Elapsed.Seconds)s...    " -ForegroundColor Yellow
        Start-Sleep -Seconds 1
    }

    # 5. Capture the Error message if it exists
    $ErrorMessage = $Process.StandardError.ReadToEnd()
    $Process.WaitForExit()

    if ($Process.ExitCode -eq 0) {
        Write-Host "`n`nSUCCESS: Database import completed." -ForegroundColor Green
    } else {
        Write-Host "`n`nCRITICAL FAILURE: Exit Code $($Process.ExitCode)" -ForegroundColor Red
        if ($ErrorMessage) {
            Write-Host "--- ACTUAL ERROR FROM MYSQL ---" -ForegroundColor White
            Write-Host $ErrorMessage -ForegroundColor Yellow
            Write-Host "-------------------------------" -ForegroundColor White
        } else {
            Write-Host "No specific error captured. Tip: Check if 'platform' database has enough disk space." -ForegroundColor Gray
        }
    }
} catch {
    Write-Host "`nSCRIPT ERROR: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    $env:MYSQL_PWD = $null
}

Pause