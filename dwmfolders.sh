#!/bin/bash
# Replace any occurance of dmenu with rofi-dmenu to make this a rofi menu instead of dmenu 

# Define preferred text editor and terminal
edit=${EDITOR:-vim}
tty=kitty

# Paths to configuration directories
configs="$HOME/j3ll0/.config/"
suckless="$HOME/j3ll0/.suckless/"

# Map of folder paths to friendly names
declare -A friendly_names=(
    ["/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/Downloads/"]="Downloads"
    ["/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/dwhelper/"]="DW Helper Downloads"
    ["/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/VIDEO_DOWNLOADS/"]="YouTube Video Downloads"
    ["/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/Torrents/Complete/"]="Torrent Complete"
    ["/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/Torrents/InComplete/"]="Torrent InComplete"
    ["/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/AUR/"]="AUR Downloads"
    ["/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/OneDrive/"]="One Drive"
    ["/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/Wallpaper/"]="Wallpapers"
    ["/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/ISO/"]="ISO's"
    ["smb://mycloudex2ultra//"]="MyCloud HOME"
    ["smb://mycloudex2ultra/_linux_backup/_DISTROS/DWM_Configs/ROG/"]="MyCloud DWM Backup"
    ["smb://mycloudex2ultra/xbox/"]="XBOX on MyCloud"
    ["smb://mycloudex2ultra/transfer/⭐_File_Transfer/"]="Files For Transfer"
    ["/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/_SAMBA/"]="VM SAMBA"
    ["smb://mycloudex2ultra/jav/"]="JAV"
    ["smb://mycloudex2ultra/p/"]="P"
    ["/home/j3ll0/.config/scripts/polybar/icons.sh "]="Icons"
    ["/home/j3ll0/.config/scripts/polybar/themes.sh"]="Window Themes"
    ["/home/j3ll0/.config/scripts/polybar/lightdm.sh"]="LightDM Themes"
    ["/home/j3ll0/.config/"]=".config"
    ["/home/j3ll0/.suckless/"]=".suckless"
    ["/home/j3ll0/.config/scripts/"]="SCRIPTS"
    ["/home/j3ll0/.config/scripts/polybar/"]="POLYBAR SCRIPTS"
    ["smb://mycloudex2ultra/iCloud_Photo_Backup/"]="iCloud Photo Library on MyCloud"
    ["smb://mycloudex2ultra/pictures_from_the_internet/"]="Internet Pictures"
    ["smb://mycloudex2ultra/TV"]="TV Shows"
    ["smb://mycloudex2ultra/youtube/"]="YouTube"
)

# Function to display the menu options
menu() {
    cat <<EOF
📥  DOWNLOADS
📥  DW Helper Downloads
📥  YouTube Video Downloads
📥  Torrent Complete
📥  Torrent InComplete
📥  AUR Downloads
☁️  One Drive
📡  MyCloud HOME
📡  MyCloud DWM Backup
📡  iCloud Photo Library on MyCloud
🎮  XBOX on MyCloud
📤  Files For Transfer
📤  VM SAMBA
📸  Wallpapers
📸  Internet Pictures
🎥  TV Shows
📺  YouTube Etc.
🎥  JAV
🎥  P
🔐  Cursors & Icons
🔐  Window Themes
🔐  LightDM Themes
🧰  .suckless
🧰  .config
🧰  SCRIPTS
🔧  POLYBAR SCRIPTS
📀  ISO's
EOF
}

# Main function to handle menu selection
main() {
    choice=$(menu | rofi -i -dmenu -config /home/j3ll0/.config/rofi/config.rasi)

    # Map choices to corresponding files
    case "$choice" in
        "📥  DOWNLOADS") folder=/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/Downloads/ ;;
        "📥  DW Helper Downloads") folder=/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/dwhelper/ ;;
        "📥  YouTube Video Downloads") folder=/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/VIDEO_DOWNLOADS/ ;;
        "📥  Torrent Complete") folder=/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/Torrents/Complete/ ;;
        "📥  Torrent InComplete") folder=/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/Torrents/InComplete/ ;;
        "📥  AUR Downloads") folder=/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/AUR/ ;;
        "☁️  One Drive") folder=/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/OneDrive/ ;;
        "📡  MyCloud HOME") folder=smb://mycloudex2ultra/ ;;
        "📡  MyCloud DWM Backup") folder=smb://mycloudex2ultra/_linux_backup/_DISTROS/DWM_Configs/ROG/ ;;
        "📡  iCloud Photo Library on MyCloud") folder=smb://mycloudex2ultra/iCloud_Photo_Backup/ ;;
        "🎮  XBOX on MyCloud") folder=smb://mycloudex2ultra/xbox/ ;;
        "📤  Files For Transfer") folder=smb://mycloudex2ultra/transfer/⭐_File_Transfer/ ;;
        "📤  VM SAMBA") folder=/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/_SAMBA/ ;;
        "📸  Wallpapers") folder=/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/Wallpaper/ ;;
        "📸  Internet Pictures") folder=smb://mycloudex2ultra/pictures_from_the_internet/ ;;
        "🎥  TV Shows") folder=smb://mycloudex2ultra/TV/ ;;
        "🎥  JAV") folder=smb://mycloudex2ultra/jav/ ;;
        "🎥  P") folder=smb://mycloudex2ultra/p/ ;;
        "🔐  Cursors & Icons") folder=exec kitty -e /home/j3ll0/.config/scripts/polybar/icons.sh ;;
        "🔐  Window Themes") folder=exec kitty -e /home/j3ll0/.config/scripts/polybar/themes.sh ;;
        "🔐  LightDM Themes") folder=exec kitty -e /home/j3ll0/.config/scripts/polybar/lightdm.sh ;;
        "🧰  .suckless") folder=/home/j3ll0/.suckless/ ;;
        "🧰  .config") folder=/home/j3ll0/.config/ ;;
        "🧰  SCRIPTS") folder=/home/j3ll0/.config/scripts/ ;;
        "🔧  POLYBAR SCRIPTS") folder=/home/j3ll0/.config/scripts/polybar/ ;;
        "📀  ISO's") folder=/mnt/4681ad39-ed76-4fe7-ab87-d3a03816a8a1/ISO/ ;;
        "📺  YouTube Etc.") folder=smb://mycloudex2ultra/youtube/ ;;        
    esac

    # Open the folder
    [ -n "$folder" ] && exec thunar "$folder"
}

main
