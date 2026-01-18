#!/bin/bash
# This utility script translates the selected or copied text in Wayland using Reverso Translation in a dedicated web app window.

SOURCE_LANG="eng"
TARGET_LANG="rus"

TEXT=$(wl-paste -p) # Get Selection from Wayland
if [ -z "$TEXT" ]; then TEXT=$(wl-paste); fi
if [ -z "$TEXT" ]; then
    notify-send "Reverso" "Nothing selected or copied"
    exit 1
fi

ENCODED_TEXT=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$TEXT'''))")
FINAL_URL="https://www.reverso.net/text-translation#sl=${SOURCE_LANG}&tl=${TARGET_LANG}&text=${ENCODED_TEXT}"

brave --class WebApp-Reverso1619 --user-data-dir="$HOME/.local/share/ice/profiles/Reverso1619" --app="$FINAL_URL"
