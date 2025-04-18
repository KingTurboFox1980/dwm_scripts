#!/bin/bash

if pgrep -x "picom" > /dev/null
then
    killall picom
    notify-send "PICOM" "OFF"
else
    picom -b --config /etc/xdg/picom.conf
    notify-send "PICOM" "ON"
fi
