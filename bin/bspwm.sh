#!/usr/bin/zsh

while true ; do
	export PANEL_FIFO=/tmp/panel-fifo
	export BSPWM_SOCKET=/tmp/bspwm-socket
	if [[ $HOST == "servy" ]]; then
		bspwm -c ~/.config/bspwm/bspwmrc || break
	else
		bspwm -c ~/.config/bspwm/bspwmrc -s "$PANEL_FIFO" || break
	fi
done
