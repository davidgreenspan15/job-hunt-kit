# Setup

About 20 minutes, once. Work top to bottom and tick the boxes.

## Checklist

- [ ] 1. [Install Claude Code and log in with your claude.ai account](#1-install-claude-code-and-log-in)
- [ ] 2. [Install Node.js 22+ and Google Chrome](#2-install-nodejs-and-chrome)
- [ ] 3. [Clone the kit](#3-clone-the-kit)
- [ ] 4. [First run: approve the Playwright MCP](#4-first-run-approve-the-playwright-mcp)
- [ ] 5. [Enable the claude.ai connectors (Gmail, optional Drive and Indeed)](#5-enable-the-claudeai-connectors)
- [ ] 6. [Install the Claude in Chrome extension](#6-install-the-claude-in-chrome-extension)
- [ ] 7. [Optional: computer use](#7-optional-computer-use)
- [ ] 8. [Pick a permission mode](#8-pick-a-permission-mode)
- [ ] 9. [Install Python 3 + openpyxl (and optionally pdfinfo)](#9-python-3-openpyxl-and-pdfinfo)
- [ ] 10. [Verify: render the example resume](#10-verify-render-the-example-resume)
- [ ] 11. Say "set me up" (see the [README quick start](../README.md#quick-start))

---

## MCPs and connectors

Everything the kit talks to beyond files and the shell. Get the two required ones working before your first round; add the rest when you need them.

| Name | Type | Required or optional | What it's used for in this kit | How to enable | How to verify |
|---|---|---|---|---|---|
| Playwright MCP | Project MCP via `.mcp.json` | Required | Tier 1 applies (Claude Code fills and submits forms) and reading job pages during search and prep | Nothing to install: approve the `.mcp.json` prompt on first run (step 4). Needs Node.js 22+ | `/mcp` shows `playwright` connected |
| Gmail | claude.ai connector | Required | Phase 6 inbox sweeps, reply drafts, email one-time codes during applies, the morning brief | claude.ai connector settings, connect Gmail with the account recruiters email (step 5) | `/mcp` lists the claude.ai Gmail entry |
| Google Drive | claude.ai connector | Optional | The cloud tracker add-on, so the morning routine can keep your live pipeline current | Same connector settings (step 5) | `/mcp` lists the claude.ai Google Drive entry |
| Indeed | claude.ai connector | Optional | An extra Phase 1 search source | Same connector settings (step 5) | `/mcp` lists the claude.ai Indeed entry |
| Claude in Chrome | Browser extension | Recommended | Tier 2 handoffs: forms that reject automated browsers as spam (Ashby especially) | Chrome Web Store, sign in with the same claude.ai account, start with `claude --chrome` (step 6) | In a `claude --chrome` session, "open example.com in a new tab and tell me the page title" works |
| Computer use | Desktop feature | Optional | Native desktop dialogs only. Browsers are view-only there, so it never fills application forms | Enable in Claude Code (macOS) or Claude Desktop settings (step 7) | `/mcp` lists `computer-use` in an interactive session |
| Browser MCP | Browser extension + MCP | Optional | An alternative to Playwright that drives your own Chrome profile, if you prefer it | Install the Browser MCP Chrome extension, then `claude mcp add browsermcp -- npx @browsermcp/mcp@latest` | `/mcp` shows `browsermcp` connected, with the extension connected in Chrome |

Why only two are required: Playwright plus Gmail cover search, prep, most applies, and replies. The rest either handle edge cases (Claude in Chrome, computer use) or add convenience (Drive, Indeed).

---

## 1. Install Claude Code and log in

You need a Claude plan that includes Claude Code (Pro, Max, Team, or Enterprise). Supported: macOS 13+, Windows 10/11 (WSL 2 recommended, since the kit's scripts are bash), Ubuntu 20.04+, Debian 10+.

```bash
# macOS / Linux / WSL
curl -fsSL https://claude.ai/install.sh | bash
```

```powershell
# Windows PowerShell
irm https://claude.ai/install.ps1 | iex
```

Homebrew, WinGet, and Linux package managers also work: see the [Claude Code quickstart](https://code.claude.com/docs/en/quickstart).

Then run `claude` and log in through the browser with your **claude.ai account**.

Why it matters: connectors (Gmail, Drive, Indeed) and Claude in Chrome only work with a claude.ai login. They don't appear in sessions authenticated with an API key or through Bedrock, Vertex, or Foundry. If `ANTHROPIC_API_KEY` is set in your shell, unset it before logging in.

## 2. Install Node.js and Chrome

- **Node.js 22 or newer.** Claude Code itself doesn't need it, but the Playwright MCP server runs through `npx`. Install the LTS from [nodejs.org](https://nodejs.org) or `brew install node`, then check with `node -v`.
- **Google Chrome.** Playwright drives it for Tier 1 applies, the Claude in Chrome extension lives in it for Tier 2, and `scripts/pdf.sh` uses it to render PDFs.

## 3. Clone the kit

Run the `git clone` and `cd job-hunt-kit` lines from the [README quick start](../README.md#quick-start).

You don't need to run `scripts/setup.sh` by hand; "set me up" runs it. It's safe to run yourself too, and safe to re-run: it never overwrites an existing file.

## 4. First run: approve the Playwright MCP

The kit's `.mcp.json` declares one project-scoped MCP server:

```json
{ "mcpServers": { "playwright": { "type": "stdio", "command": "npx", "args": ["@playwright/mcp@latest"] } } }
```

The first time you run `claude` in this folder, Claude Code asks whether to use the MCP server found in this project's `.mcp.json`. Approve it. Why the prompt: project files can launch programs on your machine, so Claude Code asks once per project.

Check it: type `/mcp` in the session. `playwright` should be listed as connected. (The first launch downloads the package, so it can take a moment.)

Equivalent manual setup, if you ever need it: `claude mcp add --transport stdio playwright --scope project -- npx @playwright/mcp@latest`.

## 5. Enable the claude.ai connectors

In claude.ai, open the connectors settings ([claude.ai/customize/connectors](https://claude.ai/customize/connectors); the menu is Customize or Settings, then Connectors) and connect:

| Connector | Needed? | Used for |
|---|---|---|
| Gmail | **Required** | Phase 6 inbox sweeps, reply drafts, email one-time codes during applies, the morning brief |
| Google Drive | Optional | The cloud tracker add-on ([docs/TRACKER.md](TRACKER.md), [docs/MORNING_ROUTINE.md](MORNING_ROUTINE.md)) |
| Indeed | Optional | An extra Phase 1 search source |

Connect Gmail with the Google account recruiters actually email.

Then confirm in Claude Code: start a new session, type `/mcp`, and look for the claude.ai Gmail entry (plus Drive and Indeed if you enabled them). Connectors from your claude.ai account are shared into Claude Code, routines, and cloud sessions when you're logged in with that same account. On a Team or Enterprise plan, an admin may have to allow a connector first.

## 6. Install the Claude in Chrome extension

This is what makes Tier 2 work: Claude assists inside your own, logged-in Chrome, which is how you apply on sites that don't accept automated browsers.

1. Install **Claude in Chrome** (by Anthropic) from the Chrome Web Store. You need version 1.0.36 or newer.
2. Sign in to the extension with the same claude.ai account.
3. Start Claude Code with it connected: `claude --chrome`.
4. Test: ask it to "open example.com in a new tab and tell me the page title."

How the kit uses it: when forms bounce, Claude Code writes a handoff file. You open a separate session with the extension connected (Cowork with the extension installed is the validated path; a fresh `claude --chrome` session in this folder also works, and `AGENTS.md` tells it to act only as the executor; plain Claude Desktop chat is untested) and say "run the handoff at Applications/_handoff/HANDOFF_<YYYY-MM-DD>.md". The session needs to read local files to upload your resume PDFs; if a file-upload dialog stalls, pick the file yourself. Details: [docs/HANDOFF.md](HANDOFF.md).

## 7. Optional: computer use

Not needed for the core flow. Computer use lets Claude see your screen and control desktop apps (Claude Code CLI: macOS only; Claude Desktop: macOS and Windows; Pro or Max; interactive sessions only). Browsers are view-only in computer use, so it can't fill forms in Chrome. That's what Claude in Chrome is for. Skip this unless you hit a native desktop dialog the browser tools can't reach. Docs: [computer use](https://code.claude.com/docs/en/computer-use).

## 8. Pick a permission mode

Your current mode shows under the prompt; Shift+Tab cycles modes.

| Mode | What it does | When to use it |
|---|---|---|
| Default | Depending on your plan and version: either asks before edits, commands, and tool calls, or runs in auto mode (a classifier reviews each action and asks only on risky ones, the default for Pro, Max, and Team interactive sessions) | Your first round. You learn what the agent actually does. |
| Accept edits | Auto-accepts file edits, still asks for commands and tools | Once you trust it with files. |
| Allowlist | Pre-approves specific commands and tools | Cuts the repetitive prompts. Manage with `/permissions`. |
| Skip all prompts | Nothing asks, including browser submits and email sends | See the warning below. |

A starter allowlist in `.claude/settings.local.json` (personal and gitignored):

```json
{
  "permissions": {
    "allow": [
      "Bash(scripts/pdf.sh:*)",
      "Bash(scripts/setup.sh)",
      "mcp__playwright"
    ]
  }
}
```

Keep send tools **off** any allowlist, so every email still needs your click. Check exact tool names in `/permissions` or `/mcp`.

**About skipping permissions entirely** (`--dangerously-skip-permissions`): every file write, shell command, form submit, and email send happens without a prompt. One wrong match can send a reply or submit an application you didn't want. Only use it for an unattended run of a flow you've already watched work once with prompts on, and never with email sending loosened. Auto mode, accept edits, or an allowlist is the safer way to cut prompts.

## 9. Python 3, openpyxl, and pdfinfo

The tracker is an `.xlsx`, edited through Python.

```bash
python3 -m pip install --user openpyxl
python3 -c "import openpyxl; print('openpyxl', openpyxl.__version__)"
```

If pip refuses with "externally-managed-environment" (common with Homebrew Python), add `--break-system-packages` to the install line. It only installs into your user folder.

Optional, for page counts after rendering (`scripts/pdf.sh` uses whichever it finds):

- `pdfinfo`: `brew install poppler` (macOS) or `sudo apt install poppler-utils` (Debian/Ubuntu)
- or `python3 -m pip install --user pypdf`

## 10. Verify: render the example resume

```bash
ls examples/Resumes/Final/
scripts/pdf.sh examples/Resumes/Final/<the .html file listed> /tmp/kit_check.pdf
```

You should get `/tmp/kit_check.pdf` and, if pdfinfo or pypdf is installed, a page count of 1. Give an output path outside `examples/` so you don't overwrite the tracked example PDF.

`pdf.sh` looks for Chrome at its macOS app path first, then `google-chrome` or `chromium` on your PATH.

---

## Troubleshooting

**Playwright doesn't show in `/mcp`**
- You declined the first-run prompt: run `claude mcp reset-project-choices` in this folder, restart `claude`, and approve.
- Node is missing or old: `node -v` should print 22 or higher.
- Test the server by itself: `npx @playwright/mcp@latest --help`. Fix any error it prints, then restart `claude`.
- If it complains that the browser isn't installed, run `npx playwright install chrome`.

**An MCP shows "connection closed" or "failed" in `/mcp`**
- Run its npx command by hand to see the real error, for example `npx @playwright/mcp@latest --help`. `/mcp` only shows that the server died, not why.
- `ENOTEMPTY` (or a similar rename error) means a half-finished npx install is stuck in the npm cache. Find the cache with `npm config get cache`, delete that package's folder under its `_npx` directory (search the folders there for the package name), then reconnect from `/mcp` or restart `claude`.
- A VPN is rarely the cause. If `npm view @playwright/mcp version` works, the npm registry is reachable and the problem is local.

**A connector is missing in Claude Code**
- Run `/status` and check you're logged in with your claude.ai account, not an API key. Unset `ANTHROPIC_API_KEY` if it's set.
- Make sure it's the same claude.ai account where you enabled the connector, and that the connector shows as connected on claude.ai.
- Start a fresh session after enabling a connector.
- Team or Enterprise plan: ask your admin to allow it.

**The resume PDF is over one page**
- Ask Claude to trim to one page. The order that works: cut the weakest bullet, shorten long bullets, drop an older project, then tighten spacing. Shrink the font last.
- Re-run `scripts/pdf.sh` and confirm the page count is 1. Never submit a two-page resume.
- `pdf.sh` can't find Chrome: install it, or put `google-chrome` or `chromium` on your PATH.

**Ashby (or another ATS) says "possible spam"**
- The site doesn't accept the Playwright browser. It's not your data, and refilling won't change it.
- Don't keep retrying in Playwright. Retry once at most, then put the role in a handoff ([docs/HANDOFF.md](HANDOFF.md)) and run it in real Chrome.
- If a specific company blocks real Chrome too, retry once, mark it FAILED, and apply by hand (Tier 3) or reach the company another way.

**Captcha loops**
- Some big-company portals (amazon.jobs account creation, for example) chain captchas endlessly in an automated browser. Create the account in your normal Chrome yourself, add it to `Applications/Credentials.md`, then let Claude log in and apply.
- For a single captcha mid-apply, solve it in the open browser window. Claude pauses and continues after.
- If the same captcha keeps coming back, stop. It's a Tier 3 job for your own hands.

**Claude in Chrome won't connect**
- Check the extension is version 1.0.36+ and signed in to the same claude.ai account you use in Claude Code.
- Start Claude Code with `claude --chrome`, and keep Chrome open.
