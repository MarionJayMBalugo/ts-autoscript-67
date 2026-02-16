# 1. Define your list of paths to check
$BackupPaths = @(
    "C:\Users\mbalugo\Documents\automation scripts\Archived\backups\SQL\platform-users-20260128_205902.sql",
    "C:\Users\mbalugo\Documents\automation scripts\Archived\backups\SQL\platform-users-20260128_210056.sql"
)

Write-Host "--- Starting Bulk Integrity Verification ---" -ForegroundColor Cyan

foreach ($Path in $BackupPaths) {
    Write-Host "`nChecking: $(Split-Path $Path -Leaf)" -ForegroundColor Gray
    
    if (Test-Path $Path) {
        $FileObj = Get-Item $Path
        $SizeMB = [Math]::Round($FileObj.Length / 1MB, 2)

        # 2. Get the last 10 lines
        $Footer = Get-Content -Path $Path -Tail 10 -ErrorAction SilentlyContinue

        # 3. Verify Footer Integrity
        if ($Footer -match "-- Dump completed on") {
            Write-Host "  [OK] Integrity Verified." -ForegroundColor Green
            Write-Host "  [OK] Size: $SizeMB MB" -ForegroundColor White
            
            # Extract and show the completion date from the footer for extra detail
            $CompletionLine = $Footer | Where-Object { $_ -match "-- Dump completed on" }
            Write-Host "  [OK] $CompletionLine" -ForegroundColor Gray
        } else {
            Write-Host "  [!!] INTEGRITY FAILURE: Success footer missing!" -ForegroundColor Red
            Write-Host "  [!!] The file may be incomplete or corrupted." -ForegroundColor Yellow
        }
    } else {
        Write-Host "  [ERROR] File not found at specified path." -ForegroundColor Red
    }
}

Write-Host "`n--- Verification Complete ---" -ForegroundColor Cyan
Pause