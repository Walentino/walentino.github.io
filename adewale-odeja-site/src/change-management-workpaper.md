# IT-320 ITGC Testing: Program Change Management

> **Simulated engagement.** All populations, evidence and results are constructed for training. No live environment was assessed. Service provider and product names (Northline, Keystone, Lakeshore Central, Ledgerline) are fictional.

| | |
|---|---|
| **Client** | Lakeridge Community Credit Union Ltd. |
| **Period** | Fiscal year ended October 31, 2026 |
| **Workpaper** | IT-320 |
| **Prepared by / date** | A. Odeja / November 26, 2026 |
| **Reviewed by / date** | [Reviewer] / [date] |
| **In scope** | Keystone configuration and releases (Lakeridge-side), Ledgerline configuration, LOS configuration, infrastructure supporting in-scope applications, reports used in financial reporting |
| **Cross-references** | IT-100 Scoping memo. IT-200 CUEC analysis. IT-310 Access. IT-900 Deficiency log |
| **Materiality used** | Overall $550K, performance $360K, clearly trivial $27K (IT-100, revised) |

## Domain objective

Changes to applications, configurations and reports that affect financial data are authorized, tested and approved before implementation, so that systems continue to process data completely and accurately.

## Sampling conventions applied (set before testing)

| Item | Convention |
|---|---|
| Event-driven population over 50 items | 25 items, elevated risk |
| Monthly control, elevated risk | 5 of 12 months |
| Populations of 10 or fewer | Test all |
| Selection | Random. Excel `RAND()` over the full extract, sorted ascending, first *n* selected. Selection file retained as IT-320-S1 |
| Expected deviations | Zero. Any exception is investigated for root cause. Samples are **not** extended to "test out" of an exception |

**Key:** ✓ agreed without exception. ✗ exception. ✓\* agreed using alternative evidence, explained.

## Summary

| Ref | Control | Design | Operating effectiveness | Result | Deficiency |
|---|---|---|---|---|---|
| CM-01 | Keystone configuration changes approved by Lakeridge before submission to Northline | Ineffective | Not tested. Impact assessment | DD, impact found | D-04 (extended) |
| CM-02 | Changes to Lakeridge-managed systems approved before implementation | Effective | **Ineffective.** 10 of 25 exceptions. Population incomplete | OD | D-14, D-15 |
| CM-03 | Changes tested before implementation, with evidence retained | Ineffective | Not tested | DD | D-08 (extended) |
| CM-04 | Emergency changes controlled and approved after the fact | Ineffective | Full population reviewed (4) | DD, impact assessed | D-16 |
| CM-05 | Ledgerline configuration changes segregated from approval | Ineffective | Compensating control tested: **effective** for accuracy, **not** for classification | DD, partly compensated | D-13 |
| CM-06 | Changes to reports used in financial reporting are controlled | No control | Not tested | DD | D-17 |
| CM-07 | Keystone releases reviewed and accepted by Lakeridge (CUEC 13) | Effective | **Effective** (full population, 2) | Pass | None |

---

## CM-01 Keystone configuration changes approved by Lakeridge

| Step | Detail |
|---|---|
| **Control objective** | Only authorized changes to Keystone rates, fees, calculation parameters and GL mapping are sent to Northline |
| **Control description** | Application support analyst raises a Northline ticket. The same analyst approves it. No authorized requester list is held by Northline (IT-200, CUECs 4 and 6) |
| **Test of design** | Walkthrough of one rate change (Mar 2026). Inspected the Northline ticket: raised and approved by the same analyst. No reference to a business decision |
| **Conclusion on design** | **Ineffective.** Not tested further |

### Impact assessment

**Population.** Northline ticket extract of all Lakeridge configuration changes, FY2026: **64 changes.** Completeness: agreed to Northline's monthly client change report, all 12 months ✓.

**Filter.** 23 changes affect financial calculations or GL posting. The other 41 (screen layouts, report formats, branch codes) were excluded as not financially relevant, with reasons recorded in IT-320-S2.

**Test.** Traced all 23 to a business authorization.

| Change type | Count | Authorization source | Result |
|---|---|---|---|
| Deposit and loan rate changes | 16 | ALCO minutes | 16 ✓ |
| Loan interest calculation parameter (Jan 14, 2026) | 1 | None at the time. Telephone instruction. Northline exception E2 | ✗ See CM-04 EC1 |
| Fee changes | 5 | Board-approved fee schedule | 4 ✓, **1 ✗** |
| GL mapping parameter | 1 | Finance Manager email request | 1 ✓ |

**Exception F1.** NSF fee set at **$48** from April 1, 2026. The board-approved schedule is **$45**. Charged about 1,400 times to Oct 31. **Estimated overcharge $4,200.** Referred to the financial audit team. Below clearly trivial ($27K), so no audit adjustment. Reported to management for member refunds and as a conduct issue.

**Conclusion.** No independent approval exists. One change was unauthorized in amount and went undetected for seven months. **D-04** extended, with impact quantified.

---

## CM-02 Changes to Lakeridge-managed systems approved before implementation

| Step | Detail |
|---|---|
| **Control objective** | Every change to Lakeridge-managed in-scope systems is approved before implementation |
| **Control description** | Change ticket raised in the service desk tool. Approved at the monthly CAB, recorded in minutes. Change Policy s.3 allows the Manager, IT Infrastructure to approve standard changes by email between meetings |
| **Test of design** | Walkthrough of one firewall change (Nov 2025): ticket, CAB minutes approving it, implementation date after approval. **Design effective** if performed consistently |

### Population and completeness

**Population.** Service desk change log, FY2026, run by the Service Desk lead on Nov 19, 2026 (observed): **86 changes.** Covers Ledgerline, LOS, AD, firewall, servers, backup.

**Completeness, tested in the reverse direction.** A ticket log only proves the changes someone chose to log. So we started from system records of changes and traced back to tickets.

| System record | Selected | Traced to a ticket |
|---|---|---|
| Ledgerline configuration audit log (37 changes in FY2026) | 10 | **6 of 10.** 4 made by Finance with no ticket |
| AD Group Policy change events | 5 | 5 of 5 ✓ |
| WSUS patch deployment history | 5 | 5 of 5 ✓ |

**Conclusion on population.** Complete for IT-managed infrastructure. **Incomplete for Ledgerline.** Finance makes configuration changes outside the change process, so sample results cannot cover them. See CM-05. **D-15.**

### Sample test

**Sample size.** 25 (event-driven, over 50, elevated risk). Random selection, IT-320-S1.

**Attributes tested.**
- **A.** A ticket describes the change.
- **B.** Approved by CAB (per minutes) or by the policy delegate (per email) **before** the implementation date.

| # | Ticket | Implemented | System | A | B | Note |
|---|---|---|---|---|---|---|
| 1 | CHG-1107 | 2025-11-06 | Firewall | ✓ | ✓ | |
| 2 | CHG-1121 | 2025-11-20 | Ledgerline | ✓ | ✓ | |
| 3 | CHG-1204 | 2025-12-03 | AD | ✓ | ✗ | No December minutes. No email approval |
| 4 | CHG-1211 | 2025-12-10 | LOS | ✓ | ✓\* | Delegate email approval, Dec 8 |
| 5 | CHG-1219 | 2025-12-17 | Server patch | ✓ | ✗ | No December minutes. No email approval |
| 6 | CHG-0108 | 2026-01-08 | Ledgerline | ✓ | ✓ | |
| 7 | CHG-0122 | 2026-01-22 | Backup | ✓ | ✓ | |
| 8 | CHG-0205 | 2026-02-05 | Firewall | ✓ | ✓ | |
| 9 | CHG-0226 | 2026-02-26 | Ledgerline | ✓ | ✗ | Approved in April CAB minutes, **after** implementation |
| 10 | CHG-0304 | 2026-03-04 | AD | ✓ | ✗ | No March minutes. No email approval |
| 11 | CHG-0318 | 2026-03-18 | LOS | ✓ | ✗ | No March minutes. No email approval |
| 12 | CHG-0325 | 2026-03-25 | Server patch | ✓ | ✓\* | Delegate email approval, Mar 23 |
| 13 | CHG-0409 | 2026-04-09 | Ledgerline | ✓ | ✓ | |
| 14 | CHG-0423 | 2026-04-23 | Firewall | ✓ | ✓ | |
| 15 | CHG-0514 | 2026-05-14 | Backup | ✓ | ✓ | |
| 16 | CHG-0528 | 2026-05-28 | LOS | ✓ | ✓ | |
| 17 | CHG-0603 | 2026-06-03 | Ledgerline | ✓ | ✗ | No June minutes. No email approval |
| 18 | CHG-0617 | 2026-06-17 | AD | ✓ | ✗ | No June minutes. No email approval |
| 19 | CHG-0709 | 2026-07-09 | Server patch | ✓ | ✓\* | Delegate email approval, Jul 7 |
| 20 | CHG-0722 | 2026-07-22 | Firewall | ✓ | ✗ | No July minutes. No email approval |
| 21 | CHG-0813 | 2026-08-13 | Ledgerline | ✓ | ✗ | No August minutes. No email approval |
| 22 | CHG-0827 | 2026-08-27 | LOS | ✓ | ✗ | No August minutes. No email approval |
| 23 | CHG-0910 | 2026-09-10 | AD | ✓ | ✓ | |
| 24 | CHG-0924 | 2026-09-24 | Ledgerline | ✓ | ✓ | |
| 25 | CHG-1015 | 2026-10-15 | Server patch | ✓ | ✓ | |

**Results.** Attribute A: 25 of 25 ✓. Attribute B: **10 exceptions.** 9 in the five months with no CAB minutes (Dec, Mar, Jun, Jul, Aug) and no delegate email. 1 approved after implementation.

**Root cause (inquiry of Manager, IT Infrastructure, Nov 24).** The CAB secretary was on leave in those months and no alternate was assigned. Meetings were held on some of those dates, but nothing was recorded. An approval that is not evidenced cannot be relied on.

**Conclusion.** **Control did not operate effectively.** 10 of 25 against an expectation of zero. Sample not extended. **D-14.**

---

## CM-03 Changes tested before implementation

| Step | Detail |
|---|---|
| **Control objective** | Changes are tested and accepted before implementation, with evidence retained |
| **Test of design** | Inquiry (Nov 24). Inspected the 25 CM-02 sample tickets for test evidence: **0 of 25** contain UAT sign-off. The ticket tool has no testing field. The business unit confirms testing verbally |
| **Conclusion** | **Design ineffective.** No mechanism to record or retain testing evidence. Consistent with IT-200 CUEC 11 |
| **Deficiency** | D-08, extended from Keystone to all systems |

---

## CM-04 Emergency changes

| Step | Detail |
|---|---|
| **Control objective** | Urgent changes made outside the normal process are logged, justified and approved after the fact |
| **Test of design** | Change Policy has no emergency change section. No retrospective approval step exists |
| **Population** | 4 emergency changes identified in FY2026: service desk log, plus Northline exception E2. All 4 reviewed |

| # | Date | System | Change | Retro approval | Financially relevant | Impact procedure | Result |
|---|---|---|---|---|---|---|---|
| EC1 | Jan 14, 2026 | Keystone | Loan interest calculation parameter changed on a telephone instruction | ✗ | **Yes** | Financial audit team recalculated interest on 25 affected loans from Jan 14 to Oct 31 | 25 of 25 agreed. Change was correct |
| EC2 | Mar 9, 2026 | Firewall | Inbound rule opened for LOS vendor support. Left open 6 weeks | ✗ | No | None required. Security observation to management | N/A |
| EC3 | Jun 11, 2026 | Ledgerline | Finance analyst edited the Keystone-to-Ledgerline GL import job after a failed load | ✗ | **Yes** | Agreed June Keystone GL totals by account to Ledgerline | Agreed ✓ |
| EC4 | Sep 3, 2026 | AD | Group Policy rolled back after branch login outage | ✗ | No | None required | N/A |

**Conclusion.** No emergency change process. 4 of 4 not approved after the fact. Two affected financial processing. The impact procedures found no misstatement. **D-16.**

---

## CM-05 Ledgerline configuration: segregation of duties

| Step | Detail |
|---|---|
| **Control objective** | Changes to account mapping, consolidation rules and approval workflows are independently approved |
| **Test of design** | Inspected Ledgerline roles: 2 finance staff hold both configuration and approval rights. No workflow requires a second approver |
| **Conclusion on design** | **Ineffective** |
| **Impact** | Ledgerline configuration audit log, FY2026: 37 changes. 29 by the 2 users, all self-approved. 12 affected account mapping or consolidation rules |

### Compensating control

A **compensating control** covers the same risk in a different way. Management identified one.

| Step | Detail |
|---|---|
| **Control** | Monthly reconciliation of the Ledgerline trial balance to the Keystone general ledger, by account. Prepared by a Senior Accountant, reviewed and signed by the Finance Manager within 10 business days of month end |
| **Test of design** | Walkthrough of the September reconciliation. Detects differences in **account balances** between Keystone and Ledgerline. **Does not detect** an account mapped to the wrong financial statement line, because a mis-mapped account still reconciles by balance |
| **Operating effectiveness** | 5 of 12 months, random (Dec, Feb, May, Jul, Oct). Attributes: prepared, differences explained, reviewed and signed within 10 business days |
| **Results** | 5 of 5 ✓ |
| **Conclusion** | **Effective for accuracy** of balances. **Not a compensating control for classification** |

### Classification risk: referred to the financial audit team

Year-end review of Ledgerline mapping of every GL account to financial statement lines. **Result (Nov 26):** one account, *Accrued interest payable on member deposits* ($1.9M), mapped to "Other liabilities" instead of "Member deposits" after a mapping change on Feb 26, 2026 (CM-02 sample item 9). **Management corrected the classification.** No effect on net income.

**Conclusion.** The segregation failure produced a classification misstatement above overall materiality. The client's controls did not detect it. The auditor did. **D-13.**

---

## CM-06 Changes to reports used in financial reporting

| Step | Detail |
|---|---|
| **Control objective** | Reports relied on in financial reporting are changed only under control |
| **Population** | 14 Power BI and SQL reports. Inquiry of Finance and IT (Nov 24): 12 are management or board reporting only. **2 feed financial reporting:** (1) ECL staging report, a SQL query on a Keystone data extract used in the expected credit loss model. (2) Monthly deposit interest accrual analysis used in a Finance review control |
| **Test of design** | No version control, no change tickets, no testing, no restriction on who can edit. Query text is stored on a shared drive editable by 6 users |
| **Conclusion** | **No control.** ITGCs cannot support reliance on either report. Financial audit team to test both directly: re-run the queries against Keystone data and agree a sample of output lines to source |
| **Deficiency** | **D-17** |

---

## CM-07 Keystone release review and acceptance (CUEC 13)

| Step | Detail |
|---|---|
| **Control objective** | Lakeridge reviews and tests Keystone releases before Northline implements them |
| **Control description** | Northline's portal requires a client sign-off for each release. Application Support lead reviews release notes, runs Lakeridge test scripts in Northline's test environment, and signs off in the portal |
| **Test of design** | Walkthrough of release 2026.2 (Aug 2026). Design effective |
| **Operating effectiveness** | Full population: 2 releases in FY2026 |

| Release | Release notes reviewed | Test scripts run | Portal sign-off before go-live | Note |
|---|---|---|---|---|
| 2026.1 (Mar 2026) | ✓ | ✓ 10 amortization scenarios compared to expected results, including the rounding change | ✓ Mar 6. Go-live Mar 14 | |
| 2026.2 (Aug 2026) | ✓ | ✓ | ✓ Aug 12. Go-live Aug 22 | |

**Conclusion.** **Effective.** Closes CUEC 13 in IT-200. The Keystone Systems carve-out for code development remains open (IT-200 Part D), but Lakeridge's testing of release 2026.1 provides partial evidence that the amortization change works as intended.

---

## Domain conclusion

Change management is **not effective** for FY2026. Of seven controls, five are ineffective in design, one did not operate, and one (Keystone release acceptance) is effective.

Two findings stand out for Deliverable 4:
1. **The Ledgerline mapping error** ($1.9M classification, above materiality) was caused by a control failure and was found by the auditor, not the client.
2. **The NSF fee exception** ($4,200) is trivial in amount but shows an unauthorized change went undetected for seven months.

**Communicated to engagement team (Nov 26, 2026):** change ITGCs do not support reliance on Keystone configuration, Ledgerline configuration or the two financial reports. Substantive procedures performed as noted above.

## Deficiencies carried to IT-900

| Ref | Deficiency | Type | Status |
|---|---|---|---|
| D-04 | Keystone configuration changes not independently approved | Design | From IT-200. Impact quantified (F1, EC1) |
| D-08 | Testing evidence not retained, all systems | Design | Extended |
| D-13 | Ledgerline configuration changes self-approved. Caused $1.9M classification misstatement | Design | **New** |
| D-14 | Change approval not evidenced. 10 of 25 exceptions | Operating | **New** |
| D-15 | Ledgerline changes made outside the change process | Design | **New** |
| D-16 | No emergency change process. 4 of 4 unapproved | Design | **New** |
| D-17 | No change control over reports used in financial reporting | Design | **New** |
