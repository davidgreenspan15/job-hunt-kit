> EXAMPLE ONLY: fictional candidate (Jordan Rivera) prepping an invented posting at a fictional company, frozen on 2026-09-23. Nothing was submitted.

# Prep Record: Proseware, Senior Full-Stack Engineer

- **Date prepped:** 2026-09-23
- **Company:** Proseware
- **Company key:** `proseware` (the posting's legal entity is "Proseware, Inc."; the key rule drops "inc", so both normalize to the same key)
- **Role:** Senior Full-Stack Engineer
- **RoleSlug:** SeniorFullStack
- **Bucket:** apply-now
- **Priority:** 20 (R:4 C:5)
- **Apply URL:** https://example.com/jobs/proseware/senior-full-stack/apply
- **Canonical URL:** https://example.com/jobs/proseware/senior-full-stack

## Gate Results (run before any materials were built)

| Gate | Result | Note |
|---|---|---|
| Location | pass | New York hybrid at 2 days a week, inside Jordan's 3-day max (Remote US also offered) |
| Role type | pass | Product full-stack, Jordan's core target |
| Seniority band | pass | Senior, inside Senior through Staff |
| Freshness (posted under 2 weeks ago) | pass | Posted 2026-09-18, 5 days before prep |
| DO_NOT_REAPPLY (company key) | clear | none |
| Tracker dedupe (all rows, any status) | clear | No prior `proseware` rows |
| Per-company cap | role 1 of 1 | Other roles at this company logged as Backup (not prepped): none |
| Portal-stated cap or reapply window | none | Nothing stated on the posting |

## Materials

- **Resume variant chosen:** `Jordan_Rivera_Resume_Proseware_SeniorFullStack.html`, from the "AI application / AI company" row in `Context/Achievement_Bank.md`
  - **Why:** the posting wants React/TypeScript depth plus shipped LLM features with evaluations; the LLM triage bullet and Pantry Planner's AI angle carry the second half.
- **Projects swapped:** Pantry Planner bullet 2 swapped from the recipe matching engine to the AI plan generator (Claude API, structured output, evals). TrailLog condensed from 2 bullets to its 1-bullet general version.
- **Bullets reordered or trimmed:** disputes redesign moved above the payout pipeline in the current role (maps to "from the first customer conversation to the metric that says it worked"). Nothing trimmed; it fits on one page. Skills line reordered: React, TypeScript, Node.js, LLM APIs first; accessibility added (the posting names it); JavaScript, React Native, GraphQL, and Terraform dropped to keep the line at two rows. Current-role stack line reordered to lead with React.
- **Cover letter angle:** AI-forward. (1) hook: "the approval flows that decide what an agent may do on its own" and the role title; (2) proof: LLM triage service with tool calling, evals, and human review, plus squad lead and the disputes redesign; (3) extra proof: Pantry Planner's validated structured-output plans, and Fabrikam Health's audit logging as high-trust experience; (4) close: based in Brooklyn, glad to be in the New York office.

## Fit Notes

- **Strong matches:** 9 years vs a 6-year minimum; React, TypeScript, and Node.js depth; PostgreSQL and AWS in production; led a user-facing feature from merchant interviews to measured result (disputes redesign); a shipped LLM feature with an eval set and human review; accessibility (score 71 to 98); two regulated domains (payments, health).
- **Gaps / stretches:** the LLM work is one internal tool for support agents, not a customer-facing agent product; no legal-domain experience.
- **Interview talking points:** designing the triage service's eval set and human-review step (maps straight to their approval flows); the disputes redesign from interviews to measured result; spreading the testing standard to 4 teams; moving payouts from a nightly batch to events.

## Files Created

1. `Job_Description_SeniorFullStack.md`
2. `Jordan_Rivera_Resume_Proseware_SeniorFullStack.html`
3. `Jordan_Rivera_Resume_Proseware_SeniorFullStack.pdf` (1 page: yes)
4. `Jordan_Rivera_CoverLetter_Proseware_SeniorFullStack.html`
5. `Jordan_Rivera_CoverLetter_Proseware_SeniorFullStack.pdf` (pages: 1, em dashes: 0)
6. `Prep_Record_SeniorFullStack.md`

## JD Liveness Check

- Fetched 2026-09-23: live. Evidence: the posting page loads with an active Apply button.

## Open Questions (answer before applying)

1. **Location choice.** The form asks "New York (hybrid)" or "Remote (US)". Suggested: New York (hybrid), since you're in Brooklyn and the cover letter says so. Confirm.
2. **Salary field is required and numeric.** Your policy says use the upper portion of the posting's band: suggested $230,000. Confirm or change.
3. **"Why Proseware?" (required, 100-250 words).** A draft built from cover letter paragraphs 1 and 3 is in the Application_Record. Approve or edit it before submit.

## Caveats

- Ashby board: if the submit comes back "possible spam", retry once, then it goes into the next handoff (Tier 2).
- No visa sponsorship for this role; Jordan doesn't need it, so no issue.

**Status:** prepped, not applied
