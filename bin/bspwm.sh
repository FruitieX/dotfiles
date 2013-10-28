#!/usr/bin/zsh

while true ; do
	bspwm -s "$PANEL_FIFO" -p W || break
done
