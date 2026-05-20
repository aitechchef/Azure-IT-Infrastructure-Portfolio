# Lab 04: Task Manager & Resource Monitoring

## Objective
Diagnose system performance bottlenecks and evaluate hardware resource constraints utilizing the native Windows Task Manager and automated PowerShell resource audits.

## Scenario
Responding to a simulated user escalation reporting system latency and application freezing. The objective is to identify process-level resource consumption and evaluate the physical (or virtual) hardware limits to determine if a hardware upgrade or process termination is required.

## Execution & Logic
**Phase 1: GUI Resource Diagnostics**
1. Accessed the Windows Task Manager (`taskmgr.exe`).
2. Utilized the **Processes** tab to sort active applications by active Memory and CPU utilization to identify rogue or hanging applications.
3. Utilized the **Performance** tab to evaluate system-wide resource availability and hardware limits.

*Infrastructure Insight (Virtualization vs. Bare Metal):* During the hardware evaluation, the Memory "Slots used" metric displayed as `N/A`. This accurately reflects the cloud environment's architecture. Because the system is an Azure Virtual Machine, the hypervisor dynamically allocates virtual RAM, abstracting the physical motherboard form factor (like SODIMM slots) away from the guest operating system.

**Phase 2: PowerShell Automation (Remote Diagnostics)**
To diagnose a sluggish machine without interrupting a user's active desktop session, a remote CLI approach is required.
* Engineered a PowerShell script (`Audit-SystemResources.ps1`) to silently query the system for high-consumption processes.
* Utilized `Get-Process` piped into a `Sort-Object` to isolate the top 5 Memory and CPU consumers.
* Formatted the raw byte output into readable Megabytes utilizing standard PowerShell math operators (`[math]::Round`).

## Assets & Documentation
* `Lab04_01_TaskManager_MemorySlots.png` - GUI diagnostic highlighting virtualized hardware abstraction.
* `Lab04_02_PowerShell_ResourceAudit.png` - Automated CLI remote resource monitoring output.