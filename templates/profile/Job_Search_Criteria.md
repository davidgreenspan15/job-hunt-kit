# Job Search Criteria (read this on EVERY search pass)

Purpose: the canonical spec for how the agent searches for you. Every search pass (docs/PLAYBOOK.md, Phase 1 Search) reads this first, so rounds stay consistent instead of ad hoc. Built from your resume, Career_Profile.md, Achievement_Bank.md, and your stated goals. Anything marked "(suggested default)" is a starting point: keep it, change it, or delete the tag once you've decided.

## Who you are (search to THIS, not to a narrow keyword)
> Good looks like: 3-5 lines that let the agent recognize a fit even when the title uses different words.

- Core: <FILL: seniority + discipline + primary stack, e.g. "Senior full-stack engineer: TypeScript, React, Node.js, PostgreSQL">
- Operating level: <FILL: evidence of the level you work at today (team size, ownership)>
- Strength that widens the net: <FILL: a specialty that qualifies you for adjacent roles, or "none">
- What you are NOT: <FILL: adjacent work you don't do, so the agent stops surfacing it (e.g. "not an ML researcher")>

## What qualifies (target roles)
> Good looks like: a ranked list of role families, with stretches marked as stretches.

- <FILL: core target, e.g. "Senior / Staff Full-Stack Engineer">
- <FILL: adjacent target, e.g. "Engineering Manager">
- <FILL: specialty target, or delete>
- <FILL: stretch roles (surfaced, not weighted), or delete>
- Generalist roles at strong companies qualify even without your specialty keyword in the title. (suggested default)

## What to SKIP
> Good looks like: short, explicit exclusions. Each skipped role is logged with a one-line reason, not silently dropped.

- <FILL: role types you won't do>
- <FILL: industries or company types you won't work for, or "none">
- Postings with no apply link or a closed requisition. (suggested default)

## Hard gates (checked before any scoring)
A role that fails a gate becomes status Skip with a one-line reason and is never scored. Why: scoring only what you'd actually take keeps the queue honest.

1. Location: matches the Location section below.
2. Role type: not in What to SKIP.
3. Seniority band: <FILL: lowest and highest level you'll accept, e.g. "Senior through Engineering Manager">
4. Not listed in `Applications/DO_NOT_REAPPLY.md` (normalized company key).
5. Posting is fresh (see Freshness).
6. Per-company cap: 1 role per company, max 2, decided before prep; extra roles are logged as "Backup (not prepped)". (suggested default)

## Scoring anchors (Phase 2 Rate and group)
Priority = R x C (1-25). Fit Reason format: "R:{n} C:{n}: reason".

- R = role fit: 5 = exact title + stack + seniority match; 3 = plausible stretch; 1 = barely qualifies. (suggested default)
- C = company desirability: 5 = <FILL: what dream tier means to you>; 3 = solid; 1 = would only take it as a fallback.
- Minimum Priority to prep: <FILL: number> (suggested default: 6)

## Comp
> Good looks like: a target and a rule for how comp affects ranking.

- Target total comp: <FILL: amount, or "no target yet">
- Floor: <FILL: hard floor, or "none: rank toward the target but still surface great companies">
- Note comp on every result; if the posting has no band, note an inferred range and its source (e.g. Levels.fyi). (suggested default)

## Location
- <FILL: e.g. "NYC metro (hybrid OK) + remote-US">
- Max in-office days per week: <FILL: number, or "any">

## Sources (in priority order)
Why a mix: each source misses a different slice of the market. Startup ATS boards alone miss big companies, which post on their own career portals and LinkedIn.

| Priority | Source | Notes |
|---|---|---|
| Primary | Indeed | Broad aggregation; run generalist queries, not only specialty keywords. (suggested default) |
| Primary | Google Jobs | Catches postings the job boards miss. (suggested default) |
| Secondary | Direct company career pages | Required for big companies that don't use Greenhouse, Ashby, or Lever. (suggested default) |
| Secondary | Greenhouse / Ashby / Lever boards | Strong for startups and scale-ups. (suggested default) |
| Secondary | LinkedIn Jobs | Good for discovery; follow through to the company's own apply page. (suggested default) |
| Optional | YC Work at a Startup | Early-stage companies; has a weekly application cap, so spend it on top picks. (suggested default) |

Target companies to always check directly: <FILL: list, or "none">

## Freshness
- Only postings under 2 weeks old. (suggested default)
- Why: older postings are often filled or dead by the time you apply, which wastes the whole prep step.
- Record the posting date (or "unknown") on every result; unknown-date postings rank below dated ones.

## Volume
- Gather every match that clears the gates; the quality bar holds, the count doesn't. (suggested default)
- Applying is paced separately: in waves of about 20 (see docs/PLAYBOOK.md, Phase 4 Apply).

## How to GROUP results (return them sectioned)
1. **Apply-now**: direct-apply roles with no referral norm and no contact. Usually the bulk.
2. **Referral-hold**: large established companies where a referral materially helps. Surfaced separately so you can mark which ones you have a contact at (status "Referral - Hold"); the rest fold into apply-now. Prep them anyway so they're ready either way.
3. **Skip**: failed a hard gate. Logged with a one-line reason, never applied.

## Per-result data to capture (tracker row, then the company folder)
Company, Role, Location, Salary Range (note the source if inferred), Source, Date Posted, Date Found, Apply URL, Priority, Fit Reason ("R:{n} C:{n}: reason"), Suggested resume variant, Bucket. Fields without their own tracker column (Date Posted, Suggested resume variant, Bucket) go in Notes. New rows start at status "New/To Review".

## Dedupe
- Check every result against `Applications/DO_NOT_REAPPLY.md` and every tracker row, whatever its status.
- Compare on a normalized company key: lowercase, strip punctuation, spaces, and legal suffixes (Inc, LLC, Ltd, Corp). Why: "Acme, Inc." and "acme" are the same company.
- Don't re-add a company unless the role genuinely reopened or changed.

## Style
- No em dashes in any employer-facing output. Why: they read as an AI tell. En-dash date ranges (2021–2024) are fine.
