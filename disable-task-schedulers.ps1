# 1. Configuration - Define the names of the tasks you want to disable
$TasksToDisable = @(
    "test only"
)

Write-Host "--- Initiating Task Disabler ---" -ForegroundColor Cyan

foreach ($TaskName in $TasksToDisable) {
    try {
        # Check if the task exists first
        $Task = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
        
        if ($Task) {
            # Disable the task
            Disable-ScheduledTask -TaskName $TaskName | Out-Null
            # Using $($TaskName) isolates the variable from the surrounding text
            Write-Host "[SUCCESS] Disabled task: $($TaskName)" -ForegroundColor Green
        } else {
            Write-Host "[SKIP] Task not found: $($TaskName)" -ForegroundColor Yellow
        }
    } catch {
        # This line previously failed because of '$TaskName:'
        Write-Host "[ERROR] Failed to disable $($TaskName): $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`n--- Operation Complete ---" -ForegroundColor Cyan
Pause