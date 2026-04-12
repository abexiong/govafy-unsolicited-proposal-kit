# Contributing to the Govafy.com Unsolicited Proposal Kit

First — thank you. This kit gets better when practitioners who have actually submitted unsolicited proposals share what they learned. Even a one-line fix to a stale citation is genuinely valuable.

## What kinds of contributions are welcome

- **Typo and grammar fixes** in any Markdown file.
- **Stale FAR citation updates** after a new Federal Acquisition Circular (FAC) changes Subpart 15.6 text.
- **Clarifications** where an existing explanation is confusing or where a plain-English analogy would help a first-time reader.
- **Additional sample proposals** for agencies not currently covered — but please see the rules for samples below.
- **New appendices** in the master guide for situations the current version doesn't cover (e.g., foreign-owned small businesses, CMMC implications, specific agency peculiarities).
- **Bug reports** via GitHub Issues when something is wrong or unclear.

## Rules for new or modified samples

1. **All samples must remain explicitly fictional.** Fake company name, fake personnel, fake patent numbers, fake pilot data, fake prices, fake email addresses. Real agency, real regulations, real program names, real FAR 15.609 legend text. Do not contribute a sample based on a real proposal you submitted — that creates attribution and confidentiality risk.
2. **Cite the FAR next to every rule.** The existing samples model this. Citations make the sample verifiable and educational.
3. **Keep the "HOW TO ADAPT THIS TEMPLATE" section at the end.** Every sample teaches — not just shows.
4. **Do not weaken existing teaching moments.** Some samples (most notably `03-forgeforward-mcsc.md`, which teaches how to position against an agency's existing capability) are structured around specific lessons. Don't remove the teaching framing in a routine edit.

## Rules for guide updates

1. **Keep the plain-English voice.** This kit is for small business owners, not contracting officers. If a paragraph could be shorter without losing meaning, shorten it.
2. **Every new rule needs a FAR citation.** Readers should be able to verify every claim against <https://www.acquisition.gov/far/subpart-15.6>.
3. **Don't add year labels to the title or section headings.** The guide is evergreen. Currency notes go in the dated section at the end of the guide and in `CHANGELOG.md`.
4. **Flag any changes to the FAR 15.609 proprietary data legend text in the pull request description.** That legend is legally load-bearing — changes must be reviewed carefully.

## How to submit a pull request

If you've never done this before, here's the short version:

1. **Fork the repository** on GitHub by clicking the *Fork* button in the top right of the repo page.
2. **Edit the file** you want to change. You can do this directly in your browser on your fork — click any `.md` file, then click the pencil icon to edit.
3. **Commit the change** with a short descriptive message (e.g., `Fix typo in guide.md Section 7`).
4. **Open a pull request** from your fork back to the main repository. Describe what you changed and why.
5. **Don't worry about regenerating the `.docx` files** in `downloads/` when you edit a `.md` file — a maintainer will do that before the change is merged.

## If you find a legal or factual error

If you believe the kit contains a statement that is factually incorrect about federal law or agency procedure — especially anything touching the FAR 15.609 legend, the FAR 15.603 six-part eligibility test, or an agency's submission address — please open an Issue first, *before* submitting a pull request. These changes need careful review because they affect real proposals, and we want to make sure the correction is discussed in public so the reasoning is documented.

## License of contributions

By submitting a contribution to this repository, you agree that your contribution will be published under the same dual license as the rest of the repository: **MIT** for code and configuration, **Creative Commons Attribution 4.0** for written content. You retain your own copyright in your contribution.

## Code of conduct

Be kind. Be specific. Assume the reader is a first-time small business owner trying to pitch their first idea to a federal agency — and remember that you were once in their seat too.
