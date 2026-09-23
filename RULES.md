# Rules

The rules the whole kit depends on. `Context/Preferences.md` can tune behavior (checkpoints, email, style), but it never overrides anything under Truth, Secrets and privacy, Style, or the dedupe gate.

## Truth

- **DO** reword, reorder, reframe, and choose which true things to lead with for each role. Why: tailoring is the job; literal transcription makes flat resumes.
- **DON'T** claim anything the user didn't do: no invented employers, titles, dates, tools, scope, or ownership. Why: every claim has to survive an interview and a background check.
- **DON'T** invent metrics. If a bullet needs a number the Achievement Bank doesn't have, ask. Why: one made-up number gets copied into every application after it.
- **DO** mark unknowns as a question or `<FILL: ...>`, never as a guess. Why: a visible gap gets fixed; a plausible guess ships.

## Before applying

- **DO** freeze the full job description in `Job_Description_<RoleSlug>.md` during prep. Why: postings change or vanish, and you'll need the salary, requirements, and why-it-qualified later.
- **DO** decide the per-company cap (1 role, max 2) in Phase 2, before any prep. Extra roles become "Backup (not prepped)". Why: five near-identical applications to one company look like spam and waste prep.
- **DO** stop and surface when prep is complete. Apply only after the user's explicit go. Why: nothing leaves the machine without a human look.
- **DO** stop after the first apply wave for a flow check. Why: a systematic form mistake caught early doesn't repeat across every remaining application.

## While applying

- **DO** run the submit-time dedupe gate before EVERY submit: normalized company key against `Applications/DO_NOT_REAPPLY.md` and every tracker row, whatever its status. Why: add-time dedupe misses re-applies; this gate is what actually stops them.
- **DO** record every application: tracker row, `Application_Record_<RoleSlug>.md`, and `applied_<RoleSlug>.png`. Why: each company folder must be a complete record of exactly what was sent.
- **DO** retry a spam rejection once, then mark it FAILED and move it to the next tier. Why: repeated submits from a flagged browser only dig the hole deeper.
- **DO** pause and hand captchas, login walls, and account creation to the user, then continue. Why: those are the user's identity and the user's call.
- **DON'T** route the user through repeated per-session 2FA. Skip those portals or flag them for one manual sitting. Why: a code prompt on every login turns a batch into a babysitting job.
- **DON'T** auto-start or auto-decline a timed assessment (CodeSignal, HackerRank, clocked take-homes). Surface it with its deadline. Why: a started timer can't be undone, and a declined invite can't be taken back.

## Tracking and status

- **DO** write every transition to `Applications/Job_Tracker.xlsx` in the same session it happens. Why: the tracker is the single sink; anything that lives only in chat is lost.
- **DO** use only the kit's status vocabulary and column order. Why: the morning brief and every later session parse these exact strings.
- **DO** verify before reporting status: "submitted" needs on-screen confirmation text or a receipt email, plus the screenshot. Why: "I clicked submit" is not evidence, and a false "done" hides a lost application.
- **DON'T** call a round done at submit. Done means responded-to. Why: the replies are where offers come from.

## Email

- **DON'T** let the morning routine send, draft, label, archive, or delete anything. It is read-only. Why: an unattended job that can act on the user's inbox is one bad match away from a wrong email.
- **DON'T** send any email until the user has approved that specific email, unless `Context/Preferences.md` explicitly loosens this. Draft it and show it first. Why: recruiter replies are the highest-stakes text in the whole hunt.

## Secrets and privacy

- **DON'T** echo credential values anywhere: chat, logs, tracker, records, handoff files, or command lines. Why: transcripts and files outlive the moment.
- **DON'T** store the email account password. Gmail access goes through the connector. Why: the inbox is the key to resetting every other account.
- **DON'T** commit or push unless the user asks. Why: the user decides what leaves the machine.
- **DON'T** put personal data in tracked files (anything outside the Capitalized dirs), and never un-ignore a personal dir or `git add -f` one. Why: this repo is meant to be shareable; one commit can publish the user's whole job hunt.
- **DON'T** name anything the user listed under Privacy in `Context/Preferences.md` in employer-facing text. Why: some work is private even when it's impressive.

## Style

- **DON'T** use the em dash character in employer-facing text (resumes, cover letters, form answers, emails). Use commas, colons, parentheses, or two sentences; en-dash date ranges are fine. Why: it reads as an AI tell to many reviewers.
