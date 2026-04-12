# Render Output — Final File Generation (PDF or Word .docx)

> **Purpose.** This file is the shared output rendering pipeline used by **all three workflow modes** (Conversational, Intake Checklist, Full Workflow) at the very end of the engagement, after the proposal draft is complete and Appendix F has been run. It defines the verbatim "PDF or Word?" question, the filename convention, the pandoc commands for each format, and the fallback paths if rendering fails.
>
> **Why this file exists.** The kit produces a draft as Markdown during the workflow. The user almost always needs the final document as a Word .docx (so they can edit, share with their attorney, and print) or a PDF (locked, ready to submit to the agency). Without this rendering step, the user would be left with a Markdown file they can't open in Word — which defeats the purpose of the workflow.

---

## When to invoke this file

The agent invokes `render-output.md` at exactly one point in every workflow mode: **after the Appendix F pre-submission checklist passes and before declaring the engagement complete**. Specifically:

- **Mode 1 (Conversational):** as the closing step after the Appendix F final check
- **Mode 2 (Intake Checklist):** after the final check section
- **Mode 3 (Full Workflow):** as Phase 8, after Phase 7 (final sweep + fictional-data grep)

If the agent reaches the end of the workflow without invoking this file, the engagement is incomplete.

---

## The question to ask the user

The agent asks the user this verbatim, with the bolded options exactly as shown:

> Your draft is complete. Would you like the final proposal as a **Word .docx file** (most flexible — you can edit it before sending, hand it to your attorney for review, or print it) or a **PDF** (locked, ready to submit to the agency)?
>
> If you're not sure, I recommend **Word .docx** — you can always export to PDF from Word later, but you can't easily edit a PDF.

The agent waits for a clear answer (`docx`, `Word`, `pdf`, or "1" / "2") before proceeding. If the user says "both," the agent produces both formats — that's a valid answer.

---

## Filename convention

The agent uses this filename pattern:

```
<company-slug>-unsolicited-proposal-<YYYY-MM-DD>.<ext>
```

Where:
- **`<company-slug>`** is the user's company name in lowercase, with spaces replaced by hyphens and punctuation stripped. Example: "Umbra Signals, Inc." → `umbra-signals`
- **`<YYYY-MM-DD>`** is today's date in ISO format
- **`<ext>`** is `docx` or `pdf`

**Examples:**
- `umbra-signals-unsolicited-proposal-2026-04-11.docx`
- `acme-solutions-unsolicited-proposal-2026-04-11.pdf`

If the agent doesn't have a clean company name yet (rare but possible), it asks the user for one before generating the filename.

---

## Save location

The agent asks the user where to save the file. Default rules:

1. **If the user is in Claude Code or another agent with shell access:** the default save location is the **current working directory** of the session. The agent confirms the path with the user before writing.
2. **If the user specifies a location** (e.g., "Save it to my Desktop"): the agent uses that path. On macOS, "Desktop" expands to `~/Desktop`. On Windows, "Desktop" expands to `%USERPROFILE%\Desktop`.
3. **If the agent has no shell access** (some AGENTS.md-compatible agents may be sandboxed): the agent saves to a temporary location it can write to (e.g., `/tmp/`) and reports the path so the user can move the file.

---

## Pre-render: the mandatory anti-bleed check

**Before running pandoc, the agent always re-confirms the document contains zero fictional-sample data.**

This is a final guard against the kit's #1 failure mode: a fictional company name, fictional patent number, fictional pilot result, or fictional personnel name from one of the nine sample proposals leaking into the user's real submission.

The agent runs a quick grep against the draft for these markers:

```
Axiom Sentinel | SentinelMind
Nova Materials | ONR Sample
Meridian Workforce
RapidResponse Water
NeuroEdge | POTFF Sample
ForgeForward | X-FAB Sample
FedFacility IQ
LeadFed | FEI Sample
ReadyRelief
11,XXX,XXX | 18/YYY,YYY
acme.example
@axiomsentinel.example
Dr. Priya Ramanathan | Dr. Kenji Maruyama | Sarah Whitaker | Claire Donoghue
```

(In Mode 3, this same grep already ran in Phase 7 against all 9 sample files. In Modes 1 and 2, this is the first time the grep runs and it functions as the safety net.)

**If any match is found, the agent stops and asks the user to confirm whether the match is intentional** (e.g., the user genuinely happens to be named Sarah Whitaker, or the user genuinely cited a sample as a comparison). If unintentional, the agent fixes the leak before rendering.

---

## Rendering pipeline — Word .docx (default and most reliable)

**Step 1.** Save the draft as a temporary `.md` file. Use a simple temp path like `/tmp/<company-slug>-draft.md`.

**Step 2.** Run pandoc to convert Markdown to .docx:

```bash
pandoc /tmp/<company-slug>-draft.md \
  -o <save-location>/<filename>.docx \
  --from markdown \
  --to docx \
  --standalone
```

**Optional reference document.** If the user has a Word document with their corporate styles (logo, fonts, header/footer), pandoc can use it as a template:

```bash
pandoc /tmp/<company-slug>-draft.md \
  -o <save-location>/<filename>.docx \
  --reference-doc=<path-to-reference.docx>
```

The agent asks the user up front: *"Do you have a corporate Word template you'd like me to use? If yes, paste the path. If not, I'll use pandoc's default styling."*

**Step 3.** Verify the file was actually created:

```bash
ls -la <save-location>/<filename>.docx
```

The agent confirms (a) the file exists, (b) the file size is reasonable (> 5 KB and < 50 MB for a typical proposal), and (c) the filename matches what was requested.

**Step 4.** Report the file path to the user with the next-action reminder:

> Your proposal is saved at `<full-path>`.
>
> Before you submit it to the agency, please:
> 1. Open the file in Word and visually verify the FAR 15.609 legend is on the cover page and on every proprietary page
> 2. Have a federal contracts or procurement attorney review the document — especially the proprietary markings and any binding-offer language
> 3. Verify the agency submission address on `dcsa.mil` (or your target agency's website) on the day you submit, since these can change

---

## Rendering pipeline — PDF (with fallbacks)

PDF rendering is more fragile than .docx because pandoc requires a LaTeX engine for high-quality PDF output, and not every Mac has LaTeX installed. The agent tries the pipelines in order and stops at the first one that succeeds.

### Primary path: pandoc → LaTeX → PDF

```bash
pandoc /tmp/<company-slug>-draft.md \
  -o <save-location>/<filename>.pdf \
  --from markdown \
  --pdf-engine=xelatex
```

This requires a LaTeX engine like **MacTeX** (full, ~5 GB) or **BasicTeX** (slim, ~100 MB) on macOS. If pandoc fails with "xelatex: command not found" or similar, fall through to Fallback 1.

### Fallback 1: pandoc → HTML → Chrome headless → PDF

```bash
# Step A: convert markdown to standalone HTML
pandoc /tmp/<company-slug>-draft.md \
  -o /tmp/<company-slug>-draft.html \
  --standalone \
  --metadata title="Unsolicited Proposal" \
  --css=<optional-stylesheet>

# Step B: render HTML to PDF using Chrome headless
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless \
  --disable-gpu \
  --no-pdf-header-footer \
  --print-to-pdf=<save-location>/<filename>.pdf \
  file:///tmp/<company-slug>-draft.html
```

If Chrome is not at the standard path, the agent checks for Chromium, Microsoft Edge, or Brave at their typical install paths. If none are found, fall through to Fallback 2.

### Fallback 2: pandoc → .docx → manual conversion

```bash
pandoc /tmp/<company-slug>-draft.md \
  -o <save-location>/<filename>.docx
```

Then the agent tells the user:

> I couldn't render directly to PDF on this machine (no LaTeX engine and no Chrome found). I've saved a Word .docx version instead at `<path>`. To get a PDF:
>
> 1. Open the file in **Microsoft Word**
> 2. Click **File → Save As** (or **File → Export**)
> 3. Choose **PDF** from the format dropdown
> 4. Save
>
> Or, if you don't have Word: open the file in **Google Docs** (drag-and-drop into a new Google Doc), then **File → Download → PDF Document**.

---

## Verification — every render must be checked

After running any pandoc command, the agent **always** verifies the file actually exists before reporting success. Pandoc can fail silently (return code 0) when the input has Markdown syntax errors. The verification command is:

```bash
test -f <save-location>/<filename>.<ext> && wc -c <save-location>/<filename>.<ext>
```

- **If the file exists and is > 5 KB:** report success
- **If the file exists but is < 5 KB:** something went wrong (probably an empty document or a pandoc error). Show the user the file size and ask whether to retry
- **If the file does not exist:** the rendering failed silently. Run pandoc again with `--verbose` to capture the error, show it to the user, and try the next fallback

---

## What gets included in the rendered file

The rendered output is the **complete proposal** as drafted during the workflow:

- **Cover page** with the offeror identity (Group A from `intake-fields.md`), the FAR 15.609 title-page legend with the exact proprietary page numbers filled in, and the authorized representative signature line
- **Part 1 — Basic Information** (FAR 15.605(a))
- **Part 2 — Technical Information** (FAR 15.605(b)) — abstract, objectives, method of approach, anticipated results, mission support statement, key personnel, government support needed
- **Part 3 — Supporting Information** (FAR 15.605(c)) — proposed price, period of validity, contract type, duration, organization description, past performance, conflicts of interest, prior agency contacts
- **Per-sheet legend** (FAR 15.609(b)) on the footer of every page that contains proprietary content

The rendered file does **not** include:
- Anything from the kit's nine fictional sample proposals (the anti-bleed grep enforces this)
- The kit's master guide
- Internal notes the agent and user exchanged during the workflow

---

## Post-render: what the agent reports to the user

After a successful render, the agent reports:

1. **File path** — full absolute path to the saved file
2. **File size** — confirms the file is reasonable
3. **Format used** — .docx or .pdf, plus which rendering pipeline succeeded if PDF
4. **Three reminders** (always — these are non-negotiable):
   - **Visual verification** — open the file and confirm the FAR 15.609 legend is on the cover page and every proprietary page
   - **Legal review** — have a federal contracts or procurement attorney review the document before submission. This is the educational-not-legal-advice rule from `guide.md`
   - **Agency address verification** — verify the submission address on the agency's website on the day of submission, since these can change. FAR 15.606 delegates this to each agency
5. **Reminder about the kit's downloadable samples** — if the user wants to compare their draft to the kit's reference samples, those live in the `downloads/` folder of the repo and are clearly labeled as fictional

---

## Error handling

If rendering fails entirely (all paths exhausted), the agent does the following:

1. **Save the Markdown source** at a known path so nothing is lost: `<save-location>/<filename>.md`
2. **Tell the user exactly what failed** with the error message from the last attempted command
3. **Provide a manual conversion path:** "Copy-paste the contents of `<filename>.md` into Google Docs, then export as Word or PDF from there. The file is preserved at `<path>` so nothing is lost"
4. **Do not declare the engagement complete** — the user does not have a usable file yet

---

**End of render-output.md.**
