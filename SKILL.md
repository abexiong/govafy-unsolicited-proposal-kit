---
name: govafy-unsolicited-proposal-kit
description: Plan, draft, or review federal unsolicited proposals under FAR Subpart 15.6. Use whenever the user asks about unsolicited proposals, sole-source federal pitching, the FAR 15.603 six-part eligibility test, the FAR 15.609 proprietary data legend, or submitting an unrequested idea directly to a U.S. federal agency without responding to a solicitation. Also use when a small business is preparing a self-initiated proposal to agencies like ONR, DCSA, USSOCOM, MCSC, GSA PBS, OPM, FEMA, VA, or EPA. Provides a plain-English master guide, nine fictional sample proposals, and compliance checklists. Do not use for RFP/RFI responses, SBIR/STTR solicitations, BAAs, OTAs, or GSA Schedule work — those are different procurement paths.
---

# Govafy.com Unsolicited Proposal Kit

Help small businesses plan, draft, and review **federal unsolicited proposals** — proposals submitted to a U.S. federal agency *without* responding to a solicitation, RFP, RFI, or posted requirement. Governed by **FAR Subpart 15.6** (in particular **FAR 15.603** eligibility, **FAR 15.606** agency procedures, and **FAR 15.609** proprietary data markings).

Authoritative online source, which should always be cited to the user because the FAR changes without the kit being updated: <https://www.acquisition.gov/far/subpart-15.6>

## Start every engagement here

The **first thing** you do when this skill activates — before answering any question, before reading the guide, before pulling up a sample — is greet the user and offer them four workflow modes. This is non-negotiable. The user picks one mode and the entire rest of the engagement runs through that mode's playbook.

### Smart mode detection (pre-check)

Before calling `AskUserQuestion`, scan the user's first message for **explicit mode signals**. If you find a strong match, skip the question and go directly to the matching workflow file. Tell the user *"I detected you want [Mode X] — starting there. If you'd rather use a different mode, just say so and I'll re-offer the choice."*

Signal table:

| Signal phrases in user message | Route directly to |
|---|---|
| "review my draft," "I have a draft," "check my proposal," "second opinion," "I already wrote," "I already have," "critique," "audit my proposal" | **Mode 4** (`mode-4-review-existing.md`) |
| "step by step," "walk me through," "guide me through," "first time," "never done this," "high stakes," "rigorous," "make sure I don't miss anything," "checklist with signoffs" | **Mode 3** (`full-workflow.md`) |
| "what info do you need," "what should I gather," "intake first," "ask me the questions," "structured questions" | **Mode 2** (`intake-checklist.md`) |
| "just talk me through," "can I ask you," "quick chat," "free-form," "conversation" | **Mode 1** (`conversational.md`) |

If the user's message is ambiguous or doesn't match any signal, proceed to the explicit question below.

### The greeting and the four-mode question

**Greeting (verbatim):**

> I'm here to help you create or review a federal unsolicited proposal under FAR Subpart 15.6. Before we start, which workflow would you like to use?

Then immediately call `AskUserQuestion` with four options. Each option has a 2–3 sentence description so the user can choose wisely:

1. **Conversational** — *"We'll have a back-and-forth conversation where I ask questions and you answer organically. No structured intake form, no rigid sign-off gates — just a discussion that moves at your pace. Best if you already know the basics of federal contracting, have most of your information in your head, and want to think out loud as we go. Typically 30–60 minutes."*

2. **Intake Checklist** — *"I'll walk you through a structured intake form covering nine areas: your company identity, the target agency, the FAR 15.603(c) eligibility test, the technical substance, key personnel, cost model, past performance, other disclosures, and timing. After the intake, I'll summarize everything back, run the eligibility verdict, and then we draft the proposal together using your real data. Best if you want to make sure nothing gets missed but don't need eight scripted phases. Typically 45–90 minutes."*

3. **Full Workflow** — *"Guided step-by-step through eight phases: kickoff, eligibility check, template selection, drafting each of the three proposal parts, applying the FAR 15.609 IP protection legends, a final sweep that checks for fictional sample data, forbidden writing-rule phrases, and strategic weaknesses via a red-team review, and output rendering as Word .docx or PDF. I'll pause for your approval between every phase and ask for document attachments (SAM.gov profile, pilot data, patents, resumes) at the right moments. Best if this is your first federal proposal, the stakes are high, or you want a paper trail of every step. Typically 60–120 minutes."*

4. **Review Existing Proposal** — *"You paste or attach a proposal draft you've already written (or had a consultant write), and I run it through seven review sweeps: FAR 15.605 section-by-section gap analysis, FAR 15.603(c) eligibility verdict, writing-rules sweep, fictional-data sweep, red-team review for strategic weaknesses, cost realism check, and the Appendix F pre-submission checklist. I produce a structured critique report with top-10 prioritized edits and an overall go/revise/rethink recommendation. Best if you already have a draft from a consultant, grant writer, or earlier attempt and want a Govafy-grade second opinion before submitting. Typically 30–60 minutes."*

After the user picks, **read only the matching workflow file** from `references/workflows/` and follow it exactly:
- Conversational → `references/workflows/conversational.md`
- Intake Checklist → `references/workflows/intake-checklist.md`
- Full Workflow → `references/workflows/full-workflow.md`
- Review Existing Proposal → `references/workflows/mode-4-review-existing.md`

**Mode-switching mid-session is always allowed.** If the user says *"this is too much, drop to conversational"* or *"switch to review mode — I have a draft after all,"* re-offer the four-mode `AskUserQuestion` and transition to the new workflow file **without losing the context already collected** (eligibility verdict, template choice, draft sections in progress, review findings).

The seven files under `references/workflows/` are the operational playbooks:
- `intake-fields.md` — shared data dictionary (Modes 2 and 3)
- `render-output.md` — shared "Word .docx or PDF?" pipeline (all modes)
- `writing-rules.md` — shared writing rules / banned phrases (all modes)
- `conversational.md` — Mode 1
- `intake-checklist.md` — Mode 2
- `full-workflow.md` — Mode 3
- `mode-4-review-existing.md` — Mode 4

The rest of this SKILL.md is the inheritance: rules, references, and reminders that apply to every mode.

## The single most important rule

An idea only qualifies as an unsolicited proposal under FAR Subpart 15.6 if it passes **all six** of the tests in **FAR 15.603(c)**. An idea that doesn't pass all six is *not* an unsolicited proposal and should go through a different procurement channel. Before drafting any content for the user, run their idea through the six tests out loud:

1. **Innovative and unique.** Is the approach genuinely new — not a me-too of something already funded, already under contract, or already on a Schedule?
2. **Independently originated and developed by the offeror.** Did the user's company conceive it themselves, without government direction?
3. **Prepared without government supervision.** No agency employee guided the write-up.
4. **Sufficient detail for meaningful evaluation.** Enough technical and cost information that an evaluator could actually make a decision.
5. **Does not duplicate an existing agency effort.** Not already being pursued by an in-house program, existing contract, or grant.
6. **Not an advance proposal for a known requirement.** If the agency has already published an RFP, sources-sought, or draft PWS for this work, the user must respond through that channel — the idea is no longer "unsolicited."

If any of the six fails, **tell the user clearly and explain why**, then recommend the correct alternative channel (SBIR/STTR, BAA, OTA, sources-sought response, GSA Schedule buy, subcontracting). Do not help the user disguise a non-qualifying idea as an unsolicited proposal — that wastes the user's time and damages their relationship with the target agency.

## How to use the bundled references

The kit is built around a master guide and nine fictional sample proposals. Read files only as you need them — don't load everything up front. The guide is the single source of truth; samples are scaffolding.

### Start here for any proposal help

- **`references/guide.md`** — The master guide. 12 numbered sections and 9 appendices covering every rule, process, and template. Read the section that matches the user's current question. Key sections to know:
  - Section 3 — the FAR 15.603(c) six-part eligibility test in plain English
  - Section 6 — the two-part proposal format required by FAR 15.605
  - Section 7 — the FAR 15.609 proprietary data legend (exact text and placement rules)
  - Section 8 — writing for evaluators who did not ask to receive your proposal
  - Section 10 — submission logistics and agency-specific rules
  - Section 11 — what to do after you submit
  - Section 12 — decision tree for picking a sample template
  - Appendix E — eligibility self-assessment worksheet
  - Appendix F — pre-submission checklist (every item is a failure mode observed in real-world rejected proposals)

### General templates — use when the user wants a starting structure regardless of agency

- `references/general-samples/01-innovation-rd.md` — **Innovation / R&D template.** For a novel technology, patent, proof of concept, or research effort aimed at a research-oriented agency. Fictional company *Nova Materials* pitching fictional detail to real agency **ONR**.
- `references/general-samples/02-mission-solution.md` — **Mission-solution template.** For a services or operational solution to an agency's recognized mission need where the *approach* is innovative. **This is the most broadly applicable template — most small business users will find their own situation fits here.** Fictional company *Meridian Workforce* pitching to real agency **VA**.
- `references/general-samples/03-crisis-rapid-response.md` — **Crisis / rapid-response template.** For a turnkey capability offered to an agency facing an urgent or emerging need (disaster, surge, public health event). Fictional company *RapidResponse Water* pitching to real agency **EPA**.

### Specific samples — use when the target agency matches, or when the teaching situation matches

Each specific sample is explicitly fictional (fake companies, fake names, fake patent numbers, fake pilot data, fake prices) but the regulations, agency missions, program names, and FAR 15.609 markings are real and compliant.

- `references/specific-samples/01-sentinelmind-dcsa.md` — DCSA insider-threat analytics. Shows how to propose to an intelligence/security agency where **proprietary data protection is paramount**. Study the FAR 15.609 legend placement on every restricted page.
- `references/specific-samples/02-neuroedge-ussocom.md` — USSOCOM human performance technology. Shows how to position a **commercial dual-use technology** for Special Operations Forces mission use.
- `references/specific-samples/03-forgeforward-mcsc.md` — **The most important teaching example in the kit.** MCSC expeditionary additive manufacturing. Shows how to position a **next-generation** innovation when the target agency *already has* a similar capability (in this case, X-FAB and TACFAB managed by PM CSS). If the user says "but they're already doing something like this," study this sample before responding.
- `references/specific-samples/04-fedfacility-iq-gsa-pbs.md` — GSA Public Buildings Service facilities intelligence. Shows how to pitch an **operational/IT solution to a civilian real-property agency** — very different tone from the defense samples.
- `references/specific-samples/05-leadfed-opm.md` — OPM executive leadership development. Shows how to target a **successor policy office** when the obvious program office has been dismantled (in this case, the Federal Executive Institute, dissolved February 2025). If the user's "obvious buyer" doesn't exist anymore, study this one.
- `references/specific-samples/06-readyrelief-fema.md` — FEMA disaster logistics. Shows how the general crisis/rapid-response template applies to a real disaster-response agency with its own procurement quirks.

### Workflow files (under `references/workflows/`)

These are the operational playbooks loaded based on the mode the user picks at the entry point above. Read **only** the file matching the chosen mode — do not read all of them.

**Shared files (used by multiple modes):**

- **`references/workflows/intake-fields.md`** — Shared data dictionary used by Modes 2 and 3. Lists every field the kit needs from the user (company identity, target agency, eligibility answers, technical substance, key personnel, cost model, past performance, disclosures, timing) with `[REQUIRED]`, `[OPTIONAL]`, and `[ATTACH]` tags.
- **`references/workflows/render-output.md`** — Shared output rendering pipeline used by all four modes at the very end of every engagement. Defines the verbatim "Word .docx or PDF?" question, the filename convention, the pandoc commands, the verification steps, and the fallback paths if PDF rendering fails.
- **`references/workflows/writing-rules.md`** — Shared writing-rules reference used by all four modes during drafting and review. Eight rules (crutch words, boasting, weak/vague, hidden verbs, redundant phrases, long words, legal words, unsourced agency-priority claims) derived from Govafy.com's full proposal-writing guide. Includes a tell/don't-sell principle and a concrete before/after paragraph example. Enforced via a writing-rules sweep at the end of every workflow.

**Per-mode playbooks:**

- **`references/workflows/conversational.md`** — **Mode 1 contract.** Organic Q&A, no TodoWrite, no rigid sign-off gates. Codifies the kit's original conversational behavior.
- **`references/workflows/intake-checklist.md`** — **Mode 2 contract.** One structured pass through `intake-fields.md`, then flexible drafting. Eligibility verdict derived from collected answers.
- **`references/workflows/full-workflow.md`** — **Mode 3 contract.** Eight numbered phases. TodoWrite progress tracker. Sign-off gates. Phase 7 includes five checks: Appendix F, writing-rules sweep, fictional-data grep, **red-team sweep (adversarial reviewer)**, and submission-address verification. Largest and most rigorous of the workflow files.
- **`references/workflows/mode-4-review-existing.md`** — **Mode 4 contract.** Review an existing proposal draft the user has already written or had a consultant write. Read-only on the user's file. Produces a structured critique report with seven review sweeps and an overall go/revise/rethink verdict.

**Drift prevention rule:** all workflow files reference `guide.md` by section number (`Section 6`, `Appendix F`) and FAR citations verbatim, never by copied content.

## Core rules when drafting for the user

1. **Cite the FAR next to every rule.** Users can and should verify. The master guide models this — follow its pattern. Always point the user back to <https://www.acquisition.gov/far/subpart-15.6> so they can check the current text themselves.

2. **Everything in the samples is fictional.** When adapting a sample for a real user, replace every fictional detail — company name, personnel, patent numbers, pilot data, prices, email addresses, DUNS/UEI numbers — with the user's real information. Never let a fictional number, name, or claim leak into a real submission. This is the single most common way a Claude-assisted proposal would go wrong.

3. **The FAR 15.609 proprietary data legend is not optional if the user wants IP protection.** Section 7 of the guide explains the exact legend text, the two-paragraph structure, and the placement rule (legend on the cover page AND on each page that contains restricted material). If the user wants any part of their proposal protected from disclosure outside the government, the legend must be present and correctly placed. Explicitly tell the user this when they ask about IP, trade secrets, or proprietary methods.

4. **Cost realism matters.** FAR 15.603(c)(4) requires enough cost detail for meaningful evaluation. The samples show realistic rough-order-of-magnitude (ROM) pricing with a cost basis. Push the user to think through labor hours, labor rates, subcontractor cost, ODCs, and G&A — not just a top-line dollar figure. Under-detailed cost is a top-three reason unsolicited proposals get rejected.

5. **This is educational, not legal advice.** State this plainly whenever the user is about to act on the content in a real submission. Recommend they have a contracts or procurement attorney review the final document before it leaves their desk, especially for proprietary data markings and any terms that could be read as binding offers.

## How to adapt the kit to a user's real situation

The detailed adaptation logic has moved into the workflow files under `references/workflows/`. After the user picks a mode at the entry point above, follow that mode's playbook exactly. All three modes share the same core inheritance:

1. **Diagnose eligibility first** using the FAR 15.603(c) six-part test. If any test fails, stop and recommend the alternative channel. Don't draft content for an ineligible idea.
2. **Pick the closest template** using the decision tree in `guide.md` Section 12.
3. **Walk through the guide section by section** — never dump the whole guide at once.
4. **Use samples as structural scaffolding only** — never lift fictional names, numbers, patents, or personnel.
5. **Final check** with `guide.md` Appendix F (Pre-Submission Checklist).
6. **Render the final file** by invoking `references/workflows/render-output.md` to ask the user PDF or Word .docx and produce the deliverable.

The workflow files differ in *how* they execute these steps (organic conversation vs. structured intake vs. eight-phase scripted workflow), not in *what* they do.

## What the kit does not cover

- **Solicited proposals** (RFPs, RFQs, RFIs, sources-sought responses). Different rules.
- **SBIR/STTR submissions.** Separate statutory program with its own application process.
- **BAAs and OTAs.** Close cousins of unsolicited proposals but with different procedures.
- **GSA Schedule sales and task-order responses.** Entirely different acquisition path.
- **Subcontracting or teaming arrangements.** Not addressed here.

If the user's situation actually fits one of the above, say so clearly and point them to the right channel. Don't force-fit the unsolicited proposal template to a situation it wasn't built for.

## Currency of the regulations

The kit's citations are current as of **FAC 2026-01** (effective March 13, 2026). **Executive Order 14275**, *Restoring Common Sense to Federal Procurement* (2025), is cited as the policy backdrop and remains current at time of writing. Both the FAR and executive orders can change. Always link the user to <https://www.acquisition.gov/far/subpart-15.6> as the authoritative current source, and encourage them to check their target agency's website for agency-specific submission procedures, which are delegated to agencies under FAR 15.606.
