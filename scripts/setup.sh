#!/usr/bin/env bash
# Creates your personal working layout (Capitalized dirs at the repo root) from templates/.
# Safe to re-run: it never overwrites a file that already exists.
# It only reads templates/ and never touches examples/.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

WARNINGS=0

# copy_template <source under templates/> <destination under the repo root>
copy_template() {
  local src="$1" dst="$2"
  if [ ! -f "$src" ]; then
    echo "  warning:       template missing, skipped: $src"
    WARNINGS=$((WARNINGS + 1))
    return 0
  fi
  if [ -e "$dst" ]; then
    echo "  kept existing: $dst"
  else
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
    echo "  created:       $dst"
  fi
}

make_dir() {
  if [ -d "$1" ]; then
    echo "  kept existing: $1/"
  else
    mkdir -p "$1"
    echo "  created:       $1/"
  fi
}

echo "Job hunt kit setup in: $ROOT"
echo

echo "Folders"
for d in \
  Context \
  Resumes/Template Resumes/Final Resumes/Drafts Resumes/Archive \
  CoverLetters \
  Applications/_Template Applications/_handoff \
  Prep Research; do
  make_dir "$d"
done
echo

echo "Profile (Context/)"
for f in Career_Profile.md Achievement_Bank.md Job_Search_Criteria.md \
         Application_Answers.md Project_Links.md Preferences.md; do
  copy_template "templates/profile/$f" "Context/$f"
done
echo

echo "Resume and cover letter templates"
copy_template templates/resume/Resume_TEMPLATE.html Resumes/Template/Resume_TEMPLATE.html
copy_template templates/cover-letter/CoverLetter_TEMPLATE.html CoverLetters/CoverLetter_TEMPLATE.html
echo

echo "Applications"
for f in Job_Description.md Prep_Record.md Application_Record.md; do
  copy_template "templates/application/$f" "Applications/_Template/$f"
done
copy_template templates/handoff/HANDOFF_TEMPLATE.md Applications/_handoff/HANDOFF_TEMPLATE.md
copy_template templates/DO_NOT_REAPPLY.md Applications/DO_NOT_REAPPLY.md
copy_template templates/tracker/Job_Tracker_TEMPLATE.xlsx Applications/Job_Tracker.xlsx
copy_template templates/Credentials.template.md Applications/Credentials.md
if [ -f Applications/Credentials.md ]; then
  chmod 600 Applications/Credentials.md
  echo "  locked:        Applications/Credentials.md (chmod 600, owner read/write only)"
fi
echo

# Optional tools: warn only, never fail.
echo "Tool check (warnings only)"
if command -v npx >/dev/null 2>&1; then
  NODE_MAJOR=$(node -v 2>/dev/null | sed 's/^v//; s/\..*//')
  if [ -n "$NODE_MAJOR" ] && [ "$NODE_MAJOR" -lt 22 ] 2>/dev/null; then
    echo "  warning:       Node.js $(node -v) found. Install Node.js 22+ so the Playwright MCP runs reliably."
    WARNINGS=$((WARNINGS + 1))
  else
    echo "  ok:            npx (runs the Playwright MCP server from .mcp.json)"
  fi
else
  echo "  warning:       npx not found. Install Node.js 22+ so browser applies work."
  WARNINGS=$((WARNINGS + 1))
fi
if [ -x "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ] \
   || command -v google-chrome >/dev/null 2>&1 \
   || command -v chromium >/dev/null 2>&1; then
  echo "  ok:            Chrome (scripts/pdf.sh renders PDFs with it)"
else
  echo "  warning:       Chrome not found. scripts/pdf.sh needs Google Chrome or Chromium."
  WARNINGS=$((WARNINGS + 1))
fi
if command -v python3 >/dev/null 2>&1 && python3 -c "import openpyxl" >/dev/null 2>&1; then
  echo "  ok:            python3 + openpyxl (tracker edits)"
else
  echo "  warning:       python3 with openpyxl not found. Run: python3 -m pip install openpyxl"
  WARNINGS=$((WARNINGS + 1))
fi
echo

if [ "$WARNINGS" -gt 0 ]; then
  echo "Finished with $WARNINGS warning(s). Nothing was overwritten."
else
  echo "Finished. Nothing was overwritten."
fi
echo
echo "Next steps"
echo "  1. Open Claude Code in this folder:  cd \"$ROOT\" && claude"
echo "  2. Say:  set me up"
echo "     Have your current resume (PDF, DOCX, or text) handy; Claude will ask for its path."
echo "  3. Optional: docs/MORNING_ROUTINE.md sets up the daily Gmail briefing."
