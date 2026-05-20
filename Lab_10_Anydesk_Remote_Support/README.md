# Lab 10: Remote Support Deployments & Unattended Access

## Objective
Establish a secondary, user-facing remote access protocol utilizing a third-party vendor (AnyDesk) and engineer a PowerShell script for silent network deployment.

## Scenario
While Remote Desktop Protocol (RDP) is the standard for backend server administration, it intentionally locks the local console, making it unsuitable for live end-user Help Desk support. T1 technicians require screen-sharing utilities (AnyDesk, TeamViewer) to interactively troubleshoot alongside the user. This lab documents the configuration of unattended remote access and the automated deployment of the support executable.

## Execution & Logic
**Phase 1: GUI Configuration & Unattended Access**
1. Deployed the AnyDesk client to the target Windows Server.
2. Navigated to security parameters to configure **Unattended Access**.
3. *Security Protocol:* Unattended access allows an administrator to bypass the physical user prompt (the "Accept" button) by authenticating with a pre-shared cryptographic key/password. This is critical for off-hours server maintenance but requires strict password complexity to prevent unauthorized lateral network movement.

**Phase 2: PowerShell Automation (Silent Deployment)**
Enterprise environments cannot rely on manual web browser downloads for software deployment. 
* Engineered a PowerShell script (`Deploy-RemoteAgent.ps1`) to handle the silent acquisition of the vendor executable.
* Utilized the `Invoke-WebRequest` cmdlet to establish a direct CLI connection to the vendor's download servers.
* Routed the payload directly to the `C:\Users\Public\Desktop` directory, ensuring the support tool is globally available to any user profile that logs into the machine.

## Assets & Documentation
* `Lab10_01_AnyDesk_Interface.png` - Standard user-facing interface and endpoint identification address.
* `Lab10_02_PowerShell_AgentDeployment.png` - Automated CLI deployment bypassing standard web browser acquisition.