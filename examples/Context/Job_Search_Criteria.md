# Job Search Criteria (read this on EVERY search pass)

> EXAMPLE: Jordan Rivera is a fictional candidate. This shows what the criteria file looks like after "set me up".

Purpose: the canonical spec for how the agent searches for you. Every search pass (docs/PLAYBOOK.md, Phase 1 Search) reads this first, so rounds stay consistent instead of ad hoc. Built from your resume, Career_Profile.md, Achievement_Bank.md, and your stated goals.

## Who you are (search to THIS, not to a narrow keyword)

- Core: Senior full-stack engineer: TypeScript, React, Node.js, PostgreSQL, AWS
- Operating level: leads a 6-engineer product squad (planning, code review, weekly releases); sets team-wide testing standards
- Strength that widens the net: LLM features in production (support triage service on the Claude API), which qualifies Jordan for AI product teams
- What you are NOT: not an ML researcher, not a data scientist, not an embedded or infrastructure-only engineer

## What qualifies (target roles)

- Senior Full-Stack Engineer / Senior Product Engineer
- Senior Software Engineer on product teams (web front end plus API)
- Senior Frontend Engineer at product-led companies
- Stretch (surfaced, not weighted): Staff Software Engineer (product), Tech Lead at companies under 200 people
- Generalist roles at strong companies qualify even without your specialty keyword in the title.

## What to SKIP

- ML research, model training, data science, embedded, infrastructure-only SRE with heavy on-call
- Crypto trading, gambling, and ad-tech companies
- Postings with no apply link or a closed requisition.

## Hard gates (checked before any scoring)
A role that fails a gate becomes status Skip with a one-line reason and is never scored. Why: scoring only what you'd actually take keeps the queue honest.

1. Location: matches the Location section below.
2. Role type: not in What to SKIP.
3. Seniority band: Senior through Staff (no Junior or Mid; Principal only as a stretch)
4. Not listed in `Applications/DO_NOT_REAPPLY.md` (normalized company key).
5. Posting is fresh (see Freshness).
6. Per-company cap: 1 role per company, max 2, decided before prep; extra roles are logged as "Backup (not prepped)".

## Scoring anchors (Phase 2 Rate and group)
Priority = R x C (1-25). Fit Reason format: "R:{n} C:{n}: reason".

- R = role fit: 5 = exact title + stack + seniority match; 3 = plausible stretch; 1 = barely qualifies.
- C = company desirability: 5 = an AI product company or mission-driven product company with comp at or above the $230K target; 3 = solid; 1 = would only take it as a fallback.
- Minimum Priority to prep: 6

## Comp

- Target total comp: $230K
- Floor: none: rank toward the target but still surface great companies
- Note comp on every result; if the posting has no band, note an inferred range and its source (e.g. Levels.fyi).

## Location
- NYC metro (hybrid OK) + remote-US
- Max in-office days per week: 3

## Sources (in priority order)
Why a mix: each source misses a different slice of the market. Startup ATS boards alone miss big companies, which post on their own career portals and LinkedIn.

| Priority | Source | Notes |
|---|---|---|
| Primary | Indeed | Broad aggregation; run generalist queries, not only specialty keywords. |
| Primary | Google Jobs | Catches postings the job boards miss. |
| Secondary | Direct company career pages | Required for big companies that don't use Greenhouse, Ashby, or Lever. |
| Secondary | Greenhouse / Ashby / Lever boards | Strong for startups and scale-ups. |
| Secondary | LinkedIn Jobs | Good for discovery; follow through to the company's own apply page. |
| Optional | YC Work at a Startup | Early-stage companies; has a weekly application cap, so spend it on top picks. |

Target companies to always check directly: Proseware, Tailspin Toys, Adventure Works Cycles

## Freshness
- Only postings under 2 weeks old.
- Why: older postings are often filled or dead by the time you apply, which wastes the whole prep step.
- Record the posting date (or "unknown") on every result; unknown-date postings rank below dated ones.

## Volume
- Gather every match that clears the gates; the quality bar holds, the count doesn't.
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
