# Handoff Template (standing): real-browser execution batch

Purpose: the reusable skeleton Claude Code fills whenever applications need a REAL, logged-in browser (Tier 2 in `docs/HANDOFF.md`). Claude Code copies this file to `Applications/_handoff/HANDOFF_<YYYY-MM-DD>.md`, fills every `<FILL: ...>` slot, and tells you it is ready. You open a Claude session that drives your normal Chrome through the Claude in Chrome extension and say "run the handoff at <path>". The filled file is self-contained, so nothing needs re-explaining.

Keep this template generic. Never put a company name in the filename: one handoff file per BATCH, not per company.

---

## Fill-in rules for Claude Code (delete this whole block when filling)

- Include every fact the executing agent needs. It has no memory of your Claude Code session.
- Local file paths must be absolute and must already exist. Check each one before writing the handoff.
- Pull identity, contact, and standard answers from `Context/Application_Answers.md` and paste them in literally. Do not link to the file; the executor may not be able to read it.
- Per-role custom answers and essays go inline, verbatim, in quotes. Draft them during prep, not here.
- Run the eligibility gate BEFORE writing: company key vs `Applications/DO_NOT_REAPPLY.md` and every tracker row (any status), the per-company cap, any portal-stated cap, posting still live, and no Referral - Hold roles. Record the result per role below.
- If a role has a REQUIRED field with no truthful answer on file, leave it out of the batch, keep it in the tracker as parked, and tell the user why.
- Never put a password or other credential value in a handoff file. If a portal needs a login, the user's real Chrome is usually already signed in; otherwise the user signs in when prompted.
- If a second batch is needed the same day, name it `HANDOFF_<YYYY-MM-DD>b.md`.

---

# Handoff: <FILL: N> <FILL: task type, e.g. "job applications"> via real-browser control

You are helping <FILL: preferred full name> (legal name: <FILL: legal name>) <FILL: task, e.g. "submit N fully prepped job applications that an automation browser could not submit">. Use your real-browser control of their normal, logged-in Chrome. Do them ONE AT A TIME, in the order listed.

## FIRST, before touching a browser

Ask the user in chat to confirm their legal name is <FILL: legal name>, and wait for the reply.

Why: the name is already on record, but a safety check can refuse to type identity data that came from a file into an external form, since a file could say anything. The user confirming it in chat clears that. Asking now costs ten seconds; discovering it mid-form stalls the whole batch.

## Identity / contact (use literally)

- Preferred name: <FILL: preferred full name> (use for name and first-name fields)
- Legal name: <FILL: legal name> (use ONLY where a field explicitly asks for legal name)
- Pronouns (only if asked, optional): <FILL: from Application_Answers.md, or "leave blank">
- Email: <FILL: email> | Phone: <FILL: phone>
- LinkedIn: <FILL: URL> | GitHub: <FILL: URL> | Portfolio: <FILL: URL, or "none">
- Location: <FILL: city/metro as it appears on the resume>
- Full street address (only if a field requires it): <FILL: address, or "not on file: leave blank or skip the role if required">
- Current employer / title: <FILL: employer, title>
- Education (only if asked): <FILL: school, degree, field, end date exactly as on file>. Do not invent any date or detail that is not on file (for example a start date).
- Projects you may mention: <FILL: names and URLs from Context/Project_Links.md>
- Documented targeting (the only basis for "why us" style answers): <FILL: two or three lines from Context/Job_Search_Criteria.md and Context/Career_Profile.md>

## Standard answers

- Authorized to work in the US: <FILL: answer> | Require sponsorship now or in future: <FILL: answer>
- In-office / hybrid as the role asks: <FILL: answer> | Willing to relocate: <FILL: answer>
- Start date / notice: <FILL: answer> (if a specific date is required, use <FILL: YYYY-MM-DD>)
- Salary expectation: <FILL: default text from Application_Answers.md>. If a number is REQUIRED: <FILL: the rule from Application_Answers.md, e.g. "the upper portion of that posting's own listed band">. Never disclose current salary.
- How did you hear about us: <FILL: default channel>. If that option is not offered, pick the closest truthful option (else "Other"). Never pick a channel the user did not use.
- Voluntary self-ID (EEO): <FILL: answers from Application_Answers.md, or "decline to answer" for each>
- Outside business / conflicts of interest question: <FILL: the disclosure from Application_Answers.md, or "No">. Disclose nothing confidential.
- Acknowledgement / certification boxes: <FILL: "tick them" or "stop and ask the user first">

## Roles in this batch

<!-- Repeat one block per role. -->

### <FILL: n>. <FILL: Company>: <FILL: Role title> (<FILL: comp range, context only>)

- Apply URL: <FILL: URL>
- Resume: <FILL: absolute path to the resume PDF>
- Cover letter: <FILL: absolute path to the cover letter PDF, or "none">
- Custom question(s), answer verbatim:
  - Q: "<FILL: question as shown on the form>"
    A: "<FILL: exact answer to paste>"
- Eligibility gate: <FILL: e.g. "DO_NOT_REAPPLY clear; 1st role at this company this round; within the per-company cap; user approved <YYYY-MM-DD>">
- Portal-stated limits: <FILL: e.g. "portal allows N applications per M days, this is 1", or "none seen">
- Notes: <FILL: anything known about this form: required fields, a login, a captcha at submit; or "none">

## Hard rules

- No em dashes in any free text. Use commas, colons, or parentheses.
- Only mention the projects listed under "Projects you may mention" above. Nothing else.
- **Truthful only.** Never invent metrics, dates, titles, technologies, or the user's opinions.
  - Subjective questions ("why us", "rate our position in X") get only answers traceable to the user's documented targeting pasted in this file. If an honest "N/A" or "not enough information" option exists and nothing on file supports a view, take it and flag it in the report.
  - If a REQUIRED field has no truthful answer, skip that role and report it. Do not guess.
- Optional fields with nothing on file stay BLANK. Blank beats invented.
- If the portal auto-parses the resume into profile fields, review every parsed field against the resume and fix anything it got wrong (invented jobs, wrong degree or major) before certifying.
- Do not start any timed assessment or coding test. Report it with the role's comp instead; the user decides.
- Where you tick an acknowledgement, arbitration, or certification box, **name every binding agreement accepted in the report**, so the user knows what they are bound to.
- Never type a password from this file (there are none). If a login wall appears, ask the user to sign in, then continue.
- If a captcha appears, ask the user to solve it, then continue.

## On a "possible spam" / bot rejection

Retry ONCE. If it fails again, do not force it: mark that role FAILED and move on to the next.

## When done

Report a plain list:

```
SUBMITTED
- <Company>: <Role>. Confirmation: "<verbatim confirmation text>"
FAILED
- <Company>: <Role>. Reason: <what happened, including "rejected as spam twice" or "required field with no truthful answer">
JUDGMENT CALLS
- <Company>: <substituted answers, blank fields, parser corrections, N/A choices>
AGREEMENTS ACCEPTED
- <Company>: <each binding agreement or certification>
PORTAL LIMITS SEEN
- <Company>: <any stated application cap or reapply window>
```

**Do NOT edit any local file.** Claude Code owns `Applications/Job_Tracker.xlsx`, `Applications/DO_NOT_REAPPLY.md`, the Application_Record files, and the cloud tracker. The user pastes this report back into Claude Code, which reconciles everything from it.
