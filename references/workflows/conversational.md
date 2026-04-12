# Mode 1 — Conversational Workflow

> **Purpose.** This file is the agent contract for **Mode 1**, the lowest-friction of the three workflow modes. The user picked "Conversational" at the entry-point question because they want an organic back-and-forth — not a structured intake form, not a heavily scripted phase machine. Mode 1 codifies the natural conversational behavior the kit was originally designed around so it stays consistent across Claude instances and across agents.

---

## Mode contract

When the user picks Mode 1, the agent commits to the following rules for the rest of the engagement:

1. **No structured intake form.** The agent does not walk the user through `intake-fields.md` as a sequential checklist. Instead it asks for information organically as the conversation progresses.
2. **No TodoWrite progress tracker.** The agent does not create a visible phase list. The interaction feels like a discussion, not a workflow.
3. **No mandatory sign-off gates.** The agent moves between topics fluidly when the conversation suggests it's time, instead of pausing for an explicit "ready to proceed?" at every transition.
4. **The agent still exercises judgment** — it asks the right questions in the right order based on the master guide (`guide.md`), it still runs the eligibility test before drafting, it still applies all the core rules (FAR citations, fictional-data warning, FAR 15.609 legend, cost realism, educational-not-legal disclaimer).
5. **At the end, the agent still runs Appendix F and invokes `render-output.md`** to produce a final .docx or PDF. Mode 1 is conversational in *interaction*, not in *output rigor*.

**The user can switch modes at any time.** If they say "actually, let's switch to the intake checklist" or "I want the full workflow now," the agent re-offers the mode choice and transitions to the new mode without losing the context already collected.

---

## Opening move — the six-question eligibility check

The first thing the agent does after the user describes their idea is run the **FAR 15.603(c) six-part eligibility test** out loud. This is non-negotiable across all modes — Mode 1 just delivers it conversationally rather than as a structured intake.

The agent asks the six questions one at a time, in plain English, using the structure from `guide.md` Section 2:

1. **Innovative and unique** — "What makes your approach genuinely new compared to what the agency and other vendors already provide? Be specific — 'we're cheaper' or 'we're better' isn't enough."
2. **Independently originated** — "Did your team come up with this on your own? Or did anyone at the target agency, DoD, or another federal office suggest the idea, review early versions, or give you direction on what to build?"
3. **No government supervision** — "Is any current federal employee helping you write this proposal? (Former employees are usually fine — I'm asking about active agency guidance on the write-up itself.)"
4. **Sufficient detail** — "Do you already have enough to describe (a) how the technology or service works at a technical level, (b) a deployment or execution plan, and (c) a cost estimate broken down beyond a single dollar figure?"
5. **No duplication** — "Have you researched what the target agency already has in this space? In-house programs, existing contracts, grants? If yes, how does your approach leapfrog them?"
6. **Not a known requirement** — "Have you checked SAM.gov for any open or recent solicitations, sources-sought notices, RFIs, or draft PWSs from this agency on the same topic? If they've already publicly asked for this, you must respond through that channel instead."

After all six are answered, the agent gives a clear pass/fail verdict and explains why. If any test fails, the agent **stops** and recommends the alternative channel (SBIR/STTR, BAA, OTA, sources-sought response, GSA Schedule, subcontracting). It does not draft content for an ineligible idea.

---

## After eligibility — walking the guide section by section

If the eligibility verdict is pass, the agent walks the user through `guide.md` **one section at a time**, in this order:

1. **Section 3 — The reality check.** Make sure the user understands that "favorable evaluation ≠ contract." Sets expectations about the 9–18 month evaluation timeline and the four-condition sole-source gate at FAR 15.607(b)
2. **Section 4 — Preliminary contact.** Help the user draft (or send) the FAR 15.604 preliminary email to the agency POC if they haven't already
3. **Section 6 — The three-part proposal format.** Walk through Part 1 (Basic Information), Part 2 (Technical Information), and Part 3 (Supporting Information) under FAR 15.605(a), (b), (c). Draft each section as a conversation
4. **Section 7 — The FAR 15.609 proprietary data legend.** Apply the title-page legend and per-sheet legend verbatim from Appendix B and Appendix C of the guide. Confirm exactly which pages contain proprietary content
5. **Section 8 — Where to submit.** Verify the agency's current submission POC on the agency's website. FAR 15.606 delegates this to each agency
6. **Section 10 — What happens after submission.** Set expectations about acknowledgement, initial review, comprehensive evaluation, and the four possible outcomes
7. **Section 11 — Twelve ways proposals get killed.** Quick sanity check against the most common failure modes

**Pull one section at a time.** Do not dump the full guide on the user — that's exactly the failure mode this workflow file exists to prevent. Wait for the user to engage with each section before moving to the next.

---

## Sample handling

When the user's situation matches one of the kit's nine fictional samples, the agent uses that sample as a **structural scaffold only**. The decision tree lives in `guide.md` Section 12:

- **Research/invention/novel tech** → General Sample 1 (Innovation/R&D)
- **Services with an innovative approach to a known problem** → General Sample 2 (Mission-Solution) — the most common fit
- **Time-bound or emerging crisis** → General Sample 3 (Crisis/Rapid-Response)
- **If the target agency matches one of the six specific samples** (DCSA, USSOCOM, MCSC, GSA PBS, OPM, FEMA) → prefer the specific sample because it shows agency-particular mission language and program names

**What the agent lifts from the matching sample:**
- The section ordering (cover page → Part 1 → Part 2 → Part 3)
- The FAR citations next to each section heading
- The 199-word abstract format
- The exact FAR 15.609 legend wording
- The tone and level of formality

**What the agent never lifts from the sample:**
- Company names (Axiom Sentinel, Nova Materials, etc.)
- Personnel names (Dr. Priya Ramanathan, Dr. Kenji Maruyama, etc.)
- Patent numbers (`11,XXX,XXX`, `18/YYY,YYY`, etc.)
- Pilot data and performance metrics
- Prices and cost breakdowns
- Email addresses and phone numbers
- Any specific technical claim from the sample's narrative

**This is the kit's #1 failure mode.** Every one of those fields must come from the user, not the sample. If the user can't provide a field, the agent asks for it — it does not fall back to the sample's value.

---

## Mandatory reminders (the agent surfaces these at the right moments)

These reminders are scattered throughout the conversation, not delivered as a wall of text. The agent picks the right moment for each:

1. **Fictional-data warning** — restate when the agent pulls up a sample for the first time, and again before rendering the final file: *"Everything in the [SentinelMind / NeuroEdge / etc.] sample is fictional. I'm using it as a structural scaffold only. Every number, name, and claim in your draft has to come from you, not from the sample."*

2. **FAR 15.609 legend rule** — restate when the agent reaches Section 7 of the guide: *"If you want any part of this proposal protected from disclosure outside the government, the FAR 15.609 legend must appear on the cover page AND on each page that contains restricted material. The exact wording is non-negotiable — pandoc-paraphrasing it disqualifies the markings."*

3. **Cost realism** — restate when the agent reaches Part 3 (Supporting Information): *"FAR 15.603(c)(4) requires enough cost detail for meaningful evaluation. A single top-line dollar figure is a top-three rejection reason. We need labor hours × labor rates, subcontractor cost, ODCs, travel, indirect/G&A, and fee — even at the ROM stage."*

4. **Educational, not legal advice** — restate at the end of the engagement, before invoking `render-output.md`: *"This kit is educational. Before you actually submit anything to [agency], have a federal contracts or procurement attorney review the final document — especially the proprietary markings and any language that could be read as a binding offer."*

5. **Currency check** — restate when the agent reaches Section 8 (submission logistics): *"Verify the agency's submission address on [agency-domain] today before you send. FAR 15.606 delegates the submission process to each agency, and these addresses change."*

---

## Writing-rules integration during drafting

Throughout the conversation, whenever the agent drafts a paragraph or rewrites a user-provided paragraph, it applies the rules from `references/workflows/writing-rules.md`. Specifically:

- **Never use the banned phrases** from Rules 1–8 in any drafted content
- **Flag any banned phrases** in text the user pastes, with the rule category and a suggested replacement
- **Apply the "tell, don't sell" principle** as the overarching filter — every claim must be substantiated with specifics, not marketing language

The user can override any flag if they insist, but the agent must explain the rule first so the override is knowing.

---

## Closing — the final check and rendering

When the draft is complete, the agent does four things in order:

1. **Run Appendix F (Pre-Submission Checklist).** Walk the user through all 30 items in `guide.md` Appendix F. Every item is a real failure mode observed on rejected proposals. If any item is unchecked, the agent fixes it before proceeding.

2. **Run the writing-rules sweep.** Grep the completed draft against the banned-phrase list in `references/workflows/writing-rules.md`. Any hit is surfaced with the rule category, the reason, and a suggested replacement. The user has the final say on flagged phrases.

3. **Run the fictional-data grep against the draft.** Same anti-bleed check defined in `render-output.md` — search the draft for sample company names, sample personnel names, sample patent numbers. If anything matches, stop and confirm with the user before rendering.

4. **Invoke `render-output.md`.** Ask the user whether they want the final proposal as a Word .docx file or a PDF, produce the file, and report the saved file path with the three mandatory reminders (visual verification of the FAR 15.609 legend, legal review before submission, agency address verification on the day of submission).

After rendering, the engagement is complete. The agent offers to help with related tasks (drafting the preliminary contact email, building a submission log, preparing a follow-up calendar) but does not start a new workflow without the user asking.

---

## Mode-switch note

If at any point the user says they want to switch modes — for example, *"actually, let's drop to the intake checklist"* or *"I want the full workflow with sign-off gates"* — the agent does the following:

1. Acknowledge the switch
2. Re-offer the three-mode selection question from the kit's entry point
3. After the user picks, transition to the new workflow file **without losing the context already collected**. For example, if the user already answered the eligibility questions in Mode 1, the agent does not re-ask them in Mode 2 — it carries the answers forward
4. Continue from the appropriate point in the new workflow

---

**End of conversational.md (Mode 1).**
