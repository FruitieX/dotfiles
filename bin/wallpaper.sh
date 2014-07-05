#!/usr/bin/zsh

hsetroot -solid $($HOME/bin/theme.sh bg)

#cd ~
#while true; do
#	wallpaper="$(find ~/media/wallpapers/* \( -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' -o -name '*.gif' \) -print0 | shuf -n1 -z | xargs -0 echo)"
#	wallpaper="$(basename $wallpaper)"
#	echo $wallpaper
#	if [[ $HOST == "bulky" ]]; then
#		ssh -o ConnectTimeout=10 -o BatchMode=yes ircscreen@fruitiex.org DISPLAY=:0 feh --bg-fill \"/home/ircscreen/media/wallpapers/$wallpaper\"
#	elif [[ $HOST == "lappy" ]]; then
#		ssh -o ConnectTimeout=10 -o BatchMode=yes mba DISPLAY=:0 killall wallpaper.sh > /dev/null 2>&1
#		ssh -o ConnectTimeout=10 -o BatchMode=yes mba DISPLAY=:0 feh --bg-fill \"/home/rasse/media/wallpapers/$wallpaper\"
#	fi
#
#	DISPLAY=:0 feh --bg-fill "/home/rasse/media/wallpapers/$wallpaper"
#
#	if [[ $1 == "-o" ]]; then
#		exit $?
#	fi
#	sleep 15m
#done
