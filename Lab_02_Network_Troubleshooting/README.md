# Lab 02: Network Diagnostic Isolation

## Objective
Systematically isolate and diagnose network connectivity issues utilizing standard TCP/IP utility tools and automated PowerShell scripting.

## Scenario
Simulating a "no internet" help desk ticket. The diagnostic approach isolates the local network, the gateway, the external network, and the DNS resolution layer to pinpoint the exact point of failure.

*Environmental Constraint:* The standard troubleshooting commands `ipconfig /release` and `/renew` were explicitly omitted from this lab to prevent severing the active Remote Desktop (RDP) connection to the Azure VM.

## Execution & Logic
**Phase 1: Manual Command Line Isolation**
1. **Local Configuration:** Ran `ipconfig` to identify the Azure virtual Default Gateway.
2. **Local Router Test:** Executed `ping 10.0.x.x` (Gateway).
3. **External Test:** Executed `ping 8.8.8.8` (Google Public DNS).
4. **DNS Test:** Executed `nslookup google.com`.
5. **Resolution:** Flushed the DNS cache (`ipconfig /flushdns`) to clear legacy records.

*Troubleshooting Note (Cloud Infrastructure Quirk):* The ping to the Azure Default Gateway resulted in 100% packet loss, despite internet access functioning perfectly. This highlights a cloud-specific architecture design: Azure Software-Defined Networks (SDNs) intentionally drop local ICMP requests for security purposes. The successful ping to `8.8.8.8` mathematically proved the gateway was successfully routing TCP/UDP traffic, rendering the ICMP timeout irrelevant.

**Phase 2: PowerShell Automation**
Engineered `Run-NetDiag.ps1` to automate the execution of DNS flushing, external pings, and DNS resolution, outputting a color-coded diagnostic summary for rapid Help Desk use.

## Assets & Documentation
* `Lab02_01_IPConfig_Gateway.png` - Identification of the local routing table.
* `Lab02_02_Ping_Gateway_Timeout.png` - Demonstration of Azure SDN blocking ICMP.
* `Lab02_03_Ping_External_Success.png` - Successful outbound routing verification.
* `Lab02_04_NSLookup_Test.png` - Successful DNS resolution.
* `Lab02_05_PowerShell_NetDiag_Script.png` - Automated diagnostic tool execution.