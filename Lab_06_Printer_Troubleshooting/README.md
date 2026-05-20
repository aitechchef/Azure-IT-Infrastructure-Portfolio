# Lab 06: Printer & Spooler Troubleshooting

## Objective
Diagnose and resolve common print queue failures utilizing Windows GUI administrative tools and automated PowerShell service management.

## Scenario
Printer malfunctions and stuck document queues are among the most frequent Help Desk escalations. This lab simulates a user reporting a "stuck" print job that cannot be deleted manually. The objective is to identify accidental offline configurations and perform a hard reset of the Windows Print Spooler service to restore functionality without risking overall system stability.

## Execution & Logic
**Phase 1: GUI Diagnostics & Service Management**
1. Accessed the classic **Devices and Printers** panel (`control printers`) to verify the device was not accidentally set to "Use Printer Offline," a standard baseline check for user error.
2. Launched the **Services Manager** (`services.msc`) to locate the **Print Spooler** background service.
3. Executed a standard service restart. This is the preferred initial troubleshooting step as it attempts to unfreeze the service without permanently deleting the user's queued documents.

**Phase 2: PowerShell Automation (The "Nuclear Option")**
When a standard restart fails to resolve the issue, the corrupted print spool files must be manually purged directly from the Windows system architecture.
* Engineered a PowerShell script (`Reset-PrintSpooler.ps1`) to safely automate this deep-system purge.
* Utilized `Stop-Service` to forcefully halt the Print Spooler.
* Utilized `Remove-Item` with `-Force` and `-Recurse` flags to silently target and delete all corrupted cache files hidden within the `$env:windir\System32\spool\PRINTERS\` directory.
* Utilized `Start-Service` to bring the clean spooler back online.
* *Help Desk Protocol Note:* Executing this script permanently deletes all pending print jobs. Explicit user authorization is always obtained prior to execution.

## Assets & Documentation
* `Lab06_01_Services_PrintSpooler.png` - GUI identification and standard restart of the Print Spooler service.
* `Lab06_02_PowerShell_SpoolerReset.png` - Automated CLI execution of a deep print queue purge and service reset.