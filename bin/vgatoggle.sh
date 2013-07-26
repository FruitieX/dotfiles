#!/bin/bash

# projector
if [[ $1 == '-p' ]]; then
	xrandr --output LVDS-0 --off
	xrandr --output VGA-0 --mode 1280x720 --rate 120
	xrandr --output HDMI-0 --off
# work
elif [[ $1 == '-w' ]]; then
	xrandr --output LVDS-0 --mode 1920x1080 --rate 120
	xrandr --output VGA-0 --mode 1920x1080 --rate 60 --right-of LVDS-0
	xrandr --output HDMI-0 --off
# home
else
	xrandr --output VGA-0 --off
	xrandr --output LVDS-0 --mode 1920x1080 --rate 120
	xrandr --output HDMI-0 --mode 1920x1080 --rate 75 --left-of LVDS-0
fi

~/bin/wallpaper.sh -o
