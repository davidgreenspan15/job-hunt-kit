# DO NOT REAPPLY

Checked in Phase 1 (add-time dedupe) and again before EVERY individual submit in Phase 4. Why: dedupe at list-build time alone misses re-applies; the submit-time check is what actually stops them.

Add a row the moment an application is submitted. Never delete rows; update Outcome as it changes.

## The Rule

- **Reapply window: 6 months by default.** Skip a company if you submitted there inside the window, UNLESS the new role is materially different (different function or level) AND the prior application was rejected or expired. When in doubt, ask.
- **Stricter portal windows win.** Some portals state their own limits: a same-role wait, "N applications per M days", or one application per candidate. Record them in the role's Application_Record and in Notes below, and honor them even when this file's default is looser.
- **Per-company cap: 1 role per company per round, at most 2**, decided in Phase 2 BEFORE prep. Extra roles go in the tracker as "Backup (not prepped)". Why: several applications to one company at once read as spray, not interest.
- **Any hit blocks the submit.** Log the block in that tracker row's Notes and surface it to the user.

## Company Key (normalize before comparing)

1. Lowercase.
2. Drop legal suffixes: inc, incorporated, llc, ltd, limited, corp, corporation, co, company, plc, gmbh, ag, sa, pbc.
3. Remove all punctuation and whitespace.

Example: "Wide World Importers, Inc." and "WideWorld Importers" both become `wideworldimporters`.

One folder per company key. Name the folder in CamelCase from the company name, with no spaces or punctuation (`Applications/WideWorldImporters/`), and check existing folders by key before creating one. Why: two folders for one company (dotted vs undotted name, for example) look like "prepped, not applied" and invite a re-apply.

## Known Aliases

Different names that are the same company for this rule: rebrands, parent and subsidiary, product name vs company name, a recruiter writing from an acquiring company's domain.

| Alias key | Canonical key | Why |
|---|---|---|

## Applied

| Company key | Company | Role(s) | Date applied | Outcome | Reapply after |
|---|---|---|---|---|---|

## Notes (portal-stated limits and exceptions)

| Company key | Limit or exception | Source |
|---|---|---|
