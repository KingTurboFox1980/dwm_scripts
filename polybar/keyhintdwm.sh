#!/usr/bin/env bash
#
declare -a options=(
"PICOM TOGGLE                    -    F12"
"AUTO MAINTENANCE                -      + Numpad +"
"(D-MENU) Check For Updates      -    Numpad + "
"(D-MENU) DWM MENU               -    Numpad -"
"(D-MENU) NOTIFICATIONS          -      + N "
"FAVORITE FOLDERS                -    ROG KEY"
"MOVE WINDOW THROUGH TAGS        -      + CTRL +   / "
"WEB SEARCH (D-MENU)             -      + S"
"WEB SEARCH (ROFI)               -      + Shift + S"
"System Monitor                  -      + ESCAPE"
"Screen(s) Off                   -    F6 / F11"
"Screen Brightness DOWN          -    FN + F7"
"Screen Brightness UP            -    FN + F8"
"Keyboard Brightness DOWN        -    FN + "
"Keyboard Brightness UP          -    FN + "
"Close Program                   -      + Q "
"DWM Configs                     -    Numpad *"
"DWM RESTART LOOP                -      + Shift + Q"
"DWM RECOMPILE MENU              -      + Shift + R"
"DWM POWER MENU                  -      + X "
"EXIT DWM                        -    ctrl + alt + backspace"
"KEYHINTS FOR DWM                -    F5"
"KEYHINTS FOR VIM                -    SHIFT + F5"
"REDSHIFT (Monitor Warmth)       -    SHIFT + F9"
"Pywal Wallpaper (AUTO)          -    MIC MUTE KEY"
"RELOAD POLYBAR                  -    Numpad /"
"Screen Layout (Arandr)          -    F9"
"Toggle DWM Bar and Polybar      -      + B "
"Move A Window to L/R Monitor    -      + SHIFT +   / "
"Move All Windows to L/R Monitor -    CTRL  + SHIFT +   / "
"Rotate Stack                    -      +   /   "
"Resize Stack                    -      +   /  "
"Toggle Window Full-Screen       -      + F "
"Move Window                     -      + Left Click and Drag"
"Resize Window                   -      + Right Click and Drag"
"Reset Window to Tiling          -    Numpad ."
"Volume Control                  -      + Shift + V"
"D-Menu                          -      + SHIFT + Z"
"ROFI                            -      + Z "
"Cider Music                     -      + A "
"Code-OSS                        -      + C"
"Evolution E-Mail                -      + E"
"OneNote                         -      + O"
"Rclone Browser                  -      + R"
"THUNAR                          -      + T"
"QEMU Virt-Manager               -      + V"
"Vivaldi Web Browser             -      + W"
"Edge Web Browser                -      + Shift + W"
"Kitty Terminal                  -      + Return"
""
"quit"
)

# Picking a search engine.
while [ -z "$engine" ]; do
enginelist=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i 20 -p '  =  ') || exit
engineurl=$(echo "$enginelist" | awk '{print $NF}')
engine=$(echo "$enginelist" | awk '{print $1}')
done

# Searching the chosen engine.
while [ -z "$query" ]; do
query=$(rofi -dmenu -i 20 -p "Searching $engine:") || exit
done

# Display search results in web browser
$DMBROWSER "$engineurl""$query"








#!/usr/bin/env bash
#
# Script name: dmsearch

# Defining our web browser.
DMBROWSER="firefox"

# An array of search engines.  You can edit this list to add/remove
# search engines. The format must be: "engine_name - url".
# The url format must allow for the search keywords at the end of the url.
# For example: https://www.amazon.com/s?k=XXXX searches Amazon for 'XXXX'.
declare -a options=(

"quit"
)

# Picking a search engine.
while [ -z "$engine" ]; do
enginelist=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i 20 -p 'Choose search engine:') || exit
engineurl=$(echo "$enginelist" | awk '{print $NF}')
engine=$(echo "$enginelist" | awk '{print $1}')
done

# Searching the chosen engine.
while [ -z "$query" ]; do
query=$(rofi -dmenu -i 20 -p "Searching $engine:") || exit
done

# Display search results in web browser
$DMBROWSER "$engineurl""$query"
