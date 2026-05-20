# Lab 05: Disk Management & Storage Troubleshooting

## Objective
Diagnose storage capacity bottlenecks, evaluate physical drive health, and map system partitions utilizing native Windows GUI tools and automated PowerShell storage audits.

## Scenario
Simulating a proactive Help Desk intervention for system stability. Low storage availability and failing physical drives are primary causes of system latency and crashes. This lab documents the process of evaluating logical drive space, identifying safe avenues for junk data cleanup, and analyzing the underlying partition architecture of the server.

## Execution & Logic
**Phase 1: GUI Storage Diagnostics**
1. Utilized **File Explorer** for a rapid visual check of logical drive capacity.
2. Launched **Disk Cleanup** (`cleanmgr`) to simulate the safe removal of temporary internet files and cached data without impacting user directories.
3. Accessed **Disk Management** (`diskmgmt.msc`) to map the disk partition layout.

*Infrastructure Insight (Cloud Storage Architecture):* While mapping the partitions, two critical architectural elements were identified:
* **EFI System Partition:** Located on Disk 0, this 99 MB partition manages the Windows boot sequence and must be strictly protected from volume modification.
* **Ephemeral Storage (D:):** Azure automatically provisions a 16 GB "Temporary Storage" drive. This is highly volatile space utilized strictly for Windows page files and system caching; any data saved here by a user is permanently destroyed upon VM deallocation. 

**Phase 2: PowerShell Automation (Storage Audit)**
Engineered a PowerShell script (`Audit-StorageHealth.ps1`) to bypass the GUI and pull real-time hardware health metrics.
* Utilized `Get-PhysicalDisk` to confirm the drive's operational health status.
* Utilized `Get-PSDrive` combined with mathematical operators (`[math]::Round`) to output exact GB availability on the primary OS drive.

*Troubleshooting Note (Virtualization):* The `Get-PhysicalDisk` query returned a hardware model of "Msft Virtual Disk". This documents how the Azure hypervisor abstracts the physical data center storage arrays into logical virtual drives for the guest operating system.

## Assets & Documentation
* `Lab05_01_DiskManagement_Partitions.png` - Partition map highlighting the EFI system partition and Azure volatile storage.
* `Lab05_02_PowerShell_StorageAudit.png` - Automated CLI storage health report and capacity calculation.