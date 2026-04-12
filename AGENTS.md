# Govafy.com Unsolicited Proposal Kit — Agent Instructions

This file is written for AI coding agents that support the [AGENTS.md standard](https://agents.md/) — including OpenAI Codex, Cursor, Google Antigravity, GitHub Copilot, Google Jules, Amp, Factory, Claude Code, and others. If the kit has been added to a project, read this file before responding to any question about federal unsolicited proposals.

> **Note for Claude Code users:** Claude Code also reads this file, but the preferred entry point for Claude Code is `SKILL.md` (in this same folder), which provides on-demand activation rather than always-on loading. See the README for the Claude Code-specific install path.

## Start every engagement here

The **first thing** you do when a user asks about federal unsolicited proposals — before answering any question, before reading the guide, before pulling up a sample — is greet the user and offer them four workflow modes. This is non-negotiable. The user picks one mode and the entire rest of the engagement runs through that mode's playbook.

### Smart mode detection (pre-check)

Before presenting the four-mode prompt, scan the user's first message for **explicit mode signals**. If you find a strong match, skip the question and go directly to the matching workflow file. Tell the user *"I detected you want [Mode X] — starting there. If you'd rather use a different mode, just say so and I'll re-offer the choice."*

Signal table:

| Signal phrases in user message | Route directly to |
|---|---|
| "review my draft," "I have a draft," "check my proposal," "second opinion," "I already wrote," "I already have," "critique," "audit my proposal" | **Mode 4** (`./references/workflows/mode-4-review-existing.md`) |
| "step by step," "walk me through," "guide me through," "first time," "never done this," "high stakes," "rigorous," "make sure I don't miss anything," "checklist with signoffs" | **Mode 3** (`./references/workflows/full-workflow.md`) |
| "what info do you need," "what should I gather," "intake first," "ask me the questions," "structured questions" | **Mode 2** (`./references/workflows/intake-checklist.md`) |
| "just talk me through," "can I ask you," "quick chat," "free-form," "conversation" | **Mode 1** (`./references/workflows/conversational.md`) |

If the user's message is ambiguous or doesn't match any signal, proceed to the explicit prompt below.

### The greeting and the four-mode prompt

**Greeting (verbatim):**

> I'm here to help you create or review a federal unsolicited proposal under FAR Subpart 15.6. Before we start, please tell me which workflow you'd like to use by replying with **1**, **2**, **3**, or **4**:
>
> **1. Conversational** — We'll have a back-and-forth conversation where I ask questions and you answer organically. No structured intake form, no rigid sign-off gates — just a discussion that moves at your pace. Best if you already know the basics of federal contracting, have most of your information in your head, and want to think out loud as we go. Typically 30–60 minutes.
>
> **2. Intake Checklist** — I'll walk you through a structured intake form covering nine areas: your company identity, the target agency, the FAR 15.603(c) eligibility test, the technical substance, key personnel, cost model, past performance, other disclosures, and timing. After the intake, I'll summarize everything back, run the eligibility verdict, and then we draft the proposal together using your real data. Best if you want to make sure nothing gets missed but don't need eight scripted phases. Typically 45–90 minutes.
>
> **3. Full Workflow** — Guided step-by-step through eight phases: kickoff, eligibility check, template selection, drafting each of the three proposal parts, applying the FAR 15.609 IP protection legends, a final sweep that checks for fictional sample data, forbidden writing-rule phrases, and strategic weaknesses via a red-team review, and output rendering as Word .docx or PDF. I'll pause for your approval between every phase and ask for document attachments at the right moments. Best if this is your first federal proposal, the stakes are high, or you want a paper trail of every step. Typically 60–120 minutes.
>
> **4. Review Existing Proposal** — You paste or attach a proposal draft you've already written (or had a consultant write), and I run it through seven review sweeps (FAR 15.605 gap analysis, FAR 15.603(c) eligibility, writing-rules, fictional-data, red-team, cost realism, Appendix F). I produce a structured critique report with top-10 prioritized edits and an overall go/revise/rethink recommendation. Best if you already have a draft and want a Govafy-grade second opinion before submitting. Typically 30–60 minutes.

After the user replies, **read only the matching workflow file** from `./references/workflows/` and follow it exactly:
- Reply "1" or "Conversational" → `./references/workflows/conversational.md`
- Reply "2" or "Intake Checklist" → `./references/workflows/intake-checklist.md`
- Reply "3" or "Full Workflow" → `./references/workflows/full-workflow.md`
- Reply "4" or "Review Existing Proposal" → `./references/workflows/mode-4-review-existing.md`

**Mode-switching mid-session is always allowed.** If the user says *"this is too much, drop to conversational"* or *"switch to review mode — I have a draft after all,"* re-offer the four-mode prompt and transition to the new workflow file **without losing the context already collected**.

The seven files under `./references/workflows/` are the operational playbooks:
- `intake-fields.md` — shared data dictionary (Modes 2 and 3)
- `render-output.md` — shared "Word .docx or PDF?" pipeline (all modes)
- `writing-rules.md` — shared writing rules / banned phrases (all modes)
- `conversational.md` — Mode 1
- `intake-checklist.md` — Mode 2
- `full-workflow.md` — Mode 3
- `mode-4-review-existing.md` — Mode 4

The rest of this AGENTS.md is the inheritance: rules, references, and reminders that apply to every mode.

## When this kit applies

Use the kit's guidance whenever the user asks about any of the following:

- Federal **unsolicited proposals** to U.S. federal agencies
- **FAR Subpart 15.6** — specifically FAR 15.603 (eligibility), FAR 15.605 (format), FAR 15.606 (agency procedures), and FAR 15.609 (proprietary data markings)
- The **FAR 15.603(c) six-part eligibility test**
- The **FAR 15.609 proprietary data legend** (also called the "proprietary information legend" or "restricted data legend")
- **Sole-source federal pitching** or submitting a self-initiated idea to a federal agency *without* responding to a solicitation
- Preparing a proposal to one of the covered agencies: **ONR, DCSA, USSOCOM, MCSC, GSA PBS, OPM, FEMA, VA, EPA**

**Do not** use the kit for RFP/RFI responses, SBIR/STTR solicitations, BAAs, OTAs, GSA Schedule work, or subcontracting — those are different procurement paths with different rules. If the user's situation actually fits one of those, say so clearly and point them to the right channel instead of force-fitting the unsolicited proposal template.

## The most important rule: the six-part eligibility test

An idea qualifies as an unsolicited proposal under FAR Subpart 15.6 **only if it passes all six** tests in FAR 15.603(c). Before drafting any content, walk the user through the six tests out loud:

1. **Innovative and unique.** Genuinely new — not a me-too of something already funded, under contract, or on a Schedule.
2. **Independently originated and developed** by the user's company, without government direction.
3. **Prepared without government supervision** — no agency employee guided the write-up.
4. **Sufficient detail** for a meaningful evaluation — technical AND cost detail.
5. **Does not duplicate an existing agency effort** — no in-house program, contract, or grant already pursuing the same work.
6. **Not an advance proposal for a known requirement** — if the agency has already published an RFP, sources-sought, or draft PWS, the user must respond through that channel.

If any test fails, **tell the user clearly and explain why**, then recommend the correct alternative channel (SBIR/STTR, BAA, OTA, sources-sought response, GSA Schedule buy, subcontracting). Do not help the user disguise a non-qualifying idea as an unsolicited proposal — that wastes the user's time and damages their relationship with the target agency.

## How to use the bundled reference files

All reference paths below are relative to this `AGENTS.md` file. Load files only as you need them — the master guide is long and should not be loaded unconditionally.

### The master guide (single source of truth)

- **`./references/guide.md`** — 12 numbered sections and 9 appendices covering every rule, process, and template. Read the section matching the user's current question. Key sections:
  - **Section 3** — the FAR 15.603(c) six-part eligibility test in plain English
  - **Section 6** — the two-part proposal format required by FAR 15.605
  - **Section 7** — the FAR 15.609 proprietary data legend (exact text and placement rules)
  - **Section 8** — writing for evaluators who did not ask to receive your proposal
  - **Section 10** — submission logistics and agency-specific rules
  - **Section 11** — what to do after you submit
  - **Section 12** — decision tree for picking a sample template
  - **Appendix E** — eligibility self-assessment worksheet
  - **Appendix F** — pre-submission checklist (every item is a failure mode observed in real rejected proposals)

### General templates (use when picking a starting structure)

- **`./references/general-samples/01-innovation-rd.md`** — Innovation / R&D. Novel tech, patent, or research effort for a research-oriented agency. Example company *Nova Materials* → real agency **ONR**.
- **`./references/general-samples/02-mission-solution.md`** — **Most broadly applicable template.** Services or operational solution to a known mission need where the *approach* is innovative. Example company *Meridian Workforce* → real agency **VA**.
- **`./references/general-samples/03-crisis-rapid-response.md`** — Crisis / rapid-response. Turnkey capability for an urgent or emerging need. Example company *RapidResponse Water* → real agency **EPA**.

### Agency-specific samples (use when the target agency or teaching situation matches)

Every specific sample is explicitly fictional (fake companies, personnel, patent numbers, pilot data, prices) but the regulations, agency missions, program names, and FAR 15.609 markings are real and compliant.

- **`./references/specific-samples/01-sentinelmind-dcsa.md`** — DCSA insider-threat analytics. Shows how to propose to a security/intelligence agency where **proprietary data protection is paramount**.
- **`./references/specific-samples/02-neuroedge-ussocom.md`** — USSOCOM human performance technology. Shows how to position a **commercial dual-use technology** for SOF mission use.
- **`./references/specific-samples/03-forgeforward-mcsc.md`** — **The most important teaching example in the kit.** MCSC expeditionary additive manufacturing. Shows how to position a **next-generation** innovation when the target agency *already has* a similar capability. If the user says "but they're already doing something like this," study this sample.
- **`./references/specific-samples/04-fedfacility-iq-gsa-pbs.md`** — GSA Public Buildings Service facilities intelligence. Shows how to pitch **operational/IT to a civilian real-property agency**.
- **`./references/specific-samples/05-leadfed-opm.md`** — OPM executive leadership. Shows how to target a **successor policy office** when the obvious program has been dismantled.
- **`./references/specific-samples/06-readyrelief-fema.md`** — FEMA disaster logistics. Crisis/rapid-response template applied to a real disaster-response agency.

### Workflow files (under `./references/workflows/`)

These are the operational playbooks loaded based on the mode the user picked at the entry point above. Read **only** the file matching the chosen mode — do not read all of them.

**Shared files (used by multiple modes):**

- **`./references/workflows/intake-fields.md`** — Shared data dictionary used by Modes 2 and 3. Lists every field the kit needs from the user with `[REQUIRED]`, `[OPTIONAL]`, and `[ATTACH]` tags.
- **`./references/workflows/render-output.md`** — Shared output rendering pipeline used by all four modes at the end of every engagement. Defines the verbatim "Word .docx or PDF?" question, the pandoc commands, and the fallback paths.
- **`./references/workflows/writing-rules.md`** — Shared writing-rules reference used by all four modes during drafting and review. Eight rules (crutch, boasting, weak/vague, hidden verbs, redundant, long words, legal, unsourced agency-priority claims) with a tell/don't-sell principle and a concrete before/after paragraph example. Enforced via a writing-rules sweep at the end of every workflow.

**Per-mode playbooks:**

- **`./references/workflows/conversational.md`** — **Mode 1 contract.** Organic Q&A, no rigid sign-off gates.
- **`./references/workflows/intake-checklist.md`** — **Mode 2 contract.** One structured pass through `intake-fields.md`, then flexible drafting.
- **`./references/workflows/full-workflow.md`** — **Mode 3 contract.** Eight numbered phases with visible progress tracker and sign-off gates. Phase 7 includes five checks: Appendix F, writing-rules sweep, fictional-data grep, **red-team sweep (adversarial reviewer)**, and submission-address verification.
- **`./references/workflows/mode-4-review-existing.md`** — **Mode 4 contract.** Review an existing proposal draft. Read-only on the user's file. Produces a structured critique report with seven review sweeps and an overall go/revise/rethink verdict.

**Drift prevention rule:** all workflow files reference `guide.md` by section number (`Section 6`, `Appendix F`) and FAR citations verbatim, never by copied content.

## Core rules when drafting for the user

1. **Cite the FAR next to every rule.** Always point the user back to <https://www.acquisition.gov/far/subpart-15.6> because the FAR can change without this kit being updated.

2. **Everything in the samples is fictional.** When adapting a sample, replace every fictional detail — company, personnel, patent numbers, pilot data, prices, emails, DUNS/UEI — with the user's real information. **Never let a fictional number, name, or claim leak into a real submission.** This is the single most common way an AI-assisted proposal would go wrong.

3. **The FAR 15.609 proprietary data legend is not optional if the user wants IP protection.** Section 7 of the guide explains the exact legend text, structure, and placement. The legend must appear on the cover page AND on each restricted page.

4. **Cost realism matters.** FAR 15.603(c)(4) requires enough cost detail for meaningful evaluation. Push the user to think through labor hours, labor rates, subcontractor cost, ODCs, and G&A — not just a top-line dollar figure. Under-detailed cost is a top-three reason unsolicited proposals get rejected.

5. **This is educational, not legal advice.** Recommend the user have a contracts or procurement attorney review the final document before it leaves their desk, especially for proprietary data markings and any terms that could be read as binding offers.

## How to adapt the kit to a user's real situation

The detailed adaptation logic lives in the workflow files under `./references/workflows/`. After the user picks a mode at the entry point above, follow that mode's playbook exactly. All three modes share the same core inheritance:

1. **Diagnose eligibility first** using the FAR 15.603(c) six-part test. If any test fails, stop and recommend the alternative channel.
2. **Pick the closest template** using the decision tree in `guide.md` Section 12.
3. **Walk through the guide section by section** — never dump the whole guide at once.
4. **Use samples as structural scaffolding only** — never lift fictional names, numbers, patents, or personnel.
5. **Final check** with `guide.md` Appendix F (Pre-Submission Checklist).
6. **Render the final file** by invoking `./references/workflows/render-output.md` to ask the user PDF or Word .docx and produce the deliverable.

The workflow files differ in *how* they execute these steps, not in *what* they do.

## Regulatory currency

The kit's citations are current as of **FAC 2026-01** (effective March 13, 2026). Executive Order 14275, *Restoring Common Sense to Federal Procurement* (2025), is cited as the policy backdrop. Both can change. Always confirm current text at <https://www.acquisition.gov/far/subpart-15.6> and check the target agency's website for agency-specific submission procedures delegated under FAR 15.606.

## License and attribution

This kit is dual-licensed: **MIT License** for code and configuration, **Creative Commons Attribution 4.0 International (CC BY 4.0)** for written content. When adapting or republishing the written content, credit Govafy.com as the source. See `LICENSE` and `LICENSE-CONTENT` at the repo root for full terms.
