# IT-100 ITGC Scoping Memorandum
## Lakeridge Community Credit Union Ltd. | Fiscal year ended October 31, 2026

> **Simulated engagement.** The organization, systems, service providers and observations are constructed for training. No assessment of a live environment was performed. Service provider and product names (Northline, Keystone, Lakeshore Central, Ledgerline) are fictional.

| | |
|---|---|
| **Prepared by / date** | A. Odeja / September 28, 2026 |
| **Reviewed by / date** | [Engagement manager] / [date] |
| **Our role** | IT audit team supporting the external audit of Lakeridge's FY2026 financial statements |
| **Standards** | CAS 315 (risk assessment), CAS 330 (responses to risk), CAS 402 (service organizations), CAS 500 (audit evidence, including information produced by the entity), CAS 530 (sampling), CAS 265 (communicating deficiencies) |
| **Service auditor standard** | CSAE 3416 |

---

## 1. Purpose

This memo sets out which applications and IT processes we will test, which we exclude and why, how we will obtain evidence over systems Lakeridge does not operate, and how we will select samples. Scope is driven by what the audit plans to rely on, not by the systems inventory.

## 2. Entity

Lakeridge is an Ontario credit union under the *Credit Unions and Caisses Populaires Act, 2020*, regulated by FSRA. It has $2.1B in assets, 48,000 members, 14 branches and 240 staff. It reports under IFRS. Year end is October 31.

**The defining feature:** Lakeridge does not operate its core banking system. Keystone is hosted and operated by Northline. This shapes most of the approach (section 7).

## 3. Materiality

| Measure | Amount | Basis |
|---|---|---|
| Benchmark: pre-tax income, FY2026 forecast | $11.0M | Primary measure of performance for members and the Board |
| **Overall materiality** | **$550K** | 5% of pre-tax income |
| **Performance materiality** | **$360K** | 65% of overall. Elevated because of known control weaknesses |
| **Clearly trivial** | **$27K** | 5% of overall |

Total assets were considered and rejected. 0.5% of assets gives about $10.5M, which is too high to detect errors that matter to users.

## 4. Significant accounts and assertions

| Account | Balance / activity | Key assertions |
|---|---|---|
| Member deposits | $1.74B | Completeness, existence, accuracy |
| Consumer and mortgage loans | $1.62B | Existence, accuracy, valuation |
| Commercial loans | $340M | Existence, valuation (largely manual credit files) |
| Allowance for expected credit losses (IFRS 9) | Estimate | Valuation. **Significant risk** |
| Interest income and interest expense | P&L | Accuracy, completeness, cut-off |
| Fee income | P&L | Accuracy, occurrence |
| Cash, settlement and clearing accounts | Balance sheet | Existence, completeness |
| Investments and borrowings | Balance sheet | Existence, valuation |

Wealth ($290M AUA, referral only) and credit cards (third-party issuer, agent model) are off balance sheet and excluded.

## 5. What the audit plans to rely on

ITGCs matter only because of the automated controls, IT-dependent manual controls and reports below. If the audit went fully substantive for an account, ITGCs over that system would not be needed.

| Application | Relied-upon item | Type | Account / assertion |
|---|---|---|---|
| Keystone | Interest accrual calculation | Automated control | Interest income and expense, accuracy |
| Keystone | Loan amortization calculation | Automated control | Loans, accuracy |
| Keystone | Transaction posting to the general ledger | Automated control | All balances, completeness |
| Keystone | Delinquency aging report | Report (IPE) used in ECL | ECL, valuation |
| Keystone / LOS | Loan boarding interface and reject handling | Interface, IT-dependent manual control | Loans, completeness, accuracy |
| Ledgerline | GL-to-financial-statement mapping and consolidation | Automated control / configuration | All lines, classification |
| Ledgerline | Journal entry listing | Report (IPE) for journal entry testing | Fraud risk (CAS 240) |
| SQL / Power BI | ECL staging report | Report (IPE), end-user computing | ECL, valuation |

## 6. Applications in scope and out of scope

### In scope

| Application | Why |
|---|---|
| **Keystone core banking** | System of record for deposits, loans, interest and the GL. Hosts most relied-upon items |
| **Ledgerline** | Produces the financial statements. Mapping and consolidation sit here |
| **Loan origination system (LOS)** | Loan terms originate here and pass to Keystone. Keystone does not re-derive them |
| **Reports used in financial reporting** | ECL staging report and deposit interest analysis |

### Out of scope

| Application | Basis for exclusion | What covers the risk instead |
|---|---|---|
| **Lakeshore Central digital banking** | A channel. Balances are held and posted in Keystone. The engagement scope listed it; **we override that listing** for the reasons here | Daily reconciliation of Lakeshore Central settlement and clearing reports to Keystone GL clearing accounts, **tested by the financial audit team**. Lakeshore Central's SOC 2 is not relied on: it is not designed for financial reporting and covers only 2 of 12 months. If the reconciliation fails, digital banking comes into scope |
| AML platform | AML compliance. No balances | N/A |
| Card issuing partner, wealth platform | Off balance sheet | N/A |
| ATM platform | Cash recorded in Keystone after daily reconciliation | ATM cash reconciliation, financial audit team |
| Microsoft 365 / Entra ID | Supporting only | Considered only where it authenticates in-scope applications |

### ITGC domains by application

| | Access | Change management | Program development | Computer operations |
|---|---|---|---|---|
| **Keystone** | Lakeridge: authorize, review, terminate (CUECs). Northline: SOC 1 CO1 | Lakeridge: approve and test (CUECs). Northline: CO2, CO3. Keystone Systems: carved out | Not performed by Lakeridge | Lakeridge: review outputs (CUECs). Northline: CO4, CO5 |
| **Ledgerline** | Lakeridge: test | Lakeridge configuration: test. Vendor code: vendor SOC 1 to be obtained | None expected. Confirm | Import job monitoring |
| **LOS** | Lakeridge: test | Lakeridge configuration: test | None expected. Confirm | Interface to Keystone: test |
| **Reports** | Editing rights | Change control: test | N/A | N/A |

Backup and restore are **not relied upon**. They protect availability, not accuracy. Findings go to the management letter as observations.

## 7. Service organizations (CAS 402)

### 7.1 Northline (Keystone hosting)

We will rely on Northline's SOC 1 Type II (CSAE 3416) for **Nov 1, 2025 to Sep 30, 2026**, expected in late October 2026. The prior-year report was received in December 2025 and never reviewed.

We will:
1. Confirm the report type, period, and the services covered against Lakeridge's use.
2. Evaluate the service auditor's competence and independence.
3. Read the opinion. Read every exception on control objectives we rely on, and ask Northline whether each affected Lakeridge.
4. Identify subservice organizations and whether they are inclusive or carved out. **Keystone Systems (Keystone code development) is expected to be carved out.** If so: obtain Keystone Systems' own report, or identify releases that changed relied-upon functions and have them retested.
5. Extract the CUECs, map them to control objectives, and identify and test the Lakeridge control that satisfies each relevant one (Deliverable 2).

**Expected result, stated now.** Preliminary inquiry shows Lakeridge has no process for any of the 19 CUECs. We expect CUECs over access, configuration change and batch output to fail. If confirmed, the Keystone control objectives will not be achieved for Lakeridge, regardless of Northline's opinion. We will tell the engagement team at once, so substantive procedures over interest, balances and Keystone reports can be planned.

### 7.2 Other providers

| Provider | Report | Treatment |
|---|---|---|
| Ledgerline vendor | SOC 1 to be obtained | Vendor-side code changes. Lakeridge-side configuration tested directly |
| LOS vendor | SOC 2 requested, not received. SOC 2 not designed for financial reporting | Rely instead on Lakeridge's LOS-to-Keystone boarding reconciliation, tested directly |
| Lakeshore Central, AML platform, Microsoft | Not relied on | See section 6 |

## 8. The October gap period

Northline's report ends Sep 30. Year end is Oct 31. We will **obtain a bridge letter and perform roll-forward procedures together**. They are not alternatives:
- A bridge letter is Northline management's statement that nothing changed. It is not tested evidence.
- The roll-forward is our own work: inquiry of Northline about October changes, inspection of Lakeridge's October change and incident records, and testing of Lakeridge's CUECs through October.

**Sufficient only if:** the opinion is unmodified, no exception affects our reliance, and no October changes are found. **If any condition fails:** no reliance on Northline's controls for October. The engagement team extends substantive procedures for that month.

**Note:** where the audit cannot rely on controls, the response is a change in audit strategy, not a "scope limitation." A scope limitation (CAS 705) means we could not obtain sufficient evidence at all.

## 9. Information produced by the entity (IPE)

Every system report used as evidence, or used inside a control we rely on, will be tested for completeness and accuracy. If ITGCs over the source system fail, we test the report directly (re-run it, agree totals to source, trace a sample to documents).

| Report | Used for |
|---|---|
| Keystone user listing (from Northline) | Access populations |
| HR termination report | Termination population |
| Change logs: service desk, Northline tickets, Ledgerline audit log | Change populations. **Completeness tested in reverse**, from system logs back to tickets |
| Keystone delinquency aging, ECL staging report | ECL |
| LOS funded loans and Keystone new loans boarded | Boarding reconciliation |
| Ledgerline journal entry listing | Journal entry testing |

## 10. Sampling

These are **firm conventions**, not ISACA requirements. ITAF provides the sampling process: define the objective and population, establish completeness, select, evaluate, conclude.

| Control frequency or population | Sample (elevated risk) |
|---|---|
| Daily, or many times daily | 25 |
| Weekly | 10 |
| Monthly | 5 |
| Quarterly | 2 |
| Annual | 1 |
| Event-driven, over 50 items | 25 |
| Event-driven, 10 or fewer | All |
| Configured system setting | 1, if change management over the setting is effective |

**Rules set in advance:**
- Random selection, documented and reproducible.
- **Terminations: test all**, given the October 2025 teller incident.
- **Emergency changes: test all four.**
- **Expected deviations: zero.** An exception is investigated for root cause. We do not extend a sample to test our way out of it.
- A control that did not operate in the period is not sampled. It is concluded on directly.

## 11. Known conditions affecting planning

| Condition | Domain | Planning implication |
|---|---|---|
| No access review since May 2024 | Access | Control did not operate. Conclude directly. No sample |
| Shared `svc_admin` holds Domain Admin **and Keystone access**. Used to change a member record, Apr 2026, unattributable | Access | Fraud risk (CAS 240). Impact assessment on the April change |
| 2 staff can initiate and approve member data corrections in Keystone | Access, SoD | Fraud risk. Filter the full correction log for self-approval |
| Teller retained Keystone access 34 days, 2 logins | Access | Test all terminations. Refer logins to audit team |
| No MFA on Keystone, LOS or domain login. Weak AD password policy | Access | Inspect settings |
| Loan interest calculation changed on a verbal instruction, Jan 2026 | Change | Audit team recalculates affected interest. Ask Northline if it appears as a SOC exception |
| 4 emergency changes, none approved after the fact | Change | Test all 4 |
| CAB minutes for 7 of 12 months. UAT sign-off not retained | Change | Expect approval and testing exceptions |
| 2 finance staff can make and approve Ledgerline configuration changes | Change, SoD | Design deficiency. Look for a compensating control. Check which assertion it covers |
| 14 Power BI and SQL reports, no change control | Change, IPE | Identify which feed financial reporting. Test those directly |
| Keystone end-of-day exception reports never reviewed | Operations (CUEC 5, 14) | Inspect reports. Ask audit team to analyse suspense balances |
| ISO reports to VP Technology. IT internal audit not performed since 2023 | Entity level | Limits reliance on management self-assessment |
| Board told SOC reports were "on file" (Jun 2026) | Entity level | Control environment. Relevant to deficiency evaluation |

## 12. Open items

1. Northline FY2026 SOC 1 report (expected late October).
2. Bridge letter covering October 2026.
3. Keystone Systems report, or list of FY2026 Keystone releases.
4. Ledgerline SOC 1.
5. Confirmation of the Lakeshore Central settlement reconciliation by the financial audit team.

## 13. Conclusion

In scope: Keystone, Ledgerline, the LOS and two financial reports. Excluded: digital banking, AML, off-balance-sheet platforms and ATM management, each with the control that covers the risk. Reliance on Northline depends on the report, the gap-period procedures and Lakeridge's CUECs. We expect Lakeridge's CUECs to fail, and have told the engagement team to plan substantive work accordingly.

