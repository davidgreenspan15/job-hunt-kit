# Preferences

> EXAMPLE: Jordan Rivera is a fictional candidate. This shows Preferences.md after "set me up": suggested defaults kept, every blank answered.

Your rules for the agent, one per line. Edit freely: change a value, delete a line, or add your own. The agent reads this file at the start of every session.

- Lines marked **(suggested default)** are a starting point that worked well in practice. Keep, change, or delete them.
- This file tunes behavior. It can't override `RULES.md` on truthfulness, credentials, privacy, or the dedupe gate.

## Writing style

- DON'T use em dashes in anything employer-facing (resumes, cover letters, recruiter emails): they read as an AI tell. Use commas, colons, or parentheses. En-dash date ranges (2021–2024) are fine. (suggested default)
- Name on all materials: Jordan Rivera. Use a legal name only where a form requires it. (suggested default)
- Tone: direct and warm, specific numbers over adjectives, no buzzwords
- Cover letter length: 4 short paragraphs, about 300 words
- Resume: exactly one page, every project and profile link clickable. (suggested default)
- Spelling: US English

## Search

- Freshness window: postings under 14 days old only. (suggested default) Why: older links are often dead by apply time, which wastes the whole prep.
- Source order: Indeed and Google Jobs first; direct company boards (big-tech career portals, Greenhouse, Ashby, Lever) second; YC Work at a Startup last and optional, since it has an account-wide weekly application cap. (suggested default)
- Target titles: Senior Full-Stack Engineer, Senior Product Engineer, Senior Software Engineer (product), Senior Frontend Engineer; Staff as a stretch
- Seniority band: Senior through Staff
- Locations: NYC metro (hybrid up to 3 days), remote-US
- Role types to skip: ML research, data science, embedded, infrastructure-only SRE with heavy on-call
- Industries to favor or avoid: favor AI products, fintech, health tech, and developer tools; avoid crypto trading, gambling, and ad tech
- Volume per round: no hard cap; the hard gates and the Priority cutoff control volume. (suggested default)
- Priority cutoff: don't prep anything below Priority 6 (R x C). (suggested default)
- Referral candidates (big companies where a referral materially helps): list them separately so you can mark who you know. (suggested default)

## Applying

- Roles per company per round: 1, at most 2, decided before prep. (suggested default)
- Apply wave size: about 20, strongest Priority first. (suggested default)
- Auto-submit clean forms that need no login: yes. (suggested default)
- Portals where you already have an account to reuse: Indeed, LinkedIn, Workday (two company tenants, listed in `Applications/Credentials.md`)
- New accounts: the agent gives you a batch of sign-up links, you create the accounts and add them to `Applications/Credentials.md`, then the agent logs in and applies. (suggested default)
- Forced per-session 2FA portals: skip, or flag for one manual sitting. (suggested default)
- Email one-time codes: the agent may read them from Gmail during an apply. (suggested default)
- Referral-hold roles: prep them, but don't apply until you say so. (suggested default)

## Email

- Sending: draft replies, and send only after you approve that specific email. (suggested default)
- Inbox sweeps after an apply wave: day 3, day 7, then weekly. (suggested default)
- Action list: one list per sweep, capped at 10 hard asks, each with a one-line action and a deadline. (suggested default)
- Follow-up nudges to recruiters: one polite follow-up after 7 business days of silence after an interview; never after a plain application
- Morning brief: on, weekdays at 7:00 am America/New_York. Read-only on Gmail. (suggested default)
- Morning brief repeats every unhandled item daily until you reply or ack it. (suggested default)
- Cloud tracker on Google Drive (lets the morning brief keep the pipeline current while your computer is off): enabled

## Checkpoints (where the agent must stop and ask)

- After Phase 2: show the ranked list and the referral candidates before prep starts. (suggested default)
- After Phase 3: stop when prep is complete; nothing is submitted until you say go. (suggested default)
- After the first apply wave: stop for a flow check. (suggested default)
- Before sending any email (see Email above). (suggested default)
- Before creating any account. (suggested default)
- Before starting or declining any timed assessment. (suggested default)
- Before withdrawing from a process or declining an interview. (suggested default)
- Before applying anywhere that publishes a candidate AI-usage policy: show me the policy and the parts of my application it affects

## Privacy

- Never name these in employer-facing text (projects, employers, clients, anything under NDA): Contoso Payments' unreleased instant-payouts product
- Current employer may / may not be contacted: may not, until an offer stage
- Share your applications with anyone else (a mentor, a friend): never without asking me

## Comp and tradeoffs

- Target total comp: $230K
- Hard floor: none, rank by comp but don't gate on it
- Tie-breaker for equal Priority: comp toward your target first, then posting freshness. (suggested default)
- Show each role's comp in the morning brief so you can weigh effort against pay. (suggested default)
- Remote vs hybrid vs onsite tradeoff: hybrid in NYC is fine; fully onsite only if comp clearly beats the target
- Equity vs cash: prefer cash-heavy offers; value private-company equity at a steep discount
- Work authorization and sponsorship: record the facts in `Context/Application_Answers.md`, not here.
