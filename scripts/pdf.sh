#!/usr/bin/env bash
# Render an HTML resume or cover letter to PDF with headless Chrome.
#
# Usage: scripts/pdf.sh <input.html> [output.pdf]
#   output defaults to the input path with a .pdf extension.
#
# Prints the page count when pdfinfo (poppler) or python3 + pypdf is
# available, and warns loudly when a file named *Resume* is not exactly 1 page.
set -euo pipefail

usage() {
  echo "Usage: scripts/pdf.sh <input.html> [output.pdf]" >&2
  exit 2
}

[[ $# -ge 1 && $# -le 2 ]] || usage

in="$1"
if [[ ! -f "$in" ]]; then
  echo "Error: input file not found: $in" >&2
  exit 1
fi

if [[ "$(basename "$in")" == *.* ]]; then
  default_out="${in%.*}.pdf"
else
  default_out="$in.pdf"
fi
out="${2:-$default_out}"
mkdir -p "$(dirname "$out")"

# Absolute path without relying on realpath (not on every macOS install).
abspath() {
  printf '%s/%s\n' "$(cd "$(dirname "$1")" && pwd -P)" "$(basename "$1")"
}

in_abs="$(abspath "$in")"
out_abs="$(abspath "$out")"

if [[ "$in_abs" == "$out_abs" ]]; then
  echo "Error: output path is the same as the input: $in_abs" >&2
  exit 1
fi

find_chrome() {
  local mac="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
  if [[ -x "$mac" ]]; then
    printf '%s\n' "$mac"
    return 0
  fi
  local c
  for c in google-chrome google-chrome-stable chromium chromium-browser; do
    if command -v "$c" >/dev/null 2>&1; then
      command -v "$c"
      return 0
    fi
  done
  return 1
}

if ! chrome="$(find_chrome)"; then
  echo "Error: Chrome or Chromium not found." >&2
  echo "Install Google Chrome, or put google-chrome / chromium on your PATH." >&2
  exit 1
fi

# file:// URL from the absolute path; escape the characters that break URLs.
url_path="${in_abs//%/%25}"
url_path="${url_path// /%20}"
url_path="${url_path//\#/%23}"
url_path="${url_path//\?/%3F}"
url="file://${url_path}"

chrome_args=(--headless=new --disable-gpu --no-pdf-header-footer --print-to-pdf="$out_abs")
# Chrome refuses to run sandboxed as root (common in Linux containers).
if [[ "$(id -u)" -eq 0 ]]; then
  chrome_args+=(--no-sandbox)
fi

rm -f "$out_abs"
log="$(mktemp)"
trap 'rm -f "$log"' EXIT

if ! "$chrome" "${chrome_args[@]}" "$url" >"$log" 2>&1; then
  echo "Error: Chrome failed to render $in_abs" >&2
  cat "$log" >&2
  exit 1
fi

if [[ ! -s "$out_abs" ]]; then
  echo "Error: no PDF was written to $out_abs" >&2
  cat "$log" >&2
  exit 1
fi

pages=""
if command -v pdfinfo >/dev/null 2>&1; then
  pages="$(pdfinfo "$out_abs" 2>/dev/null | awk '/^Pages:/ {print $2}')" || pages=""
fi
if [[ -z "$pages" ]] && command -v python3 >/dev/null 2>&1; then
  pages="$(python3 -c 'import sys
from pypdf import PdfReader
print(len(PdfReader(sys.argv[1]).pages))' "$out_abs" 2>/dev/null)" || pages=""
fi

is_resume=0
if [[ "$(basename "$in_abs")" == *Resume* || "$(basename "$out_abs")" == *Resume* ]]; then
  is_resume=1
fi

if [[ -n "$pages" ]]; then
  echo "Wrote $out_abs ($pages page(s))"
  if [[ $is_resume -eq 1 && "$pages" != "1" ]]; then
    {
      echo ""
      echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      echo "WARNING: this resume is $pages pages. Resumes must be exactly 1 page."
      echo "Trim bullets from the bottom of each role or drop a project, then re-run."
      echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    } >&2
  fi
else
  echo "Wrote $out_abs (page count unavailable: install poppler for pdfinfo, or run: pip install pypdf)"
  if [[ $is_resume -eq 1 ]]; then
    echo "Open the PDF and confirm it is exactly 1 page." >&2
  fi
fi
