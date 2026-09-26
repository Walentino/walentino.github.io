# IT-900 Deficiency Evaluation and Summary Memo

> **Simulated engagement.** All findings are constructed for training. No live environment was assessed. Service provider and product names (Northline, Keystone, Lakeshore Central, Ledgerline) are fictional.

| | |
|---|---|
| **Client** | Lakeridge Community Credit Union Ltd. |
| **Period** | Fiscal year ended October 31, 2026 |
| **Workpaper** | IT-900 |
| **Prepared by / date** | A. Odeja / December 1, 2026 |
| **Reviewed by / date** | [Engagement manager] / [date] |
| **Standard** | CAS 265, Communicating Deficiencies in Internal Control to Those Charged with Governance and Management |
| **Materiality** | Overall $550K. Performance $360K. Clearly trivial $27K (IT-100, revised) |
| **Sources** | IT-200, IT-310, IT-320, IT-330, IT-340 |

---

## 1. Purpose

Evaluate the 17 control deficiencies identified in ITGC testing, individually and in combination, determine which are significant deficiencies, and set out what is communicated, to whom, and when.

## 2. Framework

| Term (CAS 265) | Meaning |
|---|---|
| **Deficiency in internal control** | A control is designed, implemented or operated so that it cannot prevent, or detect and correct, misstatements on a timely basis. Or a control needed to do so is missing |
| **Significant deficiency** | A deficiency, or combination of deficiencies, that in the auditor's professional judgment is important enough to merit the attention of those charged with governance |

**Two tiers only.** "Material weakness" is not a CAS 265 category. It applies to US registrants under SOX and to Canadian reporting issuers under NI 52-109. Lakeridge is neither, so the term is not used.

**Who receives what.**
- Significant deficiencies go **in writing** to those charged with governance (Lakeridge's Audit Committee), on a timely basis.
- Other deficiencies that merit management's attention go to management.

## 3. Evaluation method

For each deficiency we considered the factors in the CAS 265 application guidance:

1. **What could go wrong.** Which accounts and assertions are exposed.
2. **Likelihood.** How likely it is that the deficiency leads to a misstatement.
3. **Magnitude.** How large a misstatement could be. Based on the exposure, not on what was found.
4. **Susceptibility to fraud or loss.**
5. **Compensating controls.** Tested and effective only.
6. **Actual misstatements found.** A misstatement found by the auditor and not by the client's controls is a strong indicator of a significant deficiency.
7. **debit networktion with other deficiencies.**

**A principle applied throughout.** Severity depends on what **could** happen, not only on what **did** happen. Our substantive procedures found no misstatement for several deficiencies. That is relevant to likelihood. It does not make the controls effective, and it does not by itself reduce a deficiency below significant.

---

## 4. Individual evaluation

| Ref | Deficiency | Exposure | Fraud risk | Compensating control | Misstatement found | Individual conclusion |
|---|---|---|---|---|---|---|
| D-01 | Provisioning not authorized, all applications | All Keystone, LOS, Ledgerline data | Medium | None | None | Deficiency |
| D-02 | No periodic access review | All applications. The main detective control over access | Medium | None | None | Deficiency |
| D-03 | Late termination notice to Northline | Keystone | Medium | None | None. 1 user, 2 logins, inquiry only | Deficiency |
| D-04 | Keystone configuration changes not independently approved | Interest and fee parameters on $3.36B of loans and deposits. Interest income and expense | Medium | None | $4.2K fee overcharge. Interest recalculation clean | **Significant deficiency** |
| D-05 | Self-approval of Keystone member data corrections | Deposit and loan balances. Interest rate overrides | **High** | None | None. 146 self-approvals, 11 balance-affecting, all supported | **Significant deficiency** |
| D-06 | Shared privileged account with Keystone access | All Keystone data. Actions unattributable | **High** | None | None. April change was an address | **Significant deficiency** |
| D-07 | No review of Keystone end-of-day exceptions | Deposits and loans (completeness, accuracy) | Low | None | **$212K** uncleared suspense. Uncorrected | Deficiency. See 5.1 |
| D-08 | Testing evidence not retained | All changed functionality | Low | None | None | Deficiency |
| D-09 | No process to review service organization reports or perform CUECs | All Keystone controls. Board told reports were "on file" | Medium | None | Indirect. D-01 to D-08 follow from it | **Significant deficiency** |
| D-10 | Weak passwords. No MFA on Keystone, LOS, domain | All applications | Medium | MFA on M365 and VPN only | None | Deficiency |
| D-11 | Termination process incomplete across applications | AD, LOS, Ledgerline | Medium | None | None. 5 active accounts, no logins | Deficiency |
| D-12 | Excessive, shared, unmonitored Domain Admin | Infrastructure beneath all applications | High | None | None | Deficiency. Aggregated with D-06 |
| D-13 | Ledgerline configuration changes self-approved | Classification of all reported balances | Medium | Monthly TB reconciliation. Effective for accuracy, **not** classification | **$1.9M** classification, above materiality. Found by auditor. Corrected | **Significant deficiency** |
| D-14 | Change approval not evidenced, 10 of 25 | Lakeridge-managed systems | Low | None | None | Deficiency |
| D-15 | Ledgerline changes outside the change process | Ledgerline | Medium | Same as D-13 | Linked to D-13 | Deficiency. Aggregated with D-13 |
| D-16 | No emergency change process | Keystone, Ledgerline | Medium | None | None. EC1 and EC3 recalculated clean | Deficiency |
| D-17 | No change control over reports used in financial reporting | ECL staging report (a significant estimate). Deposit interest analysis | Medium | None | None. Reports tested directly | Deficiency. Close call, see 5.2 |

**Individually significant: 5** (D-04, D-05, D-06, D-09, D-13).

---

## 5. Judgments that needed more than the table

### 5.1 D-07: why the $212K suspense balance is not individually significant

**For:** the auditor found a misstatement the client's controls missed.

**Against:**
- The amount is below performance materiality.
- It is confined to one visible account.
- The exposure is bounded by daily transaction volumes that fail to match, which are low.

**Conclusion:** deficiency. It is still reported to the Audit Committee, because it is part of the service organization finding (D-09) in section 6.

### 5.2 D-17: a close call

**For significant:** the ECL staging report feeds a significant accounting estimate, where subjectivity raises risk.

**Against:**
- The report is a data extract, not the model itself.
- The engagement team tested it directly and found it accurate.
- The error it could introduce would most likely show up as a visible shift in staging percentages at the model review stage.

**Conclusion:** deficiency, included in the change management finding. A reasonable reviewer could conclude otherwise. The reasoning is recorded for that discussion.

### 5.3 D-13: why an auditor-detected misstatement matters

The $1.9M mapping error was caused directly by the segregation failure. Management's reconciliation could not detect it. The auditor found it at year end. The size is above overall materiality, and the client's controls failed to catch it. That settles the conclusion, even though the error was a classification with no income effect.

---

## 6. Evaluation in combination

Deficiencies that affect the same accounts, assertions or root cause are evaluated together. A group can be significant even where its members are not.

| Finding for the Audit Committee | Deficiencies | Why significant in combination |
|---|---|---|
| **1. Oversight of the core banking service provider and IT governance** | D-09 (root cause), D-07, and the CUEC failures behind D-01 to D-06 | Lakeridge's half of the Keystone control system did not exist during FY2026. Northline's controls cannot achieve their objectives without it. The Board was told reports were "on file" when they had not been read. IT has had no internal audit coverage since 2023, and the ISO reports to the executive who owns the systems. These are control environment weaknesses |
| **2. Access to financial systems** | D-01, D-02, D-03, D-05, D-06, D-10, D-11, D-12 | Preventive access controls are missing. The detective control (access review) did not operate. Privileged access is shared and unmonitored. Together, a person could obtain inappropriate access, use it without attribution and not be detected. There is fraud susceptibility over $3.7B of member balances |
| **3. Change management over financial systems and reports** | D-04, D-08, D-13, D-14, D-15, D-16, D-17 | Changes to interest parameters, fee parameters, statement mapping and financial reports are made without independent approval, testing evidence or a complete record. One change caused a $1.9M misstatement found by the auditor. One unauthorized fee change ran undetected for 7 months |

**Result:** 17 deficiencies communicated to the Audit Committee as **3 significant deficiencies**, each listing its component deficiencies. All 17 are also listed individually for management.

---

## 7. Misstatements identified through ITGC-related procedures

| Source | Misstatement | Amount | Status |
|---|---|---|---|
| D-13 (IT-320 CM-05) | Accrued interest payable on member deposits classified in Other liabilities | $1.9M, classification only | Corrected by management |
| D-07 (IT-340 OP-01) | Uncleared Keystone suspense balance | $212K | Uncorrected. On the summary of uncorrected misstatements |
| D-04 (IT-320 CM-01) | NSF fee charged above board-approved amount | $4.2K | Below clearly trivial. Not accumulated. Reported to management for member refunds |

---

## 8. Effect on the audit (already communicated to the engagement team)

- No reliance on automated controls or ITGCs for Keystone, the LOS or Ledgerline in FY2026.
- Substantive procedures performed:
  - Interest recalculation, including loans affected by the January change
  - Direct testing of Keystone and SQL reports used as audit evidence
  - Year-end review of the Ledgerline mapping
  - Suspense account analysis
- Reliance was placed only on the LOS-to-Keystone boarding reconciliation and reject review (IT-340), with the underlying reports tested directly.

---

## 9. Communication

| To | What | Form | Timing |
|---|---|---|---|
| Audit Committee | 3 significant deficiencies, with components, effect and recommendations | Written letter | Before the audit report is issued |
| Management (CEO, CFO, VP Technology and Operations) | All 17 deficiencies, plus observations O-01 to O-05 | Management letter | With the Audit Committee letter. Discussed in advance to obtain responses |

### Draft wording: significant deficiency 2 (access), for the Audit Committee letter

Each finding follows the same structure: **condition** (what we found), **criteria** (what should happen), **cause** (why it happened), **effect** (what it means) and **recommendation**.

> **Access to financial systems**
>
> **Condition.** During the year ended October 31, 2026, access to the core banking system, the loan origination system and Ledgerline was granted without documented approval. No periodic review of user access was performed. One terminated employee's core banking access remained active for 34 days, and the account was used twice after termination. Four system administrators share one privileged account that can change member records. Two staff members can initiate and approve their own corrections to member accounts, and did so 146 times.
>
> **Criteria.** Access should be approved before it is granted, reviewed periodically, removed promptly on termination, and restricted so that no individual can make and approve a change to member data. Privileged activity should be attributable to an individual.
>
> **Cause.** There is no defined access management process across applications. Responsibilities for core banking access, which Lakeridge must perform under its service agreement with Northline, have not been assigned.
>
> **Effect.** Unauthorized or erroneous changes to member balances could occur without detection. Our procedures did not identify any such change. However, we could not rely on these controls, and we extended our audit procedures as a result.
>
> **Recommendation.** Assign ownership of access management for each financial application. Introduce a documented request and approval process, a same-day termination process covering all applications, and semi-annual access reviews signed by application owners. Remove the shared administrator account, enforce individual privileged accounts with monitoring, and separate initiation and approval of member data corrections in Keystone.
>
> **Management response.** [To be obtained]

---

## 10. Observations for the management letter (not deficiencies under CAS 265)

These affect availability, security or operations, not the reliability of the financial statements.

| Ref | Observation |
|---|---|
| O-01 | Restore testing performed once of four required. Failed test not remediated or retested |
| O-02 | No reconciliation evidence retained for the digital banking conversion of 33,000 member profiles |
| O-03 | Recovery time and recovery point objectives not defined for Keystone |
| O-04 | Firewall rule opened for vendor support in an emergency change and left open for 6 weeks |
| O-05 | No security event monitoring. No alerting on authentication failures. Incident tickets lack severity and post-incident review |

---

## 11. Conclusion

ITGCs over Lakeridge's financially significant applications were **not effective** in FY2026. The external audit was completed on a substantive basis for the affected areas. Five deficiencies are individually significant. They are communicated to the Audit Committee as three significant deficiencies, with twelve further deficiencies and five observations communicated to management.
