# Help Desk Automation: Print Spooler Reset (The Nuclear Option)
Write-Host "--- Print Spooler Diagnostic ---" -ForegroundColor Cyan

Write-Host "`n1. Stopping Print Spooler Service..." -ForegroundColor Yellow
Stop-Service -Name Spooler -Force
Write-Host "Service Stopped." -ForegroundColor Green

Write-Host "`n2. Clearing Stuck Print Jobs..." -ForegroundColor Yellow
# This path targets the hidden folder where Windows caches print jobs
Remove-Item -Path "$env:windir\System32\spool\PRINTERS\*.*" -Force -Recurse
Write-Host "Print Queue Cleared." -ForegroundColor Green

Write-Host "`n3. Restarting Print Spooler Service..." -ForegroundColor Yellow
Start-Service -Name Spooler
Write-Host "Service Started." -ForegroundColor Green

Write-Host "`nDiagnostic Complete. All corrupted jobs purged." -ForegroundColor Red