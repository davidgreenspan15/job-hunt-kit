# Job Hunt Kit

## What this is

An AI-run job hunt. Claude Code does the searching, rating, resume and cover letter tailoring, applying, tracking, and inbox follow-up. You stay in the loop at a few checkpoints: you approve the shortlist, review the prepped materials, say go before anything is submitted, and approve every email before it's sent.

The kit ships the process, empty templates, and one fully fictional worked example. Your own data lives in gitignored folders and never leaves your machine.

## How it works

Seven phases. The full detail is in [docs/PLAYBOOK.md](docs/PLAYBOOK.md).

| Phase | What happens | What you do | What Claude does | Output |
|---|---|---|---|---|
| 0 Refresh profile | Bring your profile up to date before a round | Tell Claude what changed (new role, project, skills, comp target) | Updates `Context/*` and your base resume | `Context/`, `Resumes/Final/` |
| 1 Search | Find fresh roles that match your criteria | Nothing, or point it at a source | Searches against `Context/Job_Search_Criteria.md`, keeps postings under 2 weeks old, dedupes against the tracker | `Research/<YYYY-MM-DD>-search/`, new tracker rows |
| 2 Rate and group | Hard gates, then score, then bucket | Review the ranked list, mark referral contacts | Scores Priority = R x C, sorts into apply-now / referral-hold / skip, caps each company at 1 role (max 2) | Priority and Fit Reason per row, "Backup (not prepped)" rows |
| 3 Prep | Build every package before anything is sent | Review, then say go | Freezes the full job description, tailors resume and cover letter (HTML + PDF), then STOPS | `Applications/<Company>/` |
| 4 Apply | Submit in waves of about 20 | Clear captchas and logins, run any handoff | Runs the dedupe gate before each submit, fills forms, screenshots the confirmation, stops after wave 1 for a flow check | `Application_Record_<RoleSlug>.md`, `applied_<RoleSlug>.png` |
| 5 Track | One tracker row per role, always current | Nothing | Updates `Applications/Job_Tracker.xlsx` (plus the optional cloud tracker) | Tracker |
| 6 Respond | Work the replies until every row closes | Approve replies, show up to interviews | Sweeps Gmail, updates statuses, drafts replies, builds interview prep | Tracker updates, drafts, `Prep/` notes |

Done means responded-to, not sent. The round ends when every application has reached a final or scheduled state.

## What you need

Full walkthrough with checkboxes: [docs/SETUP.md](docs/SETUP.md).

- A Claude subscription that includes Claude Code, logged in with your claude.ai account (not an API key)
- Google Chrome
- Node.js 22 or newer (runs the Playwright browser server)
- Python 3 with `openpyxl` for the xlsx tracker
- The MCP servers and connectors below

## MCPs and connectors you need

| Name | Type | Required? | Used for | Verify |
|---|---|---|---|---|
| Playwright MCP | Project MCP (`.mcp.json`) | Required | Tier 1 applies, reading job pages | `/mcp` shows `playwright` connected |
| Gmail | claude.ai connector | Required | Phase 6 inbox sweeps, reply drafts, email codes, the morning brief | `/mcp` lists the claude.ai Gmail entry |
| Claude in Chrome | Browser extension | Recommended | Tier 2 handoffs for bot-blocked forms (Ashby especially) | `claude --chrome`, then open example.com |
| Google Drive | claude.ai connector | Optional | The cloud tracker add-on | `/mcp` lists Google Drive |
| Indeed | claude.ai connector | Optional | An extra Phase 1 search source | `/mcp` lists Indeed |
| Computer use | Desktop feature | Optional | Native desktop dialogs only; browsers are view-only there | Settings in Claude Code or Claude Desktop |
| Browser MCP | Browser extension + MCP | Optional | An alternative to Playwright if you prefer it | `/mcp` shows it connected |

How to enable each one, plus fixes when one won't connect: [docs/SETUP.md](docs/SETUP.md#mcps-and-connectors).

## Quick start

```bash
git clone https://github.com/davidgreenspan15/job-hunt-kit.git
cd job-hunt-kit
claude
```

1. Say **"set me up"**. Claude runs `scripts/setup.sh`, asks for your current resume (PDF, DOCX, or text), fills your profile from it, builds your base resume, then asks about criteria and preferences in short numbered batches.
2. Say **"run a job hunt round"**. It runs Phases 0 to 3 (refresh, search, rate, prep), pauses after Phase 2 for your picks, and stops before applying. Use "run Phase N per the playbook" when you want one phase at a time.

## Everyday things to say to Claude

| Say | What happens |
|---|---|
| "set me up" | First-run onboarding (safe to repeat, never overwrites your files) |
| "run Phase N per the playbook" | Runs that phase exactly as [docs/PLAYBOOK.md](docs/PLAYBOOK.md) describes |
| "run a job hunt round" | Phases 0 through 3, then stops before applying |
| "refresh my profile" | Phase 0 |
| "find new roles" | Phase 1 search, then Phase 2 ranking |
| "prep the top 10" | Phase 3 for the ten highest-Priority roles, then it stops |
| "apply wave 1" | Phase 4, first wave, then a flow check with you |
| "write the handoff for the blocked ones" | A batch file for your real-Chrome session ([docs/HANDOFF.md](docs/HANDOFF.md)) |
| "reconcile the handoff report" (paste it) | Reconciles the tracker and do-not-reapply list from the results |
| "check my inbox" | Phase 6 sweep: statuses updated, one action list |
| "ignoring Tailspin Toys" / "handled Tailspin Toys" | Records it in your tracker; with the cloud tracker add-on, also mutes it in the morning brief |
| "draft a reply to Wide World Importers" | A Gmail draft you review; sent only on your OK |
| "prep me for an interview at Adventure Works Cycles" | Interview notes in `Prep/`, built from the frozen JD and what you submitted |
| "what did Tailspin Toys list for salary?" | Answer from the frozen `Job_Description_<RoleSlug>.md` |

## Folder map

```
job-hunt-kit/
├── README.md, AGENTS.md, CLAUDE.md, RULES.md, .mcp.json   the kit (tracked)
├── docs/          how everything works
├── scripts/       setup.sh, pdf.sh
├── templates/     blank profile, resume, cover letter, tracker, handoff files
├── examples/      a fully fictional worked example (Jordan Rivera) to copy the shape of
│
├── Context/       your profile, criteria, answers, preferences       (yours, gitignored)
├── Resumes/       Template/, Final/, Drafts/, Archive/                (yours, gitignored)
├── CoverLetters/  your cover letter template                        (yours, gitignored)
├── Applications/  Job_Tracker.xlsx, one folder per company, handoffs (yours, gitignored)
├── Prep/          interview prep notes                                (yours, gitignored)
└── Research/      search results per round                           (yours, gitignored)
```

Rule of thumb: **lowercase = the kit** (tracked in git), **Capitalized = your personal data** (gitignored, never pushed). `scripts/setup.sh` creates the Capitalized folders from `templates/`.

## Email

The Gmail connector can search and read threads, create drafts, and send or reply. The kit default is cautious:

- **Interactive sessions** draft replies and send only after you approve that specific email.
- **The morning brief** is strictly read-only. It never sends, drafts, or labels anything.
- **One-time codes** sent by email during an apply can be read from Gmail, so you don't have to paste them.

To loosen it, edit the Sending line under Email in `Context/Preferences.md`. For example: "send routine replies (scheduling confirmations, thank-yous) without asking; ask for anything else." Why the default: a recruiter reply is the highest-stakes text in the whole hunt.

## Automation levels

Full detail: [docs/HANDOFF.md](docs/HANDOFF.md).

- **Tier 1, Claude drives the browser:** Claude Code fills and submits clean forms itself through Playwright MCP. This covers most applications.
- **Tier 2, real-browser handoff:** some sites (Ashby especially) don't accept automated browsers and reject the submit as spam. Claude writes one batch file, `Applications/_handoff/HANDOFF_<YYYY-MM-DD>.md`, and you run it in a session that drives your real, logged-in Chrome through the Claude in Chrome extension. That session reports SUBMITTED or FAILED; Claude Code updates the trackers.
- **Tier 3, your hands:** captchas, account creation that chains captchas, per-company blocks that survive a retry, and forced per-session 2FA.

Computer use is optional and not part of applying: browsers are view-only there, so form filling goes through Playwright (Tier 1) or the Claude in Chrome extension (Tier 2). See [docs/SETUP.md](docs/SETUP.md) step 7.

## Accounts and credentials

You create any portal accounts yourself (Claude hands you the sign-up links in one batch). You record them in `Applications/Credentials.md`, which setup creates from `templates/Credentials.template.md`, sets to chmod 600, and keeps gitignored. Claude reads that file only to log in and never echoes a value into chat, logs, trackers, or records. Your Gmail password is never stored anywhere: Gmail goes through the connector. Details: [docs/ACCOUNTS_AND_CREDENTIALS.md](docs/ACCOUNTS_AND_CREDENTIALS.md).

## Morning brief

An optional scheduled cloud routine that reads your Gmail every morning and gives you one skimmable briefing: what's waiting on you (with days waiting), what arrived in the last 24 hours, interviews coming up (found from confirmation and invite emails), and a one-line pipeline pulse. It repeats unhandled items every day until you reply or mute them. It runs even when your computer is off, needs only the Gmail connector, and is read-only. An optional Google Drive add-on keeps a cloud copy of your live pipeline current. Setup and the paste-ready prompt: [docs/MORNING_ROUTINE.md](docs/MORNING_ROUTINE.md).

## Your rules and preferences

- **[RULES.md](RULES.md)**: the core rules the kit depends on (truthfulness, the dedupe gate, secrets, privacy). Your preferences can't override these.
- **`Context/Preferences.md`**: your personal do/don't list, one rule per line. Edit it freely: change a value, delete a line, add your own. Claude reads it at the start of every session.

## Privacy and safety

- Never commit personal data. Everything personal lives in the Capitalized folders, which `.gitignore` excludes. Don't `git add -f` them.
- If you want your own remote, keep it a private repo.
- Claude will never do these without asking you first:
  - submit an application before your go for that wave
  - send an email (unless you loosened this in `Context/Preferences.md`)
  - create an account, or start or decline a timed assessment
  - withdraw from a process or decline an interview
  - commit or push anything
  - echo a credential value anywhere

## Top tips

More in [docs/TIPS.md](docs/TIPS.md).

- **Stay fresh.** Only chase postings under 2 weeks old. Stale links are often dead by apply time and waste the whole prep.
- **One role per company.** Pick the best one (two at most) before prep. Five applications to one company look like spam.
- **Prep everything, then review.** Reviewing a finished batch is faster and catches more than reviewing as it goes.
- **Don't fight Ashby in Playwright.** A "possible spam" rejection means the site doesn't accept the automated browser, not that your data is wrong. Retry once, then send it to the handoff.
- **Check the page count.** Every resume must be exactly one page. `scripts/pdf.sh` prints the count.
- **Answer fast.** The morning brief nags on purpose. Scheduling asks go stale in days.

## Updating the kit

```bash
git pull
```

Your data is untouched: everything personal is gitignored, and `scripts/setup.sh` never overwrites a file that already exists. Re-run it after a pull to pick up any new templates.
