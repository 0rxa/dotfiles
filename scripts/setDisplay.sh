#!/bin/sh

display=$(xrandr -q | awk '{print $1}' | grep "^[A-Z]" | tail -n +2 | dmenu -i)

resolution=$(echo | dmenu)

xrandr --output $display --mode $resolution --pos 0x0 --rotate normal --output LVDS-1 --primary --mode 1600x900 --pos 1680x0 --rotate normal --output HDMI-3 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off
