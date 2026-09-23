# Playbook: the repeatable job-hunt round

This is the process. Your content (resume, criteria, target comp) changes round to round; these phases stay the same. Once you are set up, you never re-explain the steps: you say "run Phase N per the playbook" and Claude does it.

First time? Say **"set me up"** (see [SETUP.md](SETUP.md)). Nothing below works well until `Context/` is filled in.

## At a Glance

| Phase | What happens | You say | Ends with |
|---|---|---|---|
| 0 Refresh profile | Update profile, achievements, criteria, resume | "run Phase 0 per the playbook" | Current `Context/` + `Resumes/Final/` |
| 1 Search | Find fresh postings that match your criteria | "run Phase 1 per the playbook" | New rows in the tracker |
| 2 Rate and group | Gate, score, bucket, cap per company | "run Phase 2 per the playbook" | A ranked list, surfaced to you |
| 3 Prep | Freeze JD, tailor resume + cover letter per role | "run Phase 3 per the playbook" | Full folders, then STOP |
| 4 Apply | Submit in waves after your go | "go: run Phase 4 per the playbook" | Application_Records + tracker updates |
| 5 Track | Keep the tracker (and cloud copy) true | "run Phase 5 per the playbook" | A reconciled tracker |
| 6 Respond | Read replies, draft responses, move statuses | "run Phase 6 per the playbook" | Every Applied row answered or closed |

Shortcut: **"run a job hunt round"** (or "run the job hunt per the playbook") runs Phases 0 through 3, pausing after Phase 2 for your picks, and stops before applying.

Rules that apply in every phase live in [../RULES.md](../RULES.md) (truthful only, no em dashes in employer-facing text, privacy, credentials).

---

## Phase 0: Refresh profile

**Why:** search and tailoring both read your profile. A stale profile gives stale results and resumes that undersell you.

**Inputs:** `Context/Career_Profile.md`, `Context/Achievement_Bank.md`, `Context/Job_Search_Criteria.md`, `Context/Preferences.md`, `Resumes/Final/`.

**Steps:**
1. Tell Claude what changed since last round: new role or title, shipped projects, new wins with numbers, new skills, comp target, locations, seniority band.
2. Claude updates `Career_Profile.md` and `Achievement_Bank.md`. Every resume claim should trace back to a line in the bank. Why: tailoring pulls from the bank, and anything missing there gets lost or drifts.
3. Claude confirms `Job_Search_Criteria.md`: target titles, seniority band, locations, comp target, source priority, anything you will not do.
4. If your experience changed materially, Claude updates the canonical resume in `Resumes/Final/` per [RESUME_GUIDE.md](RESUME_GUIDE.md): exactly 1 page, links preserved, PDF re-rendered with `scripts/pdf.sh`, prior version moved to `Resumes/Archive/`.
5. Re-render every variant PDF you touched. Why: an edited HTML with an old PDF silently ships old content.

**Outputs:** current `Context/*` and a current `Resumes/Final/` (HTML + 1-page PDF).

**Say:** "run Phase 0 per the playbook"

---

## Phase 1: Search

**Why:** build a fresh list of roles that actually match what you want, without re-adding companies you already applied to.

**Inputs:** `Context/Job_Search_Criteria.md`, `Applications/Job_Tracker.xlsx`, `Applications/DO_NOT_REAPPLY.md`.

**Steps:**
1. Read `Job_Search_Criteria.md` first and search against it, in the source priority order set there (for example: Indeed, Google Jobs, company boards on Greenhouse / Ashby / Lever, LinkedIn, YC Work at a Startup).
   - YC Work at a Startup has an account-wide weekly application cap, so roles deferred there tend to expire. Use it deliberately or last.
2. **Freshness rule: only postings under 2 weeks old** (change the window in `Job_Search_Criteria.md` if you must). Why: stale postings are often dead by apply time, and every dead link wastes a full prep.
3. **Dedupe at add time** against ALL tracker rows (any status) and `DO_NOT_REAPPLY.md`, using the normalized company key (defined in `DO_NOT_REAPPLY.md`). Re-adding a prior company needs a note, and it inherits that company's reapply clock.
4. For each role capture: Company, Role, Location, Salary Range, Source, Date Found, Apply URL, posting date, a fit note, and a suggested resume variant. Status: `New/To Review`.
5. Save raw results to `Research/<YYYY-MM-DD>-search/` so the round is reproducible.

**Outputs:** new `New/To Review` rows in the tracker; a dated `Research/` folder.

**Say:** "run Phase 1 per the playbook"

---

## Phase 2: Rate and group

**Why:** decide what is worth prepping BEFORE spending effort on it, and make the queue order mean something.

**Inputs:** the new tracker rows, `Job_Search_Criteria.md`, `DO_NOT_REAPPLY.md`.

**Steps:**
1. **Hard gates first.** Fail any gate and the row becomes `Skip` with a one-line reason. A gated row is never scored.
   1. Location matches your criteria (for example your metro, hybrid in your metro, or remote in your country).
   2. Role type matches (list excluded role types in your criteria).
   3. Seniority is inside your band.
   4. `DO_NOT_REAPPLY.md` check by company key.
   5. Freshness: posted under 2 weeks ago (the Phase 1 rule, re-checked here with the posting date).
   6. Per-company cap (step 5 below).
2. **Score survivors on two anchored 1-5 axes, at add time**, by whoever added the row (no separate scoring pass, so no blank scores):
   - **R = role fit.** 5 = exact title, stack, and seniority match. 3 = plausible stretch. 1 = barely qualifies.
   - **C = company desirability.** 5 = dream tier with a comp path to the target in `Job_Search_Criteria.md`. 3 = solid. 1 = would rather not.
3. **Priority = R x C (1-25)** in its own column. Queue strictly by Priority, highest first; break ties by comp toward your target, then posting freshness. By default nothing below Priority 6 gets prepped. Fit Reason format is self-auditing: `R:{n} C:{n}: reason`.
4. **Group into three buckets:**
   - **Apply-now:** the bulk. Companies where a referral is not the norm or you have no contact.
   - **Referral candidates:** large established companies where a referral materially helps. Claude lists these SEPARATELY for you. You mark the ones where you have a contact; those become `Referral - Hold`. The rest fold into apply-now.
   - **Skip:** failed a gate or out of scope, with the reason recorded.
5. **Cap roles per company BEFORE prep.** Usually 1 role, at most 2 (for example one senior IC role plus one lead or manager role, only if both genuinely fit). A company with five listings does not get five applications. Extra roles are logged as `Backup (not prepped)`. Why: deciding this up front prevents same-day multi-role sprays.
6. **Surface the grouped list** (apply-now by Priority, referral candidates separately, backups, skips) and wait for your edits.

**Outputs:** every row has a Status, Priority, and Fit Reason; your referral marks recorded.

**Say:** "run Phase 2 per the playbook"

---

## Phase 3: Prep

**Why:** build everything before applying, so applying is fast and consistent and you review materials before anything goes out.

**Inputs:** selected rows (apply-now and `Referral - Hold`), `Context/*`, `Resumes/Final/`, [RESUME_GUIDE.md](RESUME_GUIDE.md), `Applications/_Template/`.

**Steps (per selected role):**
1. Find or create `Applications/<Company>/`. Check existing folders by company key first. Why: two folders for one company look like "prepped, not applied" and invite a re-apply.
2. Fetch the posting, confirm it is live, and **freeze the full JD** verbatim into `Job_Description_<RoleSlug>.md` (from `Applications/_Template/Job_Description.md`). Why: postings vanish, and you will want the salary and requirements at interview time.
3. Tailor the resume per [RESUME_GUIDE.md](RESUME_GUIDE.md): copy the Final into `Resumes/Drafts/`, apply the suggested variant (a swap, not a rewrite), render with `scripts/pdf.sh`, confirm **exactly 1 page**, then copy the HTML and PDF into the company folder as `<First>_<Last>_Resume_<Company>_<RoleSlug>.html` + `.pdf`.
4. Write the cover letter the same way: `<First>_<Last>_CoverLetter_<Company>_<RoleSlug>.html` + `.pdf`.
5. Write `Prep_Record_<RoleSlug>.md`: variant and why, projects swapped, fit notes, gate results, open questions.
6. Update the tracker row: Folder, Resume File, Cover Letter File.
7. If a selected role has expired, mark it `Expired (never applied)` and promote a backup: build its materials now.

Multiple roles at one company share the folder, with different RoleSlugs.

**Parallel fan-out:** run prep as a wide, rolling fan-out, one agent per role. Keep a steady number in flight and start a new one as each finishes. Push concurrency up while it runs smoothly and back off when you hit rate limits or throttling. Never launch every role at once: a rate-limit jam is slower than a steady stream.

**STOP.** When prep is complete, Claude surfaces a table of prepped roles by Priority plus every open question, and does not apply.

**Outputs:** one complete folder per selected role; tracker rows point at the files.

**Say:** "run Phase 3 per the playbook"

---

## Phase 4: Apply (only after your explicit go)

**Why:** submit the prepped roles, strongest first, without duplicates, and keep an exact record of what was sent.

**Inputs:** prepped apply-now rows, `Context/Application_Answers.md`, `Applications/Credentials.md`, `Applications/DO_NOT_REAPPLY.md`, [HANDOFF.md](HANDOFF.md), [ACCOUNTS_AND_CREDENTIALS.md](ACCOUNTS_AND_CREDENTIALS.md).

**Steps:**
1. **Apply-now pile only.** Never apply to `Referral - Hold` rows until you tell Claude the referral is in. Why: a cold application burns the referral.
2. Order strictly by Priority, highest first.
3. **Submit-time dedupe gate before EVERY submit:** compute the company key and check it against `DO_NOT_REAPPLY.md` and all tracker rows regardless of status, plus any portal-stated cap. Any hit blocks the submit and gets logged in that row's Notes.
4. Pick the apply tier per [HANDOFF.md](HANDOFF.md): Tier 1 Claude drives the browser, Tier 2 real-Chrome handoff, Tier 3 your hands.
5. **Apply in waves of about 20.** Why: browser automation does not parallelize like prep, and captchas gate it.
6. **Human in the loop:** on a captcha, Cloudflare check, or login wall, Claude pauses and pings you. You clear it; Claude continues.
7. Answer from `Context/Application_Answers.md` only. Truthful only; an optional field with nothing on file stays blank. Never start a timed assessment; surface it with the role's comp.
8. Per submission:
   - Write `Application_Record_<RoleSlug>.md` (from the template): every answer, custom question, essay, file, agreement, and the confirmation.
   - Save the confirmation screenshot as `applied_<RoleSlug>.png`.
   - Tracker: Status `Applied`, Date Applied. Add the company to `DO_NOT_REAPPLY.md`.
9. **Surface after the FIRST wave** for a flow check (folders, records, and tracker rows look right), then continue with the remaining waves.
10. Report honestly: a role counts as submitted only with confirmation text or a screenshot. Queued is not submitted.

**Outputs:** Application_Records, screenshots, updated tracker and `DO_NOT_REAPPLY.md`, and a handoff file for anything that needs Tier 2.

**Say:** "go: run Phase 4 per the playbook" (or "apply wave 2")

---

## Phase 5: Track

**Why:** the tracker is the only place state lives. If it drifts, you miss follow-ups and re-apply by accident.

**Inputs:** `Applications/Job_Tracker.xlsx`, the Application_Records, Gmail, and the cloud tracker if you use one.

**Steps:**
1. Keep one row per role; the company folder holds the full record. Columns and statuses: [TRACKER.md](TRACKER.md).
2. Update the tracker at every event, not at the end of the round.
3. Apply the referral-hold rule when a round closes: applied and then no response -> `Closed - No Response`; never applied -> `Expired (never applied)`.
4. Re-verify stale `New/To Review` and `Backup (not prepped)` rows; mark dead postings `Expired (never applied)`.
5. **Sync duty:** whenever you reconcile the xlsx, also write a new cloud tracker version (if you use one). See [TRACKER.md](TRACKER.md).

**Outputs:** a tracker that matches reality, local and cloud.

**Say:** "run Phase 5 per the playbook" or "reconcile the tracker"

---

## Phase 6: Respond

**Why:** applying without listening loses interviews. Invites expire, and a silent week can cost the best lead of the round.

**Inputs:** Gmail, the tracker, the morning brief ([MORNING_ROUTINE.md](MORNING_ROUTINE.md)).

**Steps:**
1. The morning routine briefs you daily (read-only): new responses, a repeating "awaiting your response" list, upcoming interviews.
2. Interactive sweeps at **day 3, day 7, then weekly** after each apply wave: match Gmail threads to tracker rows by company key and apply the status change (see the transitions in [TRACKER.md](TRACKER.md)).
3. Anything needing a human reply goes on ONE action list, capped at about 10 hard asks, each with a one-line action and a deadline. Everything else stays in the tracker.
4. Claude drafts replies; it sends only after you approve that specific email (loosen this in `Context/Preferences.md` if you want).
5. Never auto-decline anything. Surface assessments and take-homes with the role's comp, and decide case by case.
6. Out-of-band handling (a phone call, a LinkedIn message, "I am ignoring this one"): tell Claude "ignoring <company>", "handled <company>", or "withdrawn <company>" (the ack protocol in [TRACKER.md](TRACKER.md)).
7. **Done means responded-to, not sent.** The round is complete when every `Applied` row reaches a terminal or scheduled state.

**Outputs:** statuses moved, replies drafted or sent with your OK, an action list with deadlines.

**Say:** "run Phase 6 per the playbook" or "what do I owe people?"

---

## What Changes vs What Stays

- **Changes per round:** resume content, the listings, comp target, maybe source emphasis. Update `Context/`.
- **Stays:** these phases, the folder and record convention, gates plus R x C, the per-company cap, the dedupe gate, and the rules in [../RULES.md](../RULES.md).

More lessons: [TIPS.md](TIPS.md).
