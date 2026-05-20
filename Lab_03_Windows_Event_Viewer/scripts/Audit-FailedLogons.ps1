# Help Desk Automation: Security Audit Log Parser
Write-Host "--- Initiating Security Log Audit ---" -ForegroundColor Cyan
Write-Host "Scanning for Event ID 4625 (Failed Logons)...`n" -ForegroundColor Yellow

# Fetch the last 10 failed login attempts from the Security log
$FailedLogons = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} -MaxEvents 10 -ErrorAction SilentlyContinue

if ($FailedLogons) {
    # Format the output into a clean, readable table
    $FailedLogons | Select-Object TimeCreated, 
        @{Name='Account';Expression={$_.Properties[5].Value}}, 
        @{Name='Workstation';Expression={$_.Properties[13].Value}} | 
        Format-Table -AutoSize
        
    Write-Host "Audit Complete: Failed logons detected. Investigate for potential brute-force activity." -ForegroundColor Red
} else {
    Write-Host "Audit Complete: No failed logons detected in the recent logs." -ForegroundColor Green
}