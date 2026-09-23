# Preferences

Your rules for the agent, one per line. Edit freely: change a value, delete a line, or add your own. The agent reads this file at the start of every session.

- Lines marked **(suggested default)** are a starting point that worked well in practice. Keep, change, or delete them.
- Anything with `<FILL: ...>` is yours to answer. During "set me up" the agent walks you through these.
- This file tunes behavior. It can't override `RULES.md` on truthfulness, credentials, privacy, or the dedupe gate.

## Writing style

- DON'T use em dashes in anything employer-facing (resumes, cover letters, recruiter emails): they read as an AI tell. Use commas, colons, or parentheses. En-dash date ranges (2021–2024) are fine. (core rule in RULES.md; kept here so you see it)
- Name on all materials: <FILL: the name you go by>. Use a legal name only where a form requires it. (suggested default)
- Tone: <FILL: e.g. direct and warm, no buzzwords>
- Cover letter length: <FILL: e.g. 3 to 4 short paragraphs, well under one page>
- Resume: exactly one page, every project and profile link clickable. (suggested default)
- Spelling: <FILL: e.g. US English>

## Search

- Freshness window: postings under 14 days old only. (suggested default) Why: older links are often dead by apply time, which wastes the whole prep.
- Source order: Indeed and Google Jobs first; direct company boards (big-tech career portals, Greenhouse, Ashby, Lever) second; YC Work at a Startup last and optional, since it has an account-wide weekly application cap. (suggested default)
- Target titles: <FILL: e.g. Senior Software Engineer, Staff Engineer, Engineering Manager>
- Seniority band: <FILL: e.g. Senior through Staff>
- Locations: <FILL: e.g. your metro, hybrid in your metro, remote in your country>
- Role types to skip: <FILL: e.g. pure ML research, embedded, on-call-only SRE>
- Industries to favor or avoid: <FILL:>
- Volume per round: no hard cap; the hard gates and the Priority cutoff control volume. (suggested default)
- Priority cutoff: don't prep anything below Priority 6 (R x C). (suggested default)
- Referral candidates (big companies where a referral materially helps): list them separately so you can mark who you know. (suggested default)

## Applying

- Roles per company per round: 1, at most 2, decided before prep. (suggested default)
- Apply wave size: about 20, strongest Priority first. (suggested default)
- Auto-submit clean forms that need no login: yes. (suggested default)
- Portals where you already have an account to reuse: <FILL: e.g. Indeed, Workday, YC Work at a Startup>
- New accounts: the agent gives you a batch of sign-up links, you create the accounts and add them to `Applications/Credentials.md`, then the agent logs in and applies. (suggested default)
- Forced per-session 2FA portals: skip, or flag for one manual sitting. (suggested default)
- Email one-time codes: the agent may read them from Gmail during an apply. (suggested default)
- Referral-hold roles: prep them, but don't apply until you say so. (suggested default)

## Email

- Sending: draft replies, and send only after you approve that specific email. (suggested default) Other options: drafts only (you send everything yourself), or send routine replies (scheduling confirmations, thank-yous) without asking.
- Inbox sweeps after an apply wave: day 3, day 7, then weekly. (suggested default)
- Action list: one list per sweep, capped at 10 hard asks, each with a one-line action and a deadline. (suggested default)
- Follow-up nudges to recruiters: <FILL: e.g. one polite follow-up after 7 business days of silence after an interview>
- Morning brief: <FILL: on or off, and the time and timezone you want it>. Read-only on Gmail. (suggested default)
- Morning brief repeats every unhandled item daily until you reply or ack it. (suggested default)
- Cloud tracker on Google Drive (lets the morning brief keep the pipeline current while your computer is off): <FILL: enabled or disabled>

## Checkpoints (where the agent must stop and ask)

- After Phase 2: show the ranked list and the referral candidates before prep starts. (suggested default)
- After Phase 3: stop when prep is complete; nothing is submitted until you say go. (suggested default)
- After the first apply wave: stop for a flow check. (suggested default)
- Before sending any email (see Email above). (suggested default)
- Before creating any account. (suggested default)
- Before starting or declining any timed assessment. (suggested default)
- Before withdrawing from a process or declining an interview. (suggested default)
- Add your own: <FILL: e.g. before applying to any company over 10,000 people>

## Privacy

- Never name these in employer-facing text (projects, employers, clients, anything under NDA): <FILL: e.g. a side project you have not made public>
- Current employer may / may not be contacted: <FILL:>
- Share your applications with anyone else (a mentor, a friend): <FILL: e.g. never without asking me>

## Comp and tradeoffs

- Target total comp: <FILL:>
- Hard floor: <FILL: a number, or "none, rank by comp but don't gate on it">
- Tie-breaker for equal Priority: comp toward your target first, then posting freshness. (suggested default)
- Show each role's comp in the morning brief so you can weigh effort against pay. (suggested default)
- Remote vs hybrid vs onsite tradeoff: <FILL: e.g. hybrid only if comp beats remote by a clear margin>
- Equity vs cash: <FILL:>
- Work authorization and sponsorship: record the facts in `Context/Application_Answers.md`, not here.
