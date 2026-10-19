# MEMO-02 Correction to the Interim Memo
## Port Alder Community Church | Advisory engagement AO-2026-001

> **Constructed scenario.** The church, vendors and people are fictional. This memo is published because owning an error in writing is part of the work. The note after it explains what went wrong and what changed in my practice.

| | |
|---|---|
| **To** | Finance Committee, Port Alder Community Church |
| **Copy** | Board Chair; Lead Pastor |
| **From** | Adewale Odeja, CISA |
| **Date** | Wednesday, December 9, 2026, 9:00 AM |
| **Re** | Correction to interim memo of December 4, 2026 |

*This memo comes from an advisory engagement. It does not provide assurance, and it is not an audit or a PCI DSS assessment.*

## 1. The correction

**The interim memo of December 4 said the website giving page falls under SAQ A-EP. That is wrong. The giving page falls under SAQ D, the most demanding set of card security rules.**

The December 4 memo said in section 5 that a server review could change this conclusion. It should have said so in the first line. That was my error in presentation, and I have changed how I write conclusions that depend on open checks.

## 2. Why it changed

On December 8 I reviewed the website's server files for the first time. Access had not been available before then.

- The donation software has a fallback. When the processor's software fails to load in a donor's browser, card details are sent to the church's own server instead.
- Since April 29, 2025, a setting in the donation software has written every failed attempt to a log file on the server, including full card number, expiry date and security code. The setting appears to have been enabled during the vendor's support work.
- There are 214 entries, from April 29, 2025 to December 6, 2026.

## 3. What has happened since

| Time, Dec 8 | Action |
|---|---|
| 10:21 | Logging switched off |
| 10:38 | Public web access to the log folder blocked by the host. Files preserved, not deleted |
| 10:52 | Board chair informed, under section 7.3 of the engagement letter |
| 12:40 | Card form removed from the website. Online giving now goes through the recurring giving platform |
| 1:30 | Insurer notified |
| 1:45 | Charity lawyer engaged on notification questions |
| 2:10 | Processor notified by the treasurer. Case opened |

The host's records for the last 14 days show no outside access to the files. Older records do not exist, so earlier access can neither be confirmed nor ruled out.

## 4. What changes in the December 4 recommendations

| Original recommendation | Now |
|---|---|
| Move the giving page to the processor's hosted payment page | **Still the right fix, and now a precondition** for card giving to return to the website |
| Remove extra scripts from the giving page | Overtaken. The card form is no longer on the website |
| Complete the domain recovery | Unchanged. Still urgent |
| File the annual self-assessment | Deferred until the processor advises |
| Name a paid person responsible for the website | Unchanged, and more important |

## 5. What I don't yet know

- Whether anyone accessed the files before the last 14 days.
- How many of the 214 entries are distinct cards.
- Whether a forensic investigation will be required. That is for the processor and the card brands.
- What the church must tell affected donors. That is for the church's lawyer.

---

## Note: what went wrong, and what I changed

The December 4 memo was accurate. Its limitations section said plainly that two open checks could move the website to SAQ D. But its first bullet, the line the committee member who asked for it actually read, said "SAQ A-EP" in bold. He told his family the website was basically fine.

A limitation that sits in section 5 does not exist for most readers. **When a conclusion depends on an open check, the condition goes in the headline**: "Based on browser testing, the page appears to fall under SAQ A-EP. A server review on December 8 could change this."

The finance committee also asked a fair question: could I have looked sooner? Yes. The former volunteer who held the hosting account could have shared his screen ten days earlier. I preferred to wait until someone from the church could be present, which the engagement letter favours. I conceded the timing in the meeting rather than defending it. The memo correction, the hours spent on it and that meeting were not billed.
