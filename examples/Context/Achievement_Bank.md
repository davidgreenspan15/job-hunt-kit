# Achievement Bank

> EXAMPLE: Jordan Rivera is a fictional candidate. Every employer, project, and number here is invented to show the shape of a filled-in bank.

Last updated: 2026-09-23
Status: source bullets for resumes, cover letters, and networking intros.

This is the bank, not the resume: write more than will ever fit, and every resume variant picks from here. Only facts go in; the resume can polish wording but never invent. Tag any number you haven't confirmed with `(verify)` so it stays off resumes until you do.

## Current Focus / Signature Work (2024 – Present)

- Built and own an LLM-assisted support triage service at Contoso Payments that classifies merchant tickets, pulls account context, and drafts replies for a support agent to review and send
- Node.js service on the Claude API with tool calling (account lookup, payout status, dispute status); every drafted reply is human-reviewed before it goes out
- 60 support agents use it daily; median first-response time fell 31%
- Built a 200-ticket evaluation set, re-run on every prompt or model change, so quality regressions show up before release

## Contoso Payments (Senior Software Engineer, March 2022 – Present)

- Lead a 6-engineer squad that owns the Merchant Dashboard (React, TypeScript, Node.js), used by 40,000+ small-business merchants; run sprint planning, code review, and weekly releases
- Designed an event-driven payout notification pipeline (AWS SQS, Lambda, PostgreSQL) that replaced a nightly batch job, so merchants see payout status within a minute instead of the next day
- Led the redesign of the dispute (chargeback) response flow, cutting average merchant response time from 6 days to 2 and raising the dispute win rate by 12 percentage points
- Shipped a guided evidence checklist that assembles the card network's required documents automatically
- Ran 3 rounds of merchant interviews with Risk and Design to define the flow before writing code (the dispute flow)
- Cut dashboard p75 load time from 3.8s to 1.6s with route-level code splitting and query caching
- Raised the dashboard's Lighthouse accessibility score from 71 to 98 (keyboard navigation, focus states, contrast, screen-reader labels)
- Merged resume version of the two bullets above: Cut dashboard p75 load time from 3.8s to 1.6s with route-level code splitting and query caching, and raised the Lighthouse accessibility score from 71 to 98
- Set the frontend testing standard (Jest, Playwright, visual regression) now used by 4 teams; production UI incidents fell by half over two quarters
- Mentor two mid-level engineers through design reviews and pairing; both now lead features end to end

## Contoso Payments (Software Engineer, June 2020 – February 2022)

- Built the self-serve merchant onboarding flow, cutting signup to first payment from 5 days to 1 for most merchants
- Replaced an email-and-PDF identity check with in-app verification and bank linking
- Onboarding completion rose from 58% to 81%
- Led the dashboard's migration from JavaScript to TypeScript (about 180,000 lines) in incremental releases with no customer-facing incidents

## Fabrikam Health (Software Engineer, July 2017 – May 2020)

- Built appointment scheduling and reminder features for a patient portal used by 300+ clinics (React, Python with Django, PostgreSQL)
- Automated insurance eligibility checks with a Python service, cutting front-desk verification calls by 40%
- Added audit logging for patient-record access (Python, PostgreSQL) that closed the portal's findings from the company's first HIPAA security review

## Side Projects (Sole Creator / Developer)

### Pantry Planner
- Tech: Next.js, TypeScript, Node.js, PostgreSQL, Claude API
- Link: https://example.com/pantry-planner
- Status: live (January 2024 – Present), about 1,200 monthly active users
- General (1 bullet): Built a meal-planning web app (Next.js, PostgreSQL) that turns what's in your pantry into a week of recipes and one grocery list; about 1,200 monthly active users.
- Featured (2 bullets): Built a meal-planning web app (Next.js, PostgreSQL) that turns what's in your pantry into a week of recipes and one grocery list; about 1,200 monthly active users. / Designed the recipe matching engine (PostgreSQL full-text search plus ingredient substitution rules) that ranks recipes by what you already have; plans load in under 2 seconds.
- Angle, AI: Added an AI plan generator on the Claude API with structured JSON output, validated against allergy and diet rules before display; a 150-case eval set runs on every prompt change.

### TrailLog
- Tech: React Native, Expo, TypeScript, SQLite, AWS
- Link: https://example.com/traillog
- Status: live on iOS and Android (May 2023 – Present), about 3,000 downloads
- General (1 bullet): Built a hiking log app (React Native, Expo) with offline GPS tracks and trail notes that sync when signal returns; live on iOS and Android, about 3,000 downloads.
- Featured (2 bullets): Built a hiking log mobile app (React Native, Expo) with offline GPS track recording and trail notes; live on iOS and Android, about 3,000 downloads. / Designed offline-first sync (SQLite on device, merge on a Node.js API on AWS) so hikes recorded without signal upload cleanly later.
- Angle, mobile: lead with the offline-first sync bullet.

## Resume Variants by Job Type

| Job type | Projects to feature | Lead with (bullets) | Skills to front-load |
|---|---|---|---|
| Product / full-stack SaaS | Pantry Planner (featured), TrailLog (featured) | Squad lead, disputes redesign, payout pipeline | TypeScript, React, Node.js, PostgreSQL |
| AI application / AI company | Pantry Planner (AI angle), TrailLog (general, 1 bullet) | Squad lead, LLM support triage, disputes redesign | React, TypeScript, Node.js, LLM APIs |
| Fintech / payments | Pantry Planner (general), TrailLog (featured) | Disputes redesign, payout pipeline, onboarding | TypeScript, Node.js, PostgreSQL, AWS |
| Frontend | Pantry Planner (featured), TrailLog (featured) | Performance and accessibility, testing standard | React, TypeScript, Next.js, Playwright |
| Health tech | Pantry Planner (general), TrailLog (general) | Fabrikam Health bullets (full version), onboarding | React, Python, PostgreSQL |

## Current-Role Bullet Priority (trim from the bottom)

| # | Bullet theme | Marker |
|---|---|---|
| 1 | Squad lead, Merchant Dashboard scope | [KEEP ALWAYS] |
| 2 | LLM support triage service (differentiator) | [KEEP ALWAYS] |
| 3 | Payout notification pipeline (architecture) | [KEEP ALWAYS] |
| 4 | Disputes redesign (biggest business result, with 2 sub-bullets) | [KEEP ALWAYS] |
| 5 | Performance and accessibility | [TRIM SECOND] |
| 6 | Frontend testing standard | [TRIM FIRST] |
| 7 | Mentoring two mid-level engineers | [TRIM FIRST] |

## Leadership and Collaboration Angles

- Sets standards for the team, not just personal output (testing standard adopted by 4 teams)
- Talks to users before building: ran merchant interviews with Risk and Design for the disputes flow
- Mentors: two mid-level engineers now lead features end to end (design reviews and pairing)
- Ships AI carefully: human review on every drafted reply, and an eval set that gates releases

## Data Needed For Stronger Future Drafts

- Pantry Planner week-4 retention (verify): check the analytics dashboard
- Support triage: agent hours saved per week (verify): ask the Support Ops lead for the Q3 numbers

## Approved Final-Resume Wording

- Senior Software Engineer, Contoso Payments: "Lead a 6-engineer squad that owns the Merchant Dashboard (React, TypeScript, Node.js), used by 40,000+ small-business merchants; run sprint planning, code review, and weekly releases."
- Senior Software Engineer, Contoso Payments: "Built and own an LLM-assisted support triage service (Node.js, Claude API with tool calling) that classifies merchant tickets, pulls account context, and drafts replies for agent review; 60 support agents use it daily and median first-response time fell 31%."
- Senior Software Engineer, Contoso Payments: "Designed an event-driven payout notification pipeline (AWS SQS, Lambda, PostgreSQL) that replaced a nightly batch job, so merchants see payout status within a minute instead of the next day."
- Senior Software Engineer, Contoso Payments: "Led the redesign of the dispute (chargeback) response flow, cutting average merchant response time from 6 days to 2 and raising the dispute win rate by 12 percentage points."
- Senior Software Engineer, Contoso Payments: "Cut dashboard p75 load time from 3.8s to 1.6s with route-level code splitting and query caching, and raised the Lighthouse accessibility score from 71 to 98."
- Senior Software Engineer, Contoso Payments: "Set the frontend testing standard (Jest, Playwright, visual regression) now used by 4 teams; production UI incidents fell by half over two quarters."
- Senior Software Engineer, Contoso Payments: "Mentor two mid-level engineers through design reviews and pairing; both now lead features end to end."
- Software Engineer, Contoso Payments: "Built the self-serve merchant onboarding flow, cutting signup to first payment from 5 days to 1 for most merchants."
- Software Engineer, Contoso Payments: "Led the dashboard's migration from JavaScript to TypeScript (about 180,000 lines) in incremental releases with no customer-facing incidents."
- Software Engineer, Fabrikam Health: "Built appointment scheduling and reminder features for a patient portal used by 300+ clinics."
- Software Engineer, Fabrikam Health: "Automated insurance eligibility checks with a Python service, cutting front-desk verification calls by 40%."
- Software Engineer, Fabrikam Health: "Added audit logging for patient-record access (Python, PostgreSQL) that closed the portal's findings from the company's first HIPAA security review."
- Pantry Planner: "Built a meal-planning web app (Next.js, PostgreSQL) that turns what's in your pantry into a week of recipes and one grocery list; about 1,200 monthly active users."
- Pantry Planner: "Designed the recipe matching engine (PostgreSQL full-text search plus ingredient substitution rules) that ranks recipes by what you already have; plans load in under 2 seconds."
- TrailLog: "Built a hiking log mobile app (React Native, Expo) with offline GPS track recording and trail notes; live on iOS and Android, about 3,000 downloads."
- TrailLog: "Designed offline-first sync (SQLite on device, merge on a Node.js API on AWS) so hikes recorded without signal upload cleanly later."
