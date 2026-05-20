# Lab 11: System Information & Hardware Diagnostics

## Objective
Identify and document critical hardware specifications, driver errors, and system uptimes utilizing native Windows graphical and command-line diagnostic utilities.

## Scenario
System information tools let you quickly pull hardware specs, driver versions, and system details.This info is essential when troubleshooting hardware issues or escalating a ticket to T2. This lab demonstrates the ability to map a system's underlying architecture and identify hardware faults before escalating a ticket.

## Execution & Logic

**Phase 1: GUI Diagnostics (`msinfo32`)**
* Executed `msinfo32` to pull a full hardware overview, problem devices, and driver info.
* Navigated to the System Summary to locate the total installed RAM amount.
* Audited the **Problem Devices** node to identify failing hardware. 
* Documented the standard troubleshooting protocol that Error Code 48 in Problem Devices means Windows blocked a driver from loading, which requires investigation to see if it affects the user.

**Phase 2: Display & Audio Diagnostics (`dxdiag`)**
* Launched `dxdiag` to isolate display and audio issues and to save a full spec report.
* Highlighted the critical T1 escalation procedure: save dxdiag output before escalating to T2, and attach it to the ticket so the next tech has everything.

**Phase 3: Command Line Enumeration (`systeminfo`)**
* Deployed the `systeminfo` command via PowerShell to capture a quick snapshot, uptime, network info, and hotfixes.
* Isolated the system's exact last boot time. 
* Documented that last boot time shows if a machine has not been restarted in a long time, as inconsistent reboot often causes performance issues.

## Assets & Documentation
* `Lab11_01_ProblemDevices.jpg` - `msinfo32` capture highlighting blocked communication ports.
* `Lab11_02_Total_RAM.jpg` - System Summary capture verifying total physical memory.
* `Lab11_03_DirectX_Diagnostic.jpg` - `dxdiag` interface demonstrating the full specification export capability.
* `Lab11_04_CMD_SystemInfo.jpg` - PowerShell output verifying system uptime and hotfix installation.