# Mode 3 — Full Unsolicited Proposal Workflow

> **Purpose.** This file is the agent contract for **Mode 3**, the maximum-rigor workflow. The user picked "Full Workflow" at the entry-point question because they want eight scripted phases, visible progress tracking, document attachment requests at every relevant point, sign-off gates between every phase, and a final fictional-data sweep before the handoff packet is produced. Mode 3 is the right choice for first-time federal proposers, high-stakes proposals, or anyone who wants a paper trail.

---

## Mode contract

When the user picks Mode 3, the agent commits to the following rules for the rest of the engagement:

1. **Eight numbered phases.** Phase 0 (Kickoff) → Phase 1 (Eligibility) → Phase 2 (Template selection) → Phase 3 (Part 1 drafting) → Phase 4 (Part 2 drafting) → Phase 5 (Part 3 drafting) → Phase 6 (FAR 15.609 IP protection) → Phase 7 (Final sweep) → Phase 8 (Output rendering). Phases run in order.
2. **Visible progress tracker.** The agent uses a TodoWrite-style progress list (or numbered checklist if running in an agent without TodoWrite) so the user can see exactly which phase is in progress and what's coming next.
3. **Sign-off gate at every phase transition.** The agent does not move to Phase N+1 until the user explicitly confirms Phase N is complete and they're ready to proceed. Format: *"Phase N complete. [One-line summary]. Ready to proceed to Phase N+1, or would you like to revise Phase N first?"*
4. **Document attachment requests at every relevant phase.** When `intake-fields.md` flags a field as `[ATTACH]`, the agent requests the document explicitly during the phase that needs it, and explains why it's needed. **Attachment enforcement:** the agent MUST ask for each `[ATTACH]` document using the exact request language written in the phase instructions. "I already have enough information from earlier answers" is not a valid reason to skip an attachment request — earlier answers establish eligibility, attachments produce the draft. If the user says they don't have the document, that's fine — the agent notes it as a gap and moves on. But the agent must always ask.
5. **The fictional-data sweep is non-negotiable.** Phase 7 includes an explicit grep against all 9 sample files in `references/general-samples/` and `references/specific-samples/` to make sure no fictional company name, personnel name, patent number, or pilot result has leaked into the user's draft. This is the kit's #1 failure mode and Mode 3's biggest defense against it.
6. **The user can switch modes at any phase transition.** If they say "this is too much, drop to conversational" the agent re-offers the mode choice and transitions without losing collected context.
7. **The bracket-count quality gate applies at every sign-off.** Before declaring any phase "complete," the agent checks how many bracketed placeholder fields remain in the draft produced during that phase. If more than two brackets remain (excluding fields that genuinely belong to a later phase, like FAR 15.609 page numbers), the agent must collect the missing data before moving forward. See the Sign-off gate template section for the full rule.

---

## Phase 0 — Kickoff

### What the agent does

**0a. Set expectations.** State the mode contract in plain English so the user knows what they're signing up for:

> Great — we're in **Full Workflow** mode. Here's what to expect:
>
> I'm going to walk us through **eight phases**: eligibility check, template selection, drafting Part 1 (basic info), drafting Part 2 (technical), drafting Part 3 (cost and supporting), applying the FAR 15.609 IP protection legends, final sweep including a grep for fictional sample data, and finally rendering your completed proposal as a Word .docx file or a PDF.
>
> At every phase transition I'll pause and ask you to confirm before moving forward — that's the "sign-off gate." It feels like more friction than a casual conversation, but it's the right level of rigor for a real federal proposal where the proprietary markings have to be exactly right and every fact has to come from you, not from a sample.
>
> A few of the phases will ask you to **paste or attach documents** — your SAM.gov profile screenshot, your pilot data report, your patent filings, your key personnel resumes, your past performance contract numbers. I'll tell you why each one matters when we get there.
>
> The whole thing usually takes 60–120 minutes depending on how much you have ready. You can pause and come back, and you can switch to a lighter mode at any phase transition if this feels like overkill.
>
> Ready to kick off Phase 1?

**0b. Create the progress tracker.** Initialize a TodoWrite list (or numbered checklist if the agent doesn't have TodoWrite) with all eight phases:

```
Phase 1 — Eligibility (FAR 15.603(c) six-part test)           [pending]
Phase 2 — Template selection                                   [pending]
Phase 3 — Part 1 drafting (Basic Information)                 [pending]
Phase 4 — Part 2 drafting (Technical Information)             [pending]
Phase 5 — Part 3 drafting (Supporting Information)            [pending]
Phase 6 — FAR 15.609 IP protection legends                    [pending]
Phase 7 — Final sweep (Appendix F + writing-rules +
          fictional-data + RED TEAM + submission verify)      [pending]
Phase 8 — Output rendering (PDF or Word .docx)                [pending]
```

The agent updates this list as phases complete so the user can see progress visually.

**0c. State the mandatory reminders up front.** Surface all six core reminders so the user knows the rules before drafting begins:

1. **Fictional-data warning** — every sample in this kit is fictional; nothing from a sample lands in your draft
2. **Writing-rules rule** — no banned phrases from `writing-rules.md` appear in the draft; the "tell, don't sell" principle is the overarching filter on every claim
3. **FAR 15.609 legend rule** — proprietary markings must be verbatim from FAR 15.609(a) and (b), no paraphrasing
4. **Cost realism** — line-item ROM cost is required, not a top-line dollar figure
5. **Educational, not legal advice** — have an attorney review the final document before submission
6. **Currency check** — verify the agency's submission address on the agency's website on the day you submit

**0d. Sign-off gate.** *"Phase 0 complete. Ready to start Phase 1 — Eligibility?"* Wait for confirmation.

---

## Phase 1 — Eligibility (FAR 15.603(c) six-part test)

### What the agent does

**1a. Ask the six eligibility questions** from `intake-fields.md` Group C, one at a time, in plain English:

1. **Innovative and unique** — "What makes your approach genuinely new compared to what the agency and other vendors already provide? Be specific. 'Cheaper' or 'better' doesn't pass this test."
2. **Independently originated** — "Did your team come up with this on your own, with no government direction or tipoff?"
3. **No government supervision** — "Is any current federal employee helping you write this proposal?"
4. **Sufficient detail** — "Do you already have a working prototype, pilot data, technical white papers, or a credible cost model? If yes, we're good. If not, we need to talk about whether you're actually ready to propose this yet."
5. **No duplication** — "What does the target agency already have in this space? In-house programs? Existing contracts? Grants? How does your approach leapfrog them?"
6. **Not a known requirement** — "Have you searched SAM.gov for any open or recent solicitation, sources-sought notice, RFI, or draft PWS in the same topic area?"

**1b. Document attachment request.** For test #6, the agent asks for the SAM.gov check result:

> Please run a search on **SAM.gov** for any current or recent (last 12 months) opportunities in your topic area at the target agency. If you find anything that looks like a match, paste the title and notice number here. If you find nothing, just say "no matches" and we'll proceed.
>
> *(I need this in writing because the FAR 15.603(c)(6) test requires it and the agency reviewer will check too. If they find a sources-sought notice in the same topic area that you didn't respond to, your unsolicited proposal gets bounced.)*

**1c. Run the verdict.** The agent presents pass/fail as a clear table with one-line reasoning per test (same format as Mode 2 Step 4). All six must be "yes" for the proposal to qualify.

**1d. Sign-off gate.** If pass: *"Phase 1 complete. All six eligibility tests pass. Ready to proceed to Phase 2 — template selection?"* Wait for confirmation.

If fail: stop, explain which test failed and why, and recommend the alternative channel (SBIR/STTR, BAA, OTA, sources-sought response, GSA Schedule, subcontracting). Do not proceed to Phase 2.

---

## Phase 2 — Template selection

### What the agent does

**2a. Ask the user about the proposal pattern.** Use a structured choice (the agent uses `AskUserQuestion` if available in Claude Code; in other agents, a plain-text numbered prompt):

> Which of these patterns best fits your proposal?
>
> **1. Innovation / R&D** — A novel technology, patent, proof of concept, or research effort. The "what" is genuinely new. Best fit for ONR, AFRL, DARPA, NASA, NIH-style agencies.
>
> **2. Mission-Solution** — A services or operational solution to a known agency mission need. The *approach* is innovative even though the *problem* is recognized. **Most broadly applicable.** Best fit for VA, DoL, DOJ, civilian operational agencies.
>
> **3. Crisis / Rapid-Response** — A turnkey capability for an urgent or emerging need (disaster, surge, public health). Time-bound. Best fit for FEMA, EPA, HHS during crises.

After the user picks the general pattern, the agent asks whether the **target agency** matches one of the kit's six specific samples (DCSA, USSOCOM, MCSC, GSA PBS, OPM, FEMA). If yes, the agent uses the specific sample as the scaffold instead of the general template, because the specific samples show agency-particular mission language and program names.

**2b. Announce the template choice and explain why** in one sentence.

**2c. Sign-off gate.** *"Phase 2 complete. Using [Specific Sample 1 — SentinelMind / DCSA] as the structural scaffold. Ready to proceed to Phase 3 — drafting Part 1?"* Wait for confirmation.

---

## Phase 3 — Part 1 drafting (Basic Information under FAR 15.605(a))

### What the agent does

**3a. Read `intake-fields.md` Groups A and B** to know exactly which fields are needed for Part 1.

**3b. Walk the user through Group A — Company Identity.** Ask for each field conversationally:
- Legal company name
- Mailing address
- Type of organization
- CAGE Code
- UEI
- NAICS code and size standard
- Small business status
- Socioeconomic certifications (8(a), WOSB, HUBZone, SDVOSB)
- Facility security clearance level (if relevant to the target agency)

**3c. Document attachment requests:**

> 1. Please paste your **SAM.gov entity profile** — go to SAM.gov, log in, click your entity, and paste the Core Data section here. I need your CAGE Code and UEI in writing for the cover page.
>
> 2. If you have any **socioeconomic certification letters** (SBA 8(a) approval letter, WOSB certification, HUBZone certification, SDVOSB certification), paste them or attach them. These give the contracting officer a legal pathway to sole-source below certain dollar thresholds — they're worth getting right.

**3d. Walk the user through Group B — Target agency.** Collect:
- Target federal agency
- Target mission center / directorate
- Why this agency / why this directorate
- Agency strategic priorities cited
- Prior contacts with the agency
- Preliminary contact done? (Y/N)
- SAM.gov sources-sought check (already collected in Phase 1)

**3e. Document attachment request:**

> Paste any **prior communication with the target agency** — the email exchange where you confirmed they take unsolicited proposals, any reply from a contracting officer, any meeting notes from an industry day where you spoke to an agency representative. I need this for Section 3.7 of the proposal (Prior Agency Contacts), which is required by FAR 15.605(c)(7). If you've never talked to anyone at the agency, that's OK — say "no prior contacts" and I'll note it in the proposal.

**3f. Draft Part 1 on screen.** Using the collected Group A and Group B data, the agent produces:
- Cover page (offeror identity, title, target agency, date, validity period)
- Section 1.1 — Offeror description
- Section 1.2 — Points of contact
- Section 1.3 — Identification of proprietary data (placeholder until Phase 6)
- Section 1.4 — Other parties receiving the proposal
- Section 1.5 — Date of submission
- Section 1.6 — Authorized representative signature

The draft uses the structural scaffolding from the chosen template (Phase 2) but every fact, name, and number comes from the user's intake answers.

**3g. Sign-off gate.** *"Phase 3 complete. Part 1 (Basic Information) is drafted. [One-line summary of what's in the draft]. Ready to proceed to Phase 4 — drafting Part 2 (Technical Information)?"* Wait for confirmation.

---

## Phase 4 — Part 2 drafting (Technical Information under FAR 15.605(b))

### What the agent does

**4a. Read `intake-fields.md` Groups D and E** to know which fields are needed for Part 2.

**Phase 4 non-skip rule:** Even if the user provided detailed technical answers during Phase 1 (eligibility), the agent MUST still walk through Group D and Group E field-by-field during Phase 4. Phase 1 answers establish *eligibility* — Phase 4 answers produce the *draft*. They are different questions at different levels of detail. The eligibility check asks "is this idea genuinely new?" while Phase 4 asks "give me the patent application number, the pilot sample size, your CTO's degree and institution, and each person's percent commitment." Skipping Phase 4 intake because the user already described their technology during eligibility is the most common Mode 3 failure — it produces a Part 2 full of `[bracket]` placeholders that the user may not catch before submission.

**4b. Walk the user through Group D — Technical substance.** Collect:
- One-sentence description of the product/service
- What problem it solves for the agency
- What is genuinely new about the approach (the innovation moat)
- Patent or IP status
- Existing pilot or proof of concept
- Independent origin story
- Required government access
- Required clearances for the work

**4c. Document attachment requests:**

> 1. **Pilot data report** (if you have one). I need this so the technical approach section can cite real metrics — true positive rate, false positive rate, mean time to detect, sample size, methodology — instead of placeholder numbers. Numbers in your proposal must be traceable to a real source. Paste the report or attach the file.
>
> 2. **Patent filings** (if any). I need the patent number for issued patents and the application number for pending. These go into the "what is genuinely new" paragraph and into Section 1.3 of Part 1 if the patent itself is proprietary content.
>
> 3. **Technical white papers, conference presentations, or trade publications** about the technology. These strengthen the credibility of the technical approach and are great references in the bibliography. Paste them or attach files.
>
> 4. **Existing pitch materials** (deck, one-pager, executive summary). Even if they're commercial-flavored, I can extract the structure and language and translate it for the federal context.

**4d. Walk the user through Group E — Key personnel.** For each role (Principal Investigator, Operational Lead, Program Executive, Program Manager), collect:
- Full name
- Title
- Highest degree and institution
- Years of relevant experience
- Active security clearance level
- Percent commitment to this project
- One-paragraph bio focused on relevant experience

**4e. Document attachment request:**

> **Resumes for each named key person.** I need the resumes so the bios in Section 2.6 are accurate and so the agency can verify the qualifications. The resumes don't go into the proposal — they're for my reference only — but FAR 15.606-2 evaluates the qualifications of named key personnel, so the bios in the proposal have to match the resumes.

**4f. Draft Part 2 on screen.** Using the collected data, the agent produces:
- Section 2.1 — Title and ~199-word abstract (drafted last, after the other sections)
- Section 2.2 — Objectives (3–5 specific, measurable goals)
- Section 2.3 — Method of approach (phased execution plan)
- Section 2.4 — Anticipated results (specific, quantified deliverables)
- Section 2.5 — Mission support statement (the single most important paragraph in the proposal — explicit tie to the agency's published priorities)
- Section 2.6 — Key personnel (with real bios from resumes)
- Section 2.7 — Type of support needed from the government

**4g. Sample-comparison checkpoint.** Before declaring Phase 4 complete, the agent compares the drafted §2.6 (Key Personnel) against the matching sample's §2.6. If the user's bios have fewer specifics than the sample's fictional bios — missing degree discipline, missing institution, missing years of experience, missing commitment percentage, missing clearance status — the agent goes back and asks for those details. The sample is the quality floor, not the ceiling. Every named person in the user's proposal should have at least as much concrete detail as the fictional characters in the sample.

**4h. Sign-off gate.** *"Phase 4 complete. Part 2 (Technical Information) is drafted. [One-line summary]. Ready to proceed to Phase 5 — drafting Part 3 (Supporting Information)?"* Wait for confirmation. **Apply the bracket-count quality gate** before using this sign-off — see the Sign-off gate template section below.

---

## Phase 5 — Part 3 drafting (Supporting Information under FAR 15.605(c))

### What the agent does

**5a. Read `intake-fields.md` Groups F, G, H, I** to know which fields are needed for Part 3.

**Cost intake non-skip rule:** The agent MUST walk the user through every Group F line item, one at a time, and collect a specific number or "not applicable" for each. Producing an empty cost table with `$[____]` placeholders and moving on is not acceptable — it is the second most common Mode 3 failure. If the user says "I don't have my cost numbers ready," the agent should help them estimate: "What do you pay your lead scientist per hour? How many hours a week would they spend on this over a 12-month period? That gives us a starting labor figure." The goal is a defensible ROM, not a perfect budget — but a ROM with zero numbers is not a ROM.

**ROM acronym rule:** Always spell out "Rough Order of Magnitude (ROM)" on first use in the proposal, both in the §3.1 heading and in the body text. Do not assume the evaluator knows the acronym — unsolicited proposals often reach non-acquisition staff first who may not be familiar with procurement shorthand.

**5b. Walk the user through Group F — Cost model.** Collect every line item:
- Total estimated price
- Total period of performance
- Direct labor (hours and blended rate)
- Subcontractor costs
- Other direct costs (ODCs)
- Travel
- Indirect cost rate (G&A or overhead)
- Fee

**5c. Document attachment request:**

> **Rate justification documentation** — how you derived your labor rates. This could be DCAA-approved rates, market comparables (Glassdoor, Payscale, BLS data), prior commercial contract rates, or your CFO's signed rate sheet. FAR 15.609(a) protects this as proprietary so it doesn't go in the public proposal — it goes in a separate sheet that's marked proprietary. But I need it now to make sure the line-item cost in Section 3.1 is realistic.
>
> Push the user to think through where each number actually came from. Vague answers ("I just guessed") are a top-three rejection reason per `guide.md` Section 11.

**5d. Walk the user through Group G — Past performance.** For each of 3–5 references, collect:
- Customer / agency name
- Contract or project number
- Period of performance
- Total dollar value
- One-paragraph description
- Reference contact (name, email, phone)
- Permission to contact this reference
- Federal vs commercial

**5e. Document attachment request:**

> **Past performance contract numbers and CPARS records** if they exist. If you have prior federal work, the agency reviewer can look up your CPARS scores directly — make sure you know what they say before they're seen. If you have only commercial past performance, that's fine for a first-time federal offeror; just be explicit about it in the proposal.

**5f. Walk the user through Group H — Other disclosures.** Collect:
- Organizational conflicts of interest
- Active security clearances
- Environmental impact considerations
- Other federal agencies receiving this proposal
- Related federal funding currently held

**5g. Walk the user through Group I — Timing and contract preferences.** Collect:
- Period of validity (recommend 9–12 months)
- Preferred contract type (FFP, CPFF, T&M, IDIQ)
- Earliest desired start date
- Phase breakdown

**5h. Draft Part 3 on screen.** Using the collected data, the agent produces:
- Section 3.1 — Proposed Price — Rough Order of Magnitude (ROM) (line-item cost table with real numbers from Group F intake)
- Section 3.2 — Period of validity
- Section 3.3 — Type of contract preferred
- Section 3.4 — Proposed duration of effort
- Section 3.5 — Organization description, experience, and facilities
- Section 3.6 — Conflicts of interest, security clearances, environmental impacts
- Section 3.7 — Names and phone numbers of prior agency contacts

**5i. Sign-off gate.** *"Phase 5 complete. Part 3 (Supporting Information) is drafted. [One-line summary]. Ready to proceed to Phase 6 — applying the FAR 15.609 IP protection legends?"* Wait for confirmation.

---

## Phase 6 — FAR 15.609 IP protection legends

### What the agent does

**6a. Identify which pages contain proprietary content.** The agent walks through the draft and asks the user to confirm which sheets should be marked as proprietary. Typical candidates:
- Sheet containing the technical approach details (Section 2.3)
- Sheet containing pilot data and performance metrics (Section 2.4)
- Sheet containing patent / IP details (Section 2.6 if applicable)
- Sheet containing the line-item cost structure (Section 3.1 plus the separate rate justification sheet)

The user has the final say on what counts as proprietary. **Over-marking is almost as bad as under-marking** per `guide.md` Section 7.5 — over-marking weakens the FOIA position.

**6b. Apply the title-page legend** verbatim from `guide.md` Appendix B:

```
USE AND DISCLOSURE OF DATA

This proposal includes data that shall not be disclosed outside the
Government and shall not be duplicated, used, or disclosed — in whole
or in part — for any purpose other than to evaluate this proposal.
However, if a contract is awarded to this offeror as a result of — or
in connection with — the submission of these data, the Government
shall have the right to duplicate, use, or disclose the data to the
extent provided in the resulting contract. This restriction does not
limit the Government's right to use information contained in these
data if they are obtained from another source without restriction.
The data subject to this restriction are contained in Sheets
[insert the user-confirmed page numbers, e.g., "Sheets 3, 5–7, 9, and 11"].
```

The agent fills in the exact page numbers in the last line. **"Various pages" is not acceptable** per FAR 15.609(c).

**6c. Apply the per-sheet legend** verbatim from `guide.md` Appendix C, on every proprietary page (footer placement):

```
Use or disclosure of data contained on this sheet is subject to the
restriction on the title page of this proposal.
```

**6d. Update Section 1.3** of Part 1 (Identification of proprietary data) with the same exact list of page numbers used in the title-page legend.

**6e. Sign-off gate.** *"Phase 6 complete. FAR 15.609 IP protection legends applied. Title-page legend lists Sheets [list]. Per-sheet legend on every proprietary page. Ready to proceed to Phase 7 — final sweep?"* Wait for confirmation.

---

## Phase 7 — Final sweep (Appendix F + writing-rules + fictional-data + red-team + submission verification)

This is the most important phase in Mode 3. It's where strategic and mechanical quality checks happen **before** the proposal is rendered and sent to the user. Phase 7 has **five sub-steps**, each a different class of check. Do not skip any of them.

### What the agent does

**7a. Run `guide.md` Appendix F (Pre-Submission Checklist)** out loud, all 30 items, every one a real failure mode observed on rejected proposals. The agent walks through each item and confirms with the user that it's complete. Categories:

- **Content** (8 items: title length, abstract, objectives, technical approach, anticipated results, mission support, key personnel, government support)
- **Cost and business terms** (5 items: price specificity, cost breakdown, validity, contract type, duration)
- **Basic Information / FAR 15.605(a)** (7 items: offeror, certifications, POCs, proprietary data identification, other agencies, date, signature)
- **IP protection / FAR 15.609** (4 items: title-page legend verbatim, page numbers, per-sheet legend, no over-marking)
- **Administrative** (6 items: past performance, COI, prior contacts, SAM.gov, agency address verified, format, submission log)
- **Sanity checks** (4 items: re-ran eligibility, re-read kill-shot list, re-checked SAM.gov, proofread by another person)

**Checklist enforcement rule:** When Appendix F identifies a "Fail" or "Revise" item, the agent MUST either (a) fix it immediately by going back to the relevant section and making the change, or (b) present the specific failure to the user and get explicit acknowledgment that they want to proceed with the gap. Logging a failure in a table and moving on to the next phase is not acceptable — that defeats the purpose of the checklist. The most common failures the agent should fix in place: abstract too short or missing cost (expand it), mission support statement missing citations (add them or ask the user for sources), POC fields still blank (ask the user now). If the user says "I'll fix that later after I download the document," that counts as explicit acknowledgment — note it and move on.

**7b. Run the writing-rules sweep.** Grep the entire draft against the banned-phrase list in `references/workflows/writing-rules.md` (Rules 1–8). For each hit, report:
- The exact phrase that matched
- The rule category (Crutch / Boasting / Weak / Hidden-verb / Redundant / Long / Legal)
- The section and approximate paragraph where it appears
- A suggested replacement drawn from the relevant table or the "tell, don't sell" principle

Any Rule 2 (Boasting) hit is treated as high severity and flagged at the top of the sweep report — these directly hurt the FAR 15.603(c)(1) eligibility argument. The user can override any flag but must do so knowingly.

**7c. Run the fictional-data grep.** This is the kit's strongest defense against the #1 failure mode. The agent searches the entire draft for any of these markers from the kit's 9 sample proposals:

```
Axiom Sentinel | SentinelMind | Dr. Priya Ramanathan | Dr. Kenji Maruyama | Sarah Whitaker | Claire Donoghue
Nova Materials | ONR sample
Meridian Workforce | VA sample
RapidResponse Water | EPA sample
NeuroEdge | POTFF | USSOCOM sample
ForgeForward | X-FAB | TACFAB | PM CSS | MCSC sample
FedFacility IQ | GSA PBS sample
LeadFed | FEI | OPM sample
ReadyRelief | FEMA sample
11,XXX,XXX | 18/YYY,YYY     (sample patent number patterns)
acme.example | axiomsentinel.example     (sample email domains)
2,400 cleared users | 4.2 hours | 38 hours     (sample-specific numbers)
```

**If any match is found**, the agent stops and asks the user: *"I found '[match]' in the draft. This appears in [sample name]. Is this an intentional reference, or did it leak from the scaffolding sample? If it leaked, I'll fix it before we render."*

**7d. Run the RED TEAM sweep.** This is the sweep that separates Mode 3 from a generic spell-check. The agent explicitly plays adversarial reviewer — the skeptical DCSA (or other agency) contracting officer reading the proposal for the first time — and identifies five strategic weaknesses:

1. **The weakest paragraph in the technical approach.** Which section would a skeptical reviewer attack first? Quote the specific paragraph and explain the weakness. Suggest a specific rewrite that strengthens it.
2. **The weakest cost line item.** Which specific labor rate, subcontract, or ODC line would a contracting officer most likely question during FAR 15.606-2 cost realism review? Why? Suggest either a stronger justification or a revised number.
3. **The weakest past performance reference.** Which of the 3–5 references is least relevant, most stale, or most likely to receive a poor CPARS score? Suggest either replacing it or adding context that strengthens it.
4. **The most vulnerable "unique" claim.** Under FAR 15.607, if the contracting officer posts a Notice of Intent to Sole Source on SAM.gov, what competitor could credibly raise their hand and say "we can do that too"? If there's no obvious competitor, note that as a strength. If there is one, suggest how to strengthen the uniqueness argument to survive the challenge.
5. **The weakest sentence in the 199-word abstract.** Since the abstract may be the only thing a senior reviewer reads, the weakest sentence is a disproportionate risk. Quote it and suggest a specific rewrite.

The agent presents all five findings in the same format:

> ### Red Team Finding [N]: [Category]
>
> **Quoted text:** *"[the actual sentence or paragraph from the draft]"*
>
> **Adversarial argument:** "If I were the contracting officer, I would say: [specific challenge]"
>
> **Suggested rewrite:** [specific replacement text or specific edit instruction]

**If the user rejects a Red Team finding**, the agent accepts the override but notes it in the critique packet. If the user accepts a finding, the agent applies the suggested rewrite directly into the draft before moving on.

**The framing the agent uses:** *"Here's what I'd attack if I were the contracting officer — fix these before you submit. These are the strategic weaknesses no mechanical check can catch."*

**7e. Verify the agency submission address.** The agent confirms with the user that they have checked the target agency's website (e.g., dcsa.mil) for the current submission POC on or near the day of submission. FAR 15.606 delegates this to each agency and addresses change without warning.

**7f. Sign-off gate.** *"Phase 7 complete. Appendix F all 30 items confirmed. Writing-rules sweep returned [N] violations [resolved / user-overridden]. Fictional-data grep returned [zero matches / N matches resolved]. Red-team sweep produced 5 findings [resolved / N user-overridden]. Submission address verified. Ready to proceed to Phase 8 — output rendering?"* Wait for confirmation.

---

## Phase 8 — Output rendering (PDF or Word .docx)

### What the agent does

**8a. Invoke `references/workflows/render-output.md`.** Follow that file's instructions exactly — it defines the verbatim "Word .docx or PDF?" question, the filename convention, the pandoc commands, the verification steps, and the fallback paths if PDF rendering fails.

**8b. Run the pre-render anti-bleed check** (defined in `render-output.md`). This is a second pass of the fictional-data grep, run immediately before pandoc converts the Markdown to its final format. Belt and suspenders against the #1 failure mode.

**8c. Generate the file** using the filename convention `<company-slug>-unsolicited-proposal-<YYYY-MM-DD>.<ext>`, save it to the user-specified location (default: current working directory), and verify the file exists with a reasonable size.

**8d. Build the handoff packet.** Mode 3 produces a complete handoff packet, not just the rendered file. The agent MUST deliver all five items below. Do not declare Phase 8 complete until all five are confirmed delivered.

**Handoff checklist:**

- [ ] **The rendered file** (.docx or .pdf) at the saved path — confirm it exists and has a reasonable file size
- [ ] **The Markdown source** at `<save-location>/<filename>.md` so the user can re-render later or make edits — the agent must save this file, not just offer to
- [ ] **A submission log template** — a one-page Markdown file listing the date, file path, agency POC, submission format, and a blank field for "acknowledgement received on [date]"
- [ ] **The three mandatory reminders** stated explicitly in the chat (not buried in a footnote):
   1. Open the file in Word and visually verify the FAR 15.609 legend is on the cover page and on every proprietary page
   2. Have a federal contracts or procurement attorney review the document before submission — this kit is educational structuring, not legal advice
   3. Verify the agency submission address on the target agency's website on the day you submit — FAR 15.606 delegates submission procedures to each agency and these addresses change
- [ ] **Remaining gaps summary** — a plain-English list of every bracketed placeholder or "Fail" item from Phase 7 that the user acknowledged but did not fix during the session. This is the user's punch list for what to complete before they actually submit. Example: "Before you submit, you still need to: fill in Dr. Tanaka's degree and university, name your Program Manager, complete the cost table with real numbers, and add past performance references with contact information."

**8e. Update the progress tracker.** Mark all 8 phases as complete.

**8f. Final sign-off.** *"Phase 8 complete. Your proposal is saved at `<full-path>`. The handoff packet is at `<save-location>/`. The eight-phase Full Workflow is complete. Before you submit, please [three reminders]. You have [N] items on your punch list to complete before submission — see the list above. Good luck."*

---

## Sign-off gate template (reusable between every phase)

The agent uses this exact format at every phase transition:

> **Phase [N] complete.**
>
> [One-line summary of what was produced in this phase]
>
> Ready to proceed to **Phase [N+1] — [phase name]**, or would you like to revise Phase [N] first?

The agent waits for an affirmative response (`yes`, `proceed`, `next`, `go`) before moving to the next phase. If the user wants to revise, the agent stays in the current phase until the revision is complete.

### Bracket-count quality gate (mandatory at every sign-off)

Before declaring any phase "complete," the agent MUST scan the draft content produced in that phase for **bracketed placeholder fields** — text like `[Insert]`, `[Name]`, `[____]`, `[TBD]`, `[%]`, `[X]`, or any `[square-bracket placeholder]` that indicates missing user data.

**Rule:** If the draft produced in the current phase contains **more than two bracketed placeholders**, the agent MUST NOT declare the phase complete. Instead, the agent says:

> Phase [N] is drafted, but I still need [count] items from you before we can finalize:
>
> 1. [field name] — [why it's needed]
> 2. [field name] — [why it's needed]
> [...]
>
> Let's fill these in now. [Ask the first missing field.]

The agent stays in the current phase and collects the missing data conversationally until the bracket count is two or fewer. Only then does it use the standard sign-off gate format above.

**Why this rule exists:** Without it, the agent can technically "complete" every phase by drafting correct section headings with empty brackets, producing a document that looks structurally complete but is not submission-ready. This is the #1 observed failure mode in AI-assisted proposal drafting — the agent treats structure as completion. The bracket gate forces the agent to treat *content* as completion.

**The two-bracket exception** is for fields that genuinely cannot be filled until a later phase (e.g., FAR 15.609 page numbers in §1.3, which are set in Phase 6) or fields that require a wet signature. These are expected and do not block the gate.

---

## Mandatory reminders

The agent surfaces these reminders at the right moments during the workflow. The full set is stated at Phase 0 (kickoff) and Phase 7 (final sweep), and individual reminders are restated at the relevant phase:

1. **Fictional-data warning** — restated at Phase 0, Phase 4 (when the agent pulls up a sample as scaffolding), Phase 7 (during the grep), and Phase 8 (during the pre-render anti-bleed check)
2. **FAR 15.609 legend rule** — restated at Phase 0 and Phase 6
3. **Cost realism** — restated at Phase 0 and Phase 5 (during Group F intake)
4. **Educational, not legal advice** — restated at Phase 0 and Phase 8 (in the handoff packet)
5. **Currency check** — restated at Phase 0, Phase 7 (submission address verification), and Phase 8 (in the handoff packet)

---

## Mode-switch note

If the user wants to switch modes mid-workflow:

1. Acknowledge the switch
2. Re-offer the three-mode selection from the kit's entry point
3. After the user picks, transition to the new workflow file **without losing the context already collected**. For example, if the user is in Phase 4 of Mode 3 and switches to Mode 1, the agent carries forward:
   - The eligibility verdict (from Phase 1)
   - The chosen template (from Phase 2)
   - The Part 1 draft (from Phase 3)
   - Whatever was in progress in Phase 4
4. Continue from the appropriate point in the new workflow

The user retains full ownership of their data at all times. Nothing is lost in a mode switch.

---

**End of full-workflow.md (Mode 3).**
