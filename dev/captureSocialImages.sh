#!/usr/bin/env bash

# Captures the link-preview (Open Graph) image for each game: the desktop
# view at 1200x630, rendered at 2x, without ads, saved as
# images/social-<game>.jpg. index.php points og:image at these.
#
# Usage: dev/captureSocialImages.sh [base URL]
# Defaults to staging, which has every game's data.

set -euo pipefail

base="${1:-https://stage.zeldamaps.com/}"
chrome="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
root="$(cd "$(dirname "$0")/.." && pwd)"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

for game in LA BotW TotK EoW; do
  name="$(echo "$game" | tr '[:upper:]' '[:lower:]')"
  # BotW shows all of Hyrule with only Korok Seeds (category 1916), shifted
  # clear of the sidebar.
  view=""
  case "$game" in
    BotW) view="&categoriesSelectedIds=%5B1916%5D&enforceMaxBounds=false&x=82&y=-128&zoom=2" ;;
  esac
  # A fresh profile each time: signed out, no saved settings or Minimal UI.
  "$chrome" --headless=new --disable-gpu --hide-scrollbars \
    --user-data-dir="$work/profile-$name" \
    --window-size=1200,630 --force-device-scale-factor=2 \
    --virtual-time-budget=40000 \
    --screenshot="$work/$name.png" \
    "${base}?game=${game}&ads=off${view}" >/dev/null 2>&1
  sips -s format jpeg -s formatOptions 85 "$work/$name.png" \
    --out "$root/images/social-$name.jpg" >/dev/null
  echo "images/social-$name.jpg"
done
