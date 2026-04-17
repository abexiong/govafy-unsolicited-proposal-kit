# Fictional Data Markers — Anti-Bleed Source of Truth

> **Purpose.** This file is the **single source of truth** for the fictional-data grep used by the kit's anti-bleed sweep. All four workflow files that need to run the sweep — `full-workflow.md` Phase 7, `render-output.md` pre-render check, `mode-4-review-existing.md` Sweep 4, and the closing step in `conversational.md` and `intake-checklist.md` — read this file rather than maintaining their own copy of the marker list.
>
> **Why this file exists.** The grep used to live in three places. They drifted, and five of the nine sample company names were missing from one or more lists. With one canonical file, every workflow file uses the same list and a single update keeps them all in sync.
>
> **The kit's #1 failure mode** is fictional sample data leaking into a real submission. The markers below are the strongest mechanical defense against that — but they are only effective if the list is complete. **Whenever a new sample is added to `references/general-samples/` or `references/specific-samples/`, the maintainer MUST add the new sample's company name, key personnel, patent placeholders, email domain, CAGE code, UEI, and any sample-specific pilot numbers to the corresponding section below.**

---

## How the agent uses this file

The agent runs a case-insensitive grep of the user's draft against every marker listed below. Any hit is surfaced to the user with three pieces of information:

1. The exact phrase that matched
2. Which sample the marker belongs to
3. A confirmation prompt: *"I found '[match]' in your draft. This appears in [sample name]. Is this an intentional reference, or did it leak from the scaffolding sample? If it leaked, I'll fix it before we render."*

If the user confirms a leak, the agent removes or replaces the offending text **before** invoking `render-output.md` to produce the final file.

---

## Markers by sample

### General Sample 1 — Innovation / R&D (ONR target)

- **Company:** `Nova Materials, Inc.` / `Nova Materials`
- **Personnel:** `Dr. Elena Vasquez` / `Dr. Marcus Okoye` / `Rachel Park`
- **Email domain:** `novamaterials.example`
- **CAGE Code:** `8ZR44`
- **UEI:** `NM9A1B2C3D4E`
- **Patent placeholder:** `18/XXX,XXX`

### General Sample 2 — Mission-Solution (VA target)

- **Company:** `Meridian Workforce Solutions, LLC` / `Meridian Workforce` / `Meridian`
- **Personnel:** `Teresa Nwosu` / `David Chen` / `Sarah Whitfield`
- **Product name:** `PathMatch Engine` / `PathMatch`
- **Email domain:** `meridianworkforce.example`
- **CAGE Code:** `7XY99`
- **UEI:** `MW5F6G7H8J9K`

### General Sample 3 — Crisis / Rapid-Response (EPA target)

- **Company:** `RapidResponse Water Systems, LLC` / `RapidResponse Water`
- **Personnel:** `Michael Brennan` / `Emma Vogel` / `Daniel Fischer`
- **Product name:** `Modular Treatment Skid`
- **Email domain:** `rapidresponsewater.example`
- **CAGE Code:** `9TR11`
- **UEI:** `RR1L2M3N4P5Q`

### Specific Sample 1 — SentinelMind (DCSA)

- **Company:** `Axiom Sentinel, Inc.` / `Axiom Sentinel`
- **Product:** `SentinelMind`
- **Personnel:** `Dr. Priya Ramanathan` / `Dr. Kenji Maruyama` / `Sarah Whitaker` / `Claire Donoghue`
- **Email domain:** `axiomsentinel.example`
- **CAGE Code:** `6ZK22`
- **UEI:** `AS7B8C9D1E2F`
- **Patent placeholders:** `11,XXX,XXX` / `18/YYY,YYY`
- **Sample-specific pilot numbers:** `2,400 cleared users` / `4.2 hours` / `38 hours` / `87% true-positive` / `2.1% false-positive` / `450 cleared users` / `18-month closed-network pilot`

### Specific Sample 2 — NeuroEdge (USSOCOM)

- **Company:** `Apex Cognitive Labs, Inc.` / `Apex Cognitive Labs` / `Apex Cognitive`
- **Product:** `NeuroEdge`
- **Personnel:** `Dr. Samira Nasrallah` / `Dr. Brenda Acosta` / `Jeremy Winterbourne`
- **Email domain:** `apexcognitive.example`
- **CAGE Code:** `4YN33`
- **UEI:** `AC3G4H5J6K7L`
- **Sample-specific pilot numbers:** `42 endurance-trained civilian subjects` / `60 SOF-qualified volunteers` / `18.4% improvement` / `23.7% improvement` / `72-hour sleep restriction`

### Specific Sample 3 — ForgeForward (MCSC)

- **Company:** `IronForge Manufacturing, Inc.` / `IronForge Manufacturing` / `IronForge`
- **Product:** `ForgeForward`
- **Personnel:** `Anthony Delgado` / `Dr. Angela Stroh` / `Marcus Littlefeather`
- **Email domain:** `ironforge.example`
- **CAGE Code:** `2QP44`
- **UEI:** `IF4M5N6P7Q8R`
- **Patent placeholder:** `18/ZZZ,ZZZ`

### Specific Sample 4 — FedFacility IQ (GSA PBS)

- **Company:** `Civic Energy Insights, LLC` / `Civic Energy Insights` / `Civic Energy`
- **Product:** `FedFacility IQ`
- **Personnel:** `Dr. Olivia Asante` / `Daniel Wexler` / `Monica Reeves`
- **Email domain:** `civicenergy.example`
- **CAGE Code:** `7RV55`
- **UEI:** `CE6P7Q8R9S1T`
- **Patent placeholder:** `18/WWW,WWW`

### Specific Sample 5 — LeadFed (OPM)

- **Company:** `Ascend Federal Leadership, Inc.` / `Ascend Federal Leadership` / `Ascend Federal`
- **Product:** `LeadFed`
- **Personnel:** `Dr. Evelyn Cardoza` / `Dr. Raymond Ohashi` / `Valerie Thompson`
- **Email domain:** `ascendleadership.example`
- **CAGE Code:** `1HG66`
- **UEI:** `AL8S9T1U2V3W`
- **Sample-specific pilot numbers:** `62 GS-14 and GS-15 candidates` / `94% rate (versus a 71% baseline)` / `QRB first-pass certification rates improved from 63% to 87%`

### Specific Sample 6 — ReadyRelief (FEMA)

- **Company:** `Predictive Resilience, LLC` / `Predictive Resilience`
- **Product:** `ReadyRelief`
- **Personnel:** `Nathan Briggs` / `Dr. Meera Kulkarni` / `Owen Hargrove`
- **Email domain:** `predictiveresilience.example`
- **CAGE Code:** `8MT77`
- **UEI:** `PR9X1Y2Z3A4B`

---

## Real terms that LOOK like sample data but are NOT

The following terms appear in samples but are **real** federal program names, agency names, or regulations. The grep MUST NOT flag them as fictional even though they sit next to fictional content in the samples:

- `POTFF` — real USSOCOM Preservation of the Force and Family program
- `Hyper-Enabled Operator` / `HEO` — real USSOCOM SOF AT&L program
- `X-FAB`, `TACFAB`, `PM CSS` — real Marine Corps Systems Command capabilities
- `GSALink`, `Smart Buildings`, `Building Technologies and Security Division` — real GSA PBS programs
- `FEI` / `Federal Executive Institute` — real (now-dismantled) OPM program
- `LogVIZ`, `SAVER2`, `Logistics Management Directorate`, `LMD` — real FEMA programs
- `ITMAC`, `DITMAC` — real DoD Insider Threat Management organizations
- `MIL-STD-2036`, `NAVSEA standards` — real Navy specifications
- `AFRL`, `DARPA`, `ARL`, `DCAA`, `CPARS`, `J&A`, `OCI`, `BAA`, `OTA`, `CSO`, `IDIQ`, `FFP`, `CPFF`, `T&M` — real federal contracting acronyms

---

## Maintainer rule

When you add a new sample to `references/general-samples/` or `references/specific-samples/`, you MUST:

1. Add a new section to this file with the new sample's company name, all variants of the name, all key personnel, the email domain, the CAGE code, the UEI, any patent placeholders, and any sample-specific pilot numbers.
2. Run the CI sanity script (`scripts/sanity-check.sh`) to confirm every fictional company name in every sample is in this file.
3. Bump the CHANGELOG.

---

**End of fictional-data-markers.md.**
