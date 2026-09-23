# Worked example: Jordan Rivera (fictional)

> **NOTHING HERE WAS SUBMITTED.** Jordan Rivera is a made-up candidate: every employer, school, project, number, email, and phone number is invented, and every link points at example.com. The prepped company (Proseware) and its posting are invented too, dated **2026-09-23**. No application was sent, no form was opened, and no email was written.

This folder shows what your workspace looks like after `set me up` and one prepped application. Use it to see the shape of a filled-in file. Never copy facts from it. Why: the agent treats `examples/` as a reference for format, never as a source of truth (see `AGENTS.md`).

It mirrors the personal working layout, so `examples/Context/` here is what your `Context/` will look like.

## File map

| Example file | Filled from | What it shows |
|---|---|---|
| `Context/Career_Profile.md` | `templates/profile/Career_Profile.md` | Identity, targeting, strengths, differentiator, Keep Private |
| `Context/Achievement_Bank.md` | `templates/profile/Achievement_Bank.md` | Every fact the resume can use, project blurbs with angles, the variants table, bullet trim order |
| `Context/Job_Search_Criteria.md` | `templates/profile/Job_Search_Criteria.md` | Gates, R x C anchors, sources, freshness |
| `Context/Application_Answers.md` | `templates/profile/Application_Answers.md` | Form answers, salary policy, EEO answers ("Decline to self-identify") |
| `Context/Project_Links.md` | `templates/profile/Project_Links.md` | Which projects are live and linkable |
| `Context/Preferences.md` | `templates/profile/Preferences.md` | Suggested defaults kept, every blank answered, one custom checkpoint added |
| `Resumes/Final/Jordan_Rivera_Resume_2026-09-23.html` + `.pdf` | `templates/resume/Resume_TEMPLATE.html` | The approved general resume (1 page) |
| `Applications/Proseware/Job_Description_SeniorFullStack.md` | `templates/application/Job_Description.md` | A posting frozen verbatim, with Fit Reason, Priority, and Bucket |
| `Applications/Proseware/Prep_Record_SeniorFullStack.md` | `templates/application/Prep_Record.md` | Gate results, what changed in the variant and why, open questions |
| `Applications/Proseware/Jordan_Rivera_Resume_Proseware_SeniorFullStack.html` + `.pdf` | the Final above, per `docs/RESUME_GUIDE.md` | A tailored variant: project bullet swapped, a project condensed, bullets reordered, skills reordered |
| `Applications/Proseware/Jordan_Rivera_CoverLetter_Proseware_SeniorFullStack.html` + `.pdf` | `templates/cover-letter/CoverLetter_TEMPLATE.html` | The AI-forward angle, about 300 words, every claim backed by the bank |
| `Applications/Proseware/Application_Record_SeniorFullStack.md` | `templates/application/Application_Record.md` | Headed "EXAMPLE ONLY: NOT SUBMITTED". Form question labels, the answers Jordan would give, a drafted essay awaiting approval, status DEFERRED with the blocker |
| `Applications/Job_Tracker_example.csv` | `templates/tracker/Job_Tracker_TEMPLATE.csv` | A 4-row excerpt of the tracker (exact column order, status strings, Fit Reason format) |
| `Morning_Brief_example.md` | `docs/MORNING_ROUTINE.md` | A sample morning briefing, section by section |

## Things worth noticing

- **The process stopped where it should.** Prep finished, then the Prep_Record surfaced open questions and nothing was applied. That's the Phase 3 STOP in `docs/PLAYBOOK.md`.
- **Every gate is logged.** The Prep_Record lists each hard gate with its result, including freshness (posted 5 days before prep), so you can see why the role qualified.
- **Anything that needs your judgment becomes an open question.** The required salary number and the "Why Proseware?" essay are drafted from `Context/` but wait for Jordan's OK instead of being submitted on a guess.
- **The tracker row says "New/To Review", not "Applied".** Status changes only on real events, and a submit counts only with a confirmation.
- **No `applied_SeniorFullStack.png`.** A real folder gets the confirmation screenshot at submit time; faking one would be a fabricated record.
- **The tracker is an excerpt.** Your real tracker is `Applications/Job_Tracker.xlsx` with every row. The CSV here keeps the example readable in git. The Adventure Works Cycles backup row refers to a primary role that isn't in the excerpt.

## Check your setup with it

```bash
scripts/pdf.sh examples/Resumes/Final/Jordan_Rivera_Resume_2026-09-23.html /tmp/kit_check.pdf
```

You should see a page count of 1 (if `pdfinfo` or `pypdf` is installed). Write to a path outside `examples/` so the tracked PDF stays as is.
