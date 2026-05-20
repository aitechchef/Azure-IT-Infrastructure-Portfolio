# Lab 07: Ticketing System Simulation & SLA Management

## Objective
Simulate enterprise-level incident documentation by generating a structured IT Help Desk ticket that adheres to standard Service Level Agreements (SLAs) and communication protocols.

## Scenario
Proper incident documentation is the backbone of IT operations. Just as a high-volume operational environment (like a commercial kitchen, a background I know well) relies on precise ticketing to manage the queue, prioritize tasks, and maintain service standards, an enterprise IT Help Desk relies on ticketing for auditing, escalation routing, and SLA compliance. This lab simulates documenting a high-impact, medium-priority resolution (Print Spooler Crash) to demonstrate proper communication and technical logging.

## Execution & Logic
**Incident Documentation Protocol:**
Engineered a comprehensive Markdown-based ticketing artifact (`INC0019482`) that successfully captures the full lifecycle of an IT incident. 
* **Triage & Priority:** Classified the issue accurately based on user impact (Medium - Impacting work but functional).
* **Identity Verification:** Documented the security baseline of verifying the user before executing administrative actions.
* **Step-by-Step Logging:** Explicitly detailed the tools used (`control printers`, `services.msc`) and the automated scripts executed (`Reset-PrintSpooler.ps1`). This removes ambiguity for any Tier 2 technicians reviewing the ticket in the future.
* **User Confirmation:** Ensured the resolution was actively confirmed with the end-user prior to closing the incident, preventing premature ticket closure and negative SLA impacts.

## Assets & Documentation
* `Lab07_Mock_Ticket.md` - Full text documentation of the simulated print spooler incident and resolution steps.