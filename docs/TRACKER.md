# Tracker

One source of truth, plus an optional cloud mirror of the live pipeline.

| | Local tracker (canonical) | Cloud tracker (optional) |
|---|---|---|
| Where | `Applications/Job_Tracker.xlsx`, sheet "Job Applications" | Google Drive folder "JobHunt - Cloud Tracker" |
| Holds | Every row, every round, every status (full history) | Live pipeline only |
| Written by | Local Claude Code sessions | The scheduled morning routine, plus any local session (sync duty) |
| Why | Rich history, formulas, filters, backups | Lets a cloud routine keep state while your computer is off |

The xlsx wins any disagreement. The cloud tracker is a mirror, never a second source of truth.

Templates: `templates/tracker/Job_Tracker_TEMPLATE.xlsx` (setup copies it to `Applications/Job_Tracker.xlsx`), `Job_Tracker_TEMPLATE.csv`, `Live_Tracker_TEMPLATE.csv`, `Ack_State_TEMPLATE.csv`.

---

## Local Tracker Columns (exact order)

| # | Column | What goes in it |
|---|---|---|
| 1 | Company | Company name as posted |
| 2 | Role | Exact title |
| 3 | Location | City / hybrid / remote |
| 4 | Salary Range | As posted, or "inferred: ..." |
| 5 | Source | Where you found it |
| 6 | Date Found | YYYY-MM-DD |
| 7 | Status | One of the statuses below (dropdown) |
| 8 | Priority | R x C, 1-25 |
| 9 | Fit Reason | `R:{n} C:{n}: reason` |
| 10 | Date Applied | YYYY-MM-DD, blank until submitted |
| 11 | Last Response Date | Date of the company's latest message |
| 12 | Next Action | One line: what happens next, and who does it |
| 13 | Next Action Due | YYYY-MM-DD |
| 14 | Folder | `Applications/<Company>/` |
| 15 | Resume File | File name of the submitted resume |
| 16 | Cover Letter File | File name, or blank |
| 17 | Apply URL | Direct application URL |
| 18 | Notes | Dedupe blocks, portal limits, anything else |

One row per role. Multiple roles at one company are separate rows sharing a Folder.

## Status Vocabulary (exact strings)

| Status | Meaning | Stage |
|---|---|---|
| New/To Review | Found in Phase 1 and not yet submitted: being gated, scored, or prepped (prep shows in Folder and Resume File) | Pre-apply |
| Referral - Hold | Prepped, held for a referral; never applied cold | Live |
| Backup (not prepped) | Extra role past the per-company cap; no materials built | Pre-apply |
| Applied | Submitted with a confirmation; waiting | Live |
| Action Needed | The company asked you for something; you owe the next move | Live |
| Interview - Scheduled | A call or interview is booked (date in Next Action Due) | Live |
| Follow-up Sent | You followed up or sent a thank-you; waiting on them | Live |
| Withdrawn | You pulled out | Terminal |
| Rejected | The company declined | Terminal |
| Closed - No Offer | Interviewed, ended without an offer | Terminal |
| Closed - No Response | Applied, then silence long enough that you are calling it (including a Referral - Hold role that was applied to and then heard nothing) | Terminal |
| Expired (never applied) | Posting closed before you applied | Terminal |
| Skip | Failed a gate or you chose not to apply (reason in Fit Reason or Notes) | Terminal |

The xlsx "Status Guide" sheet holds this same list and feeds the Status dropdown. Why exact strings: routines and filters match on them, so a typo hides a row.

### Common Transitions

| Event | New status |
|---|---|
| Submit confirmed | Applied |
| Recruiter asks for times, info, or an assessment | Action Needed |
| Interview booked | Interview - Scheduled (stays there even if the company also asks you for something; the ask goes in Next Action) |
| You sent a follow-up or thank-you | Follow-up Sent |
| Rejection email | Rejected |
| Interview loop ends with no offer | Closed - No Offer |
| You back out | Withdrawn |
| Posting closes before you apply | Expired (never applied) |

### Referral-Hold Rule

When the round closes, a `Referral - Hold` row resolves one way:
- Applied (the referral fired) and then no response -> `Closed - No Response`. (A rejection email makes it `Rejected` as usual.)
- Never applied (you waited and it closed) -> `Expired (never applied)`.

---

## Cloud Tracker (optional, Google Drive)

**Why:** the morning routine runs in the cloud and cannot reach your local xlsx. A small cloud copy of the live pipeline lets it keep statuses current even when your computer is off.

**Folder:** "JobHunt - Cloud Tracker"

**Live pipeline files:** `JobHunt Live Tracker (YYYY-MM-DD)`: a CSV uploaded and converted to a Google Sheet. Columns (from `Live_Tracker_TEMPLATE.csv`):

`Company, Role, Comp, Status, Date Applied, Last Response, Current State / Action`

Include only Live rows (`Referral - Hold`, `Applied`, `Action Needed`, `Interview - Scheduled`, `Follow-up Sent`). Always carry Comp forward, so the brief can show effort vs pay.

**Ack files:** `JobHunt Ack State (YYYY-MM-DD)` with columns `date,company,disposition,note`. Dispositions: `ignoring`, `handled`, `withdrawn`. The template starts with one `__init__` placeholder row so the file is never empty.

### Why Dated Copies

The Google Drive connector can create and read files but cannot edit an existing file's contents (its update_file only renames or moves). So every change is a NEW dated file, and **the most recently modified file is canonical**. Older files are harmless history. For a same-day rewrite, keep the date and let modification time decide (optionally add a letter: `(YYYY-MM-DDb)`). Readers always pick by modification time, never by name.

### Viewing It as a Google Sheet

1. Open the "JobHunt - Cloud Tracker" folder in Google Drive and sort by "Last modified".
2. Open the top `JobHunt Live Tracker (...)` file. It opens in Google Sheets because it was converted on upload.
3. Bookmark the folder, not a file: the newest file changes with every update.

Do not hand-edit the Sheet. The next write starts from the newest file, so tell Claude the change instead ("handled Tailspin Toys") and it writes a new version.

### First-Time Setup

Create the folder in Drive, then upload `templates/tracker/Live_Tracker_TEMPLATE.csv` and `templates/tracker/Ack_State_TEMPLATE.csv` as the first dated files (converted to Sheets), or ask Claude to do it through the Google Drive connector. Details: [MORNING_ROUTINE.md](MORNING_ROUTINE.md).

---

## Sync Duty

Any local session that reconciles the xlsx ALSO writes a new cloud version:
1. Read the newest `JobHunt Live Tracker (...)`.
2. Apply the same changes (plus anything the routine changed that the xlsx lacks; copy those back into the xlsx too).
3. Drop rows that are now terminal (Rejected, Withdrawn, Closed, Expired, Skip) from the new version; they stay in the xlsx.
4. Create a new dated `JobHunt Live Tracker (<today>)` in the folder.

The morning routine never prunes rows; only local sessions do.

The xlsx keeps closed and historical rows the cloud file omits. That is intended.

## Ack / Mute Protocol

Replying to an email clears the brief's "awaiting your response" nag on its own. Acks are only for things handled outside Gmail, or things you are deliberately leaving alone.

| You say | Meaning | Tracker effect |
|---|---|---|
| "ignoring <company>" | Seen it, choosing not to act; stop nagging | Note in Notes; clear Next Action |
| "handled <company>" | Dealt with outside Gmail (phone, LinkedIn, portal) | Update Last Response Date, Next Action, status if it changed |
| "withdrawn <company>" | You pulled out | Status -> `Withdrawn` |

When you say one, the session:
1. Reads the newest `JobHunt Ack State (...)` and creates a NEW `JobHunt Ack State (<today>)` = the full prior contents + one new row `date,company,disposition,note`.
2. Updates the row in `Applications/Job_Tracker.xlsx`.
3. Writes a new `JobHunt Live Tracker (<today>)` with the same change.

Without the cloud tracker, only step 2 applies.
