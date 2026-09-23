# Tips and Lessons Learned

Hard-won lessons from running this process for real, grouped by phase. Each one is already baked into the playbook; this is the why.

## Big Picture

- **Tailored rounds beat mass blasts.** A smaller, curated round with real tailoring converted noticeably better than a high-volume blitz. Volume feels productive; fit is what gets replies.
- **The tracker is the single sink.** Every status change goes into `Applications/Job_Tracker.xlsx`. A pile of snapshot sheets, digests, and side notes drifts out of sync fast, and then nobody knows the real state. The cloud tracker is a mirror of it, not a second truth.
- **Verify before reporting.** "Queued" is not "running", and "running" is not "submitted". A role counts as submitted only with confirmation text or a screenshot. Ask Claude to check before it tells you something is done.
- **Truthful only, blank beats invented.** Never let an agent invent a metric, a date, a title, or your opinion to get past a form field.

## Phase 0: Refresh Profile

- **Refresh before you search.** Stale profile in, stale matches and underselling resumes out.
- **Keep the Achievement Bank in sync with the resume.** If the resume claims it, the bank should back it. Otherwise the next tailoring pass drops or garbles it.
- **Re-render PDFs after every HTML edit.** An edited HTML with an old PDF silently ships the old content. Check that every PDF is newer than its HTML.
- **Keep canonical paths current.** If your docs point at an old resume, an agent following them literally will attach the old resume.
- **Prepare one-line answers for anything an interviewer will ask about** (a gap, a short stint, a pivot) in `Prep/`, rather than editing the resume to hide it.

## Phase 1: Search

- **Keep the freshness rule.** Stale postings are often dead by apply time, and each dead link wastes a full prep. Under 2 weeks old is the default for a reason.
- **Do not defer on capped sources.** YC Work at a Startup has an account-wide weekly cap; roles pushed to "next week" there tend to expire.
- **Dedupe against every row, any status.** Companies you skipped or that expired last round will show up again. Re-adding one needs a note and inherits its reapply clock.

## Phase 2: Rate and Group

- **Gates first, then R x C.** A single "High / Medium / Low" vibe score stops sorting once most rows land on "High". Two anchored axes multiplied together spread the list out.
- **Score at add time.** A separate scoring pass leaves blanks, and unscored rows quietly fall to the bottom (or the top).
- **Let Priority drive the queue.** If you batch by portal type for convenience, you end up applying to low-fit roles while high-fit roles expire.
- **Cap per company before prep, not mid-round.** Decide 1 (max 2) up front. Deciding late means the first batches already went out uncapped.
- **Do not send several applications to one company the same day with near-identical titles.** It reads as spray. Two near-identical intro messages to the same hiring manager is worse. Two roles on genuinely different teams can be fine.
- **Surface referral candidates separately.** A cold application to a company where you have a contact burns the referral.

## Phase 3: Prep

- **Always save the full JD.** Postings vanish. At interview time you will want the salary band, the requirements, and the exact language.
- **One folder per company key.** Two folders for the same company (dotted vs undotted name, for example) look like "prepped, not applied", which is how accidental re-applies happen.
- **Variant swap, not rewrite.** Pick the closest resume variant and swap projects; do not word-craft from scratch per role. Faster, and it keeps your claims consistent.
- **Wide rolling fan-out, with backoff.** Many prep agents in parallel works well, but launching everything at once trips rate limits and ends up slower than a steady stream.
- **Stop before applying.** A quick review of the prepped set catches wrong variants and bad fits cheaply.

## Phase 4: Apply

- **Some sites don't accept automated browsers.** Some portals (Ashby especially) reject submissions from the Playwright browser as "possible spam" no matter how carefully they're filled. Apply to those from your own Chrome with the Claude in Chrome extension instead of retrying.
- **Some blocks are per-company.** One company can still reject real Chrome while others on the same ATS pass minutes later. Retry once, then mark FAILED and move on.
- **Account creation can chain captchas.** In an automation browser some portals serve captcha after captcha. Create those accounts in your normal browser, in one batched sitting.
- **Confirm your identity in chat before a handoff.** A safety check may refuse to type a file-sourced legal name into a form. Confirming it upfront avoids a stall mid-batch.
- **Review auto-parsed profiles.** Some portals parse your resume into profile fields and get it wrong (invented jobs from side projects, the wrong degree or major). Check every parsed field before certifying.
- **Record exactly what you submitted.** Salary numbers, essay text, custom answers. You will be asked about them later, and the form will not show them to you again.
- **Name every agreement you accept.** Arbitration agreements and accuracy certifications are binding; the Application_Record should list them.
- **Pick the "how did you hear about us" channel you actually used.** If it is not offered, choose the closest truthful option or "Other".
- **Legal name only where a field demands it.** Everywhere else, your preferred name.
- **Do not start timed assessments mid-wave.** Surface them with the role's comp and decide case by case; some are worth it, some are not.
- **Record portal-stated caps.** Some portals limit applications per time window or per candidate. Put them in the Application_Record and `DO_NOT_REAPPLY.md`.
- **Update the tracker per submission.** A tracker that stops being updated partway through a round means the round's state is lost.
- **Check the first wave before the rest.** A flow check after the first wave catches systematic mistakes before they repeat across every application.

## Phase 5: Track

- **Reconcile from email regularly.** Statuses go stale fast; a silent "Applied" often hides a rejection or an invite.
- **Resolve every row.** Close out stale leads and held referrals with the referral-hold rule, so the live pipeline stays short and real.

## Phase 6: Respond

- **Interview invites expire.** A missed scheduling email or an unanswered availability ask can cost the best lead of the round. Keep the morning brief running every day; a busy week is when an invite gets missed.
- **Responsiveness pays.** Same-day thank-yous and proactive follow-ups kept interview tracks alive; silence let them lapse.
- **Never auto-decline.** Surface everything; you decide.
- **Verify the sender before you book.** A recruiter can write from a parent company's domain after an acquisition. Confirm the thread maps to your application before clicking a scheduling link.
- **Mail addressed to your legal name is still yours.** Match threads by company, not by greeting.
- **Tell Claude about out-of-band replies.** Phone calls and LinkedIn messages are invisible to Gmail. Say "handled <company>" so the tracker and brief catch up.
- **Done means responded-to, not sent.** The round is over when every Applied row is answered, scheduled, or closed.
