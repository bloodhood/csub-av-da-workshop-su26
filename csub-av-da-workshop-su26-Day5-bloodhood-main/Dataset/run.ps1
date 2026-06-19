Set-Location "$PSScriptRoot"

# Ensure CSV is present — copy from data/ if missing
$csv = "healthcare-dataset-stroke-data.csv"
if (-not (Test-Path $csv)) {
    $src = Join-Path $PSScriptRoot "..\data\$csv"
    if (Test-Path $src) {
        Copy-Item $src $csv
        Write-Host "Copied CSV from data/ folder."
    } else {
        Write-Host "ERROR: $csv not found." -ForegroundColor Red
        exit 1
    }
}

Write-Host "Step 0 - Creating schema..."
sqlite3 stroke.db ".read src\schema.sql"

Write-Host "Step 1 - Loading CSV data..."
& "C:\Users\Al3xR\.local\bin\python3.14.exe" src\load.py
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: load.py failed." -ForegroundColor Red; exit 1 }

Write-Host "Step 2 - Running analysis notebook..."
$env:PYTHONIOENCODING = "utf-8"
uv run --with pandas --with scipy --with matplotlib --with seaborn --with nbconvert --with jupyter jupyter nbconvert --to notebook --execute src\data-analysis.ipynb --output data-analysis-output.ipynb

Write-Host "Done! Open src\data-analysis-output.ipynb to see results."
