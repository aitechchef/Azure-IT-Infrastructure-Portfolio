# Lab 09: Windows Service Management & Dependency Mapping

## Objective
Diagnose application failures by auditing Windows background services, mapping service dependencies, and executing automated service health checks utilizing both modern PowerShell and legacy Command Prompt utilities.

## Scenario
Application hangs, network drops, and update failures are frequently caused by underlying background services crashing or hanging in a "Stopping" state. Help Desk administrators must understand how to isolate these failures across different command-line environments. This lab documents the methodology for inspecting parent-child dependency conflicts and automating fleet-wide scans for failed services.

## Execution & Logic
**Phase 1: GUI Dependency Mapping**
1. Accessed the Windows Services Manager (`services.msc`).
2. Evaluated core services by examining the **Dependencies** tab.
3. *Troubleshooting Protocol:* Documented the standard operating procedure that if a parent service fails, all dependent child services will subsequently fail. Restarting the child service without addressing the parent dependency is ineffective.

**Phase 2: PowerShell Automation (Modern Service Audit)**
* Engineered a PowerShell script (`Audit-FailedServices.ps1`) to instantly filter and isolate problematic services.
* Utilized `Get-Service` piped into a `Where-Object` clause, filtering specifically for services configured with an `Automatic` StartType but possessing a `Status` other than `Running`.
* *OS Behavior Note:* The script successfully flagged services like `sppsvc` (Software Protection), proving that certain automatic services are designed to execute required tasks upon boot and subsequently terminate to conserve system overhead.

**Phase 3: Command Prompt Diagnostics (Legacy Service Control)**
Enterprise environments frequently require interacting with legacy systems where PowerShell execution policies may be restricted. 
* Utilized the native `sc.exe` (Service Control) and `net` utilities via Administrator Command Prompt.
* Executed `sc query spooler` to isolate and verify the active state of a targeted service.
* Executed `net stop spooler` and `net start spooler` to perform a synchronous service reset. Documented that the legacy `net` command is highly effective for live troubleshooting because it intentionally halts the command line to provide real-time, readable feedback on the service state transition.
* Executed `sc queryex type= service state= all` to pull extended state data. The `queryex` flag is critical as it exposes the Process ID (PID) of the service, which is required to forcefully terminate a completely frozen service at the CPU level (`taskkill /PID`) when standard stop commands fail.

## Assets & Documentation
* `Lab09_01_Services_Dependencies.png` - GUI documentation mapping parent-child service relationships.
* `Lab09_02_PowerShell_ServiceAudit.png` - Automated PowerShell CLI output isolating stopped Automatic services.
* `Lab09_03_CMD_ServiceControl.png` - Legacy CMD execution demonstrating synchronous service resets and extended state data extraction.