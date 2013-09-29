# e.g. terminus-font lives here
xset +fp /usr/share/fonts/local
xset fp rehash

# disable turning screen off automatically
xset -dpms &
xset s off &
xset m 1 1 &

#xflux -l 0
redshift -l 0:0 &
VBoxClient-all &
start-pulseaudio-x11

# configs
xmodmap .Xmodmap &

# autostart
# host-specific
if [[ $HOSTNAME == "mba" ]]; then
	xrandr --output HDMI1 --right-of eDP1 --mode 1920x1080
	synclient PalmDetect=1 MaxSpeed=3 TouchpadOff=1 &
	synergyc lappy &
elif [[ $HOSTNAME == "lappy" ]]; then
	synergys -c ~/.synergy.conf &
	#nvidia-settings -l &
fi

if [[ $HOSTNAME == "servy" ]]; then
	xrandr --output DVI-0 --rotate left
	~/bin/wallpaper.sh &
	unset TMUX
	urxvt -e ~/bin/tmx &
else
	~/bin/wallpaper.sh &
	~/bin/steam.sh &
	urxvt -title tmux -e tmux &
	urxvt -title irc -e weechat-curses &
	firefox &
	connman-ui-gtk &
	numlockx &
	pasystray &
fi

dunst &
unclutter -idle 3 &

exec i3

# SLiM session selector
#DEFAULT_SESSION=/home/rasse/bin/startdwm
#case $1 in
#kde)
#	exec startkde
#	;;
#*)
#	exec $DEFAULT_SESSION
#	;;
#esac
