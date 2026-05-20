# Help Desk Automation: Critical User Data Backup
Write-Host "--- Initiating User Data Archive ---" -ForegroundColor Cyan

# Define source and backup locations
$Source = "$env:USERPROFILE\Documents"
$BackupDir = "C:\IT_Backups"
$DateStamp = Get-Date -Format 'yyyyMMdd_HHmm'
$Destination = "$BackupDir\User_Doc_Backup_$DateStamp.zip"

# Create the IT Backup directory if it doesn't exist
if (-Not (Test-Path $BackupDir)) { 
    New-Item -ItemType Directory -Path $BackupDir | Out-Null 
}

# Generate a mock file for testing purposes
Write-Host "`n1. Generating mock user data..." -ForegroundColor Yellow
New-Item -ItemType File -Path "$Source\Important_Financials.txt" -Force | Out-Null

# Compress the user's Documents folder into a secure ZIP archive
Write-Host "2. Archiving User Documents..." -ForegroundColor Yellow
Compress-Archive -Path "$Source\*" -DestinationPath $Destination -Update

Write-Host "`nBackup Complete: Archive secured at $Destination" -ForegroundColor Green