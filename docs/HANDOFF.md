# Apply Tiers and the Real-Browser Handoff

Claude Code submits most applications itself. A few portals block automated browsers, and a few steps need a human. This doc says who does what, and how work moves between them.

## The Three Tiers

| Tier | Who drives | Use it for | Default? |
|---|---|---|---|
| 1 | Claude Code, driving a browser itself (Playwright MCP) | Clean forms: most Greenhouse, Lever, and company-site forms; Workday or Indeed with stored logins | Yes, the bulk |
| 2 | A Claude session driving YOUR real, logged-in Chrome via the Claude in Chrome extension, run from a handoff file | Portals that reject automation (Ashby especially), anything needing your real signed-in browser | Yes, for bot-blocked work |
| 3 | You, by hand | Captchas, account creation that chains captchas, per-company blocks that survive a retry in real Chrome, forced per-session 2FA | Last resort only |

Rule of thumb: go to Tier 2 before Tier 3. Handing yourself a stack of forms to type is wasted effort when real Chrome would pass.

### Tier 1: Claude Code drives the browser

Claude fills and submits through Playwright MCP, writes the Application_Record, saves the screenshot, and updates the tracker. It pauses and pings you for a captcha or login wall, then continues.

### Tier 2: real-browser handoff

**Why it exists:** some application sites (Ashby especially) don't accept submissions from automated test browsers like Playwright, and reject them as "possible spam" even when every field is right. Retrying there doesn't help.

For those, you apply from **your own Chrome**, with Claude assisting through the **Claude in Chrome extension**, the way you'd apply yourself. Claude Code's Playwright browser can't do this, so it writes a handoff file and you run it in a Claude session connected to the extension. Executors, in order of confidence: a Cowork session with the extension installed (the validated path), then a separate `claude --chrome` session. Plain Claude Desktop chat is untested. The session must be able to read your local files to upload the resume PDFs; if a file-upload dialog won't take the path, pick the file yourself when it asks.

Why a separate session instead of switching Claude Code to Chrome: the extension only connects to a session started with `claude --chrome`, and Tier 1 stays in Playwright so your everyday browser isn't taken over for the bulk of applies.

Blocks are sometimes per-company: a specific company can still reject real Chrome while other forms on the same ATS pass minutes apart. That role then goes to Tier 3 (or you contact the company directly).

### Tier 3: your hands

Keep this list as short as the evidence allows:
- Captchas (drag puzzles, image grids). Claude fills everything else and hands you the last step.
- Account creation that chains captchas in an automation browser: create the account in your normal browser, store the login, and Claude continues (see [ACCOUNTS_AND_CREDENTIALS.md](ACCOUNTS_AND_CREDENTIALS.md)).
- A per-company block that survives the retry in real Chrome.
- Forced per-session 2FA (a device code on every login). Skip those or do them one-off.

---

## The Batch Handoff Mechanism

1. **Gate first.** Before writing anything, Claude Code runs the eligibility gate per role: company key vs `Applications/DO_NOT_REAPPLY.md` and every tracker row (any status), the per-company cap, any portal-stated cap, posting still live, and no `Referral - Hold` roles. The result goes into the file per role, so the executor never has to re-decide eligibility.
2. **Write one file per batch.** Claude Code copies `Applications/_handoff/HANDOFF_TEMPLATE.md` to `Applications/_handoff/HANDOFF_<YYYY-MM-DD>.md` and fills every slot: identity and standard answers pasted literally from `Context/Application_Answers.md`, absolute paths to each resume and cover letter (checked to exist), verbatim custom answers. **Never company-named.** Why: the template is the standing artifact and the dated file is one run of it; company-named files multiply and blur what ran when. A second batch the same day is `HANDOFF_<YYYY-MM-DD>b.md`.
3. **You run it.** Open a Claude session connected to the Claude in Chrome extension, in your normal Chrome, and say "run the handoff at `<path to the file>`". The file is self-contained: the executor needs no other context.
4. **The executor reports, and never edits local files.** It returns SUBMITTED (with confirmation text), FAILED (with reason), judgment calls, agreements accepted, and any portal limits it saw.
5. **Claude Code reconciles.** Paste the report into Claude Code and say "reconcile the handoff report". It updates the Application_Records, `Applications/Job_Tracker.xlsx`, `Applications/DO_NOT_REAPPLY.md`, and the cloud tracker (sync duty), then adds an "EXECUTED <date>: results" header to the handoff file.

**Division of labor:** Claude Code owns local files, the trackers, reconciliation, and writing handoffs. The real-Chrome session only executes in the browser.

## Identity Confirmation Comes First

A safety check can refuse to type identity data (your legal name, for example) that came from a file into an external form, because a file could say anything. Your data is not missing; the check simply wants it from you. So every handoff opens by asking you to confirm your legal name in chat before any browser work. Ten seconds upfront beats a stall mid-form.

Legal name goes only where a field explicitly asks for legal name; everything else gets your preferred name.

## Retry Once

On a "possible spam" or bot rejection: retry ONCE. If it fails again, do not force it. Mark the role FAILED and move on. Why: repeated attempts rarely change the result; they only burn time, and a spammy-looking string of submits is not a good first impression.

## Hard Rules the Handoff Carries

Truthful answers only; blank beats invented; no em dashes in free text; no timed assessments (report them with comp); review any auto-parsed profile fields before certifying; name every binding agreement accepted. The full list lives in the template.

## Commands

| You say | What happens |
|---|---|
| "write a handoff for the blocked roles" | Claude Code gates the roles and writes `HANDOFF_<YYYY-MM-DD>.md` |
| "run the handoff at <path>" (in the real-Chrome session) | The executor confirms your legal name, then submits one at a time |
| "reconcile the handoff report" (back in Claude Code, report pasted) | Trackers, records, and DO_NOT_REAPPLY updated |
