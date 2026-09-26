# IT-200 Service Organization and CUEC Analysis: Northline (Keystone core banking)

> **Simulated engagement.** Lakeridge, the Northline report, all inquiries and all evidence are constructed for training. No live environment was assessed. Service provider and product names (Northline, Keystone, Lakeshore Central, Ledgerline) are fictional.

| | |
|---|---|
| **Client** | Lakeridge Community Credit Union Ltd. |
| **Period** | Fiscal year ended October 31, 2026 |
| **Workpaper** | IT-200 |
| **Prepared by / date** | A. Odeja / November 16, 2026 |
| **Reviewed by / date** | [Reviewer] / [date] |
| **Standards** | CAS 402 (service organizations), CAS 315, CAS 330, CAS 230 (documentation) |
| **Cross-references** | IT-100 Scoping memo. IT-300 series ITGC testing. IT-900 Deficiency log (feeds Deliverable 4) |

---

## 1. Objective

Determine whether the Northline SOC 1 Type II report, together with controls performed by Lakeridge, provides sufficient appropriate evidence that the control objectives supporting Keystone operated effectively throughout FY2026, so that the engagement team can rely on automated controls and reports produced by Keystone.

## 2. Sources

| Ref | Source | Obtained |
|---|---|---|
| S1 | Northline SOC 1 Type II report (CSAE 3416), Nov 1, 2025 to Sep 30, 2026, dated Oct 30, 2026 | Received from Lakeridge Finance, Nov 6, 2026 |
| S2 | Inquiry: VP Technology and Operations | Nov 10, 2026 |
| S3 | Inquiry: Application Support lead (Keystone liaison) | Nov 10, 2026 |
| S4 | Inquiry: HR Manager | Nov 11, 2026 |
| S5 | Service desk mailbox and ticket extracts, FY2026 | Nov 11, 2026 |
| S6 | Northline client service contact, response to our questions on exceptions E1 and E2 | Requested Nov 12, 2026. Received Nov 14, 2026 |
| S7 | Scoping memo IT-100: relied-upon Keystone functions | Internal |

**Relied-upon Keystone functions (from IT-100):** interest accrual on loans and deposits, loan amortization, posting of transactions to the general ledger, and the delinquency aging report used in the expected credit loss estimate.

---

## 3. Part A: Report adequacy

| # | Procedure | Result | Conclusion |
|---|---|---|---|
| A1 | Confirm report type | Type II | Satisfactory |
| A2 | Confirm standard | CSAE 3416 | Satisfactory |
| A3 | Compare report period to audit period | Covers 11 of 12 months. October 2026 not covered | **Gap. See Part F** |
| A4 | Confirm services and systems covered match those used by Lakeridge | Keystone hosting, batch processing, interfaces, client configuration. Matches Lakeridge's use | Satisfactory |
| A5 | Evaluate service auditor competence and independence | Harrow & Vance LLP, CPA firm with a service organization reporting practice. Independence statement included. No known relationship with Lakeridge | Satisfactory |
| A6 | Read opinion | Unmodified on description, design and operating effectiveness | Satisfactory. Exceptions evaluated in Part C |
| A7 | Identify subservice organizations and method | Keystone Systems and colocation provider, both carve-out | **See Part D** |
| A8 | Confirm management's assertion signed and period consistent | Signed. Period consistent | Satisfactory |

**Conclusion Part A:** The report is suitable for use, subject to the gap period (Part F) and the carve-outs (Part D).

---

## 4. Part B: Control objectives mapped to reliance

| CO | Objective | Supports relied-upon function? | Used in this analysis |
|---|---|---|---|
| CO1 | Logical access restricted | Yes. All Keystone data and functions | **Yes** |
| CO2 | Configuration and parameter changes controlled | Yes. Interest and fee parameters | **Yes** |
| CO3 | Releases evaluated and approved before implementation | Yes. Interest, amortization and GL posting logic | **Yes** |
| CO4 | Batch processing complete, accurate, timely | Yes. Interest accrual and GL posting run in batch | **Yes** |
| CO5 | Interfaces processed completely and accurately | Yes. Loan boarding from LOS, payment files | **Yes** |
| CO6 | Report delivery to authorized recipients | Indirectly | Noted only |
| CO7 | Backup and recovery | No. Availability | Not used |
| CO8 | Network access restricted | Supports CO1 | Noted with CO1 |
| CO9 | New client conversion | No. No conversion in period | Not used |

---

## 5. Part C: Exceptions evaluation

| Exc | CO | Exception | Could it affect Lakeridge? | Lakeridge compensating control? | Effect on our reliance |
|---|---|---|---|---|---|
| E1 | CO1 | 2 of 25 terminations removed in 3 and 4 business days, not 1 | Yes. Occurred Nov 2025 to Jan 2026. Northline (S6) confirms one of the two related to Lakeridge's October 24 teller termination, notified by Lakeridge on November 24 and removed November 27 | None. No periodic access review (CUEC 2) | Adds to CO1 failure. The larger cause of the 34-day exposure is Lakeridge's late notification (31 of 34 days). See CUEC 3 |
| E2 | CO2 | 1 of 40 configuration changes implemented on a telephone instruction. Ticket raised afterwards | Yes. Northline (S6) confirms the item is Lakeridge's January 2026 change to the loan interest calculation parameter | None. No Lakeridge approval of change requests (CUEC 4) and no authorized requester list (CUEC 6) | CO2 not achieved for Lakeridge for this change. **Referred to financial audit team: recalculate interest on a sample of loans affected by the parameter after the January change date** |
| E3 | CO7 | Second DR test delayed 7 weeks | Not relevant to financial reporting | N/A | None |

---

## 6. Part D: Carved-out subservice organizations (CSOCs)

| CSOC | Party | Relevance | Procedure | Result | Conclusion |
|---|---|---|---|---|---|
| F1, F2 | Keystone Systems: code development and source code access | **High.** Code behind interest, amortization, GL posting | (1) Request Keystone Systems SOC report covering Keystone development. (2) If unavailable, inspect FY2026 release notes for changes to relied-upon functions | Keystone Systems report requested through Northline, not yet received. Release notes: two FY2026 releases. Release 2026.1 (March) includes a change to loan amortization rounding | **Open.** If no Keystone Systems report: amortization calculation retested after March 2026 by the financial audit team |
| F3 | Keystone Systems: release notes | Medium | Confirmed release notes exist for both releases | Present | Satisfactory |
| D1, D2 | Colocation provider | Low / not relevant | None required | N/A | No effect |

---

## 7. Part E: CUEC analysis

**Method.** For each relevant CUEC: identify the Lakeridge control that satisfies it, assess its design, then test operating effectiveness where the design is adequate. Where no control exists, record a design deficiency. No operating effectiveness testing is possible for a control that does not exist.

**Key:** DD = design deficiency. OD = operating deficiency. N/R = not relevant to this audit.

| CUEC | Requirement (short) | CO | Lakeridge control identified | Design | Operating effectiveness | Result | Deficiency |
|---|---|---|---|---|---|---|---|
| 1 | Authorize access requests | CO1 | Manager emails service desk. No standard form. Approval not retained (S3, S5) | **Ineffective.** No defined approver, no evidence | Not tested | DD | D-01 |
| 2 | Periodic access review | CO1 | None for Keystone. Policy requires semi-annual review. Last review of any system May 2024 (S2) | **No control** | Not tested | DD | D-02 |
| 3 | Timely termination notice | CO1 | HR emails a weekly list. Removal requested manually. No SLA, no confirmation (S4) | **Ineffective.** Weekly cycle and no SLA allow delays. Teller: 31 days to notify | Not tested | DD | D-03 |
| 4 | Approve change requests | CO2 | Analyst raising the request also approves it (S3) | **Ineffective.** No independent approval | Not tested | DD | D-04 |
| 5 | Reconcile daily output | CO4 | Reports received. No documented reconciliation or sign-off (S3) | **No control** | Not tested | DD | D-07 |
| 6 | Authorized requester list | CO1, CO2 | None provided to Northline (S2, S6) | **No control** | Not tested | DD | D-04 |
| 7 | Roles consistent with SoD | CO1 | None. 2 staff can initiate and approve member data corrections (S3) | **Ineffective** | Not tested | DD | D-05 |
| 8 | Approve and monitor privileged roles | CO1 | None. Shared `svc_admin` holds Keystone access and modified a member record, Apr 2026 (S2) | **No control** | Not tested | DD | D-06 |
| 9 | Credential protection, client authentication settings | CO1 | Shared account in use. MFA not enabled on Keystone (S2) | **Ineffective** | Not tested | DD | D-06 |
| 10 | Secure own network and workstations | CO8 | Firewalls, VPN with MFA. Legacy AD password policy weak (S2) | Partly effective | Tested in IT-310 | Pending | Pending |
| 11 | Test and accept changes, retain evidence | CO2 | UAT by business unit. Sign-off not retained (S3) | **Ineffective.** No evidence retained | Not tested | DD | D-08 |
| 12 | Accuracy of parameters supplied | CO2 | Business process control | N/R to ITGC | Referred to financial audit team | N/R | None |
| 13 | Review release notes, test releases | CO3 | Application support reviews release notes on inquiry. Testing evidence to be inspected (S3) | Adequate on inquiry | Tested in IT-320 | Pending | Pending |
| 14 | Review EOD exception reports | CO4 | Reports received. No review or sign-off (S3) | **No control** | Not tested | DD | D-07 |
| 15 | Complete, accurate outbound files | CO5 | LOS to Keystone loan boarding. Control totals reconciled daily by Lending Operations (S3) | Adequate on inquiry | Tested in IT-340 | Pending | Pending |
| 16 | Review confirmations and rejects | CO5 | Lending Operations reviews reject report daily (S3) | Adequate on inquiry | Tested in IT-340 | Pending | Pending |
| 17 | Report recipients current | CO6 | N/A | N/R | N/A | N/R | None |
| 18 | Recovery requirements | CO7 | RTO and RPO not defined | N/R to FS audit | N/A | N/R | Reported to management as an observation |
| 19 | Accuracy of transactions entered | General | Business process controls | N/R to ITGC | Referred to financial audit team | N/R | None |

**Root cause.** Lakeridge has no process to obtain, review or act on service organization reports. The Northline report was filed without review (prior year, Dec 2025), and management told the board in June 2026 that reports were "on file." Nobody owns the CUECs. Recorded as **D-09**. D-01 to D-08 are symptoms of D-09.

---

## 8. Part F: Gap period, October 1 to 31, 2026

| Procedure | Status | Result |
|---|---|---|
| Obtain bridge letter from Northline covering October 2026 | Requested Nov 12, 2026 | Open |
| Inquire of Northline about changes to systems, controls or personnel in October | Included in S6 request | Northline reported no significant changes. To be confirmed in the bridge letter |
| Inspect Lakeridge's change and incident records for October | Performed. Service desk extract (S5) | No Keystone changes or incidents recorded. Note: the value of this is limited, because Lakeridge's own change records are incomplete (D-04, D-08) |
| Test Lakeridge-side CUECs through October | Performed in Part E | CUECs over CO1, CO2 and CO4 are not in place for any part of the year, including October |

**Conclusion condition.** October is covered if: (1) the bridge letter reports no changes, (2) the inquiry is consistent, and (3) nothing in Lakeridge's records contradicts it. Condition (3) cannot be fully met because Lakeridge's records are incomplete. The gap is therefore not the deciding factor. **Reliance fails for CO1, CO2 and CO4 regardless of October, because of Lakeridge's CUEC failures.**

---

## 9. Conclusion

| CO | Northline side (report) | Lakeridge side (CUECs) | Can we rely? |
|---|---|---|---|
| CO1 Access | Effective, with exception E1 | Not in place (D-01, D-02, D-03, D-05, D-06) | **No** |
| CO2 Config changes | Effective, with exception E2 affecting Lakeridge | Not in place (D-04, D-08) | **No** |
| CO3 Releases | Effective. Keystone Systems development carved out | CUEC 13 pending (IT-320) | **Conditional.** Keystone Systems report or retest of March amortization change |
| CO4 Batch | Effective | Not in place (D-07) | **No** |
| CO5 Interfaces | Effective | CUECs 15 and 16 pending (IT-340) | **Conditional** on IT-340 |

**Overall.** Northline's controls operated effectively. Lakeridge's complementary controls over access, configuration change and batch output did not exist during FY2026. The control objectives for CO1, CO2 and CO4 were therefore not achieved for Lakeridge, despite the unmodified opinion.

**Communicated to engagement team (Nov 16, 2026):**
1. Do not rely on automated controls in Keystone (interest accrual, amortization, GL posting) for FY2026.
2. Test the relevant balances and calculations substantively. Recalculate interest on a sample of loans and deposits, with specific coverage of loans affected by the January 2026 parameter change.
3. Test Keystone reports used as audit evidence, including the delinquency aging report used in the expected credit loss estimate, directly for completeness and accuracy rather than relying on ITGCs.
4. D-01 to D-09 carried to the deficiency log (IT-900) for evaluation under CAS 265 in Deliverable 4.

---

## 10. Deficiency log extract (to IT-900)

| Ref | Deficiency | Type | CUEC | CO |
|---|---|---|---|---|
| D-01 | Keystone access requests not formally authorized or evidenced | Design | 1 | CO1 |
| D-02 | No periodic review of Keystone user access | Design | 2 | CO1 |
| D-03 | Termination notification to Northline not timely; no SLA. Teller retained access 34 days, 2 logins | Design | 3 | CO1 |
| D-04 | Configuration change requests self-approved; no authorized requester list; verbal change in Jan 2026 | Design | 4, 6 | CO2 |
| D-05 | Staff can initiate and approve member data corrections in Keystone | Design | 7 | CO1 |
| D-06 | Shared privileged account with Keystone access; no MFA on Keystone | Design | 8, 9 | CO1 |
| D-07 | No review of daily output and end-of-day exception reports | Design | 5, 14 | CO4 |
| D-08 | Change acceptance testing not evidenced | Design | 11 | CO2 |
| D-09 | No process to review service organization reports or perform CUECs (root cause) | Design, entity level | All | All |
