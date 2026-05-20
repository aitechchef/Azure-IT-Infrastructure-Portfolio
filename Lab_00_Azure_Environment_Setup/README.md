# Lab 00: Cloud Infrastructure & Environment Setup

## Objective
Provision a secure, cost-optimized cloud-based Windows Server environment to execute enterprise Help Desk simulations. 

## Scenario
To properly simulate an enterprise Windows environment from a local ARM-based architecture (Apple Silicon), a remote hypervisor or cloud solution is required. This lab documents the deployment of a Windows Server 2022 Datacenter virtual machine via Microsoft Azure, configured with strict cost-control governance.

## Execution Steps
1. **OS Selection:** Deployed a `Windows Server 2022 Datacenter` image to ensure a 1:1 match with enterprise Active Directory and system administration environments.
2. **Compute Sizing:** Selected `Standard_D2s_v3` (2 vCPUs, 8 GiB Memory) to ensure a fluid graphical interface during remote sessions.
3. **Cost Governance (Spot Instance):** Deployed the VM as an Azure Spot Instance with a "Stop / Deallocate" eviction policy, reducing compute costs by up to 90% while protecting storage state.
4. **Cost Governance (Auto-Shutdown):** Implemented a hard auto-shutdown policy at 11:00 PM daily to prevent accidental billing overages against the cloud budget.
5. **Network Access:** Configured the inbound Network Security Group (NSG) to allow RDP traffic (Port 3389) and established a connection via the macOS Windows App.

## Assets & Documentation
* `Lab00_01_VM_SpotDiscount_Config.png` - Image, compute size, and Spot configuration.
* `Lab00_02_Deployment_Success_IP.png` - Successful Azure deployment overview (Subscription ID and Public IP redacted for security).
* `Lab00_03_RDP_Connected_Desktop.png` - Successful remote desktop connection.