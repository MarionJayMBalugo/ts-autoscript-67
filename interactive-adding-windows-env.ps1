# 0. Force UTF-8 Encoding for clean output
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "--- Interactive Environment Variable Manager ---" -ForegroundColor Cyan

# 1. Select Scope
Write-Host "Select the Scope:" -ForegroundColor Gray
Write-Host " 1. User    (Current user only)"
Write-Host " 2. Machine (System-wide - Requires Admin)"
$ScopeChoice = Read-Host "`nEnter 1 or 2"

$Target = if ($ScopeChoice -eq "1") { [System.EnvironmentVariableTarget]::User } 
          else { [System.EnvironmentVariableTarget]::Machine }

# 2. Select Variable Type
Write-Host "`nSelect the Variable Type:" -ForegroundColor Gray
Write-Host " 1. Append to 'Path' variable"
Write-Host " 2. Create a NEW standalone variable"
$TypeChoice = Read-Host "`nEnter 1 or 2"

# 3. Handle 'Path' Append Logic
if ($TypeChoice -eq "1") {
    $NewPath = Read-Host "`nEnter the folder path to add to Path"
    
    if (Test-Path $NewPath) {
        # Retrieve current path
        $CurrentPath = [System.Environment]::GetEnvironmentVariable("Path", $Target)
        
        # Check if it's already there to avoid duplicates
        if ($CurrentPath -split ";" -contains $NewPath) {
            Write-Host "Notice: This path is already in the $Target Path variable." -ForegroundColor Yellow
        } else {
            $UpdatedPath = "$CurrentPath;$NewPath"
            [System.Environment]::SetEnvironmentVariable("Path", $UpdatedPath, $Target)
            Write-Host "SUCCESS: Path added to $Target scope." -ForegroundColor Green
        }
    } else {
        Write-Host "ERROR: The path '$NewPath' does not exist on this drive." -ForegroundColor Red
    }
}

# 4. Handle New Standalone Variable Logic
elseif ($TypeChoice -eq "2") {
    $VarName = Read-Host "`nEnter the Name for the new variable (e.g., JAVA_HOME)"
    $VarValue = Read-Host "Enter the Value/Path for '$VarName'"

    try {
        [System.Environment]::SetEnvironmentVariable($VarName, $VarValue, $Target)
        Write-Host "SUCCESS: Variable '$VarName' created in $Target scope." -ForegroundColor Green
    } catch {
        Write-Host "ERROR: Failed to create variable. Check Admin permissions." -ForegroundColor Red
    }
}

else {
    Write-Host "Invalid selection. Exiting." -ForegroundColor Red
}

Write-Host "`nNote: You may need to restart your terminal or VS Code to see the changes." -ForegroundColor Yellow
Pause