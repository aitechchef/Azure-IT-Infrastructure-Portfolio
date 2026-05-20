# Help Desk Automation: Generic User Onboarding
$Username = "JohnDoe"
$Password = ConvertTo-SecureString "TempPass2026!" -AsPlainText -Force

# Create the local user account
New-LocalUser -Name $Username -Password $Password -FullName "John Doe" -Description "Standard Employee Account"

# Assign to the standard Users group so it appears in the Settings GUI
Add-LocalGroupMember -Group "Users" -Member $Username

# Force password change on next login for security compliance
Set-LocalUser -Name $Username -PasswordNeverExpires $false
Invoke-Command -ScriptBlock { net user $Username /logonpasswordchg:yes }

Write-Host "User $Username successfully created, added to Users group, and forced to change password on next login." -ForegroundColor Green