# SPECIFIC SAMPLE 1
## SentinelMind — AI Insider Threat Detection for DoD Classified Networks
### Submitted to the Defense Counterintelligence and Security Agency (DCSA)

> **NOTE TO READERS**
>
> This is a fictional sample proposal provided for educational use. The company, people, patent numbers, test results, and prices are invented. The agency, regulations, citations, and mission language are real. Use this sample to see what a complete, compliant, technology-innovation-flavored unsolicited proposal looks like in practice — do not copy it and submit it. Adapt the structure to your own idea.
>
> **Why this sample works as a teaching example:** AI-driven cybersecurity is a crowded market, and a weaker version of this idea would fail Test 1 ("innovative and unique") of the FAR 15.603(c) eligibility test. The sample is structured to show how to frame a narrow, differentiated, proprietary-IP-based innovation in a way that survives the eligibility test and gives a contracting officer a plausible sole-source justification.

---

## [TITLE PAGE]

**AXIOM SENTINEL, INC.**
2800 Crystal Drive, Suite 1100
Arlington, VA 22202
Phone: (571) 555-0201 | Email: federal@axiomsentinel.example
CAGE Code: 6ZK22 | UEI: AS7B8C9D1E2F | NAICS: 541512

---

**UNSOLICITED PROPOSAL**

**Title:** SentinelMind — Behavioral-Biometric AI Platform for Insider Threat Detection on DoD Classified Networks

**Submitted to:**
Defense Counterintelligence and Security Agency
Counterintelligence and Insider Threat Directorate
Quantico, VA 22134

**Date of Submission:** [Month Day, Year]
**Period of Validity:** Twelve (12) months from date of submission

---

**USE AND DISCLOSURE OF DATA**

This proposal includes data that shall not be disclosed outside the Government and shall not be duplicated, used, or disclosed — in whole or in part — for any purpose other than to evaluate this proposal. However, if a contract is awarded to this offeror as a result of — or in connection with — the submission of these data, the Government shall have the right to duplicate, use, or disclose the data to the extent provided in the resulting contract. This restriction does not limit the Government's right to use information contained in these data if they are obtained from another source without restriction. The data subject to this restriction are contained in **Sheets 3, 5–7, 9, and 11**.

---

*Authorized Representative:*

Dr. Priya Ramanathan, Chief Executive Officer
Axiom Sentinel, Inc.
Signature: ________________________________  Date: ____________

---

## PART 1 — BASIC INFORMATION (FAR 15.605(a))

**1.1 Offeror**

Axiom Sentinel, Inc. is a for-profit small business incorporated in Delaware and headquartered in Arlington, Virginia. Axiom Sentinel was founded in 2019 by two former DoD insider threat program managers and a university-affiliated machine learning researcher. The company specializes in behavioral analytics for classified network environments and employs 31 full-time staff, including data scientists, cleared engineers, and former counterintelligence practitioners.

- Registered in SAM.gov: Active
- NAICS Code: 541512 (Computer Systems Design Services)
- Size Standard: $34M (Axiom Sentinel qualifies as small)
- Certifications: Woman-Owned Small Business (WOSB) (SBA-certified)
- Facility Clearance: Top Secret facility clearance issued by DCSA
- CMMC Level: Level 2 (anticipated Level 3 by end of next year)

**1.2 Points of Contact**

| Role | Name | Phone | Email |
|------|------|-------|-------|
| Technical Point of Contact | Dr. Kenji Maruyama, Chief Scientist | (571) 555-0202 | k.maruyama@axiomsentinel.example |
| Business Point of Contact | Claire Donoghue, VP Federal Programs | (571) 555-0203 | c.donoghue@axiomsentinel.example |
| Authorized Representative | Dr. Priya Ramanathan, CEO | (571) 555-0201 | p.ramanathan@axiomsentinel.example |

**1.3 Proprietary Data**

This proposal contains proprietary data on Sheets 3, 5–7, 9, and 11. These sheets describe the SentinelMind behavioral-biometric modeling approach (U.S. Patent 11,XXX,XXX and U.S. Patent Pending 18/YYY,YYY), performance test data from internal closed-network trials, the federated model training architecture, and Axiom Sentinel's cost structure. Each proprietary sheet is marked with the per-sheet legend in accordance with FAR 15.609(b).

**1.4 Other Parties Receiving This Proposal**

This proposal is being submitted only to DCSA. Axiom Sentinel currently holds a Phase II SBIR contract with the Air Force Research Laboratory (AFRL) for related foundational research on behavioral biometrics in classified environments (Contract FAXXXX-24-C-XXXX, $1.75M, ongoing). The AFRL work is complementary to but distinct from the SentinelMind product described in this proposal; the AFRL effort focuses on basic research, while this proposal addresses the operational deployment of a mature commercial product to support DCSA's insider threat mission.

**1.5 Date of Submission**

[Month Day, Year]

**1.6 Signature of Authorized Representative**

See title page.

---

## PART 2 — TECHNICAL INFORMATION (FAR 15.605(b))

**2.1 Title and Abstract**

**Title:** SentinelMind — Behavioral-Biometric AI Platform for Insider Threat Detection on DoD Classified Networks

**Abstract (199 words):**

Axiom Sentinel, Inc. proposes to deploy SentinelMind, a behavioral-biometric artificial intelligence platform, to support the Defense Counterintelligence and Security Agency (DCSA) in detecting insider threats across the cleared contractor community. SentinelMind ingests anonymized user activity metadata from classified networks — login patterns, keystroke cadence, file access sequences, temporal patterns — and builds individualized behavioral baselines for each cleared user. Deviations from the baseline that correlate with known insider threat indicators are flagged in near-real-time for investigation. Unlike signature-based DLP tools, SentinelMind does not depend on pre-defined rules; it learns what "normal" looks like for each user and for each role. In a 14-month closed-network pilot with a partner defense contractor (covering 2,400 cleared users), SentinelMind detected three simulated insider threat scenarios within an average of 4.2 hours of activity initiation, compared to 38 hours for the incumbent rules-based tool at the same site. This proposal seeks a 30-month contract for pilot deployment, validation, and transition planning across two DCSA-selected cleared contractor sites. Total estimated price: $4,875,000. Axiom Sentinel holds U.S. Patent 11,XXX,XXX and is the only entity currently offering this specific approach to DoD classified networks.

**2.2 Objectives**

Axiom Sentinel proposes the following specific, measurable objectives:

1. **Deploy SentinelMind at two DCSA-coordinated cleared contractor facilities** during a 12-month operational pilot, selected by DCSA for representative coverage of the cleared industrial base.

2. **Achieve mean time to detect (MTTD)** of less than 8 hours for simulated insider threat scenarios across the pilot sites, a target set at less than one-quarter of the currently observed MTTD for rules-based systems.

3. **Achieve a false-positive rate of less than 2.5%** of monitored users per quarter, minimizing investigator burden.

4. **Generate a formal effectiveness assessment report** comparing SentinelMind performance against the baseline rules-based monitoring at each site.

5. **Deliver a DCSA-specific deployment playbook and cost model** supporting a potential decision to offer SentinelMind as a standard insider threat program capability to the broader cleared contractor community.

**2.3 Method of Approach**

The proposed effort will execute in four phases over 30 months.

**Phase 1 — Site Selection and Baseline (Months 1–6).** Axiom Sentinel will work with DCSA to select two pilot facilities — ideally one mid-size cleared contractor (500–2,000 cleared users) and one large cleared contractor (5,000+ cleared users). Axiom Sentinel will deploy a passive collection capability at each site to establish a 90-day behavioral baseline and to benchmark the incumbent insider threat tools. Deliverables include a Pilot Site Selection Memorandum, a Baseline Report, and a Privacy and Legal Review addressing 32 CFR Part 117 compliance considerations.

**Phase 2 — Active Monitoring Deployment (Months 7–18).** SentinelMind will enter active monitoring mode at both pilot sites. A joint working group including the cleared contractor's insider threat program manager, the facility security officer, and DCSA representatives will meet monthly to review flagged alerts, investigate incidents, and tune the platform. Axiom Sentinel will also conduct four blind simulated insider threat exercises at each site, using industry-standard scenarios (data exfiltration, unauthorized elevation, off-hours reconnaissance, policy violation patterns). Deliverables include Monthly Alert Summary Reports, Quarterly Simulated Exercise Reports, and a Mid-Pilot Review at month 12.

**Phase 3 — Effectiveness Assessment (Months 19–26).** Axiom Sentinel will compile all operational data into a formal effectiveness assessment comparing SentinelMind against baseline tools across each of the measurable objectives in Section 2.2. The assessment will be subject to independent review by a DCSA-designated technical panel. Deliverables include the Formal Effectiveness Assessment Report and a presentation brief for DCSA leadership.

**Phase 4 — Transition Planning (Months 27–30).** Axiom Sentinel will prepare a full deployment playbook, cost model, and transition package to support DCSA's decision on whether to offer SentinelMind as a recommended insider threat program capability for the broader cleared contractor community. Deliverables include the Transition Playbook, the Enterprise Cost Model, and a Final Report.

**2.4 Anticipated Results**

At the conclusion of this effort, DCSA will have:

- **Operational pilot data** from two cleared contractor sites over 12 months, providing a direct comparison of SentinelMind performance against baseline tools.
- **A formal effectiveness assessment** suitable for supporting a DCSA decision on broader recommendation or deployment.
- **A deployment playbook and cost model** for any subsequent enterprise rollout.
- **A trained cadre** of insider threat program managers and facility security officers at the pilot sites who have direct experience with an AI-based monitoring approach.
- **An evidence base** supporting DCSA's public priority to modernize insider threat detection across the cleared contractor population.

**2.5 Mission Support Statement**

This effort directly supports the mission of the Defense Counterintelligence and Security Agency (DCSA) and specifically the Counterintelligence and Insider Threat Directorate, one of DCSA's four mission centers. DCSA's insider threat responsibilities are grounded in 32 CFR Part 117 (the National Industrial Security Program Operating Manual, or NISPOM) and in agency policy that requires cleared contractors to implement insider threat programs.

The DCSA public strategic priorities have included **modernizing insider threat detection** and **strengthening vigilance across the cleared industrial base**. Senior agency leadership has publicly noted that DCSA is deploying insider threat representatives directly into defense enterprise commands and installations to strengthen oversight. SentinelMind directly supports both priorities:

1. **Modernization.** SentinelMind replaces static, rules-based detection with a continuously-learning behavioral model. For DCSA's oversight role, this means a more effective detection capability at cleared contractor sites — reducing the likelihood that insider threats go undetected for extended periods (as has occurred in several high-profile historical cases).

2. **Scale.** DCSA is responsible for oversight of a large cleared contractor population. A scalable AI-based approach that can be deployed across many sites is better suited to DCSA's coverage model than a tool that requires manual rule authorship at each site.

Axiom Sentinel's proposal does not seek to replace DCSA's oversight authority or DCSA-run programs. It offers a capability for DCSA to evaluate, and — if found effective — to recommend or deploy as part of its insider threat oversight mission.

**2.6 Key Personnel**

**Dr. Kenji Maruyama, Chief Scientist (Principal Investigator).** Dr. Maruyama holds a Ph.D. in Computer Science from Carnegie Mellon University, with a specialization in behavioral biometrics and anomaly detection. He has 14 years of experience applying machine learning to security problems, including 7 years at a major defense cybersecurity company before co-founding Axiom Sentinel. He is the lead inventor on U.S. Patent 11,XXX,XXX. He holds a TS/SCI clearance. Commitment: 70%.

**Sarah Whitaker, Director of Operational Analytics.** Ms. Whitaker holds an M.S. in Information Assurance from George Washington University and is a former U.S. Army counterintelligence officer (retired Major) with 20 years of combined military and contractor experience in insider threat programs. She leads Axiom Sentinel's operational analytics team and will serve as the primary operational lead. She holds a TS/SCI clearance. Commitment: 80%.

**Dr. Priya Ramanathan, Chief Executive Officer (Program Executive).** Dr. Ramanathan holds a Ph.D. in Electrical Engineering from Stanford University and is a former program manager at the DoD Insider Threat Management and Analysis Center (ITMAC). She co-founded Axiom Sentinel in 2019. She holds a TS/SCI clearance. Commitment: 25%.

**Claire Donoghue, VP Federal Programs (Program Manager).** Ms. Donoghue has 16 years of federal contracting experience, including 9 years managing cybersecurity contracts for DoD customers. She will serve as the primary interface with the DCSA contracting officer. She holds a Top Secret clearance. Commitment: 40%.

Six additional cleared engineers and data scientists will be assigned to the effort. Full resumes and clearance verifications are available on request.

**2.7 Type of Support Needed from the Government**

- **DCSA coordination with two cleared contractor facilities** to participate in the pilot, including agreement from each facility's leadership.
- **DCSA designation of a Government Technical Representative** responsible for pilot oversight.
- **Access to applicable DCSA insider threat program policy documents** under appropriate sensitivity handling.
- **DCSA introduction to the relevant privacy and legal offices** for coordination on 32 CFR Part 117 compliance and monitoring scope.
- **Periodic access to DCSA technical reviewers** for quarterly program reviews (estimated 4 reviews, 2 hours each).

All software development, hosting, and operational analytics will occur within Axiom Sentinel's cleared facility and on the pilot sites' own classified networks. No government-furnished equipment or facilities are requested.

---

## PART 3 — SUPPORTING INFORMATION (FAR 15.605(c))

**3.1 Proposed Price**

Total estimated price: **$4,875,000** (firm-fixed-price, milestone-based).

Preliminary allocation:

| Cost Element | Amount |
|--------------|--------|
| Direct Labor (cleared engineering, analytics, program management staff) | $2,210,000 |
| SentinelMind Platform License (proprietary platform, DCSA-specific configuration) | $780,000 |
| Infrastructure (cleared hosting, secure development, integration) | $420,000 |
| Subcontracts (independent security testing, clearance processing) | $215,000 |
| Travel (quarterly DCSA reviews, site deployments) | $88,000 |
| Indirect Costs and Overhead | $905,000 |
| Fee | $257,000 |
| **Total** | **$4,875,000** |

A detailed line-item budget with full rate justification is available on request under FAR 15.609(a) proprietary protection.

**3.2 Period of Validity**

This proposal is valid for **twelve (12) months** from the date of submission.

**3.3 Type of Contract Preferred**

Firm-fixed-price (FFP) with milestone-based payments tied to phase deliverables. Axiom Sentinel is open to a cost-plus-fixed-fee (CPFF) structure if DCSA prefers, given the partially exploratory nature of the Phase 1 baseline work.

**3.4 Proposed Duration of Effort**

Thirty (30) months from contract award, structured as four phases as described in Section 2.3.

**3.5 Organization Description, Experience, and Facilities**

Axiom Sentinel, Inc. was founded in 2019 and specializes in behavioral biometric analytics for classified network environments. The company operates a secure development facility in Arlington, VA, holding a Top Secret facility clearance issued by DCSA. Approximately 80% of Axiom Sentinel staff hold Secret or higher clearances.

**Past Performance:**

1. **Air Force Research Laboratory (AFRL)** — SBIR Phase II, Behavioral Biometrics for Classified Environments, $1.75M, 2023–ongoing. Complementary foundational research.
2. **[Major Cleared Defense Contractor]** — SentinelMind Closed-Network Pilot, $980k, 2022–2023. Reference available under appropriate access control.
3. **[Federal Civilian Agency]** — Insider Threat Analytics Study, $640k, 2022. Completed on time.
4. **Defense Innovation Unit (DIU)** — Commercial Solutions Opening follow-on, $1.2M, 2023–2024. Completed.

**3.6 Organizational Conflicts of Interest, Security Clearances, Environmental**

**Conflicts of Interest:** Axiom Sentinel is not aware of any organizational conflicts of interest. Axiom Sentinel does not currently provide insider threat analytics services to either of the DCSA oversight organizations the pilot would engage with.

**Security Clearances:** Axiom Sentinel holds a TS facility clearance and can handle classified data up to the Top Secret level. All staff assigned to this effort will hold active TS or TS/SCI clearances before beginning work at the pilot sites.

**Environmental Impacts:** None.

**3.7 Prior Agency Contacts**

- **[Name], DCSA Counterintelligence and Insider Threat Directorate** — 30-minute phone call on [date], limited to confirming DCSA's general interest in insider threat analytics innovation and the correct unsolicited proposal submission process.
- **[Name], DCSA Small Business Office** — Email exchange confirming submission address.

No DCSA personnel reviewed drafts of this proposal or directed any portion of its preparation.

---

*End of Specific Sample 1 — SentinelMind (DCSA)*
