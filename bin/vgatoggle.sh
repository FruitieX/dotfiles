#!/bin/bash

# projector
if [[ $1 == 'p' ]]; then
	xrandr | grep "VGA-0 connected" > /dev/null
	if [ $? -ne 0 ]; then
		echo "VGA-0 not connected!"
		exit
	else
		xrandr --output VGA-0 --mode 1280x720 --rate 120
		xrandr --output LVDS-0 --off
		xrandr --output VGA-0 --mode 1280x720 --rate 120
		xrandr --output HDMI-0 --off
	fi
# work
elif [[ $1 == 'w' ]]; then
	xrandr | grep "VGA-0 connected" > /dev/null
	if [ $? -ne 0 ]; then
		echo "VGA-0 not connected!"
		exit
	else
		xrandr --output LVDS-0 --mode 1920x1080 --rate 120
		xrandr --output HDMI-0 --off
		xrandr --output LVDS-0 --mode 1920x1080 --rate 120
		xrandr --output VGA-0 --mode 1920x1080 --rate 60 --right-of LVDS-0
	fi
# laptop
elif [[ $1 == 'l' ]]; then
	xrandr --output LVDS-0 --mode 1920x1080 --rate 120
	xrandr --output HDMI-0 --off
	xrandr --output LVDS-0 --mode 1920x1080 --rate 120
	xrandr --output VGA-0 --off
# home
else
	xrandr | grep "HDMI-0 connected" > /dev/null
	if [ $? -ne 0 ]; then
		echo "HDMI-0 not connected!"
		exit
	else
		xrandr --output LVDS-0 --mode 1920x1080 --rate 120
		xrandr --output VGA-0 --off
		xrandr --output LVDS-0 --mode 1920x1080 --rate 120
		xrandr --output HDMI-0 --mode 1920x1080 --rate 75 --left-of LVDS-0
	fi
fi

~/bin/wallpaper.sh -o
herbstclient reload
