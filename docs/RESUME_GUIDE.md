# Resume Guide

How to turn your master resume into a tailored one-page variant per role, plus the matching cover letter. Used in Phase 0 Refresh profile (master and Final) and Phase 3 Prep (one variant per role). See docs/PLAYBOOK.md for the phases.

## Where things live

| Path | What it holds |
|---|---|
| `templates/resume/Resume_TEMPLATE.html` | The blank kit template. Don't edit; setup copies it. |
| `Resumes/Template/Resume_TEMPLATE.html` | Your layout with `{{FIELD_NAME}}` placeholders, adapted to your sections at onboarding. Only touched when the layout itself changes. |
| `Resumes/Drafts/` | Work-in-progress variants. Scratch space. |
| `Resumes/Final/` | Your master: the one current approved general resume (html + pdf). Its HTML keeps every project block you might use, with unused ones commented out. |
| `Resumes/Archive/` | Every older Final, kept by its date-stamped filename. |
| `Applications/<Company>/` | The approved tailored resume + cover letter for that role (the files you upload). |
| `CoverLetters/CoverLetter_TEMPLATE.html` | Cover letter template with your header filled in. |

Onboarding ("set me up") adapts the Template layout, then fills a copy from your current resume as the Final. After that, every variant starts from the Final.

## Make a variant (per role, Phase 3 Prep)

1. Copy the Final (your master) into Drafts with the standard name:
   ```bash
   cp Resumes/Final/<First>_<Last>_Resume_<YYYY-MM-DD>.html \
      Resumes/Drafts/<First>_<Last>_Resume_<Company>_<RoleSlug>.html
   ```
   RoleSlug is a short CamelCase role, e.g. `SeniorFullStack`.
2. **Swap projects.** Uncomment the 2 to 4 projects that fit the job type (your variants table in `Context/Achievement_Bank.md`); comment out the rest. Two projects get 2 bullets each; 3 or 4 projects get 1 bullet each.
3. **Reorder skills.** Put the posting's must-have tech first on the Technical Skills line.
4. **Lead with the right bullets.** Use the "Lead with" column of the same table. Reorder within a role only; never move a bullet to a different role.
5. **Trim from the bottom.** Cut `[TRIM FIRST]` bullets, then `[TRIM SECOND]`. `[KEEP ALWAYS]` bullets stay.
6. **Render and check:**
   ```bash
   scripts/pdf.sh Resumes/Drafts/<file>.html
   ```
   Confirm 1 page, no wrapped stack lines, working links (rules below).
7. **Ship it.** Copy the approved `.html` and `.pdf` into `Applications/<Company>/`. That copy is the one you upload.

## Variants by job type

You decide once which projects and bullets each job type gets; the agent uses that on every prep. Why: deciding once beats re-deciding per application, and it keeps variants consistent.

The three blocks below (this table, project blurbs, bullet priority) show the shape. You fill the real ones in `Context/Achievement_Bank.md`, where onboarding already created them. Why: `docs/` is tracked in git; `Context/` is private and gitignored.

| Job type | Projects to feature | Lead with (bullets) | Skills to front-load |
|---|---|---|---|
| Fintech / payments | <FILL: projects> | <FILL: e.g. revenue and reliability bullets> | <FILL: tech> |
| Product / platform / SaaS | <FILL: projects> | <FILL: e.g. end-to-end ownership bullets> | <FILL: tech> |
| Frontend / design systems | <FILL: projects> | <FILL: e.g. component library, UI quality bullets> | <FILL: tech> |
| Backend / infrastructure | <FILL: projects> | <FILL: e.g. scale, APIs, data bullets> | <FILL: tech> |
| AI application / AI company | <FILL: projects> | <FILL: e.g. hands-on AI work bullets> | <FILL: tech> |
| Your domain (<FILL: industry you know best>) | <FILL: projects> | <FILL: domain bullets> | <FILL: tech> |

Rename, add, or delete rows to match what you actually apply to.

## Project blurbs (write once, plug in as-is)

One block per project, in the Side Projects section of `Context/Achievement_Bank.md`. Pre-written angles let the agent swap emphasis without rewriting facts.

```markdown
### <FILL: project name>
- Tech: <FILL: stack>
- Link: <FILL: URL from Project_Links.md, or "no public link">
- Status: <FILL: live / in active development / private>
- General (1 bullet): <FILL: what it is, who it's for, the hardest technical part>
- Featured (2 bullets): <FILL: bullet 1> / <FILL: bullet 2>
- Angle, <FILL: e.g. frontend>: <FILL: same facts, different emphasis>
```

Status matters: never describe an in-development project as "launched" or "available".

## Bullet priority (current role)

Record the trim order of your current role's bullets (in `Context/Achievement_Bank.md`) so every variant trims the same way. Keep it in the same order as the bullets in your master.

| # | Bullet theme | Marker |
|---|---|---|
| 1 | <FILL: e.g. scope and leadership> | [KEEP ALWAYS] |
| 2 | <FILL: e.g. your differentiator> | [KEEP ALWAYS] |
| 3 | <FILL: theme> | [KEEP ALWAYS] |
| 4 | <FILL: theme> | [TRIM SECOND] |
| 5 | <FILL: theme> | [TRIM FIRST] |

## Rules (always enforce)

| Rule | Why |
|---|---|
| Exactly one page. `scripts/pdf.sh` warns when a Resume is not. | Reviewers skim; page two rarely gets read. |
| Each role's italic "Title: stack" line stays on one line. If it wraps, drop the tech least relevant to this job. | A wrapped subtitle looks broken and steals a line. |
| Preserve hyperlinks: project, GitHub, LinkedIn, and email stay real `<a href>` links. Click them in the PDF. | A dead or plain-text link wastes your best proof. |
| No em dashes anywhere. Use commas, colons, parentheses, or two sentences. En-dash date ranges (2021–2024) stay. | Em dashes read as an AI tell. |
| Present tense for your current role, past tense for earlier ones. | Consistency reads as care. |
| Fidelity: never claim a role, title, credential, employer, date, or accomplishment you don't have, and never invent a metric. Normal latitude is fine: stronger verbs, tighter wording, merging two of your own bullets, choosing which true facts to feature. | Anything on the page can be checked in an interview or a background check. |
| Numbers come from Context/Achievement_Bank.md. Anything tagged `(verify)` stays off until you confirm it. | One wrong number undermines every other one. |

Final pass before you ship any variant: search the file for the em dash character and for leftover `{{` placeholders.

## Final promotion + archive

`Resumes/Final/` holds exactly one resume: the current approved general version. Promote only after you sign off on the draft.

1. **Archive first.** Move everything currently in `Resumes/Final/` (all formats) into `Resumes/Archive/`. Filenames are date-stamped, so history is kept without renaming.
2. **Then promote.** Put the newly approved resume in `Resumes/Final/` as `<First>_<Last>_Resume_<YYYY-MM-DD>.html` and `.pdf`.
3. **Refresh the bank.** Copy its approved bullets into the "Approved Final-Resume Wording" section of `Context/Achievement_Bank.md`.

Why this order: `Final/` is never left holding two competing versions.

## Cover letters

1. Copy `CoverLetters/CoverLetter_TEMPLATE.html` to `Applications/<Company>/<First>_<Last>_CoverLetter_<Company>_<RoleSlug>.html`.
2. Write the four paragraphs (about 300 words, under 400, one page):

| Paragraph | What goes in it |
|---|---|
| 1. Why this company | The role title plus one specific thing only this company has (product, mission, recent launch, problem space). |
| 2. Relevant proof | Two or three results that map to what the posting asks for, with real numbers. |
| 3. Projects | Side projects or extra work that show genuine fit or interest in their space. Public projects only. |
| 4. Confident close | One or two sentences inviting a conversation. No "I hope". |

3. Pick the angle:

| Company type | Angle |
|---|---|
| AI company | AI-forward: lead with the hands-on AI work you've shipped and your genuine enthusiasm for the space. Their product is your interest, so say so with specifics. |
| Everyone else | Generalist: ownership, measurable impact, and craft. AI experience is a plus, not the headline. |
| Fintech / business | Revenue-impacting execution and reliability. |
| Product / platform | End-to-end ownership: planning, architecture, delivery, stakeholders. |
| Frontend / design | Systems thinking: component libraries, tokens, design-to-code workflow. |
| Your domain | Domain alignment: you use or build the kind of thing they make. |

The same rules apply as for resumes: fidelity, no em dashes, working links, and nothing from the "Keep Private" list in `Context/Career_Profile.md`.

## Render PDFs

```bash
scripts/pdf.sh <input.html> [output.pdf]
```

- Output defaults to the same path with `.pdf`.
- Uses headless Chrome (the macOS app, else `google-chrome`, `google-chrome-stable`, `chromium`, or `chromium-browser` on your PATH) with no header or footer.
- Prints the page count when `pdfinfo` (poppler) or Python `pypdf` is installed, and warns loudly when a file with "Resume" in its name isn't exactly 1 page.
- No Chrome? Open the HTML in any Chromium browser, Print, Save as PDF, turn headers and footers off, and keep default margins.
