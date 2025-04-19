#!/bin/bash

# Load pywal colors
. "${HOME}/.cache/wal/colors.sh"

# Check for updates
pacman_updates=$(checkupdates | wc -l)  # For official repository updates
paru_updates=$(paru -Qu | wc -l)       # For AUR updates

# Define menu options
total_updates=$((pacman_updates + paru_updates))
if [ "$total_updates" -gt 0 ]; then
    options="Total updates available: $total_updates\nOfficial repo updates: $pacman_updates\nAUR updates: $paru_updates\nRun system updates\nPerform Automated Maintenance\nExit"
else
    options="Your system is up to date.\nPerform Automated Maintenance\nExit"
fi

# Show dmenu with pywal colors, larger font, and capture selection
choice=$(echo -e "$options" | dmenu -p "System Status" \
    -nb "$color0" -nf "$color15" \
    -sb "$color1" -sf "$color15" \
    -fn "Dina-20")  # Adjust to your preferred font and size

# Handle user selection with dynamic icon notifications
case "$choice" in
    "Run system updates")
        notify-send -i system-software-update "System Updates" "Starting updates..."
        # Run updates for both official repos and AUR
        if sudo pacman -Syu && paru -Syu; then
            notify-send -i dialog-ok "System Updates" "Updates completed successfully!"
        else
            notify-send -i dialog-error "System Updates" "Update process encountered errors!"
        fi
        ;;
    "Perform Automated Maintenance")
        notify-send -i utilities-system-monitor "Automated Maintenance" "Opening maintenance script..."
        # Open the update.sh script
        if exec kitty -e /home/j3ll0/update.sh; then
            notify-send -i dialog-ok "Automated Maintenance" "Maintenance task completed!"
        else
            notify-send -i dialog-error "Automated Maintenance" "Maintenance task failed!"
        fi
        ;;
    "Exit")
        notify-send -i application-exit "System Updates" "Exiting system status menu."
        exit 0
        ;;
    *)
        notify-send -i dialog-information "System Updates" "No valid option selected."
        ;;
esac
