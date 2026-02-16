# 1. Configuration Paths
$basePath = "C:\Users\mbalugo\Documents\automation scripts"
$EnvFilePath = Join-Path -Path $basePath -ChildPath ".env"
$UpdateFilePath = Join-Path -Path $basePath -ChildPath ".envVariableHolders"

# 2. Safety Checks
if (!(Test-Path $EnvFilePath)) {
    Write-Host "CRITICAL ERROR: .env file not found at $EnvFilePath" -ForegroundColor Red
    Pause; exit
}

if (!(Test-Path $UpdateFilePath)) {
    Write-Host "CRITICAL ERROR: Update file not found at $UpdateFilePath" -ForegroundColor Red
    Pause; exit
}

# Create Safety Backup before modification
Copy-Item $EnvFilePath "$EnvFilePath.bak" -Force
Write-Host "--- Safety backup created: .env.bak ---" -ForegroundColor Gray

# 3. Load Update Variables into a Dictionary (Map)
$Updates = @{}
Get-Content $UpdateFilePath | ForEach-Object {
    if ($_ -match "^([^#\s][^=]*)=(.*)$") {
        $key = $Matches[1].Trim()
        $val = $Matches[2].Trim()
        $Updates[$key] = $val
    }
}

# 4. Process the .env file
$EnvLines = Get-Content $EnvFilePath
$NewEnvContent = @()
$FoundKeys = @()

Write-Host "--- Syncing .env Variables ---" -ForegroundColor Cyan

foreach ($Line in $EnvLines) {
    # Check if the line is an active variable (not a comment)
    if ($Line -match "^([^#\s][^=]*)=(.*)$") {
        $Key = $Matches[1].Trim()
        $OldValue = $Matches[2].Trim()

        if ($Updates.ContainsKey($Key)) {
            $NewValue = $Updates[$Key]
            $NewEnvContent += "$Key=$NewValue"
            $FoundKeys += $Key
            
            if ($OldValue -ne $NewValue) {
                Write-Host " [UPDATED] " -NoNewline -ForegroundColor Green
                Write-Host "$Key (Changed to: $NewValue)"
            } else {
                Write-Host " [NO CHANGE] " -NoNewline -ForegroundColor Gray
                Write-Host "$Key"
            }
        } else {
            # Keep the line as it was
            $NewEnvContent += $Line
        }
    } else {
        # Preserve comments and empty lines
        $NewEnvContent += $Line
    }
}

# 5. Add New Variables to the Bottom
$RemainingKeys = $Updates.Keys | Where-Object { $FoundKeys -notcontains $_ }

if ($RemainingKeys.Count -gt 0) {
    Write-Host "`n--- Adding New Variables to Bottom ---" -ForegroundColor Cyan
    $NewEnvContent += "`n# --- Added by Automation Script $(Get-Date) ---"
    foreach ($Key in $RemainingKeys) {
        $Val = $Updates[$Key]
        $NewEnvContent += "$Key=$Val"
        Write-Host " [NEW] " -NoNewline -ForegroundColor Yellow
        Write-Host "$Key=$Val"
    }
}

# 6. Save the results
$NewEnvContent | Set-Content $EnvFilePath -Force
Write-Host "`nSUCCESS: .env file synchronization complete." -ForegroundColor Cyan
Pause