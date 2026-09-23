# Accounts and Credentials

Some portals let you apply as a guest; others want an account. This doc covers how to handle both without friction, and where logins live.

## How Portal Accounts Work

| Portal type | Account behavior | What to do |
|---|---|---|
| Greenhouse, Lever, Ashby | Usually guest apply, no account | Nothing; apply directly |
| Workday | A separate account per company (each company runs its own tenant) | One Credentials.md entry per tenant |
| Indeed | One account; many postings apply through it | Create once, reuse everywhere it is accepted |
| YC Work at a Startup | One account; account-wide weekly application cap | Create once; plan around the cap |
| LinkedIn Easy Apply | Your LinkedIn login | Store it only if you let the agent use it |
| Big-company portals (for example amazon.jobs) | Their own account | Create in your normal browser (captchas, see below) |

## The Account Workflow

1. **Reuse first.** Where a portal accepts an existing Indeed, Workday, YC, or LinkedIn sign-in, use it. Why: fewer accounts, fewer passwords, fewer captchas.
2. **Batch the sign-ups.** During prep (or before an apply wave), Claude collects every portal that needs an account you do not have and gives you ONE list of sign-up links. You create them in one sitting. Why: ten context switches mid-wave cost more than one focused session.
3. **Store the login** in `Applications/Credentials.md` (fields below).
4. **Claude logs in "in and out".** During the apply, the agent reads the stored login, signs in, applies, and moves on.

### Friction to Expect

- **Chained captchas on account creation.** Some portals serve captcha after captcha in an automation browser (the token expires between rounds). Create those accounts in your normal browser; the agent logs in afterward.
- **Email one-time codes are fine.** The agent reads them from Gmail through the connector.
- **Forced per-session 2FA is a dealbreaker.** If a portal demands a fresh device code on every login, the agent cannot run it unattended. Skip the role or do it yourself one-off.
- **"Sign in with Google / LinkedIn"** works in your real Chrome where you are already signed in, but in an automation browser it often triggers a device prompt. Prefer email + password accounts for Tier 1.

## Credentials Rules

Credentials live in exactly one place: **`Applications/Credentials.md`**, created by `scripts/setup.sh` from `templates/Credentials.template.md`.

| Rule | Why |
|---|---|
| Gitignored (check: `git check-ignore Applications/Credentials.md` prints the path) | Repo history is permanent |
| `chmod 600` | Only your user can read it |
| A unique generated password per site | One leaked portal does not unlock the rest |
| Never your email account password | Gmail access goes through the connector's own sign-in, not a password; nothing here should unlock your inbox |
| Agents read it, but never echo values into chat, logs, trackers, Application_Records, handoff files, or any other file | Conversation logs and files persist; a password printed once is exposed for good |
| Records refer to an entry by its heading (for example "Workday: Tailspin Toys tenant") | Traceable without the secret |
| If a value leaks anywhere, change that password | Assume anything printed has been seen |

**Generating a password without printing it.** Use your password manager's generator, or have the agent write a generated value straight into the file (for example `openssl rand -base64 18`, redirected into the file, never printed to the terminal).

**Fields per entry:** Portal, Login URL, Username/Email, Password, 2FA method, Notes, Created by/date.

## Optional Upgrade: Keep Secrets Out of Plain Files

If you would rather not keep passwords in a Markdown file at all, keep only a reference in `Credentials.md` and the secret in a vault:

| Store | Save | Read (what the agent runs) |
|---|---|---|
| 1Password CLI | Create the item in the app | `op read "op://<vault>/<item>/password"` |
| Bitwarden CLI | Create the item in the app | `bw get password <item>` |
| macOS Keychain | `security add-generic-password -s jobhunt-<portal> -a <email> -w` (prompts for the value) | `security find-generic-password -s jobhunt-<portal> -a <email> -w` |

Then the Password field says something like `keychain: jobhunt-<portal>`. The agent still sees the value when it types it into a login form, so the no-echo rule still applies.
