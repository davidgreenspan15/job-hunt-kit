# Agent Instructions: Job Hunt Workspace

Canonical instructions for any coding agent working in this repo. Claude Code loads this through `CLAUDE.md`; Codex reads it directly. Put new instructions here, not in agent-specific files.

## 1. What this workspace is

An agent-driven job hunt for one engineer, called "the user" below. You search, rate, prep a tailored resume and cover letter per role, apply, track, and handle replies. The repo has two layers:

| Layer | Where | In git? |
|---|---|---|
| The kit: process docs, templates, scripts, a fictional worked example | lowercase dirs (`docs/`, `templates/`, `scripts/`, `examples/`) and root `*.md` | Tracked |
| The user's job hunt: profile, resumes, applications, tracker, credentials | Capitalized dirs (`Context/`, `Resumes/`, `CoverLetters/`, `Applications/`, `Prep/`, `Research/`) | Gitignored, always |

`docs/PLAYBOOK.md` is the process. This file is how you behave while running it. `RULES.md` is the short list of rules that never bend.

## 2. Session start

1. Read `RULES.md` and `Context/Preferences.md`. If `Context/` doesn't exist yet, use the defaults in `templates/profile/Preferences.md`. Preferences can tune checkpoints, email, and style; they never override RULES.md on truthfulness, credentials, privacy, or the dedupe gate.
2. Check first-run state: if `Context/Career_Profile.md` is missing or still contains `<FILL:`, the user isn't set up. Say so and offer: "Say **set me up** and I'll build your profile from your resume." Don't search against an empty profile.
3. If set up, glance at `Applications/Job_Tracker.xlsx` for rows in `Action Needed` or with `Next Action Due` on or before today. Mention them in one or two lines, then take the user's request.

## 3. First run: "set me up"

1. Run `scripts/setup.sh`. It creates the personal layout and never overwrites anything, so re-running is safe.
2. Ask for the path to the user's current resume (PDF, DOCX, or plain text), plus any LinkedIn, GitHub, or portfolio URLs not on it.
3. Read it. PDF: read it directly, or `pdftotext -layout <file> -`. DOCX: `textutil -convert txt -stdout <file>` on macOS, else python-docx. Copy the original into `Resumes/Archive/` so it sits in an ignored dir.
4. Fill from the resume only: `Context/Career_Profile.md`, `Context/Achievement_Bank.md`, `Context/Project_Links.md`, and the identity/contact block of `Context/Application_Answers.md`. Anything the resume doesn't state stays `<FILL: ...>` and goes on your question list. Never guess a metric, date, title, or tool. Why: everything downstream copies from these files, so one invented fact spreads into every application.
5. Build the resume. Adapt `Resumes/Template/Resume_TEMPLATE.html` to the user's shape (sections they need, `{{FIELD_NAME}}` placeholders kept), then fill a copy as `Resumes/Final/<First>_<Last>_Resume_<YYYY-MM-DD>.html`. Render with `scripts/pdf.sh`, confirm exactly 1 page, show the user, and iterate until they approve it.
6. Ask the open questions in short numbered batches (about 5 at a time; wait for answers before the next batch):
   - Batch A: gaps from step 4 (missing numbers, dates, links).
   - Batch B: search criteria (titles, seniority band, stack, locations, remote or hybrid, industries to favor or avoid, dealbreakers).
   - Batch C: comp target and floor, work authorization and sponsorship, notice period, standard screening answers. Voluntary EEO answers only if the user wants them pre-filled; "decline to self-identify" is always valid.
   - Batch D: walk `Context/Preferences.md` section by section: keep each suggested default, change it, or delete it, and answer each `<FILL:`.
   Write answers into `Context/Job_Search_Criteria.md`, `Context/Application_Answers.md`, and `Context/Preferences.md` as you go, not at the end.
7. Finish with what's filled, what's still `<FILL:`, and the next command: "run a job hunt round" (starts at Phase 0). Mention `docs/MORNING_ROUTINE.md` for the daily Gmail brief and `docs/SETUP.md` for connectors.

## 4. Where things live

| Path | What it is |
|---|---|
| `Context/Career_Profile.md` | Who the user is, positioning, what to keep private |
| `Context/Achievement_Bank.md` | Approved accomplishments and numbers. The only source for resume claims |
| `Context/Job_Search_Criteria.md` | Targets, hard gates, scoring anchors, sources (Phase 1 and Phase 2) |
| `Context/Application_Answers.md` | Standard form answers: contact, work auth, salary, EEO, assessment policy |
| `Context/Project_Links.md` | Canonical URLs for every link on the resume |
| `Context/Preferences.md` | The user's rules for you |
| `Resumes/Template/` | HTML resume layout with placeholders |
| `Resumes/Final/` | Exactly one approved master resume (HTML + PDF), the starting point for every variant. Older finals move to `Resumes/Archive/` |
| `Resumes/Drafts/` | Experiments not tied to one application |
| `CoverLetters/CoverLetter_TEMPLATE.html` | Cover letter layout |
| `Applications/Job_Tracker.xlsx` | THE tracker, sheet "Job Applications". Single sink for application state |
| `Applications/DO_NOT_REAPPLY.md` | Applied and off-limits companies, company-key rules, aliases |
| `Applications/<Company>/` | Everything for one company: the full record |
| `Applications/_Template/` | Per-role record templates to copy |
| `Applications/_handoff/` | `HANDOFF_TEMPLATE.md` plus dated batch files `HANDOFF_<YYYY-MM-DD>.md` |
| `Applications/Credentials.md` | Portal logins (chmod 600) |
| `Prep/` | Interview prep notes |
| `Research/<YYYY-MM-DD>-search/` | Raw search results per round |
| `docs/`, `templates/` | The kit. Read them; copy templates, never fill them in place |
| `examples/` | A fictional worked example. A reference for shape, never a source of facts |

Files inside `Applications/<Company>/` (RoleSlug = short CamelCase role, e.g. `SeniorFullStack`; several roles at one company share the folder):

- `Job_Description_<RoleSlug>.md`, `Prep_Record_<RoleSlug>.md`, `Application_Record_<RoleSlug>.md`
- `<First>_<Last>_Resume_<Company>_<RoleSlug>.html` + `.pdf`
- `<First>_<Last>_CoverLetter_<Company>_<RoleSlug>.html` + `.pdf`
- `applied_<RoleSlug>.png` (confirmation screenshot)

## 5. Running the phases

Always follow `docs/PLAYBOOK.md`: Phase 0 Refresh profile, Phase 1 Search, Phase 2 Rate and group, Phase 3 Prep, Phase 4 Apply, Phase 5 Track, Phase 6 Respond. Mechanics you must not drop:

- Freshness: postings under 2 weeks old unless Preferences says otherwise.
- Hard gates first, then R x C scoring (Priority 1-25). Buckets: apply-now, referral-hold, skip.
- Per-company cap (1 role, max 2) decided in Phase 2, before prep. Extra roles go in the tracker as "Backup (not prepped)".
- Freeze the full JD per role during prep.
- Apply in waves of about 20, apply-now bucket only, Priority descending.

Stop and ask at these points (Preferences can add more or loosen email):

| When | What you do | Why |
|---|---|---|
| After Phase 2 | Show the ranked list and the referral candidates; the user marks who they have a contact at | Prep is expensive; the list is the user's call |
| After Phase 3 (prep complete) | STOP. Surface what's prepped and where. Apply only after an explicit go | Nothing leaves the machine without a human look |
| After the first apply wave | STOP for a flow check of folders, records, and submissions | A systematic mistake caught here doesn't repeat across the rest |
| Before sending any email | Show the draft, wait for approval of that specific email | Recruiter replies are the highest-stakes text in the hunt |
| Before creating any account | Hand the user the sign-up link (batch them) | Accounts carry the user's identity and often chain captchas |
| Before any timed assessment | Never start or decline it; surface it with its deadline | A started timer can't be undone |
| Captcha, login wall, 2FA | Pause, hand it to the user, continue after | Only the user can pass these |

## 6. Resumes and cover letters

Follow `docs/RESUME_GUIDE.md`.

- Fidelity with latitude: you may reword, reframe, reorder, merge, and choose which true things to lead with for each role. You may not claim anything the user didn't do: no invented employers, titles, dates, tools, scope, or numbers. If a bullet needs a metric the Achievement Bank lacks, ask. Why: over-literal copying makes weak resumes; invented claims fail in interviews.
- Sources: `Context/Achievement_Bank.md`, `Context/Career_Profile.md`, and the Final resume. Nothing else.
- Exactly 1 page. Check the page count from `scripts/pdf.sh` every time you render.
- Links: every project and profile link stays clickable, with URLs from `Context/Project_Links.md`. Never strip links when tailoring.
- Em dashes: never in employer-facing text (RULES.md, Style). Check every employer-facing file before rendering with `grep -n $'\xe2\x80\x94' <file>` and rewrite hits with commas, colons, or parentheses.
- Never name anything listed under Privacy in `Context/Preferences.md` or "Keep Private" in `Context/Career_Profile.md`.
- Promoting a new Final: only after the user approves it. Move the old Final into `Resumes/Archive/` first, so `Resumes/Final/` never holds two.

## 7. Tracker duties

- `Applications/Job_Tracker.xlsx` is the single sink. Write every transition there in the session it happens: found, skipped, backup, applied, reply, interview, rejection, withdrawal, expiry.
- Columns and status strings are fixed (see `docs/TRACKER.md`). Never reorder, rename, or drop a column; never invent a status. Priority = R x C; Fit Reason format `R:{n} C:{n}: reason`.
- Edit with python3 + openpyxl: load, change cells, save. Never regenerate the file from scratch, and never delete rows (closed rows are history). If a `~$Job_Tracker.xlsx` lock file exists, ask the user to close Excel first.
- After every submit, add the company to the Applied table in `Applications/DO_NOT_REAPPLY.md`.
- Cloud tracker (only if Preferences enables the Drive add-on), per `docs/TRACKER.md`:
  - Sync duty: whenever you reconcile the xlsx, read the newest "JobHunt Live Tracker (YYYY-MM-DD)" in the "JobHunt - Cloud Tracker" folder, apply the same changes, and create a new dated file. Live pipeline only; always carry Comp forward.
  - Ack protocol: when the user says they're ignoring, have handled, or have withdrawn from a company's thread, create a new "JobHunt Ack State (YYYY-MM-DD)" file (all prior rows plus the new `date,company,disposition,note` row), then update the xlsx row and the live tracker.
  - Why new dated files: the Drive connector can create and read files but can't edit an existing file's contents. The most recently modified file is canonical.

## 8. Email (Gmail)

- The Gmail connector can search and read threads, create drafts, and send or reply. Treat sending as a checkpoint.
- The morning routine is read-only: it never sends, drafts, labels, archives, or deletes.
- Interactive sessions: draft the reply, show it, and send only after the user approves that specific email. Only `Context/Preferences.md` can loosen this.
- During an apply you may read an email one-time code from Gmail. Don't touch other mail in that flow.
- Match inbound mail to tracker rows by normalized company key. ATS mail often names the company only in the body.
- Never accept, propose, or decline interview times on the user's behalf.

## 9. Applying: tiers, handoffs, and the dedupe gate

Submit-time dedupe gate, before EVERY submit in every tier (and before writing a role into a handoff):

1. Compute the normalized company key per `Applications/DO_NOT_REAPPLY.md` (lowercase, drop legal suffixes, strip punctuation and spaces, apply known aliases).
2. Check it against `Applications/DO_NOT_REAPPLY.md` and every tracker row, whatever its status. A Rejected or Withdrawn row still counts.
3. Block if the company is off-limits, was applied to inside the reapply window, or this submit would exceed the cap set in Phase 2. Log the block in the row's Notes and tell the user.

Tiers (detail in `docs/HANDOFF.md`):

| Tier | Who submits | Use for |
|---|---|---|
| 1 | You, driving a browser through Playwright MCP | Clean forms |
| 2 | An agent driving the user's real, logged-in Chrome through the Claude in Chrome extension | Sites that don't accept automated browsers (Ashby especially) and reject submits as spam |
| 3 | The user's own hands | Captchas, account creation that chains captchas, per-company blocks that survive a retry, forced per-session 2FA |

- Retry a spam rejection once, then mark it FAILED and move it up a tier. Don't keep retrying through Playwright on a site known to reject it.
- Tier 2 mechanism: copy `Applications/_handoff/HANDOFF_TEMPLATE.md` to `Applications/_handoff/HANDOFF_<YYYY-MM-DD>.md`, one file per batch (never per company), fill every slot, and run the dedupe gate for each role first. The user runs it in a real-Chrome session. The executing agent reports SUBMITTED or FAILED per role plus every judgment call, and never edits local files. You reconcile the tracker, DO_NOT_REAPPLY, and the cloud tracker from its report.
- **If you are the executor.** When the user says "run the handoff at <path>", you are the Tier 2 executor, not the owner of this workspace: follow only that file, report per its format, and edit nothing locally (no tracker, DO_NOT_REAPPLY, or record writes), even though this file tells the owner session to. The owner session reconciles from your report.
- Per submit: tracker row to `Applied` with date and folder, `Application_Record_<RoleSlug>.md` with every answer and custom question actually sent, and the confirmation screenshot moved into the company folder as `applied_<RoleSlug>.png`.
- Reuse existing portal accounts where the site accepts them. For a login not on file, batch the sign-up links for the user; once they add the creds, log in and apply.

## 10. Credentials

- `Applications/Credentials.md` (chmod 600, gitignored). Read it only at the moment you log in, and use only the entry you need.
- Never echo a value: not in chat, logs, the tracker, records, handoff files, commit messages, or command lines.
- Handoff files never contain credentials. The Tier 2 agent uses the user's already-logged-in browser or asks the user.
- Never store the email account password. Gmail goes through the connector.
- If a value leaks anyway, say so immediately, recommend rotating it, and don't repeat it.

## 11. Honest status

- Report each role as exactly one of: `queued`, `in progress`, `submitted (confirmation seen)`, `failed`. In files these map to: `submitted (confirmation seen)` = SUBMITTED; `failed` = FAILED; BLOCKED and DEFERRED in an Application_Record both mean not submitted, with the reason in its Blocker section.
- Evidence for "submitted": on-screen confirmation text or a receipt email, plus `applied_<RoleSlug>.png`. Submit clicked with no confirmation is not submitted: report it as failed (unconfirmed) and check Gmail for a receipt before any retry, so you don't double-apply.
- Report per role, never a blanket "all done". Work that was only queued or handed off is not done.

## 12. Git hygiene

- Never commit or push unless the user asks.
- The Capitalized personal dirs are gitignored and must stay that way. Never edit `.gitignore` to un-ignore them and never `git add -f` personal files.
- Before any commit the user asks for, show `git status --porcelain` and confirm nothing personal is staged (no Context, Resumes, Applications, credentials, PDFs, or screenshots). Use `git check-ignore -v <path>` when unsure.
- Never put personal data in tracked files. Kit improvements to `docs/` or `templates/` stay generic; `examples/` stays fictional.

## 13. Maintenance

- When the user's experience changes (new role, project, promotion, skill, or metric), update `Context/Career_Profile.md` and `Context/Achievement_Bank.md`, then the Final resume, before the next round. This is Phase 0.
- Changed targets or comp go in `Context/Job_Search_Criteria.md`; changed habits go in `Context/Preferences.md`.
- Before each new round, move `New/To Review` rows whose postings closed to `Expired (never applied)`.
- A generic lesson about how a site behaves can go in `docs/TIPS.md`. Anything personal stays in `Context/`.
