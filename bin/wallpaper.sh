#!/bin/sh

while true; do
	find ~/annex/images/wallpapers -type l \( -name '*.jpg' -o -name '*.png' -o -name '*.jpeg' -o -name '*.gif' \) -print0 | shuf -n1 -z | xargs -0 feh --bg-fill
	if [[ $1 == "-o" ]]
	then
		exit $?
	fi
	sleep 15m
done
