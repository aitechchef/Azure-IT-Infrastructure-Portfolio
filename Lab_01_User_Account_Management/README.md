# Lab 01: Enterprise User Account Management

## Objective
Simulate the full lifecycle of an employee account (onboarding, disabling, enabling) using both the Command-Line Interface (CLI) and PowerShell automation, while adhering to the principle of Least Privilege.

## Scenario
An employee requires a local account provisioned on the server. To adhere to security best practices, the temporary password must be passed securely, and the user must be forced to reset their password upon initial login.

## Execution & Logic
**Phase 1: Manual CLI Execution**
Utilized `net user` commands to manually create a user, simulate an employee leave of absence (`/active:no`), and restore access (`/active:yes`). 

*Troubleshooting Note (GUI vs. CLI):* Discovered that the Windows GUI intentionally hides disabled accounts to prevent visual clutter. Relying strictly on the CLI (`net user [username]`) is required to accurately verify account state.

**Phase 2: PowerShell Automation**
Engineered a PowerShell script (`New-GenericUser.ps1`) to automate the onboarding process. 
* Utilized `ConvertTo-SecureString` to prevent passing plain-text passwords in memory.
* Utilized `Invoke-Command` to force a password change flag on next login.

*Troubleshooting Note (Group Policy):* Accounts generated via PowerShell `New-LocalUser` do not automatically populate into the GUI. The script was updated to explicitly use `Add-LocalGroupMember` to assign the account to the standard `Users` group, successfully exposing it to the Windows login screen.

## Assets & Documentation
* `Lab01_01_CMD_Manual_User_Creation.png` - Account lifecycle management via Command Prompt.
* `Lab01_02_PowerShell_Automation_Script.png` - Execution of the onboarding script.
* `Lab01_03_PowerShell_Group_Membership_Fix.png` - Verification of successful group assignment.