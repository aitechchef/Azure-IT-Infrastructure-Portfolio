# Help Desk Automation: Disk Health and Storage Audit
Write-Host "--- Storage Diagnostics ---" -ForegroundColor Cyan

# 1. Check the physical health of the disk
Write-Host "`n1. Physical Disk Health:" -ForegroundColor Yellow
Get-PhysicalDisk | Select-Object FriendlyName, HealthStatus, OperationalStatus | Format-Table -AutoSize

# 2. Check the available storage space on the C: drive
Write-Host "2. Logical Drive Space (C:):" -ForegroundColor Yellow
Get-PSDrive C | Select-Object Name, 
    @{Name='Used (GB)';Expression={[math]::Round($_.Used / 1GB, 2)}}, 
    @{Name='Free (GB)';Expression={[math]::Round($_.Free / 1GB, 2)}} | 
    Format-Table -AutoSize

Write-Host "Audit Complete. Verify disk health is 'Healthy' and ensure C: drive has >10% free space." -ForegroundColor Green