# Lab 12: File Permissions & Sharing

## Objective
Establish secure network file directories and enforce strict access control lists (ACLs) utilizing explicit Windows security permissions.

## Scenario
File permissions are at the core of every access-related ticket. Understanding how to grant, restrict, and remove access, knowing the difference between "Allow" and "Deny" is essential for any T1 tech. This lab documents the creation of a restricted departmental network share and the application of explicit security constraints to prevent unauthorized data access.

## Execution & Logic
**Phase 1: Network Share Configuration (The Sharing Tab)**
* Engineered a centralized directory (`HR_Confidential`) and configured it for network discovery.
* Validated the standard Windows network routing syntax. Documented the network path format: \\ComputerName\Shared Folder, this is how users access shared folders. 

**Phase 2: Security & Access Control (The Security Tab)**
* Interfaced with the folder's Security properties to manually adjust user permissions.
* Applied an explicit **Deny** constraint for a specific user. 
* *Troubleshooting Protocol:* Documented the access control hierarchy, specifically that Deny always overrides Allow, even if a user has Full Control through a group, an explicit Deny blocks them. 
* *Best Practice Note:* While explicit denials are necessary for immediate lockouts, removing a user from permissions is cleaner and preferred over using Deny.

## Assets & Documentation
* `Lab12_01_FolderSharing.png` - Folder properties confirming active network sharing and routing path.
* `Lab12_02_SecurityPermissions.png` - Security tab documenting an explicit Deny constraint applied to a specific user.