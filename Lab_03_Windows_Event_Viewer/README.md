# Lab 03: Security Log Auditing & Event Viewer

## Objective
Analyze Windows Security logs to identify and extract potential unauthorized access attempts, utilizing both manual GUI filtering and automated PowerShell parsing.

## Scenario
Monitoring system health and access logs is a critical Help Desk and introductory incident response duty. Event Viewer serves as the built-in Windows logging system, recording hardware, software, and security events. This lab simulates investigating a workstation for a potential brute-force attack by isolating failed logon attempts.

## Execution & Logic
**Phase 1: Event Generation & Manual GUI Auditing**
1. Deliberately generated a localized security event by forcing multiple failed password attempts at the Windows lock screen.
2. Navigated to the native Event Viewer (`eventvwr.msc`) and accessed the core `Security` log. 
3. Applied a Custom Filter specifically for **Event ID 4625** (Failed logon attempt). 

*Security Concept Note:* A few scattered 4625 events are normal behavior for standard users; however, a dense spike in a short chronological window triggers an immediate brute-force investigation. 

**Phase 2: PowerShell Automation (Incident Response Optimization)**
While the Event Viewer GUI is functional, it struggles to quickly parse thousands of logs during an active security incident. 
* Engineered a PowerShell script (`Audit-FailedLogons.ps1`) utilizing the `Get-WinEvent` cmdlet to bypass the GUI entirely.
* Configured a hash table filter specifically targeting the `Security` log and `ID=4625` to instantly extract the last 10 unauthorized access attempts.
* Piped the raw output into a formatted table (`Format-Table`) isolating the exact timestamp, targeted account name, and originating workstation.

## Assets & Documentation
* `Lab03_01_EventViewer_Filtered_4625.png` - Manual GUI isolation of unauthorized access attempts.
* `Lab03_02_PowerShell_Security_Audit.png` - Automated CLI log parsing and formatted data extraction.