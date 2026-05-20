# Help Desk Automation: Critical Service Health Audit
Write-Host "--- Service Health Diagnostic ---" -ForegroundColor Cyan
Write-Host "Scanning for Automatic services that have crashed or failed to start...`n" -ForegroundColor Yellow

# Query all services to find those set to start automatically but are currently stopped
$FailedServices = Get-Service | Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -ne 'Running' }

if ($FailedServices) {
    # Format the output into a clean, readable table
    $FailedServices | Select-Object Name, DisplayName, Status, StartType | Format-Table -AutoSize
    
    Write-Host "Warning: The above services are expected to be running but are currently stopped. Investigate dependencies." -ForegroundColor Red
} else {
    Write-Host "System Healthy: All Automatic services are actively running." -ForegroundColor Green
}