# WP-CARD-03 PCI DSS Scope Determination
## Port Alder Community Church | Advisory engagement AO-2026-001

> **Constructed scenario.** Port Alder Community Church, Lakeport Payments, TithePath, GraceGive, MapleNest and every person named are fictional. No live environment was assessed. This page shows the determination as first written on December 2, 2026, followed by the correction made on December 9 after server access became available.

| | |
|---|---|
| **Prepared by / date** | A. Odeja / December 2, 2026. Corrected December 9, 2026 |
| **Subject** | Which PCI DSS v4.0.1 self-assessment applies to each way the church accepts cards |
| **Basis** | Observed $1 test donation from my own card (written approval, refunded same day); merchant agreements; Lakeport portal; TithePath agreement and AOC; bank confirmation of the foyer terminal; Sunday observation |
| **Nature** | Advisory determination. Not a PCI DSS assessment, and not a substitute for the church's own self-assessment or its acquirers' requirements |

## 1. Summary

| Channel | Merchant of record | Conclusion | Confidence |
|---|---|---|---|
| Website giving page (GraceGive plugin, Lakeport) | The church | **SAQ A-EP on Dec 2. Corrected to SAQ D on Dec 9** (section 6) | High after correction |
| Phone donations keyed into Lakeport virtual terminal | The church | Not eligible for SAQ C-VT as operated. **Discontinued November 30** | High |
| Recurring giving (TithePath) | TithePath, as payment facilitator | No church SAQ for this channel. Contractual and access obligations only | High |
| Foyer terminal (bank merchant services) | The church | **SAQ P2PE**, bank confirmed the device belongs to a listed P2PE solution | High |

## 2. The website giving page: how card data moves

<figure style="margin:24px 0">
<svg viewBox="0 0 760 520" role="img" aria-label="Website giving data flow as traced on November 24, 2026" style="width:100%;height:auto;font-family:var(--sans)">
<defs><marker id="ah" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse"><path d="M0 0L10 5L0 10z" style="fill:var(--muted)"/></marker>
<marker id="ahA" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse"><path d="M0 0L10 5L0 10z" style="fill:var(--accent)"/></marker>
<marker id="ahW" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse"><path d="M0 0L10 5L0 10z" style="fill:#c0392b"/></marker></defs>
<rect x="24" y="168" width="464" height="300" rx="10" style="fill:var(--accent-soft);stroke:var(--rule)"/>
<text x="40" y="456" font-size="12" font-weight="600" style="fill:var(--ink)">Church environment: in scope</text>
<rect x="508" y="168" width="228" height="300" rx="10" style="fill:none;stroke:var(--rule)"/>
<text x="524" y="190" font-size="12" font-weight="600" style="fill:var(--ink)">Lakeport Payments</text>
<g style="fill:var(--surface);stroke:var(--muted)" stroke-width="1.2">
<rect x="24" y="40" width="220" height="64" rx="8"/><rect x="516" y="40" width="220" height="64" rx="8"/>
<rect x="40" y="200" width="208" height="52" rx="8"/><rect x="40" y="320" width="208" height="52" rx="8"/><rect x="280" y="320" width="192" height="52" rx="8"/>
<rect x="524" y="204" width="196" height="48" rx="8"/><rect x="524" y="264" width="196" height="48" rx="8"/><rect x="524" y="324" width="196" height="64" rx="8"/><rect x="524" y="400" width="196" height="48" rx="8"/>
</g>
<g font-size="13" text-anchor="middle" style="fill:var(--ink)">
<text x="134" y="68" font-weight="600">Donor's browser</text><text x="134" y="88" font-size="11.5" style="fill:var(--muted)">card typed into page fields</text>
<text x="626" y="68" font-weight="600">Third-party scripts</text><text x="626" y="88" font-size="11.5" style="fill:var(--muted)">14 scripts, 6 outside domains</text>
<text x="144" y="222" font-weight="600">Church web server</text><text x="144" y="240" font-size="11.5" style="fill:var(--muted)">WordPress, GraceGive plugin</text>
<text x="144" y="342" font-weight="600">giving@ mailbox</text><text x="144" y="360" font-size="11.5" style="fill:var(--muted)">shared, Microsoft 365</text>
<text x="376" y="342" font-weight="600">Shepherd Base</text><text x="376" y="360" font-size="11.5" style="fill:var(--muted)">giving records</text>
<text x="622" y="226" font-weight="600">Tokenisation</text><text x="622" y="242" font-size="11.5" style="fill:var(--muted)">returns a token</text>
<text x="622" y="286" font-weight="600">Payment API</text><text x="622" y="302" font-size="11.5" style="fill:var(--muted)">charges the token</text>
<text x="622" y="346" font-weight="600">Merchant portal</text><text x="622" y="362" font-size="11.5" style="fill:var(--muted)">refunds, credits, terminal</text><text x="622" y="378" font-size="11.5" font-weight="600" style="fill:#c0392b">one shared login</text>
<text x="622" y="422" font-weight="600">Daily settlement</text><text x="622" y="438" font-size="11.5" style="fill:var(--muted)">net of fees, to bank</text>
</g>
<g fill="none" stroke-width="1.2" style="stroke:var(--muted)">
<path d="M516 72H252" marker-end="url(#ah)"/>
<path d="M90 104V192" marker-end="url(#ah)"/>
<path d="M144 252V312" marker-end="url(#ah)"/>
<path d="M248 346H272" marker-end="url(#ah)"/>
<path d="M248 236H500V288H518" marker-end="url(#ah)"/>
</g>
<path d="M244 120H490V228H518" fill="none" stroke-width="2.2" style="stroke:var(--accent)" marker-end="url(#ahA)"/>
<text x="370" y="114" text-anchor="middle" font-size="12" font-weight="600" style="fill:var(--accent)">card data, observed path</text>
<path d="M200 104V192" fill="none" stroke-width="1.6" stroke-dasharray="5 4" style="stroke:#c0392b" marker-end="url(#ahW)"/>
<text x="208" y="152" font-size="12" font-weight="600" style="fill:#c0392b">fallback path?</text>
<text x="380" y="58" text-anchor="middle" font-size="11.5" style="fill:var(--muted)">scripts load into the payment page</text>
<text x="374" y="230" text-anchor="middle" font-size="11.5" style="fill:var(--muted)">token charged</text>
<text x="24" y="500" font-size="12" style="fill:var(--muted)">Dashed red: not observable from the browser. Confirmed on December 8 when server files were reviewed (section 6).</text>
</svg>
<figcaption class="muted" style="font-size:14px">Website giving as traced with a $1 donation on November 24, 2026.</figcaption>
</figure>

1. The card fields are rendered by the church's own page, not inside an iframe served by Lakeport, and the donor is not redirected. **This rules out SAQ A.**
2. On submission, card data went from the browser directly to Lakeport's tokenisation endpoint. The church's server received a token, the amount and donor details, and no card data. On this path the server does not receive, store or transmit card data: the SAQ A-EP pattern.
3. Because the church's server builds and delivers the page that collects card data, the server, its software and the 14 scripts it loads are in scope. Under SAQ A-EP this includes requirements 6.4.3 (payment page script authorisation and integrity) and 11.6.1 (change and tamper detection).

**A note on SAQ A.** Since the January 2025 revision of SAQ A, requirements 6.4.3 and 11.6.1 no longer appear in it. They are replaced by an eligibility criterion: the merchant confirms its site is not susceptible to attacks from scripts. They still apply in full under SAQ A-EP and SAQ D. That is why the giving page's design, not just its controls, decides the obligation.

## 3. Phone donations

1. Staff keyed card numbers read aloud by donors into Lakeport's virtual terminal, on the general office computer.
2. SAQ C-VT requires the virtual terminal to be used from a computer isolated from the rest of the environment, with no electronic storage of card data. The office computer runs email, the church management system and general work. **Not eligible.**
3. On November 24 a notebook beside the office phone was found holding 38 entries since March 2023, each with card number, expiry and security code. Storing the security code after authorisation is prohibited for every merchant (requirement 3.3.1). It was reported to the board chair the same day under the engagement letter, then destroyed by cross-cut shredding with the treasurer as witness. Only the count and date range were recorded.
4. Phone card donations stopped on November 30. With keyed entry gone, the Lakeport account's only card channel is the website.

## 4. Requirements in evidence as not in place (website)

Not a full SAQ. These are the requirements where evidence already showed a gap.

| Requirement | What it expects | Observed |
|---|---|---|
| 6.3.3 | Security patches applied promptly | WordPress 6.1.1, PHP 7.4 (end of life), 9 of 23 plugins with updates pending |
| 6.4.3 | Every payment page script authorised, justified, integrity assured | 14 scripts from 6 domains, no inventory |
| 11.6.1 | Change and tamper detection on payment page content and headers | None. No Content-Security-Policy header |
| 8.2.2 | Shared accounts by exception only, with individual accountability | Shared WordPress administrator |
| 11.3.2 | Quarterly external scans by an Approved Scanning Vendor | Never performed |
| 12.8 | Service providers managed, written acknowledgment, status monitored | Web host has no agreement with the church and offers no AOC |

The church had never filed a self-assessment. Lakeport had charged a $24.95 monthly non-validation fee since March 2023, about $1,100 to date.

## 5. Limitations, as written on December 2

1. **Server-side files have not been reviewed.** The hosting account is held in a former volunteer's name. Until it is reviewed, it is not possible to confirm that no copy of card data exists on the server.
2. **Plugin behaviour on failure is unconfirmed.** The test observed one successful path. The plugin vendor was asked in writing how the page behaves if Lakeport's script fails to load. No reply.
3. **If either check finds card data reaching or stored on the church's server by any path, the website is SAQ D, not SAQ A-EP.**

## 6. Correction, December 9, 2026

The server review on December 8 found that both limitations applied.

- The plugin falls back to sending card fields to the church's own server when Lakeport's script fails to load.
- A plugin setting, enabled during the vendor's support work in April 2025, logged every failed attempt to a file in a publicly reachable folder: **214 entries, with full card number, expiry and security code**, from April 29, 2025 to December 6, 2026.
- Logging was switched off within seven minutes of the discovery and public access blocked within twenty-four. Nothing was deleted. The board chair was told the same morning, and the treasurer reported to Lakeport that afternoon.

**Corrected conclusion: the website giving page fell under SAQ D.** Section 5 described exactly this possibility, but the December 4 interim memo led with "SAQ A-EP" and put the condition in its last section. The correction memo owns that. See [Correction to the interim memo](correction-memo.html).

## 7. Recommendation

| Option | What changes | Effect on scope |
|---|---|---|
| **A. Recommended.** Lakeport hosted payment page or hosted fields | Card entry happens on a page or frame served by Lakeport | SAQ A, subject to the script eligibility criterion |
| B. Keep the church-built page and implement the controls | Script inventory, CSP, change detection, patching, ASV scans, host agreement | SAQ D. Ongoing work no one at the church can own |

A volunteer-run church cannot operate controls designed for e-commerce teams. The right answer is to design the obligation away. Card giving returned to the website on February 22, 2027, entirely on Lakeport's hosted page.
