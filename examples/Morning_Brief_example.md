# Morning Brief: sample output

> EXAMPLE: what the morning routine ([docs/MORNING_ROUTINE.md](../docs/MORNING_ROUTINE.md)) posts as its final message, for the fictional candidate Jordan Rivera on 2026-09-23, with the cloud tracker add-on ON (as set in `examples/Context/Preferences.md`). Every company and email here is fictional. Proseware doesn't appear: nothing was submitted there, so there's no email about it.

Everything between the two rules is the routine's output, verbatim.

---

**Job-search brief: 2026-09-23 (Wednesday)**

**1. AWAITING YOUR RESPONSE**
- Tailspin Toys, Senior Full-Stack Engineer ($185K–$215K): the recruiter asked for a link to a code sample you'd like to walk through on Friday. Waiting 1 day. Action: reply to their Sep 22 email with the link.

**2. NEW IN THE LAST 24H**
- Tailspin Toys, Senior Full-Stack Engineer ($185K–$215K): calendar invite for the technical screen with the hiring manager, Fri Sep 25, 2:00 pm ET. In motion.
- Wide World Importers, Senior Software Engineer, Platform ($170K–$200K): rejection ("we've decided to move forward with other candidates"). Closed.

**3. UPCOMING INTERVIEWS (FOUND IN EMAIL)**
- Fri Sep 25, 2:00 pm ET: Tailspin Toys, Senior Full-Stack Engineer ($185K–$215K), technical screen with the hiring manager (video), from the calendar invite email.

**4. PIPELINE PULSE**
awaiting you: 1 / in motion: 1 / new rejections (24h): 1 / muted: 0
tracker: updated

To mute an item: tell Claude Code "ignoring <company>" or "handled <company>" in any session. Replying to the email clears it automatically.

---

## What to notice

| Detail | Why it's there |
|---|---|
| Comp in parentheses | Read from the cloud tracker's Comp column (add-on ON). Without the add-on, comp shows only when the email itself states it. |
| Tailspin Toys appears in sections 1, 2, and 3 | The calendar invite (in motion) arrived first; the recruiter's code-sample ask came later the same day and has no reply, so it's awaiting you. Order matters: had the invite arrived after the ask, the routine would treat the ask as in motion. |
| "Waiting 1 day" | Counted from the date of their ask (Sep 22), after the routine checked sent mail for a reply from you. |
| "tracker: updated" | The routine wrote one new `JobHunt Live Tracker (2026-09-23)` with two changes: Wide World Importers to Rejected, Tailspin Toys to Interview - Scheduled. The local xlsx picks these up at the next reconcile (see `examples/Applications/Job_Tracker_example.csv` for the matching rows). |
| No codes, links, or email bodies | One short quote at most. Routine sessions are stored. |

A quiet day is just one line plus the pulse:

> Quiet day: no new responses, nothing awaiting you.
> awaiting you: 0 / in motion: 1 / new rejections (24h): 0 / muted: 0
> tracker: no change
