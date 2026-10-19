# WP-GIV-02 Refunds and Credits Testing
## Port Alder Community Church | Advisory engagement AO-2026-001

> **Constructed scenario.** The church, processor and people are fictional. This is the version of the workpaper that went into the management draft. The restricted section, reported only to the board chair under the engagement letter, is described here but not reproduced, in the same way a real file would handle it.

| | |
|---|---|
| **Prepared by / date** | A. Odeja / December 9, 2026 |
| **Objective** | Confirm every refund or credit returned money to the original donor for a valid reason |
| **Population** | All 27 refunds and credits processed in the Lakeport merchant portal, January 1, 2025 to November 17, 2026 (evidence request item 13, unedited export) |
| **Sample** | All 27. The population was small, the control risk high, and a full population avoids any argument about sample selection |
| **Evidence inspected** | Lakeport refund report with type, last four digits and time; original transactions; the giving@ mailbox for donor requests; donor notes in the church management system |

## 1. Why this test

The walkthrough on November 17 found three conditions that, together, make refunds the classic way money leaves a small merchant account:

1. **One shared login.** All office staff sign in as office@. The sign-in code goes to a mobile phone kept on a desk.
2. **No approval.** Any refund of any amount, with no second person.
3. **Credits to any card.** The portal allows a "credit to a different card", used when a donor's original card has been replaced.

On November 24, during the donation trace, the credit function was observed working with no limit and no approval. The test was planned before that, and run exactly as planned.

## 2. Attributes

| Ref | Attribute |
|---|---|
| A | An original transaction exists |
| B | Money went to the original card, or a documented reason exists for a different card |
| C | Amount does not exceed the original |
| D | A donor request is on file |

## 3. Results

| Group | Count | Total | Result |
|---|---|---|---|
| Refunds to the original card, matching a duplicate charge from website errors | 19 | $1,615 | A, B, C pass. D: 16 of 19 with a donor email, 3 without. Minor |
| Credits to a different card, with the donor's emailed request and a donor record note | 3 | $275 | All attributes pass |
| Credits to a different card, with no supporting record | 5 | $2,340 | **Exceptions. Referred to the board chair** |
| **Total** | **27** | **$4,230** | 22 supported, 5 unsupported |

## 4. What happened to the five exceptions

The five unsupported credits shared characteristics that made them a possible indicator of fraud, and the engagement letter is explicit about what happens next:

> **Section 7.1.** If I find information that indicates possible fraud, theft or another illegal act, I will stop work on that matter, preserve what I have, and report it promptly and in confidence to the board chair. **Section 7.2.** I will not investigate further, interview anyone about the matter, or draw conclusions about any individual.

So I did four things and no more:

1. **Stopped.** No further analysis of the five transactions.
2. **Reported in person to the board chair** on December 9, with a single printed copy of the restricted detail, left with her for counsel.
3. **Recommended** legal advice and a forensic accountant; asking the processor to disable credits to other cards (a sound control change in its own right); and notifying the insurer under the crime coverage.
4. **Agreed the report wording with the church's counsel** before the draft went to staff: the counts, the total, and the fact of referral. Nothing that would identify a card, a date or a person.

**What the restricted section held:** destination card, link (or lack of one) to any donor, the gifts reversed, the timing pattern, and who could have processed them. The evidence narrowed the window but did not identify who issued any of the credits, because every one was processed under the shared login.

**What I did not do:** ask anyone about them, confirm or correct a director's guess about who was in the office, or express any view in the report. When a staff member made a remark about the timing during the draft findings meeting, which the draft did not contain, I recorded the words verbatim, said only that I could not discuss the matter, and passed the note to the chair without drawing any conclusion.

## 5. Conclusion

Twenty-two of 27 reversals are supported. Five credits totalling $2,340 are unsupported and have been referred under section 7.1. The control weaknesses that made them possible (shared login, no approval, credits to any card, no review) are reported in the normal way as finding F4, rated **High**.

**Recommendations, accepted by management:**

- A personal Lakeport login for each user, each with its own sign-in confirmation.
- Credits to cards other than the original disabled by the processor.
- A monthly refund report, reviewed and initialled by someone who does not issue refunds.

**Ninety-day check:** individual logins and the processor's confirmation that credits to other cards are disabled were both evidenced by January 14, 2027. The monthly review operated for January and February and slipped for March. It is the control most likely to fade quietly, and the ninety-day letter asked the finance committee to request it at every meeting.

## 6. The lesson in this workpaper

In an organisation too small to separate duties, nobody inside the process can check it. The compensating control is a **review by someone outside it**. One question asked quarterly by the board, "what refunds were issued, by whom, to which card, and who reviewed them?", would very likely have surfaced this pattern within months.
