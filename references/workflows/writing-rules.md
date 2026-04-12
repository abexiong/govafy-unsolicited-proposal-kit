# Writing Rules — What Never to Say in an Unsolicited Proposal

> **Purpose.** This file is the shared writing-rules reference used by **all four workflow modes** (Conversational, Intake Checklist, Full Workflow, Review Existing Proposal) during every drafting and review phase. It's a tightened subset of Govafy.com's full proposal-writing playbook — the phrases and patterns that most often sink unsolicited proposals at federal agencies. The AI agent applies these rules automatically when generating or reviewing draft content, and runs a final writing-rules sweep before rendering the output file.

---

## The one principle behind all eight rules: **tell, don't sell**

Federal evaluators read unsolicited proposals with active skepticism. They didn't ask for your idea — they're reading because it landed on their desk uninvited, and they're looking for reasons to stop reading. Marketing language gives them those reasons in the first 30 seconds.

**Selling** is telling the evaluator you're great: *"world-class team," "state-of-the-art technology," "uniquely qualified," "comprehensive solution."*

**Telling** is showing the evaluator the specific facts that prove you're great: *"14 years of cleared-network behavioral analytics experience," "87% true-positive rate in an 18-month 450-user pilot," "the only team offering combined behavioral-biometric and linguistic-drift analysis."*

Every rule in this file is a specific application of **tell, don't sell**. When in doubt, ask: "Did I claim it, or did I prove it?"

---

## The before/after example — one paragraph, two versions

This is the single most important example in the file. Read both versions carefully. Every banned phrase in Rules 1–6 appears in the "Before" paragraph. Every fix in the "After" paragraph is a specific, substantiated, measurable statement. The "After" is 40% shorter and infinitely more credible.

### Before (filler + boasting + weak words — this is what NOT to write)

> *"Umbra Signals is a world-class, cutting-edge behavioral analytics leader that is uniquely qualified to leverage our extensive experience to deliver a comprehensive, state-of-the-art insider threat solution. We understand DCSA's requirements and are committed to being the right choice for this critical mission. Our team has industry best practices and we look forward to the opportunity to utilize our methodology in a holistic, robust manner. We believe our revolutionary approach will facilitate the modernization of insider threat detection. We are pleased to submit this proposal and would be honored to discuss it further."*

**What's wrong with this paragraph** (marked in order of appearance):
- *"world-class, cutting-edge"* — boasting, unprovable (Rule 2)
- *"leader"* — who said? (Rule 2)
- *"uniquely qualified"* — prove it (Rule 2)
- *"leverage"* — filler word (Rule 1)
- *"extensive experience"* — how much? (Rule 2)
- *"comprehensive"* — vague (Rule 3)
- *"state-of-the-art"* — overused (Rule 2)
- *"We understand DCSA's requirements"* — there are no requirements (Rule 1)
- *"committed to"* — intention, not action (Rule 3)
- *"the right choice"* — prove it (Rule 2)
- *"industry best practices"* — whose standard? (Rule 2)
- *"look forward to the opportunity"* — empty filler (Rule 1)
- *"utilize"* — use "use" (Rule 6)
- *"methodology"* — use "methods" (Rule 6)
- *"holistic, robust"* — consultant-speak (Rule 3)
- *"We believe"* — nobody cares (Rule 3)
- *"revolutionary"* — boasting, modern offender (Rule 2)
- *"facilitate"* — use "help" (Rule 6)
- *"pleased to submit"* — empty filler (Rule 1)
- *"would be honored"* — weak, unnecessary (Rule 3)

**Paragraph word count:** 98 words. **Substantive information conveyed:** approximately zero.

### After (specific + substantive — this is what TO write)

> *"Umbra Sentinel detects insider threats 4.2 hours faster than the rules-based DLP tools currently deployed across DoD cleared-workforce networks. It does this by correlating two signals no current tool combines: continuous behavioral biometrics (keystroke and mouse dynamics) and linguistic-drift analysis of internal communications. In an 18-month closed-network pilot with 450 cleared users at a Tier-1 defense prime, Umbra Sentinel achieved an 87% true-positive rate and a 2.1% false-positive rate against synthetic red-team insider scenarios. This approach directly addresses the pre-incident trusted-insider detection gap DCSA's DITMAC identified in its 2024 public capability assessment. Umbra Signals has spent 24 months and $2.1M of internal R&D developing the platform; the company holds one pending patent and was founded in 2023 by three co-founders with combined 37 years of cleared-network cyber experience."*

**What's right about this paragraph:**
- Leads with a **measurable differentiator** (4.2 hours faster)
- States the **unique technical angle** (two correlated signals)
- **Names a specific gap** the agency has publicly acknowledged
- Cites **real pilot data** with sample size and error rates
- States **investment, IP, and team experience** with specific numbers
- Uses zero boasting words, zero weak claims, zero filler phrases
- Every sentence can be verified or challenged by an evaluator — which means every sentence is credible

**Paragraph word count:** 135 words. **Substantive information conveyed:** the entire value proposition.

Note that the "After" paragraph is **longer** than the "Before" paragraph (135 vs 98 words). This is the most common misconception about proposal writing — that the goal is to be short. The real goal is to be **substantive**. A 135-word paragraph full of specific facts is far more credible than a 98-word paragraph of marketing fluff.

---

## How the agent uses this file

Three things happen whenever this file is active:

1. **Drafting avoidance.** When the agent generates a draft section of the user's proposal, it does not use any of the banned phrases in this file. If the user asks for one explicitly ("please say we're world-class"), the agent pushes back, explains the rule, and offers a substantive alternative.

2. **Revision coaching.** When the user pastes their own draft content for the agent to refine (common in Mode 1 Conversational and Mode 4 Review Existing Proposal), the agent flags any banned phrases inline with the category number and reason, and suggests a specific replacement drawn from the "tell, don't sell" principle above.

3. **Writing-rules sweep before rendering.** At the end of every workflow mode — Phase 7 in Mode 3, closing step in Modes 1, 2, and 4 — the agent runs a grep of the full draft against the banned phrase list in this file. Any hit is surfaced to the user for revision before pandoc converts the draft to .docx or PDF. Same pattern as the fictional-data sweep in `render-output.md`, just a different target list.

---

## Rule 1 — Never use crutch words

Crutch words are what writers reach for when they don't know what to say. In an unsolicited proposal they're extra dangerous because the agency **didn't give you requirements to understand** — there is no RFP to react to. If you say "we understand your requirements," the evaluator immediately knows you don't have a real insight, because there's nothing for you to have understood.

| Don't say | Why it's bad | Use instead |
|---|---|---|
| *"We understand your requirements"* | There are no requirements. This is your idea, not theirs. The phrase is nonsensical in an unsolicited context. | Make a specific observation about the agency's mission or a published priority, and connect your idea to it. Demonstrate insight — don't claim it. |
| *"Leverage our experience"* | "Leverage" is filler. It tells the evaluator you know there's an advantage but don't know how to explain it. | Show the experience. *"Our team has executed 4 prior cleared-workforce behavioral-analytics pilots totaling 2,400 users."* |
| *"Thank you for the opportunity"* | There is no opportunity. You created this moment by submitting unsolicited. The phrase signals desperation. | Delete it. Start with the substance. |
| *"We look forward to..."* | Empty closing filler. Wastes evaluator attention. | Replace with a specific next-step commitment. *"I will follow up by [date] to schedule a technical interchange meeting if DCSA is interested."* |
| *"We are pleased to submit"* | Empty filler. Of course you are. | Delete it. The title page already says you're submitting. |

---

## Rule 2 — Never use boasting words

**This is the category where unsolicited proposals die most often.** FAR 15.603(c)(1) requires the idea to be *"innovative and unique."* Evaluators are trained to apply that test skeptically. Phrases like "state-of-the-art" and "leading edge" are exactly the kind of empty marketing language that makes an evaluator mark an idea as "me-too rebranding" rather than genuine innovation. Every boast without proof directly hurts your eligibility argument.

| Don't say | Why it's bad |
|---|---|
| *"state-of-the-art"* | Overused to the point of meaninglessness. Every vendor says it. The evaluator will want proof — what, specifically, is at the state of the art, and compared to what? |
| *"world-class," "world-renowned," "premier"* | Unprovable. An evaluator reading "world-class team" has no way to verify it, so they mentally downgrade it to "a team." |
| *"leading edge," "cutting edge," "pioneers," "industry leader"* | Same problem. Prove it with a citation, a patent number, or a third-party ranking — or remove it. |
| *"best of breed," "best in class"* | Clichéd and unprovable. |
| *"uniquely qualified," "very unique"* | "Unique" is binary — something either is or isn't. "Very unique" is nonsense. "Uniquely qualified" requires proof. |
| *"the right choice"* | Prove it. What alternatives did you consider, and why does your approach beat them? |
| *"industry best practices," "industry standard"* | Who decided it's the standard? Cite an authority (NIST, ISO, a federal standard) or drop the phrase. |
| *"revolutionary," "transformative," "game-changing"* | Modern AI-era offenders. Evaluators have heard these from every SaaS pitch in the last five years. |

**The fix for all of Rule 2:** show the unique technical or methodological claim with specific evidence — a patent number, a peer-reviewed result, a measurable metric from a pilot, a named dataset, a specific capability the competition doesn't have. If you can't substantiate it, delete it.

---

## Rule 3 — Never use weak or vague claim words

These are words that sound like they mean something but actually don't. The evaluator's job is to decide whether your proposal will deliver a specific outcome. Weak intention words ("committed," "strive," "hope") signal doubt. Vague quality words ("comprehensive," "robust," "holistic") signal marketing fluff. Either way, they train the reader to skip paragraphs.

| Don't say | Why it's bad |
|---|---|
| *"we are committed," "dedicated," "devoted"* | Customers don't want your commitment; they want results. State the specific deliverable. |
| *"we believe," "we think," "we feel"* | The evaluator doesn't care what you believe. Turn the belief into a measurable prediction. |
| *"we will strive," "we will try," "we will attempt"* | Signals you're not sure you can do it. Either you will or you won't. If you can't commit, scope the work smaller. |
| *"we hope," "we intend," "we desire"* | Same problem — intentions are not deliverables. |
| *"comprehensive"* | Comprehensive compared to what? Always prompts the evaluator to ask "what did you leave out?" |
| *"robust"* | Means nothing without a metric. Replace with a specific performance target. |
| *"holistic," "synergistic"* | Consultant-speak. Evaluators roll their eyes. |
| *"top-quality," "full-service"* | As opposed to what? Partial service? Bottom quality? |
| *"our highest priority," "our mission is to"* | Your internal priorities are irrelevant. Describe what the proposal will deliver. |
| *"trustworthy"* | If you have to say it, the evaluator now doubts it. Demonstrate trustworthiness through past performance, clearances, and specific references. |
| *"we would be honored"* | Empty feeling word. Make the proposal about the customer, not your feelings. |

**The fix for all of Rule 3:** turn every intention into a specific deliverable with a measurable outcome. *"We are committed to quality"* → *"We will deliver a formal effectiveness assessment with an independent technical panel review at month 22."*

---

## Rule 4 — Replace hidden-verb phrases with action verbs

Federal proposal writing defaults to bureaucratic noun constructions — "held a meeting," "performed an analysis of," "gave a demonstration." These are slower to read and waste evaluator attention. The action-verb equivalents are shorter, clearer, and more credible.

| Don't say | Use |
|---|---|
| arrived at the conclusion | concluded |
| gave a demonstration | demonstrated |
| performed an analysis of | analyzed |
| has a requirement for | requires |
| held a meeting | met |
| made a payment | paid |
| reached an agreement | agreed |
| conducted an evaluation | evaluated |

**The fix:** whenever you see a "noun + of / for" construction, ask whether there's a single verb that means the same thing. Usually there is.

---

## Rule 5 — Cut redundant phrases

Evaluator attention is a limited resource. Every extra word in your proposal costs you a little bit of attention you could have spent earning. The phrases below are the most common sources of bloat in federal proposal writing.

| Don't say | Use |
|---|---|
| in order to | to |
| for the purpose of | for, to |
| prior to | before |
| subsequent to | after |
| at this point in time | now |
| in the event that | if |
| in the case of | if |
| in an effort to | to |
| on a monthly basis | monthly |
| a number of | several |
| past experience | experience |
| end result | result |
| new innovation | innovation |
| advance planning | planning |
| close proximity | near |
| each and every | each |
| exact same | same |
| first and foremost | first |
| with regard to | about |
| in accordance with | per, by |

**The fix:** when you draft a sentence, re-read it once asking "what can I cut without losing meaning?" Most drafts shrink 15–25% on the first edit pass.

---

## Rule 6 — Use short words instead of long words

Latinate vocabulary sounds educated but reads slower and scores lower on comprehension tests. The short Anglo-Saxon equivalents are clearer, faster, and more credible.

| Long | Short |
|---|---|
| utilize | use |
| methodology | methods |
| ascertain | learn, find out |
| endeavor | try |
| encompass | include, cover |
| initiate | start, begin |
| terminate | end, stop |
| substantial | large |
| subsequent | after, later |
| facilitate | help, allow |

**The fix:** default to the shorter word. If you feel a long word is needed for precision, check whether the precision is real or just signaling.

---

## Rule 7 — Watch legal words (they have binding meaning)

A small number of words create real legal obligations if used in a proposal that becomes part of a contract. Use them deliberately and only when you mean them.

- **"assure"** — technically means *satisfy someone's doubts*. Used about people, not things. *"I assure you this will work"* is informal speech. Don't use in a proposal.
- **"ensure"** — means *guarantee or make certain*. Safer than "assure" for technical guarantees, but still a commitment.
- **"insure"** — means *buy an insurance policy for*. Don't use unless you actually mean insurance.
- **"guarantee" / "warranty"** — creates a legal warranty if the proposal becomes a contract. Use only if your legal counsel has approved the specific commitment. If you're not sure, use *"commit to"* instead.

**The fix:** when in doubt, replace with *"commit to"* and have an attorney review binding language before the final document leaves your desk. This is one of the reasons the kit's standard reminder at the end of every workflow is to have a federal contracts attorney review the draft before submission.

---

## Rule 8 — Source every claim about agency priorities

This rule is specific to unsolicited proposals and does not appear in most general proposal-writing guides. Because the agency **did not ask** for your proposal, any claim you make about what they prioritize, emphasize, or care about is inherently suspect. Unlike a solicited proposal where the RFP tells you what the agency wants, here you are asserting the agency's priorities — and if you get it wrong, the evaluator stops reading.

| Don't say | Why it's bad | Use instead |
|---|---|---|
| *"This aligns with USACE emphasis on..."* | Which emphasis? Where did they say it? The evaluator knows their own priorities — if you assert one they don't recognize, you lose credibility. | Cite a specific published source: strategic plan page number, budget justification line item, public testimony, press release URL, or named policy document. *"This aligns with the USACE FY2026 Civil Works Strategic Plan, Objective 3.2 (Environmental Sustainability)."* |
| *"The agency has identified X as a priority"* | Who identified it? When? In what document? | Name the document, the date, and ideally the page or section. If you can't find a published source, ask the user — they may have heard it in a briefing, which should be cited as a prior contact. |
| *"Broader DoD priorities include..."* | DoD publishes hundreds of priorities. Which one? | Cite the specific directive, executive order, or strategy document. Example: *"Consistent with DoD Instruction 4715.18, Environmental Restoration, and the Office of the Under Secretary of Defense (A&S) PFAS Task Force guidance dated [date]."* |

**The fix for all of Rule 8:** every sentence in Section 2.5 (Mission Support Statement) that describes what the agency cares about must include a citation to a published, verifiable source. If you can't cite it, either find the source or soften the claim to a factual observation the evaluator can verify themselves. Unsourced agency-priority claims are the most common way AI-drafted proposals lose credibility — the AI has read a lot about the agency but it can't tell you *where* it read it, which means the evaluator can't verify it either.

---

## The writing-rules sweep

At the end of every workflow mode, the agent runs a final sweep of the completed draft against the banned phrases in Rules 1–8 above. Specifically:

- **Mode 1 (Conversational)** — part of the closing step, alongside the Appendix F check and the fictional-data grep
- **Mode 2 (Intake Checklist)** — part of the final-check section, alongside Appendix F
- **Mode 3 (Full Workflow)** — part of Phase 7 (final sweep), alongside the fictional-data grep, the red-team review, and the Appendix F checklist
- **Mode 4 (Review Existing Proposal)** — applied as one of the seven review sweeps in the critique report

The sweep greps the draft for the exact phrases listed in the tables above. Any hit is surfaced to the user with three pieces of information: (1) the phrase that matched, (2) the rule category and reason it's banned, (3) a suggested replacement drawn from the tables or the "tell, don't sell" principle. The user has the final say — if they want to keep a flagged phrase, they can, but they have to do it knowingly.

The sweep does not block the output file from being rendered. It only surfaces issues. The user's judgment rules.

---

## Inheritance rule

This file is **additional to**, not a replacement for, Govafy.com's full proposal writing guide. The full guide covers ~180 rules across 10 categories including slang, unnecessary qualifiers, and the complete redundant-phrase list. This light version is the subset the AI agent applies automatically during drafting and review of unsolicited proposals specifically.

If a user wants the full guide, point them to Govafy.com.

---

**End of writing-rules.md.**
