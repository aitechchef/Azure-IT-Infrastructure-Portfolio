# Help Desk Automation: Remote Support Agent Deployment
Write-Host "--- Remote Agent Deployment ---" -ForegroundColor Cyan

$InstallerURL = "https://download.anydesk.com/AnyDesk.exe"
$Destination = "C:\Users\Public\Desktop\AnyDesk-Support.exe"

Write-Host "1. Reaching out to external vendor servers..." -ForegroundColor Yellow
# Utilizing Invoke-WebRequest to silently pull the executable without a web browser
Invoke-WebRequest -Uri $InstallerURL -OutFile $Destination

Write-Host "2. Verifying payload integrity..." -ForegroundColor Yellow
if (Test-Path $Destination) {
    Write-Host "Deployment Complete: Support agent successfully staged on the Public Desktop." -ForegroundColor Green
} else {
    Write-Host "Deployment Failed: Network timeout or firewall block." -ForegroundColor Red
}