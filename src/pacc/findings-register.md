# FR-01 Findings Register
## Port Alder Community Church | Advisory engagement AO-2026-001

> **Constructed scenario.** The church, vendors and people are fictional. Advisory engagement: findings describe conditions observed during fieldwork. They are not an audit opinion and provide no assurance. Ratings shown are final, after the draft findings meeting with management on December 10, 2026.

## 1. Rating scale

| Rating | Meaning | Expected response |
|---|---|---|
| **Critical** | Harm to donors or the church has occurred or is likely now, or a legal or contractual obligation is being breached | Act immediately. Board chair informed |
| **High** | A significant loss, exposure or breach could happen and would probably not be detected promptly | Fix within 90 days, with board oversight |
| **Medium** | A weakness that matters, but other factors limit likelihood or impact | Fix within 6 months |
| **Low** | Good practice improvement | Fix when practical |

Detection weighs most. In an organisation with four staff, where duties cannot be separated, a problem nobody would notice is rated higher than the same problem a regular check would catch.

## 2. Summary

| # | Finding | Rating | Criteria |
|---|---|---|---|
| F1 | Card data stored on the website server | **Critical** | PCI DSS 4.0.1 req. 3.3.1, 3.5.1; merchant agreement |
| F2 | Website card giving under SAQ D without the required controls | High | PCI DSS 4.0.1 req. 6.3.3, 6.4.3, 11.6.1, 11.3.2, 12.8 |
| F3 | Domain, DNS and hosting held personally by a former volunteer | High | Ownership of critical assets |
| F4 | Refunds: shared login, no approval, credits to any card | High | Individual accountability; independent review |
| F5 | Offering custody and count | High | Dual custody of cash |
| F6 | No reconciliation of giving records to count, processor and books | High | Records used for receipting reconciled to accounts |
| F7 | Shared administrator accounts; no leaver process | High | Named accounts, least privilege, timely removal |
| F8 | Email impersonation and payment change verification | Medium (lowered from High) | SPF (RFC 7208), DKIM, DMARC (RFC 7489) |
| F9 | Receipts: template gaps; paid events receipted as gifts | Medium | Income Tax Regulations s. 3501; CRA split receipting |
| F10 | Vulnerable sector screening: lapsed checks; record handling | High | Church policy; PIPEDA principles 4.5, 4.7 as benchmark |
| F11 | Privacy notice contradicted by trackers on sensitive pages | Medium | PIPEDA principles as benchmark |
| F12 | No church-held copy of giving or accounting records | Medium | Recoverability |
| F13 | Foyer terminal: refund code on a label; no tamper checks | Medium | PCI DSS 4.0.1 req. 9.5.1 |
| F14 | Board receives too little to detect a problem | Medium | ONCA director duties; oversight |
| F15 | Fraud loss paid from the benevolence fund; insurer not notified | Low | Restricted funds; policy conditions |
| F16 | 2024 T3010 filed nine days late | Low | Income Tax Act filing deadline |

**Totals:** 1 Critical, 7 High, 6 Medium, 2 Low.

## 3. Selected findings in full

### F1. Card data stored on the website server · Critical

- **Condition.** A setting in the donation plugin wrote 214 failed payment attempts, including full card number, expiry and security code, to two files in a publicly reachable folder on the shared web server, from April 29, 2025 to December 6, 2026.
- **Criteria.** PCI DSS 4.0.1 requirement 3.3.1 (security codes must not be kept after authorisation) and 3.5.1 (stored card numbers must be unreadable); Lakeport merchant agreement.
- **Cause.** The plugin falls back to sending card data to the server when the processor's script fails to load. Logging appears to have been enabled during the vendor's own support work. No one at the church was responsible for the website, and no one reviewed its settings.
- **Effect.** Possible exposure of donors' card data for about 19 months. Access before the host's 14 days of retained logs cannot be ruled out. Possible forensic costs and card brand assessments passed on by the processor; loss of donor trust.
- **Recommendation.** Follow the processor's instructions in full. Do not delete the files until the processor and counsel agree. Do not return card entry to the website until F2's recommendation is in place. Follow counsel's advice on notifying donors.
- **Response.** Contained December 8: logging disabled in 7 minutes, public access blocked in 24, files preserved. Chair, insurer, counsel and processor informed the same day. Processor's assessment still open at report date.

### F4. Refunds: shared login, no approval, credits to any card · High

- **Condition.** All staff share one processor login, with the sign-in code sent to a shared phone. Refunds have no limit, no second approval and no review. Credits to any card number are allowed. Of 27 refunds and credits tested, 22 were supported. **Five were not, and were referred to the board chair under section 7.1 of the engagement letter.**
- **Criteria.** Individual accountability for financial transactions; refunds to the original payment method; independent review.
- **Cause.** The account was set up with one login, and nobody ever reviewed refund activity.
- **Effect.** Money can leave without detection, and no record can show who sent it. That is unfair to everyone who uses the login.
- **Recommendation.** Personal logins; credits to other cards disabled; monthly refund report reviewed by someone who does not issue refunds.
- **Response.** Accepted. See [WP-GIV-02](refund-testing.html).

### F5. Offering custody and count · High

- **Condition.** Plates emptied into an unsealed bag carried by one person, on the observed Sunday a teenager. Counters count separate piles without re-counting. One counter completed the count alone on the observed Sunday and on 2 of 12 tested Sundays. Cheques not endorsed. Safe code unchanged since 2019 and known by seven people, including a former counter.
- **Criteria.** Dual custody of cash from collection to deposit.
- **Cause.** Long-standing practice, never written down.
- **Effect.** A loss before or during the count would not be detected, and counters cannot be protected from suspicion if a question arises.
- **Recommendation.** Written procedure; tamper-evident bags sealed at collection and carried by two adults; both counters count all cash; count suspended if one must leave; endorsement stamp; safe code changed and limited to three people.
- **Management disagreement.** *"In nine years there has been no loss, and the deposits match the count every time. I believe this should be Medium. I accept the recommendations."* (Treasurer)
- **Why the rating stayed High.** All 12 tested deposits matched their count sheets to the cent. That is exactly what a loss before the count would look like. The rating reflects the absence of anything that would detect a loss, not a suggestion that one occurred. The treasurer's view is recorded in the board report beside the finding.

### F8. Email impersonation and payment change verification · Medium (proposed High)

- **Condition.** Two conflicting SPF records (a permanent error under RFC 7208), no DKIM signing and DMARC at p=none allowed the September message showing the pastor's real address to be delivered. Microsoft 365 sign-in logs showed his mailbox was not accessed: impersonation, not compromise. Call-back on supplier banking changes was informal.
- **Criteria.** Email authentication good practice; documented verification of payment instructions.
- **Recommendation.** Fix SPF, enable DKIM, move DMARC to quarantine then reject; written rule that any bank change or gift card request is confirmed by phone on a number already on file.
- **Why the rating moved.** At the draft findings meeting, management brought evidence: SPF fixed and DKIM enabled, DMARC at quarantine that morning, and the written call-back rule signed by all staff. That changed likelihood, which is what the rating measures. **A rating moves when the evidence moves, not when someone pushes.**

### F10. Vulnerable sector screening · High

- **Condition.** 3 of 64 volunteers serving with children had lapsed checks, by 2, 5 and 8 months, and were still serving. Scans of checks forwarded to the safeguarding lead's personal email and saved in a folder shared with nine people. Records kept since 2014, including 31 people who no longer volunteer.
- **Criteria.** Church screening policy; PIPEDA fair information principles 4.5 (limiting retention) and 4.7 (safeguards), used as a benchmark of good practice. PIPEDA's application to a charity's non-commercial activities is limited, so the report does not assert non-compliance with it.
- **Recommendation.** No one serves without a current check; expiry alerts in the church management system; one restricted folder, never personal email; retention rule agreed with counsel.
- **Response.** The three volunteers stepped back the same day the finding was discussed. Personal email cleared that evening.

## 4. Remediation at ninety days

32 remediation actions were adopted by the board on January 5, 2027. At the ninety-day check on April 2:

| Status | Count |
|---|---|
| Done, evidence seen | 21 |
| Reported done, evidence not yet seen | 3 |
| In progress | 6 |
| Not started | 2 |

"Done" means the evidence named in the plan was seen, not that someone said so.
