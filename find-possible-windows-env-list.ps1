# 1. Configuration: Enter your keywords here
$Keywords = @("Delorean", "Eclipse")

Write-Host "--- Searching Environment Variables ---" -ForegroundColor Cyan
$TargetScopes = @([System.EnvironmentVariableTarget]::Machine, [System.EnvironmentVariableTarget]::User)
$Results = @()
$FoundPathsOnly = @() # For the clean summary

foreach ($Scope in $TargetScopes) {
    $Vars = [System.Environment]::GetEnvironmentVariables($Scope)
    
    foreach ($Key in $Vars.Keys) {
        $Value = $Vars[$Key]
        foreach ($Word in $Keywords) {
            if ($Key -like "*$Word*" -or $Value -like "*$Word*") {
                $Results += [PSCustomObject]@{
                    Scope    = $Scope
                    Variable = $Key
                    Value    = $Value
                }
                
                # Add to summary list
                if ($Value -like "*;*") {
                    $Paths = $Value -split ";"
                    foreach ($P in $Paths) {
                        if ($P -match ($Keywords -join "|")) { $FoundPathsOnly += $P.Trim() }
                    }
                } else {
                    $FoundPathsOnly += $Value.Trim()
                }
                break 
            }
        }
    }
}

# 2. Keep the existing detailed output
foreach ($Match in $Results) {
    Write-Host "[$($Match.Scope)] " -NoNewline -ForegroundColor Magenta
    Write-Host "$($Match.Variable)" -ForegroundColor Yellow
    if ($Match.Value -like "*;*") {
        foreach ($P in ($Match.Value -split ";")) {
            if ($P -match ($Keywords -join "|")) { Write-Host "  -> $P" -ForegroundColor Green }
            else { Write-Host "     $P" -ForegroundColor Gray }
        }
    } else { Write-Host "  Value: $($Match.Value)" -ForegroundColor White }
    Write-Host ("-" * 60) -ForegroundColor DarkGray
}

# 3. NEW: Clean Summary Section for Copy-Pasting
if ($FoundPathsOnly.Count -gt 0) {
    Write-Host "`n============================================================" -ForegroundColor Cyan
    Write-Host "CLEAN SUMMARY OF MATCHING PATHS (Copy these for your notes):" -ForegroundColor Cyan
    Write-Host "============================================================" -ForegroundColor Cyan
    
    $UniquePaths = $FoundPathsOnly | Select-Object -Unique | Where-Object { $_ -ne "" }
    foreach ($CleanPath in $UniquePaths) {
        Write-Host "$CleanPath" -ForegroundColor Green
    }
} else {
    Write-Host "`nNo matching paths found." -ForegroundColor Red
}

Write-Host "`nScan Complete." -ForegroundColor Cyan
Pause