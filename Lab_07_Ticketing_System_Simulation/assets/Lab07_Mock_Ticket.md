# INC0019482 - Print Queue Frozen / Spooler Crash

**User:** Jane Smith (Accounting Dept)
**Priority:** Medium (Impacting work but user can still function)
**Status:** Resolved

### Description
User reported that multiple invoices are stuck in the print queue. She cannot delete the jobs or send new ones. 

### Steps Taken
1. Verified user identity via internal directory.
2. Checked GUI (`control printers`); verified printer was NOT set to "Use Printer Offline".
3. Restarted Print Spooler service via `services.msc`. (Resolution Failed - jobs remained stuck).
4. Warned user that pending jobs would be deleted. 
5. Executed internal PowerShell script `Reset-PrintSpooler.ps1` to stop service, forcefully purge corrupted files in `System32\spool\PRINTERS\`, and restart service.

### Resolution
Print spooler cache was corrupted. Performed hard purge of the spool directory and restarted the service. Sent a test page successfully. Confirmed resolution directly with Jane Smith before closing ticket.

### Notes
No further escalation required.