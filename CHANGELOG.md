# Changelog

All notable changes to the Govafy.com Unsolicited Proposal Kit will be recorded in this file.

The format is based loosely on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

---

## [1.3.0] — 2026-04-17

### Added

- **Claude Code plugin distribution.** The kit now ships in two install formats from the same repo: the original skill format (users `git clone` into `~/.claude/skills/`) and a new plugin format (users run `/plugin marketplace add abexiong/govafy-unsolicited-proposal-kit` followed by `/plugin install govafy-unsolicited-proposal-kit`). The plugin format gives users a cleaner install, built-in `/plugin update` and `/plugin uninstall`, and (if listed) discovery via Anthropic's official plugin marketplace browser. The skill install path continues to work unchanged — v1.3.0 is additive, not a replacement.
- **`.claude-plugin/plugin.json`** — the Claude Code plugin manifest declaring name, version, description, author, homepage, repository, license, and keywords. Skills are autodiscovered from `skills/<skill-name>/SKILL.md` per the plugin spec.
- **`.claude-plugin/marketplace.json`** — the marketplace manifest that lists the kit as an installable plugin. Named `govafy-plugins` to allow future Govafy plugins (solicited RFP responses, SBIR/STTR drafting, capability statements) to join the same marketplace.
- **`skills/govafy-unsolicited-proposal-kit/`** — mirror of the root `SKILL.md` and `references/` directory in the plugin-expected location. Root is authoritative; the plugin subfolder is kept in sync by `scripts/sync-plugin-skill.sh`.
- **`scripts/sync-plugin-skill.sh`** — copies root `SKILL.md` and `references/` into the plugin subfolder. Must be run after any edit to the root skill content.
- **Sanity `Check 7`** — verifies the plugin skill folder matches the root (byte-for-byte for the Markdown, tree-comparison for the references directory). CI blocks any merge where the two have drifted.
- **README Option B reworked** — new "Option B — Claude Code (as a plugin — recommended)" section shows the `/plugin install` flow as the primary path. The original `git clone` skill install is preserved as "Option B-legacy" for users who prefer manual installs or need to edit the kit locally.

### Architectural notes

- **Why duplicate instead of symlink:** symlinks in git are supported but fragile on Windows (requires dev mode or admin) and the Claude Code plugin spec blocks path traversal via `../`. A committed duplicate with a CI drift check is the most reliable cross-platform approach. The sync script + Check 7 catch any drift before merge.
- **No breaking changes.** All existing install paths (skill format via `git clone`, AGENTS.md for Cursor/Codex/Copilot, the Cursor native rule, direct `.docx` download for non-AI users) continue to work exactly as in v1.2.1. The plugin is a strictly additive option for Claude Code users who prefer it.
- **Future marketplace submission.** The plugin is ready to submit to Anthropic's community plugin marketplace at [clau.de/plugin-directory-submission](https://clau.de/plugin-directory-submission). Approval there would surface the kit in Claude Code's in-app plugin browser at [claude.com/plugins](https://claude.com/plugins).

---

## [1.2.1] — 2026-04-16

### Fixed

- **Fictional-data anti-bleed grep was missing five of the nine sample company names** (Apex Cognitive Labs, IronForge Manufacturing, Civic Energy Insights, Ascend Federal Leadership, Predictive Resilience), most key personnel from Specific Samples 2–6, three patent placeholder patterns (`18/XXX,XXX`, `18/ZZZ,ZZZ`, `18/WWW,WWW`), and five sample email domains. This was the kit's single largest functional defect — the grep is the primary defense against the kit's #1 failure mode (sample data leaking into a real submission), and it was missing more than half the data it was supposed to catch. New file `references/workflows/fictional-data-markers.md` is the single source of truth; `full-workflow.md` Phase 7, `render-output.md` pre-render check, and `mode-4-review-existing.md` Sweep 4 now reference it instead of maintaining their own (drifted) copies.
- **Phantom marker `acme.example`** removed from the grep — it was listed as a sample email domain but never appeared in any actual sample.
- **Wrong guide section number** in `SKILL.md`, `AGENTS.md`, and `README.md` — all three said "Section 3" for the FAR 15.603(c) eligibility test. The guide actually places the test in Section 2; Section 3 is "The Reality Check."
- **Wrong Appendix F item count** — `conversational.md`, `intake-checklist.md`, `full-workflow.md` (twice), and `mode-4-review-existing.md` (twice) all claimed "30 items." Actual count is 35 (Content 8, Cost 5, Basic Info 7, IP 4, Administrative 7, Sanity 4). Mode 3 Phase 7a's "Administrative (6 items)" subhead also corrected to 7.
- **"Three modes" boilerplate** in `SKILL.md`, `AGENTS.md`, the Cursor rule, `conversational.md`, `intake-checklist.md`, `full-workflow.md`, and `mode-4-review-existing.md` updated to "four modes" / "four-mode selection" — leftover language from before Mode 4 was added in v1.1.0.
- **`render-output.md` scope statement** updated to include Mode 4. The intro and "When to invoke" sections previously named only Modes 1, 2, and 3 even though Mode 4 also calls render-output.md to produce the critique report.
- **Wrong FAR sub-citation** at `guide.md` Section 6.4.7. "Prior agency contacts" was attributed to "FAR 15.605(a)(4) and 15.605(c)(7)" — only (c)(7) is correct. (a)(4) covers a different requirement (other agencies *receiving* the proposal).
- **`README.md` install instruction** for Claude Code no longer says "restart Claude Code" — modern Claude Code auto-discovers skills.

### Added

- **`references/workflows/fictional-data-markers.md`** — the single source of truth for the anti-bleed grep. Lists every fictional company, person, patent placeholder, email domain, CAGE code, UEI, and sample-specific pilot number across all 9 samples, plus a "real terms NOT to flag" list (POTFF, X-FAB, TACFAB, PM CSS, FEI, LogVIZ, etc.) so the grep doesn't generate false positives on real federal program names. Includes a maintainer rule: when adding a new sample, the maintainer MUST add the new sample's markers to this file.
- **`scripts/sanity-check.sh`** — a small CI-friendly shell script with **6 checks** that catch every category of regression this release fixed: (1) Appendix F checkbox count matches every claim, (2) every sample's fictional company name is in the marker file, (3) `SKILL.md` / `AGENTS.md` / `README.md` cite the right guide section for the eligibility test, (4) no stale "three-mode" boilerplate, (5) no phantom `acme.example` marker, (6) **every `downloads/*.docx` is in sync with its `references/*.md` source** (text-content comparison, tolerant of pandoc-version table-formatting differences). Run before every release.
- **`scripts/regen-docx.sh`** — regenerates all 10 `.docx` files in `downloads/` from their Markdown sources via pandoc. Required after editing any `references/**/*.md` file. Maintains the explicit `.md → .docx` filename mapping in one place. Add a new line to the `PAIRS` array when introducing a new sample.
- **GitHub Action wiring (`.github/workflows/sanity-check.yml`)** is staged for a follow-up commit — it requires the maintainer's GitHub OAuth token to carry the `workflow` scope. The workflow file itself runs `bash scripts/sanity-check.sh` on every PR and push to `main`, with pandoc pre-installed. Until it's wired in, run `bash scripts/sanity-check.sh` locally before every PR.

### Changed

- **Mode 3 Phase 4 sample-comparison checkpoint** tightened with an explicit "structural comparison only, never lift content" guardrail. Earlier wording could be read as permission to pull values from the sample to complete missing user fields. The new wording makes it explicit that missing user data becomes a bracketed placeholder caught by the bracket-count gate, never a fallback to sample content.
- **`writing-rules.md` expanded** to close the highest-frequency gaps relative to Govafy.com's full *100 Words to Avoid in Proposals* source document. Added 15 phrases across four rules: Rule 3 (*maximize, minimize, optimize, we can provide*); Rule 4 (*gave an explanation → explained, has a need for → needs*); Rule 5 (*able to → can, capable of → can, any and all → all/any/every, if and when → if, in addition → also, consequently → so, furthermore → then/also*); Rule 6 (*utilization → use, modification → change, termination → end, obfuscate → hide/confuse*). The closing "Inheritance rule" section now explicitly names the two categories the kit deliberately leaves out (Slang and Unnecessary Qualifiers) and explains why — to keep the sweep fast and focused on the phrases that actually hurt eligibility credibility, while pointing users to the full Govafy guide for the complete ~180-rule list.

- **Sample-prose cleanup against the kit's own writing rules.** A spot-check of the 9 sample proposals against the (newly expanded) banned-phrase list found 5 prose violations across 4 samples — the samples were teaching one set of rules in `writing-rules.md` while practicing another in their own narrative paragraphs. Fixed:
   - `references/general-samples/02-mission-solution.md` — "prior to beginning work" → "before beginning work"
   - `references/general-samples/03-crisis-rapid-response.md` — "prior to pre-staging" → "before pre-staging"
   - `references/specific-samples/01-sentinelmind-dcsa.md` — "prior to beginning work" → "before beginning work"
   - `references/specific-samples/05-leadfed-opm.md` — "proprietary methodology" → "proprietary set of methods" (Note to Readers block) and "(proprietary methodology)" → "(proprietary methods)" (proposal body, §1.3)
   The 7 uses of "in accordance with" in the samples were left intact — all 7 are conventional regulatory citations (e.g., *"marked in accordance with FAR 15.609(b)"*) and federal evaluators expect that exact phrasing for citing FAR.

### Regenerated

- **5 `.docx` files in `downloads/`** regenerated from the updated Markdown via `scripts/regen-docx.sh` (pandoc): General Sample 2, General Sample 3, Specific Sample 1, Specific Sample 5 (sample-prose cleanup) and the master guide (FAR 15.605(a)(4) citation fix). The other 5 `.docx` files (General Sample 1 and Specific Samples 2/3/4/6) were not regenerated because their underlying Markdown was unchanged in this release. Verified with the new `sanity-check.sh` Check 6 that all 10 `.docx` files now match their `.md` source.

### Architectural notes

- Per `downloads/README.md`, the Markdown files in `references/` remain the authoritative source of truth. The `.docx` files in `downloads/` are a downstream rendering — when the Markdown changes, the corresponding `.docx` is regenerated with `pandoc <file>.md -o <file>.docx --standalone`.

---

## [1.2.0] — 2026-04-12

### Added

- **Bracket-count quality gate** at every Mode 3 sign-off. If a phase's draft contains more than two bracketed placeholder fields (e.g., `[Insert]`, `[Name]`, `[____]`), the agent must collect the missing data before declaring the phase complete. This prevents the #1 observed failure mode: agents declaring phases "complete" with empty placeholders and producing documents that look structurally sound but are not submission-ready.
- **Phase 4 non-skip enforcement rule.** Even if the user provided detailed technical answers during Phase 1 eligibility, the agent must still walk through Group D and Group E field-by-field during Phase 4. Phase 1 establishes eligibility; Phase 4 produces the draft — different questions at different levels of detail.
- **Phase 4 sample-comparison checkpoint.** Before declaring Phase 4 complete, the agent compares the drafted §2.6 (Key Personnel) against the matching sample's §2.6 to ensure user bios have at least as much concrete detail as the fictional characters.
- **Attachment enforcement rule** added to Mode 3 contract. The agent must ask for each `[ATTACH]` document using the exact request language in the phase instructions. "I already have enough information" is not a valid reason to skip an attachment request.
- **Cost intake non-skip rule** in Phase 5. Producing an empty cost table with `$[____]` placeholders and moving on is explicitly prohibited. The agent must help the user estimate if they don't have exact numbers ready.
- **ROM acronym rule** in Phase 5. Always spell out "Rough Order of Magnitude (ROM)" on first use — do not assume the evaluator knows procurement shorthand.
- **Phase 7 checklist enforcement rule.** When Appendix F identifies a "Fail" or "Revise" item, the agent must either fix it immediately or get explicit user acknowledgment before proceeding. Logging failures and moving on is not acceptable.
- **Phase 8 handoff checklist.** Five required deliverables: rendered file, Markdown source, submission log template, three mandatory reminders, and a remaining-gaps summary (punch list of everything the user still needs to complete before submission).
- **Writing Rule 8 — Source every claim about agency priorities.** Every sentence in §2.5 (Mission Support Statement) that describes what the agency cares about must cite a published, verifiable source. Unsourced agency-priority claims are the most common way AI-drafted proposals lose credibility. All workflow files updated from "Rules 1–7" to "Rules 1–8."

---

## [1.1.0] — 2026-04-11

### Added

- **Four-mode workflow system.** Every time the kit is invoked through an AI agent, the agent now greets the user and offers a choice of four workflow modes:
  - **Mode 1 — Conversational.** Organic Q&A, no rigid sign-off gates. Codifies the kit's original conversational behavior so it stays stable as the kit grows.
  - **Mode 2 — Intake Checklist.** One structured pass through a shared data dictionary covering company identity, target agency, eligibility, technical substance, key personnel, cost, past performance, disclosures, and timing. After intake the agent summarizes back, runs the eligibility verdict, and drafts together. Document attachment requests are surfaced explicitly during intake.
  - **Mode 3 — Full Workflow.** Eight numbered phases with visible progress tracking, document attachment requests at every relevant phase (SAM.gov profile, pilot data, patents, resumes, past performance), sign-off gates between every phase transition, and a five-part final sweep in Phase 7 (Appendix F checklist, writing-rules sweep, fictional-data grep, **red-team adversarial review**, submission-address verification) before final delivery.
  - **Mode 4 — Review Existing Proposal.** Read-only mode for users who already have a draft (written by themselves, a consultant, or a previous attempt) and want a Govafy-grade second opinion before submitting. The agent runs seven review sweeps (FAR 15.605 section-by-section gap analysis, FAR 15.603(c) eligibility verdict, writing-rules sweep, fictional-data grep, red-team strategic review, cost realism check, Appendix F pre-submission checklist) and produces a structured critique report with top-10 prioritized edits and an overall go/revise/rethink verdict.
- **`references/workflows/` directory** with seven new files:
  - `intake-fields.md` — shared data dictionary used by Modes 2 and 3 (every field tagged `[REQUIRED]`, `[OPTIONAL]`, or `[ATTACH]`)
  - `render-output.md` — shared output rendering pipeline used by all four modes at the very end of every engagement
  - `writing-rules.md` — shared writing-rules reference used by all four modes; eight rules (crutch, boasting, weak/vague, hidden verbs, redundant, long, legal, unsourced agency-priority claims) derived from Govafy.com's full proposal-writing playbook, with a tell/don't-sell principle and a concrete before/after paragraph example; enforced via a writing-rules sweep at the end of every workflow
  - `conversational.md` — Mode 1 contract
  - `intake-checklist.md` — Mode 2 script
  - `full-workflow.md` — Mode 3 script (8 phases including the red-team sweep in Phase 7)
  - `mode-4-review-existing.md` — Mode 4 script (7 review sweeps + critique report)
- **Smart mode detection at the entry point.** Before presenting the four-mode prompt, the agent scans the user's first message for explicit mode signals ("walk me step by step" → Mode 3, "review my draft" → Mode 4, "just talk me through it" → Mode 1, "ask me the questions" → Mode 2) and routes directly to the matching workflow file if a signal is found. Reduces friction for experienced users while preserving the explicit prompt for ambiguous cases.
- **Red-team sweep** in Mode 3 Phase 7 and Mode 4 Sweep 5. The agent plays adversarial reviewer — the skeptical contracting officer — and identifies five strategic weaknesses (weakest technical paragraph, weakest cost line item, weakest past-performance reference, most vulnerable "unique" claim, weakest abstract sentence) with specific suggested rewrites. This catches strategic problems that mechanical checks like spell-check or the fictional-data grep miss.
- **Writing-rules enforcement** across all four modes. The agent applies Govafy.com's banned-phrase list during every drafting phase and runs a writing-rules sweep at the end of every workflow. The sweep flags any banned phrase with the rule category, the reason, and a suggested replacement drawn from the "tell, don't sell" principle.
- **Expanded mode descriptions.** The `AskUserQuestion` options in SKILL.md and the numbered prompts in AGENTS.md and the Cursor rule now include 2–3 sentence descriptions with typical-duration estimates so users can choose wisely.
- **Output rendering at the end of every workflow.** The agent now asks the user whether they want the completed proposal (or critique report in Mode 4) as a Word `.docx` file (editable) or a PDF (locked, ready to submit). Fallback paths defined for environments without LaTeX.
- **Mode-switching mid-session.** Users can switch between any of the four modes at any phase transition without losing collected context (eligibility verdict, template choice, draft sections, review findings).
- **README section "Four ways to run the kit"** explaining the four modes for AI-agent users, including duration estimates and the smart mode detection behavior.
- **README Option A — No AI tools, just download the templates.** New install option at the top of the install section for non-technical users who don't use AI coding agents. Walks them through downloading the ZIP, opening the `.docx` files in Word/Google Docs/Pages, and adapting them manually. Existing AI-agent install options re-lettered B–F.

### Changed

- **`SKILL.md`** now opens with a four-mode selection via Claude Code's `AskUserQuestion` tool (with 2–3 sentence descriptions per mode) and points at the workflow files. Smart mode detection pre-check added. Old "How to adapt the kit" section condensed — detailed adaptation logic moved into the workflow files.
- **`AGENTS.md`** now opens with a four-mode plain-text numbered prompt (with 2–3 sentence descriptions per mode) and points at the workflow files. Smart mode detection pre-check added. Same condensed adaptation section as SKILL.md.
- **`.cursor/rules/govafy-unsolicited-proposals.mdc`** now opens with the four-mode numbered prompt using Cursor's `@references/...` file reference syntax for the workflow files. Smart mode detection pre-check added.
- **`README.md`** install section reorganized to lead with the dual-audience principle. Audience 1 (non-AI users) now sees Option A first; Audience 2 (AI-agent users) sees Options B–F. The old "For humans" subsection was removed because it duplicated the new Option A. Release badge bumped to v1.1.0. The "Three ways to run the kit" section was renamed to "Four ways to run the kit" and expanded to include Mode 4 (Review Existing Proposal), the red-team sweep in Mode 3, the writing-rules enforcement across all modes, and duration estimates.
- Core rules (FAR citations, fictional-data warning, FAR 15.609 legend, cost realism, educational-not-legal disclaimer) are now stated once in each entry-point file and inherited by all four workflow modes — no duplication across `SKILL.md`, `AGENTS.md`, and the Cursor rule.
- **`full-workflow.md` Phase 7** was expanded from a three-part sweep (Appendix F + fictional-data + submission verification) to a five-part sweep that also includes the writing-rules sweep and the red-team adversarial review. The `conversational.md` and `intake-checklist.md` files similarly added the writing-rules sweep as part of their closing steps.

### Architectural notes

- **Drift prevention.** All seven new workflow files reference `guide.md` by section number (`Section 6`, `Appendix F`) and FAR citations verbatim, never by copied content. If `guide.md` is updated in the future, a single grep locates every cross-reference in the workflow files.
- **Dual-audience design.** The kit now intentionally serves two audiences from the same repository: non-technical users (Option A → static `.docx` files in `downloads/`) and technical users with an AI agent (Options B–F → interactive workflow modes). Both audiences use the same underlying content. The 9 existing `.docx` files in `downloads/` are unchanged in this release and remain the canonical deliverable for Audience 1.
- **Unchanged files.** `references/guide.md`, all 9 sample proposals under `references/general-samples/` and `references/specific-samples/`, all 10 `.docx` files under `downloads/`, `LICENSE`, `LICENSE-CONTENT`, `CONTRIBUTING.md`, `.gitignore`, and `assets/` are byte-identical to v1.0.0.

---

## [1.0.0] — 2026-04-11

### Added

- Initial public release of the Govafy.com Unsolicited Proposal Kit.
- **Master guide** (`references/guide.md`) — 12 sections and 9 appendices covering FAR Subpart 15.6 eligibility, format, the FAR 15.609 proprietary data legend, writing for evaluators, submission logistics, post-submission behavior, and template selection.
- **Three general sample proposals** covering the Innovation/R&D, Mission-Solution, and Crisis/Rapid-Response patterns. Fictional companies, real agency targets (ONR, VA, EPA).
- **Six agency-specific sample proposals** covering DCSA (SentinelMind), USSOCOM (NeuroEdge), MCSC (ForgeForward), GSA PBS (FedFacility IQ), OPM (LeadFed), and FEMA (ReadyRelief). All fictional company detail, real agency missions and program names.
- **Claude Skill configuration** (`SKILL.md`) — lets Claude Code users install the entire kit as an on-demand skill that automatically activates when the user asks about unsolicited proposals, FAR 15.6, or related topics.
- **Cross-agent entry point** (`AGENTS.md`) — compliant with the [AGENTS.md standard](https://agents.md) stewarded by the Linux Foundation. Enables the kit to work natively in OpenAI Codex, Cursor, Google Antigravity, GitHub Copilot, Google Jules, Amp, Factory, and any other AGENTS.md-compatible AI coding agent.
- **Cursor native project rule** (`.cursor/rules/govafy-unsolicited-proposals.mdc`) — optional Cursor-specific rule file with YAML frontmatter and `@`-referenced source files, giving Cursor users the same on-demand activation experience that Claude Code users get from `SKILL.md`.
- **Word document downloads** (`downloads/`) — `.docx` versions of the guide and all nine samples for users who prefer editing in Microsoft Word or Google Docs.
- **Dual-license structure** — MIT License for code/configuration, Creative Commons Attribution 4.0 for written content.

### Regulatory currency at initial release

- FAR citations current as of **FAC 2026-01** (effective March 13, 2026).
- Executive Order 14275, *Restoring Common Sense to Federal Procurement* (2025), cited as policy backdrop.
