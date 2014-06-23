cd
xrdb ~/.Xdefaults
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

BASE16_SCHEME="default"
~/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh

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
	if [[ $HOSTNAME == "lappy" || $HOSTNAME == "bulky" ]]; then
		~/bin/vgatoggle.sh &
	fi

	node ~/dev/node/nodifier/clients/notify-send/notify-send.js &
	~/bin/irc_connect.sh &
	~/bin/wallpaper.sh &
	~/bin/steam.sh &
	urxvt -title tmux -e ~/bin/tmx &
	nm-applet &
	numlockx &
	pasystray &
fi

dunst &

unclutter -idle 3 &

exec herbstluftwm --locked
