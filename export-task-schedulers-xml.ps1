# 1. Define your list of Task Names here
$TaskList = @(
    "UiPath RobotJS"
)

# 2. Configuration Paths
$BackupFolder = "C:\Users\mbalugo\Documents\automation scripts\Archived\Tasks"

# Ensure the directory exists
if (!(Test-Path $BackupFolder)) {
    New-Item -ItemType Directory -Path $BackupFolder -Force | Out-Null
}

Write-Host "--- Starting Batch Task Export ---" -ForegroundColor Cyan

# 3. Loop through the list and export each one
foreach ($TaskName in $TaskList) {
    # Check if the task actually exists before trying to export it
    if (Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue) {
        
        # Clean the task name for use as a filename (removes slashes or colons)
        $SafeFileName = $TaskName -replace '[\\\/\:\*\?\"\<\>\|]', '_'
        $ExportPath = Join-Path -Path $BackupFolder -ChildPath "$SafeFileName.xml"

        try {
            # Export the task to XML
            Export-ScheduledTask -TaskName $TaskName | Out-File -FilePath $ExportPath -Encoding utf8
            Write-Host " [SUCCESS] " -NoNewline -ForegroundColor Green
            Write-Host "Exported: $TaskName"
        } catch {
            Write-Host " [FAILED]  " -NoNewline -ForegroundColor Red
            Write-Host "Could not export $TaskName - $($_.Exception.Message)"
        }
    } else {
        Write-Host " [SKIP]    " -NoNewline -ForegroundColor Yellow
        Write-Host "Task '$TaskName' not found on this system."
    }
}

Write-Host "`nBatch Export Complete." -ForegroundColor Cyan
Pause