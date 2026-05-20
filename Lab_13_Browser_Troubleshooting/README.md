# Lab 13: Browser Troubleshooting & DNS Resolution

## Objective
Diagnose and resolve web application rendering and connectivity failures utilizing environment isolation (Incognito/InPrivate) and command-line DNS flushing.

## Scenario
Browser issues are among the most frequent user complaints. When a user reports that a specific website is failing to load, Help Desk technicians must isolate whether the issue is local to the browser's cached data, caused by an extension, or stemming from a deeper network resolution failure. This lab documents the standard isolation testing and resolution workflow for browser-based tickets.

## Execution & Logic
**Phase 1: Environment Isolation (Incognito/InPrivate Mode)**
* Deployed Microsoft Edge in InPrivate mode to establish a clean browsing baseline.
* *Diagnostic Logic:* Incognito disables all extensions and starts with no cache, this is essential for isolation testing. If a site loads in this mode but fails in a standard window, the root cause is confirmed as localized cache corruption or a rogue extension.

**Phase 2: Network Resolution Troubleshooting (Flush DNS)**
* When browser-level isolation fails, the issue frequently resides at the network resolution layer. 
* Launched an elevated Command Prompt and executed `ipconfig /flushdns` to address a potential cached DNS record issue. This forces the operating system to drop outdated IP mappings and request fresh routing data from the local DNS server.

## Assets & Documentation
* `Lab13_01_Browser_Incognito.png` - Browser isolated in InPrivate mode to bypass local cache and extensions.
* `Lab13_02_CMD_FlushDNS.png` - Successful execution of a localized DNS resolver cache flush via Command Prompt.