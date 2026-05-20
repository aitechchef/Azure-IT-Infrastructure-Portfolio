 # Help Desk Automation: Network Diagnostic Tool
Write-Host "--- Starting Network Diagnostics ---" -ForegroundColor Cyan

# 1. Check Local Configuration
Write-Host "`n1. Flushing DNS Cache..." -ForegroundColor Yellow
ipconfig /flushdns | Out-Null
Write-Host "DNS Flush Complete." -ForegroundColor Green

# 2. Test External Connectivity
Write-Host "`n2. Pinging External Server (8.8.8.8)..." -ForegroundColor Yellow
$PingResult = Test-Connection -ComputerName 8.8.8.8 -Count 4 -Quiet

if ($PingResult) {
    Write-Host "External Ping: SUCCESS" -ForegroundColor Green
} else {
    Write-Host "External Ping: FAILED (Check ISP or Gateway)" -ForegroundColor Red
}

# 3. Test DNS Resolution
Write-Host "`n3. Testing DNS Resolution (google.com)..." -ForegroundColor Yellow
try {
    $DNSCheck = Resolve-DnsName -Name google.com -ErrorAction Stop
    Write-Host "DNS Resolution: SUCCESS" -ForegroundColor Green
} catch {
    Write-Host "DNS Resolution: FAILED" -ForegroundColor Red
}

Write-Host "`n--- Diagnostics Complete ---" -ForegroundColor Cyan 
