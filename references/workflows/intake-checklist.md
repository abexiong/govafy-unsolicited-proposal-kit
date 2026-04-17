# Mode 2 — Intake Checklist Workflow

> **Purpose.** This file is the agent contract for **Mode 2**, the medium-rigor middle option. The user picked "Intake Checklist" at the entry-point question because they want to make sure nothing gets missed but they don't want the heavy ceremony of Mode 3's seven sign-off gates. Mode 2's pattern is **collect everything up front in one structured pass, then draft together flexibly**.

---

## Mode contract

When the user picks Mode 2, the agent commits to the following rules for the rest of the engagement:

1. **One structured intake pass.** The agent walks the user through `intake-fields.md` in a single sequential pass — Group A → Group B → Group C → Group D → Group E → Group F → Group G → Group H → Group I — collecting answers for each field. Conversational tone, not a web form, but every group is covered before drafting begins.
2. **Document attachment requests are surfaced explicitly.** When the agent encounters an `[ATTACH]` field in `intake-fields.md`, it pauses and asks the user to paste the document or attach the file. Examples: pilot data report, patent filings, key personnel resumes, past performance contract numbers.
3. **The eligibility verdict is derived from collected answers**, not asked separately. Group C of `intake-fields.md` is the FAR 15.603(c) six-part test — the agent uses those answers to compute pass/fail and announces the verdict before drafting starts.
4. **After intake is complete, drafting is flexible.** No phase-by-phase sign-off gates. The agent walks through `guide.md` Sections 6, 7, and 8 in a natural progression and produces draft sections, but it doesn't pause for explicit "ready to proceed?" confirmations between every block.
5. **At the end, the agent runs Appendix F and invokes `render-output.md`** to produce the final .docx or PDF, same as all other modes.

**The user can switch modes at any time.** If they say "this is too much, drop to conversational" or "I want the full workflow with sign-off gates," the agent re-offers the mode choice and transitions without losing collected context.

---

## Step 1 — Open the intake

The agent introduces the mode and sets expectations:

> Great — we're in **Intake Checklist** mode. Here's how this works:
>
> I'm going to walk you through nine groups of questions covering everything I need to draft a compliant federal unsolicited proposal: your company identity, the target agency, the FAR 15.603(c) eligibility test, the technical substance, key personnel, cost, past performance, disclosures, and timing. Some of the questions will ask you to paste a document or attach a file (pilot data, patent filings, resumes — I'll tell you why each one matters when we get there).
>
> The whole intake usually takes 20–40 minutes depending on how much you have ready. After we're done, I'll summarize everything back to you for confirmation, run the eligibility verdict, and then we'll draft the proposal together using your real data. At the end, I'll ask whether you want the final file as Word .docx or PDF.
>
> Ready to start with Group A — Company Identity?

Wait for the user to confirm before opening Group A.

---

## Step 2 — Walk through `intake-fields.md` in order

The agent reads `references/workflows/intake-fields.md` and walks the user through every group in sequence. **Important: do not load the entire intake-fields.md content into the user's view as a wall of text.** Instead, present each group as a conversational block.

For each group, the agent does the following:

### 2a. Introduce the group

State what the group is for and why it matters. Example for Group A:

> **Group A — Company Identity.** This is the legal identity of your offeror. Everything here lands in the cover page or Section 1 of the proposal under FAR 15.605(a). Most of these you can answer from memory or pull from your SAM.gov profile.

### 2b. Ask for the fields

Ask the questions conversationally, in plain English, with the "where to find it" hint when relevant. Example:

> 1. What's the **legal name** of your company as it appears on your SAM.gov registration?
> 2. What's the **mailing address**?
> 3. What's your **CAGE Code**? (If you don't have it memorized, log into SAM.gov → Entity Overview — it's a 5-character alphanumeric code)
> 4. What's your **UEI**? (Same place — Entity Information. 12 characters, replaced DUNS in 2022)
> 5. What's your primary **NAICS code**? (Should be on your SAM.gov NAICS Codes page — for software it's usually 541512 or 541511)
>
> ...and so on through every required field in Group A

Skip `[OPTIONAL]` fields if the user doesn't have them — say "skip" or "don't have it" and the agent moves on. For `[REQUIRED]` fields the user can't answer immediately, the agent helps them find the information (e.g., walks them through SAM.gov navigation) before continuing.

### 2c. Surface `[ATTACH]` requests explicitly

When a field is tagged `[ATTACH]`, the agent pauses and asks for the document. Always explain *why* the document is needed:

> 6. Now I need you to **attach your most recent pilot data report** if you have one. This is so the technical approach section can cite real metrics instead of placeholder numbers. Paste the contents into the chat, or drag-and-drop the PDF if your environment supports it. If you don't have pilot data yet, say "no pilot" and we'll structure the proposal as a research/feasibility effort.

If the user can't or doesn't want to attach the document, the agent notes the gap and continues — but flags it in the final summary so the user knows which fields are using placeholder values.

### 2d. Summarize the group back

After collecting a full group, the agent summarizes back what the user provided in plain English:

> Got it — here's what I have for Group A:
>
> - **Legal name:** Umbra Signals, Inc.
> - **Address:** 1100 Wilson Boulevard, Suite 800, Arlington, VA 22209
> - **CAGE Code:** [user-provided value]
> - **UEI:** [user-provided value]
> - **NAICS:** 541512 (Computer Systems Design Services)
> - **Size standard:** $34M (small)
> - **Certifications:** WOSB (SBA-certified)
> - ... etc.
>
> Look right? Anything to correct before I move to Group B?

Wait for confirmation, then move to the next group.

### 2e. Repeat for all nine groups

Repeat steps 2a–2d for **Groups B through I** in order:

- **Group B — Target agency** (agency, mission center, prior contacts, SAM.gov sources-sought check)
- **Group C — Eligibility answers** (the six FAR 15.603(c) tests)
- **Group D — Technical substance** (product, innovation moat, patents, pilot data attach, white papers attach)
- **Group E — Key personnel** (PI, operational lead, program executive, program manager — with resume attaches)
- **Group F — Cost model** (labor hours, rates, subs, ODCs, indirect, fee, rate justification attach)
- **Group G — Past performance** (3–5 references with full detail and permission to contact)
- **Group H — Other disclosures** (OCI, clearances, environmental, other agencies, related federal funding)
- **Group I — Timing** (validity period, contract type, duration, phase breakdown)

After Group I, the intake is complete. Total time: typically 20–40 minutes for a prepared user, longer if the agent has to help find SAM.gov fields or chase down documents.

---

## Step 3 — Final intake summary

The agent presents a single one-page summary of everything collected, organized by group. This is the user's last chance to catch transcription errors before drafting begins.

The summary includes:
- A bulleted list of every field collected, by group
- A flag for any field that the user marked "skip" or couldn't provide
- A flag for any `[ATTACH]` field that didn't get a document
- A clear note about what fields will use placeholder values vs. real data

The agent asks: *"Anything to correct or add before I run the eligibility verdict?"* and waits for confirmation.

---

## Step 4 — Eligibility verdict

The agent computes the FAR 15.603(c) verdict from the Group C answers. Six tests, all must be "yes":

1. Innovative and unique
2. Independently originated
3. No government supervision
4. Sufficient detail
5. No duplication of existing effort
6. Not a known requirement (validated by the SAM.gov sources-sought check from Group B)

The agent presents the verdict as a clear pass/fail table with one-line reasoning for each test. Example:

> ## Eligibility verdict: **PASS** ✅
>
> | # | Test | Verdict | Reasoning |
> |---|---|---|---|
> | 1 | Innovative and unique | ✅ | Behavioral biometrics + linguistic drift correlation is not in any current DoD UAM stack |
> | 2 | Independently originated | ✅ | Founded in 2023 by three founders, no government direction |
> | 3 | No government supervision | ✅ | Retired DCSA advisor (left 2021), no active federal involvement |
> | 4 | Sufficient detail | ✅ | Working prototype, 18-month pilot with 450 users, ROM cost model with line items |
> | 5 | No duplication | ✅ | DITMAC public report flags pre-incident detection as a capability gap |
> | 6 | Not a known requirement | ✅ | SAM.gov sources-sought check from 2026-04-10 returned no matches |
>
> All six tests pass. We can proceed to drafting.

**If any test fails**, the agent stops, explains why, and recommends the alternative channel (SBIR/STTR, BAA, OTA, sources-sought response, GSA Schedule, subcontracting). It does not draft content for an ineligible idea.

---

## Step 5 — Template selection

If the verdict is pass, the agent picks the closest template using the decision tree from `guide.md` Section 12:

- **Research/invention/novel tech** → General Sample 1 (Innovation/R&D)
- **Services with an innovative approach to a known problem** → General Sample 2 (Mission-Solution) — most common fit
- **Time-bound or emerging crisis** → General Sample 3 (Crisis/Rapid-Response)
- **If the target agency from Group B matches a specific sample** (DCSA, USSOCOM, MCSC, GSA PBS, OPM, FEMA) → prefer the specific sample for agency-particular mission language

The agent announces the template choice and explains why in one sentence:

> I'm using **Specific Sample 1 (SentinelMind / DCSA)** as the structural scaffold because your target agency is DCSA and the innovation pattern is similar (AI-driven behavioral analytics for cleared workforces). I'll lift the structure, the FAR citations, and the section ordering — every name, number, and fact comes from your intake.

---

## Step 6 — Drafting handoff

Now the agent walks through `guide.md` Sections 6 → 7 → 8 to produce draft sections of the proposal, using the user's collected intake data. The drafting is **flexible** — no phase-by-phase sign-off gates — but it covers every required section.

### 6a. Part 1 — Basic Information (FAR 15.605(a))

Using Group A and Group B data, the agent drafts:
- Cover page (offeror identity, title, target agency, date, validity period)
- Section 1.1 — Offeror description
- Section 1.2 — Points of contact (technical, business, authorized representative)
- Section 1.3 — Identification of proprietary data (lists which sheets contain restricted material)
- Section 1.4 — Other parties receiving the proposal
- Section 1.5 — Date of submission
- Section 1.6 — Authorized representative signature line

### 6b. Part 2 — Technical Information (FAR 15.605(b))

Using Group D, Group E, and Group B data, the agent drafts:
- Section 2.1 — Title and 199-word abstract (written last, after the rest of Part 2 is done)
- Section 2.2 — Objectives (3–5 specific, measurable goals)
- Section 2.3 — Method of approach (phased execution plan)
- Section 2.4 — Anticipated results (specific deliverables)
- Section 2.5 — Mission support statement (explicit tie to the agency's published priorities — uses Group B's "agency strategic priorities cited" data)
- Section 2.6 — Key personnel (uses Group E data — names, bios, commitment percentages, clearances)
- Section 2.7 — Type of support needed from the government

### 6c. Part 3 — Supporting Information (FAR 15.605(c))

Using Group F, G, H, and I data, the agent drafts:
- Section 3.1 — Proposed price (uses Group F data — line-item ROM cost table)
- Section 3.2 — Period of validity (from Group I)
- Section 3.3 — Type of contract preferred (from Group I)
- Section 3.4 — Proposed duration of effort (from Group I)
- Section 3.5 — Organization description, experience, and facilities (uses Group A and Group G)
- Section 3.6 — Conflicts of interest, security clearances, environmental impacts (Group H)
- Section 3.7 — Names and phone numbers of prior agency contacts (Group B)

### 6d. FAR 15.609 IP Protection

Using `guide.md` Section 7 and Appendices B and C, the agent applies:
- The verbatim title-page legend from Appendix B with the exact proprietary page numbers filled in
- The verbatim per-sheet legend from Appendix C on every page that contains restricted content
- Confirms with the user which pages should be marked as proprietary (typically: technical approach details, pilot data sheets, cost structure)

### 6e. Submission logistics (Section 8 of the guide)

The agent confirms the submission address on the target agency's website (or notes that the user must verify it on the day of submission) and provides:
- The submission POC for the target agency
- The format requirements (PDF, portal, email)
- A submission log template

---

## Step 6d — Writing-rules integration during drafting

Throughout Step 6 drafting, the agent applies the rules from `references/workflows/writing-rules.md` to every sentence it generates. Specifically:

- **Never use the banned phrases** from Rules 1–8 in any drafted content
- **Apply the "tell, don't sell" principle** — every claim must be substantiated with specifics from the user's intake answers, not marketing language
- **When drawing from the chosen sample as scaffolding**, lift the structure but rewrite the prose so it doesn't carry over the sample's tone or phrasing

If the user pastes their own content during drafting, the agent flags any banned phrases inline with the rule category and a suggested replacement.

---

## Step 7 — Final check (Appendix F + writing-rules sweep)

The agent runs `guide.md` Appendix F (Pre-Submission Checklist) — all 35 items, every one a real failure mode observed on rejected proposals. The agent walks through the checklist out loud, marking each item complete or flagging gaps.

The agent also runs the **writing-rules sweep** from `references/workflows/writing-rules.md`: greps the completed draft against the banned-phrase list and surfaces any hits with the rule category, the reason, and a suggested replacement. The user has the final say on flagged phrases but has to override knowingly.

If any Appendix F item is unchecked or any writing-rule violation remains, the agent fixes it before proceeding.

---

## Step 8 — Output rendering

The agent invokes `references/workflows/render-output.md`:

1. Asks the user: *"Would you like the final proposal as a Word .docx file or a PDF?"*
2. Runs the pre-render anti-bleed grep against the draft (catches any fictional-sample data that may have leaked from the scaffolding sample)
3. Generates the file with pandoc, using the filename convention `<company-slug>-unsolicited-proposal-<YYYY-MM-DD>.<ext>`
4. Verifies the file exists and is reasonable in size
5. Reports the saved file path with the three mandatory reminders (visual verification of the FAR 15.609 legend, legal review before submission, agency address verification on the day of submission)

After rendering, the engagement is complete.

---

## Mandatory reminders

The agent surfaces these reminders at the right moments during the workflow, not as a wall of text at the end:

1. **Fictional-data warning** — restated when the agent picks a sample as scaffolding and again immediately before rendering: *"Everything in the [SentinelMind / NeuroEdge / etc.] sample is fictional. I'm using it for structure only. Every fact in your draft comes from your intake answers."*

2. **FAR 15.609 legend rule** — restated during Step 6d: *"The exact wording of the title-page legend and per-sheet legend is non-negotiable per FAR 15.609(c). Paraphrasing disqualifies the markings."*

3. **Cost realism** — already enforced during Group F intake; restated during Step 6c when the agent drafts Section 3.1.

4. **Educational, not legal advice** — restated at the end, before invoking `render-output.md`: *"This kit is educational. Have a federal contracts or procurement attorney review the final document before submission."*

5. **Currency check** — restated during Step 6e: *"Verify the agency's submission address on [agency-domain] on the day you submit. FAR 15.606 delegates this to each agency, and addresses change."*

---

## Mode-switch note

If the user wants to switch modes mid-engagement:

1. Acknowledge the switch
2. Re-offer the four-mode selection question from the kit's entry point
3. After the user picks, transition without losing collected context. If intake Groups A–F are already done, the new mode picks up at Group G or wherever drafting was paused
4. Continue from the appropriate point in the new workflow

---

**End of intake-checklist.md (Mode 2).**
