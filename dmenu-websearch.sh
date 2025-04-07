#!/bin/bash
# Import the colors
. "${HOME}/.cache/wal/colors.sh"

# Source the search engines (KEEP THESE FILES TOGETHER OR IT WON'T WORK)
source "$(dirname "$0")/dmenu-websearch_engines.sh" || { echo "Failed to source search_engines.sh"; exit 1; }

# Get the clipboard content
clipboard_content=$(printf "$(xclip -o)")

# Get the search query from dmenu with Pywal colors
query=$(echo "$clipboard_content" | dmenu -l 20 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -p "🔎" -fn 'monospace-20')

# If no query, exit
[ -z "$query" ] && exit

# Define the order for sorting
sorted_engines=$(printf "🔎 Bing\n🔎 Google\n🔎 Yahoo\n🛒 Amazon\nJAV Guru (TUBE)\niJavTorrent (TORRENT)\nOneJAV (TORRENT)\nProjectJAV (TORRENT)\nJAVAngel (TORRENT)\n%s\n" "$(printf "%s\n" "${!engines[@]}" | grep -v -e '🔎 Bing' -e '🔎 Google' -e '🔎 Yahoo' -e '🛒 Amazon' -e 'JAV Guru (TUBE)' -e 'iJavTorrent (TORRENT)' -e 'OneJAV (TORRENT)' -e 'ProjectJAV (TORRENT)' -e 'JAVAngel (TORRENT)' | sort)")

# Get the selected engine from dmenu with Pywal colors
engine=$(echo "$sorted_engines" | dmenu -l 38 -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15" -p "Select Engine:" -fn 'monospace-16')

# Get the current timestamp
timestamp=$(date +"%Y-%m-%d %I:%M %p")

# Notify user
notify-send "D-MENU SEARCH" "Engine: $engine\nQuery: $query\nTime: $timestamp"

# If no engine is selected, exit
[ -z "$engine" ] && exit

# Open the search in the selected engine
xdg-open "${engines[$engine]}$query" || { echo "Failed to open browser"; exit 1; }
