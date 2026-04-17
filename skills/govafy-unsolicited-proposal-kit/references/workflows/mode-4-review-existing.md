# Mode 4 — Review Existing Proposal

> **Purpose.** This file is the agent contract for **Mode 4**, the review-existing-proposal workflow. The user picked this mode at the entry-point question because they **already have a proposal draft** — written by themselves, a consultant, a grant writer, a former federal contracting officer, or a previous engagement — and they want a Govafy-grade second opinion before submitting. Mode 4 does not draft content from scratch. It reviews what the user brings, produces a structured critique report, and gives them a clear go/revise/rethink recommendation.

---

## Who this mode is for

Mode 4 is for users who fall into one of these scenarios:

- **"I paid a consultant to write this and I don't know if it's good."** Most common case. The user has a draft from a paid proposal coach and wants an independent review before committing to submission.
- **"I wrote this myself and I want a sanity check."** Self-drafted proposal, user wants to catch mistakes before the agency does.
- **"My company submitted this to Agency X a year ago and it was rejected. I want to revise it for Agency Y."** Recycling a prior effort with changes.
- **"I inherited this draft from a previous employee / team and I need to know if it's usable."** Legacy content with unclear quality.
- **"I want to use this as a starting point but I know parts of it are wrong."** User knows the draft has issues but can't pinpoint them.

Mode 4 is **not** for users who have only a concept or an outline and want help writing from scratch — those users belong in Mode 1, 2, or 3.

---

## Mode contract

When the user picks Mode 4, the agent commits to the following:

1. **No drafting from scratch.** The agent does not generate new proposal sections. It reviews what the user provides and recommends specific edits. If the agent decides the draft is unsalvageable and the user needs to start over, the agent says so and offers to switch to Mode 2 or Mode 3.
2. **Structured critique report as the primary deliverable.** Not inline comments, not a stream of observations — a formal report organized by review sweep, with a top-10 prioritized edit list and an overall go/revise/rethink verdict.
3. **Seven review sweeps applied in order** (detailed below). Each sweep is a specific, named check that looks for one class of problem.
4. **Document request at the start.** The user must paste or attach their existing draft before any review happens. Mode 4 cannot proceed without the draft.
5. **Optional rendering at the end.** The agent offers to render the critique report as a Word .docx or PDF via `render-output.md`, with a clear distinction from the user's actual proposal file (which the agent does NOT modify — Mode 4 is read-only on the user's draft).
6. **The user can switch modes at any time.** If the review reveals the draft is unsalvageable and needs a rewrite, the agent re-offers the mode choice and transitions to Mode 2 or Mode 3 carrying forward whatever review findings are relevant.

---

## Step 1 — Kickoff and draft intake

The agent opens the mode with this message (verbatim):

> Welcome to **Mode 4 — Review Existing Proposal**. I'll run your existing draft through seven review sweeps and produce a structured critique report. Before I can start, I need you to paste your draft proposal or attach it as a file.
>
> **What format works:** Markdown, plain text, a pasted Word document, or a file path I can read. If it's a PDF, paste the text contents — I can't OCR scanned images.
>
> **What I'll review:** The seven sweeps I run are (1) a section-by-section gap analysis against FAR 15.605 required content, (2) the FAR 15.603(c) six-part eligibility test derived from your draft's claims, (3) a writing-rules sweep for banned phrases, (4) a fictional-data sweep for accidental leakage from any AI-generated template, (5) a red-team sweep for strategic weaknesses, (6) a cost realism check against FAR 15.606-2 evaluation factors, and (7) the Appendix F pre-submission checklist.
>
> **What I will NOT do:** I will not rewrite your draft or produce new content. Mode 4 is read-only on your file. I will recommend specific edits and, at your discretion, switch to Mode 2 or Mode 3 if the draft needs major rework.
>
> **Target agency:** Which federal agency is this proposal aimed at? I need the agency name and mission center/directorate to run sweeps 1 and 2 properly.
>
> Paste your draft when ready.

Wait for the user to paste the draft AND name the target agency. If they only provide one, ask for the other before proceeding.

---

## Step 2 — Parse the draft and confirm scope

Before running any sweeps, the agent parses the pasted draft to understand its structure:

1. **Count total word count** (rough indicator of completeness — real proposals are typically 3,000–10,000 words)
2. **Identify the FAR 15.605 three-part structure** — does the draft have a Part 1 (Basic Information), Part 2 (Technical Information), and Part 3 (Supporting Information)?
3. **Identify the cover page and FAR 15.609 title-page legend** — is the verbatim legend present? Are the proprietary page numbers filled in?
4. **Identify the abstract** (usually ~200 words early in the document)
5. **Identify key personnel section** — are specific people named?
6. **Identify the cost table** — is there a specific dollar figure or just prose?

The agent reports what it found: *"Your draft is 4,820 words. I see Part 1, Part 2, and Part 3 sections. I see the FAR 15.609 title-page legend on page 1 but the proprietary page numbers say 'Sheets TBD' instead of actual numbers. I see a 180-word abstract, 3 named key personnel, and a cost table with 6 line items totaling $3.4M. Ready to run the seven sweeps?"*

Wait for user confirmation before proceeding to Step 3.

---

## Step 3 — Run the seven review sweeps

The agent runs all seven sweeps and collects findings. Each sweep produces a structured result block that gets added to the critique report.

### Sweep 1 — Section-by-section gap analysis against FAR 15.605

Walk through every required section in `guide.md` Section 6 and mark it as:
- **Present + complete** — section exists and has substantive content
- **Present + thin** — section exists but is underdeveloped (e.g., "Key Personnel: TBD" or a cost table with only a lump-sum figure)
- **Missing** — section required by FAR 15.605 is absent

Sections to check:

**Part 1 — Basic Information (FAR 15.605(a)):**
1. Offeror name, address, organization type
2. Technical and business points of contact
3. Identification of proprietary data (specific page numbers)
4. Other federal/state/local parties receiving the proposal
5. Date of submission
6. Signature of authorized representative

**Part 2 — Technical Information (FAR 15.605(b)):**
1. Concise title
2. ~200-word abstract
3. 3–5 specific measurable objectives
4. Method of approach (phased execution plan)
5. Anticipated results (specific deliverables)
6. Mission support statement (explicit tie to agency's published priorities)
7. Key personnel (named people with bios and commitment percentages)
8. Type of support needed from the government

**Part 3 — Supporting Information (FAR 15.605(c)):**
1. Proposed price (specific number with breakdown)
2. Period of validity (min 6 months, ideally 9–12)
3. Type of contract preferred
4. Proposed duration of effort (with phase breakdown)
5. Organization description, past performance, and facilities
6. Conflicts of interest, security clearances, environmental impacts
7. Prior agency contacts (names and phone numbers per FAR 15.605(c)(7))

**Output of Sweep 1:** a table with each required section marked Present/Thin/Missing, plus a one-sentence comment for any thin or missing section. Total missing/thin count is reported as the "completeness score" (e.g., "18 of 21 sections present, 3 thin, 0 missing").

### Sweep 2 — FAR 15.603(c) six-part eligibility test derived from the draft's claims

Read the draft's technical approach and mission support sections, then answer the six eligibility questions *based on what the draft actually says*:

1. **Innovative and unique** — does the draft make a specific claim that would satisfy FAR 15.603(c)(1), and is that claim substantiated?
2. **Independently originated** — does the draft include language about the origin story of the idea, or is the draft silent on where the idea came from?
3. **No government supervision** — does the draft acknowledge (Section 3.7) any prior agency contact? If yes, does the contact look like permitted preliminary contact under FAR 15.604, or does it look like government guidance on the writeup itself?
4. **Sufficient detail** — is there enough technical and cost detail for an evaluator to make a decision?
5. **No duplication** — does the draft explicitly address why this approach doesn't duplicate an existing agency program? Or does the draft ignore that question?
6. **Not a known requirement** — is there any language in the draft that references an RFP, sources-sought, or RFI? If yes, the proposal may be trying to respond to a known requirement as unsolicited, which is disqualifying.

**Output of Sweep 2:** a pass/fail verdict for each test, with the quoted text from the draft that the verdict is based on. If the draft doesn't say anything about a particular test, mark it "insufficient data — user must add language to address this."

### Sweep 3 — Writing-rules sweep

Apply the full banned-phrase list from `writing-rules.md` Rules 1–8 against the draft. Report every hit with:
- The exact phrase that matched
- The rule category (Crutch / Boasting / Weak / Hidden-verb / Redundant / Long / Legal / Unsourced-agency-claim)
- The suggested replacement from the relevant table
- The location in the draft (section and approximate paragraph)

**Output of Sweep 3:** a list of all writing-rule violations, ordered by severity (Rule 2 Boasting hits are most severe, Rule 8 Unsourced-agency-claim hits are high severity for unsolicited proposals, Rule 6 long-word hits are least severe). Report total violation count and top-5 most severe.

### Sweep 4 — Fictional-data sweep

Read the canonical marker list at `references/workflows/fictional-data-markers.md` and search the user's draft for every marker listed there — every fictional company name, key personnel name, patent placeholder, email domain, CAGE code, UEI, and sample-specific pilot number across all 9 samples. Same source of truth used by `full-workflow.md` Phase 7 and `render-output.md` pre-render check.

The marker file also lists real federal program names (POTFF, X-FAB, TACFAB, PM CSS, FEI, LogVIZ, etc.) that look like sample data but are NOT — do not flag those.

**Why this sweep matters in Mode 4:** the user's draft may have been written by another AI agent using this same kit (or a similar one) as scaffolding. If the previous agent accidentally left fictional data in place, this sweep catches it before the user submits something that references a company that doesn't exist.

**Output of Sweep 4:** zero hits (clean) or a list of every hit with the quoted context. Any hit is treated as a critical finding and flagged at the top of the critique report.

### Sweep 5 — Red-team sweep (strategic weaknesses)

This is the sweep that separates Mode 4 from a generic spell-check. The agent plays adversarial reviewer and identifies:

1. **The weakest paragraph in the technical approach** — which section would a skeptical reviewer attack first? Why? Quote the paragraph and explain the weakness.
2. **The weakest cost line item** — which specific labor rate, subcontract, or ODC line would a contracting officer most likely question during cost realism review? Why?
3. **The weakest past performance reference** — which of the 3–5 references is least relevant, most stale, or most likely to get a poor CPARS score? Why?
4. **The most vulnerable uniqueness claim** — what competitor could credibly challenge the user's "unique" argument in a Notice of Intent to Sole Source under FAR 15.607? If there's no obvious competitor, note that — that's a strength.
5. **The weakest sentence in the 199-word abstract** — since the abstract is the only thing a senior reviewer may read, the weakest sentence is a disproportionate risk.

**Output of Sweep 5:** five findings with the quoted text, the adversarial argument against it, and a specific suggested edit. This is presented as *"here's what I'd attack if I were the contracting officer — fix these before you submit."*

### Sweep 6 — Cost realism check

Check the proposed price against the six FAR 15.606-2 evaluation factors, specifically factor 6 (Realism of proposed cost). Look for:

- **Lump-sum cost with no breakdown** — automatic failure
- **Labor hours × rate math that doesn't reconcile** — calculate the labor total from hours × rate and see if it matches the line item
- **Indirect cost rate missing or below 10%** — suspiciously low G&A suggests the user didn't include actual overhead
- **Fee below 5% or above 12%** — outside typical FFP range
- **Travel line missing** for a multi-phase effort that requires site visits
- **No rate justification** — FAR 15.609(a) requires rate justification to be available

**Output of Sweep 6:** a pass/questionable/fail verdict on cost realism with specific concerns flagged. This is where many unsolicited proposals die — cost realism is one of the six formal evaluation factors and is a top-three rejection reason per `guide.md` Section 11.

### Sweep 7 — Appendix F pre-submission checklist

Run the full 35-item checklist from `guide.md` Appendix F against the draft. For each item, mark:
- **Pass** — the item is complete
- **Fail** — the item is missing or wrong
- **Can't verify** — the item requires information outside the draft (e.g., "SAM.gov registration is active" can't be verified from the draft alone)

**Output of Sweep 7:** a pass/fail count (e.g., "29 of 35 pass, 4 fail, 2 can't verify") with specifics on every fail.

---

## Step 4 — Produce the structured critique report

After all seven sweeps complete, the agent produces a single structured critique report. The format is fixed — same structure every time so the user knows what to expect.

### Report structure

```
# Critique Report for [User's Company Name] — Unsolicited Proposal to [Agency]

Date of review: [YYYY-MM-DD]
Draft word count: [N]
Reviewer: Govafy.com Unsolicited Proposal Kit, Mode 4

---

## Overall verdict: [GO / REVISE / RETHINK]

One paragraph: based on all seven sweeps, is this proposal ready to submit, needs revision before submission, or needs a fundamental rethink? Lead with the verdict and explain in plain English.

---

## Critical findings (must fix before submission)

- [Critical finding 1 — usually a failed eligibility test, missing FAR 15.609 legend, or fictional data leak]
- [Critical finding 2]
- [...]

These are the items that will get the proposal rejected at initial review (FAR 15.606-1) if not fixed.

---

## Top 10 prioritized edits

A numbered list of the 10 most impactful edits, ordered by severity. Each edit specifies:
1. What to change (with quoted text from the draft)
2. Why it matters
3. The specific replacement (with example text if helpful)

This list is the user's action plan. Fix these 10 things and the proposal is meaningfully stronger.

---

## Sweep 1 — Section-by-section gap analysis (FAR 15.605)

[Present/Thin/Missing table with comments]

---

## Sweep 2 — FAR 15.603(c) six-part eligibility verdict

[Pass/Fail per test with quoted evidence]

---

## Sweep 3 — Writing-rules violations

[Top-5 most severe hits with context]

---

## Sweep 4 — Fictional-data sweep

[Clean, or list of hits]

---

## Sweep 5 — Red-team review (strategic weaknesses)

[5 findings]

---

## Sweep 6 — Cost realism check

[Pass/Questionable/Fail with specific concerns]

---

## Sweep 7 — Appendix F pre-submission checklist

[N of 35 pass count]

---

## Recommended next steps

- If verdict is GO: what to do before submission (legal review, submission address verification, submission log)
- If verdict is REVISE: which sections to prioritize and whether to stay in Mode 4 for a second pass or switch to Mode 2 or Mode 3 for deeper work
- If verdict is RETHINK: honest recommendation that the draft needs fundamental work, with suggestion to switch to Mode 3 for a full rebuild

---

## Limitations of this review

This review is educational, not legal advice. Before submission, have a federal contracts or procurement attorney review the final document — especially the FAR 15.609 proprietary markings and any language that could be read as a binding offer. Verify the agency submission address on the agency's website on the day of submission; FAR 15.606 delegates this to each agency and addresses change.

---

End of critique report.
```

---

## Step 5 — Optional rendering of the critique report

The agent asks the user:

> Your critique report is complete. Would you like me to save it as a file you can share or attach to a follow-up conversation? Options: **Word .docx** (editable), **PDF** (locked), or **Markdown** (plain text). Or I can just leave it here in the chat.

If the user picks a rendered format, invoke `references/workflows/render-output.md` with the critique report as the input. The filename convention for critique reports is different from proposals:

```
<company-slug>-proposal-critique-<YYYY-MM-DD>.<ext>
```

Example: `umbra-signals-proposal-critique-2026-04-11.docx`

**Important:** the rendered file is the **critique report**, NOT the user's original proposal draft. Mode 4 never modifies the user's actual proposal file. The user is responsible for applying the recommended edits to their own draft and re-rendering if they want a cleaned-up version.

---

## Step 6 — Offer the mode switch if verdict is RETHINK

If the overall verdict is RETHINK, the agent offers:

> Based on the review, I recommend a fundamental rework rather than incremental edits. Would you like to switch to **Mode 3 — Full Workflow** and rebuild from scratch using the kit's eight-phase process? I'll carry forward everything I learned from the review: the target agency, the eligibility verdict (and why it failed), and any substantive content from your current draft that's salvageable.
>
> Or if you prefer, I can stay in Mode 4 for a second review pass after you've made changes on your own. Your call.

Wait for user response. If they pick Mode 3, re-offer the four-mode prompt and load `references/workflows/full-workflow.md` with the collected context from the review.

---

## Mandatory reminders

Mode 4 surfaces these reminders at the end of the critique report:

1. **Fictional-data warning** — if Sweep 4 found any hits: *"Your draft contains fictional data from the kit's sample proposals or a similar AI-generated template. This must be fixed before submission — a federal proposal with made-up patent numbers or fictional pilot results is not just embarrassing, it's potentially fraud."*
2. **FAR 15.609 legend rule** — if Sweep 1 flagged the title-page legend as missing or thin
3. **Cost realism** — if Sweep 6 flagged the cost as thin or questionable
4. **Educational, not legal advice** — always
5. **Currency check** — always, for the submission address verification

---

## Mode-switch note

Mode 4 is built to hand off cleanly to Modes 2 or 3 if the review reveals the draft needs more work than a review can fix. The collected context (target agency, eligibility verdict, salvageable content, identified gaps) carries forward. The user does not have to start over.

---

**End of mode-4-review-existing.md.**
