# 1. Configuration
$WindowsMySqlPath = "C:\Program Files\MariaDB 10.6\bin\mysql.exe" # Typical Server Path
$DockerContainer  = "wai-web-db-1"
$MySqlUser        = "root"
$MySqlPass        = "password" 

Write-Host "--- Detecting Environment ---" -ForegroundColor Cyan

# 2. Logic: Determine if we use Windows Native or Docker
if (Test-Path $WindowsMySqlPath) {
    Write-Host "[MODE] Windows Native detected at: $WindowsMySqlPath" -ForegroundColor Yellow
    $CommandType = "Native"
} else {
    # Check if Docker is available and container is running
    $ContainerStatus = docker inspect -f '{{.State.Running}}' $DockerContainer 2>$null
    if ($ContainerStatus -eq "true") {
        Write-Host "[MODE] Docker Container '$DockerContainer' detected." -ForegroundColor Yellow
        $CommandType = "Docker"
    } else {
        Write-Host "CRITICAL ERROR: No Windows MariaDB found AND Docker container is not running." -ForegroundColor Red
        Pause; exit
    }
}

# 3. Define the Query
$SqlQuery = "SELECT user, host FROM mysql.user;"

# 4. Execute based on detected Mode
try {
    if ($CommandType -eq "Native") {
        # Run using the Windows .exe
        if ($MySqlPass -ne "") {
            $Result = & $WindowsMySqlPath -u $MySqlUser -p$MySqlPass -e "$SqlQuery" -B
        } else {
            $Result = & $WindowsMySqlPath -u $MySqlUser -e "$SqlQuery" -B
        }
    } 
    else {
        # Run using Docker Exec
        if ($MySqlPass -ne "") {
            $Result = docker exec $DockerContainer mysql -u $MySqlUser "-p$MySqlPass" -e "$SqlQuery" -B
        } else {
            $Result = docker exec $DockerContainer mysql -u $MySqlUser -e "$SqlQuery" -B
        }
    }

    # 5. Output results
    if ($Result) {
        Write-Host "`nSUCCESS: Found Users:`n" -ForegroundColor Green
        $Result | ConvertFrom-Csv -Delimiter "`t" | Format-Table -AutoSize
    }
} catch {
    Write-Host "ERROR: Failed to retrieve database users." -ForegroundColor Red
    Write-Host "Reason: $($_.Exception.Message)"
}

Pause