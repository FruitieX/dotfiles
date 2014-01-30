# e.g. terminus-font lives here
xset +fp /usr/share/fonts/local
xset fp rehash

# disable turning screen off automatically
xset -dpms &
xset s off &
# disable mouse accel
xset m 1 1 &

unset TMUX

# autostart, all hosts
redshift -l 0:0 &
VBoxClient-all &
xsetroot -cursor_name left_ptr &
xmodmap .Xmodmap &
start-pulseaudio-x11
compton --config ~/.compton.conf &

# autostart, host-specific
if [[ $HOSTNAME == "mba" ]]; then
	xrandr --output HDMI1 --right-of eDP1 --mode 1920x1080
	synclient PalmDetect=1 MaxSpeed=3 TouchpadOff=1 &
	#synergyc lappy &
#elif [[ $HOSTNAME == "lappy" ]]; then
	#synergys -c ~/.synergy.conf &
	#nvidia-settings -l &
fi

if [[ $HOSTNAME == "servy" ]]; then
	xrandr --output DVI-0 --rotate left
	~/bin/wallpaper.sh -o &
	killall mpd tmux
	urxvt -title tmux -e ~/bin/tmx &
	mpd
else
	if [[ $HOSTNAME == "lappy" ]]; then
		~/bin/vgatoggle.sh &
	fi

	~/bin/steam.sh &
	urxvt -title tmux -e ~/bin/tmx &
	nm-applet &
	numlockx &
	pasystray &
fi

dunst -nf "#efefef" -lf "#9a875f" -cf "9a4747" -nb "#000000" -lb "#000000" -cb "#000000" -lto 5 -nto 5 -cto 0 -fn "Terminus 8" -geometry 600x14+172+2 &

unclutter -idle 3 &

exec herbstluftwm --locked
