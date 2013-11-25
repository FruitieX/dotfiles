# e.g. terminus-font lives here
xset +fp /usr/share/fonts/local
xset fp rehash

# disable turning screen off automatically
xset -dpms &
xset s off &
# disable mouse accel
xset m 1 1 &

# autostart, all hosts
redshift -l 0:0 &
VBoxClient-all &
xsetroot -cursor_name left_ptr &
xmodmap .Xmodmap &
start-pulseaudio-x11

# autostart, host-specific
if [[ $HOSTNAME == "mba" ]]; then
	xrandr --output HDMI1 --right-of eDP1 --mode 1920x1080
	synclient PalmDetect=1 MaxSpeed=3 TouchpadOff=1 &
	synergyc lappy &
elif [[ $HOSTNAME == "lappy" ]]; then
	synergys -c ~/.synergy.conf &
	#nvidia-settings -l &
fi

if [[ $HOSTNAME == "servy" ]]; then
	#xrandr --output DVI-0 --rotate left
	~/bin/wallpaper.sh -o &
	killall mpd tmux
	mpd
else
	~/bin/wallpaper.sh &
	~/bin/steam.sh &
	urxvt -title tmux -e ~/bin/tmx &
	firefox-nightly &
	xfce4-panel --disable-wm-check &
	nm-applet &
	numlockx &
	pasystray &
fi

dunst &
unclutter -idle 3 &

export PANEL_FIFO=/tmp/panel-fifo
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
~/bin/bspwm.sh
