# Help Desk Automation: Real-Time Resource Monitor
Write-Host "--- TDA System Resource Audit ---" -ForegroundColor Cyan

# Fetch top 5 processes consuming the most Memory
Write-Host "`nTop 5 Memory-Intensive Processes:" -ForegroundColor Yellow
Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 5 | 
    Select-Object Name, @{Name='Memory (MB)';Expression={[math]::Round($_.WorkingSet64 / 1MB, 2)}} | 
    Format-Table -AutoSize

# Fetch top 5 processes consuming the most CPU
Write-Host "Top 5 CPU-Intensive Processes:" -ForegroundColor Yellow
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 | 
    Select-Object Name, @{Name='CPU Time (s)';Expression={[math]::Round($_.CPU, 2)}} | 
    Format-Table -AutoSize

Write-Host "Audit Complete. If memory is consistently above 85-90%, recommend RAM upgrade or background app reduction." -ForegroundColor Green