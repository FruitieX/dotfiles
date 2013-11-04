#!/usr/bin/zsh

while true ; do
	export PANEL_FIFO=/tmp/panel-fifo
	export BSPWM_SOCKET=/tmp/bspwm-socket
	bspwm -c ~/.config/bspwm/bspwmrc -s "$PANEL_FIFO" -p W || break
done
