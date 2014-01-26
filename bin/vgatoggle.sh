#!/bin/bash

xrandr | grep "VGA-0 connected" > /dev/null
vga=$?
xrandr | grep "HDMI-0 connected" > /dev/null
hdmi=$?

if [[ $vga -eq 0 && $hdmi -eq 0 ]]; then
	# desktop
	xrandr --output HDMI-0 --mode 1920x1080 --rate 75
	xrandr --output LVDS-0 --off
	xrandr --output HDMI-0 --mode 1920x1080 --rate 75
	xrandr --output VGA-0 --mode 1920x1080 --rate 60 --right-of HDMI-0
elif [[ $vga -eq 0 ]]; then
	# projector
	xrandr --output VGA-0 --mode 1280x720 --rate 120
	xrandr --output LVDS-0 --off
	xrandr --output VGA-0 --mode 1280x720 --rate 120
	xrandr --output HDMI-0 --off
elif [[ $hdmi -eq 0 ]]; then
	# home
	xrandr --output LVDS-0 --mode 1920x1080 --rate 120
	xrandr --output VGA-0 --off
	xrandr --output LVDS-0 --mode 1920x1080 --rate 120
	xrandr --output HDMI-0 --mode 1920x1080 --rate 75 --left-of LVDS-0
else
	# laptop
	xrandr --output LVDS-0 --mode 1920x1080 --rate 120
	xrandr --output HDMI-0 --off
	xrandr --output LVDS-0 --mode 1920x1080 --rate 120
	xrandr --output VGA-0 --off
fi

~/bin/wallpaper.sh -o
herbstclient reload

# work
#elif [[ $1 == 'w' ]]; then
	#xrandr | grep "VGA-0 connected" > /dev/null
	#if [ $? -ne 0 ]; then
		#echo "VGA-0 not connected!"
		#exit
	#else
		#xrandr --output LVDS-0 --mode 1920x1080 --rate 120
		#xrandr --output HDMI-0 --off
		#xrandr --output LVDS-0 --mode 1920x1080 --rate 120
		#xrandr --output VGA-0 --mode 1920x1080 --rate 60 --right-of LVDS-0
	#fi
