#!/usr/bin/zsh

while true; do
	wallpaper="$(find annex/images/wallpapers -type l \( -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' -o -name '*.gif' \) -print0 | shuf -n1 -z | xargs -0 echo)"
	echo $wallpaper
	if [[ $HOST == "lappy" ]]; then
		ssh -o ConnectTimeout=10 -o BatchMode=yes ircscreen@fruitiex.org DISPLAY=:0 feh --bg-fill \"$wallpaper\" &
	fi

	DISPLAY=:0 feh --bg-fill "$wallpaper"

	if [[ $1 == "-o" ]]; then
		exit $?
	fi
	sleep 15m
done
