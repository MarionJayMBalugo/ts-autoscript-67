# 1. Configuration
$DockerContainer = "wai-web-db-1"
$EnvFilePath     = "C:\Users\mbalugo\Documents\automation scripts\.env"

# 2. Define users (Use '*' in the DB field for Global Privileges)
$UserList = @(
    # Global Admin Example
    @{Name="super_admin"; Pass="SecureAdmin789!"; Host="%"; DB="*"; Priv="ALL PRIVILEGES"},
    # Global Read-Only Example
    @{Name="global_auditor"; Pass="AuditPass321!"; Host="%"; DB="*"; Priv="SELECT, SHOW DATABASES"},
    # Standard DB User Example
    @{Name="app_user"; Pass="AppPass123!"; Host="%"; DB="platform"; Priv="ALL PRIVILEGES"}
)

# 3. Read Root Password
if (Test-Path $EnvFilePath) {
    $EnvLine = Get-Content $EnvFilePath | Where-Object { $_ -match "^DB_PASSWORD=" }
    $RootPass = if ($EnvLine) { $EnvLine.Split("=")[1].Trim().Trim("'").Trim('"') } else { "password" }
}

Write-Host "--- Initiating MySQL User Creation (Global & Local) ---" -ForegroundColor Cyan

foreach ($User in $UserList) {
    $UName = $User.Name
    $UPass = $User.Pass
    $UHost = $User.Host
    $UDB   = $User.DB
    $UPriv = $User.Priv

    # Determine Scope: Global (*.*) or Database (db.*)
    $Scope = if ($UDB -eq "*") { "*.*" } else { "$($UDB).*" }

    Write-Host "Configuring $($UName) with scope $($Scope)..." -ForegroundColor Gray

    $SqlQuery = @"
CREATE USER IF NOT EXISTS '$UName'@'$UHost' IDENTIFIED BY '$UPass';
GRANT $UPriv ON $Scope TO '$UName'@'$UHost';
FLUSH PRIVILEGES;
"@

    $TempSqlFile = New-TemporaryFile
    $SqlQuery | Out-File -FilePath $TempSqlFile.FullName -Encoding utf8

    try {
        $ArgList = "/c `"docker exec -i -e MYSQL_PWD=$RootPass $DockerContainer mysql -u root < `"$($TempSqlFile.FullName)`"`""
        $Process = Start-Process -FilePath "cmd.exe" -ArgumentList $ArgList -Wait -NoNewWindow -PassThru
        
        if ($Process.ExitCode -eq 0) {
            Write-Host "[SUCCESS] Created $($UName) on $($UHost) with $($Scope) access" -ForegroundColor Green
        } else {
            Write-Host "[FAILURE] Error creating $($UName). Exit Code: $($Process.ExitCode)" -ForegroundColor Red
        }
    } catch {
        Write-Host "[ERROR] $($_.Exception.Message)" -ForegroundColor Red
    } finally {
        if (Test-Path $TempSqlFile.FullName) { Remove-Item $TempSqlFile.FullName }
    }
}

Write-Host "`n--- User Setup Complete ---" -ForegroundColor Cyan
Pause