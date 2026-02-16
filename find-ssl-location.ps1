# 1. Setup default values
$DefaultPath = "C:\Users\mbalugo\Documents\automation scripts"


Write-Host "--- Interactive Keyword File Finder ---" -ForegroundColor Cyan

# 2. Get User Input
$SearchPath = Read-Host "Enter the directory to search (Press Enter for $DefaultPath)"
if ($SearchPath -eq "") { $SearchPath = $DefaultPath }

# Ensure path exists
if (!(Test-Path $SearchPath)) {
    Write-Host "Error: Path $SearchPath does not exist." -ForegroundColor Red
    Pause; exit
}

$Keyword = Read-Host "Enter the keyword to find (e.g., HHSSVTMSPROP001 or SSL)"
if ($Keyword -eq "") {
    Write-Host "No keyword entered. Exiting." -ForegroundColor Yellow
    Pause; exit
}

Write-Host "`nSearching for '$Keyword' in $SearchPath..." -ForegroundColor Gray
Write-Host "This may take a moment depending on the number of files.`n" -ForegroundColor Gray

# 3. Execution Logic
# Get-ChildItem -Recurse finds all files
# Select-String searches inside the files
try {
    $Matches = Get-ChildItem -Path $SearchPath -Recurse -File -ErrorAction SilentlyContinue | 
               Select-String -Pattern $Keyword -SimpleMatch

    if ($Matches) {
        $UniqueFiles = $Matches | Select-Object -Property Path -Unique
        Write-Host "FOUND in the following files:" -ForegroundColor Green
        
        foreach ($File in $UniqueFiles) {
            Write-Host "$($File.Path)" -ForegroundColor White
        }
        
        Write-Host "`nTotal unique files found: $($UniqueFiles.Count)" -ForegroundColor Cyan
    } else {
        Write-Host "No files containing '$Keyword' were found." -ForegroundColor Yellow
    }
} catch {
    Write-Host "An error occurred during the search: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nSearch Complete." -ForegroundColor Cyan
Pause