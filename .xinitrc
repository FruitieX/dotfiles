feh --bg-tile ~/dotfiles/.compiled/bg.png &
xrdb ~/.Xdefaults
# e.g. terminus-font lives here
xset +fp /usr/share/fonts/local
#xset +fp ~/.fonts
#xset fp rehash

# disable turning screen off automatically
xset -dpms &
xset s off &
# disable mouse accel
xset m 1 1 &

unset TMUX

# autostart, all hosts
redshift -l 0:0 &
xsetroot -cursor_name left_ptr &
xmodmap ~/.Xmodmap &
compton --config ~/.compton.conf &
dunst &
unclutter -idle 3 &
dsjd &
parcellite &

# hostname specific setup
if [[ $HOSTNAME == "servy" ]]; then
	xrandr --output DVI-0 --rotate right
	killall tmux
	urxvt -title tmux -e ~/bin/tmx &
else
	if [[ $HOSTNAME == "lappy" ]]; then
		# work
		xrandr --newmode "1920x1200" 193.16 1920 2048 2256 2592 1200 1201 1204 1242 -HSync +Vsync
		xrandr --addmode VGA-0 "1920x1200"
		xrandr --output VGA-0 --mode "1920x1200" --left-of LVDS-0
		synergys -c ~/.synergy.conf &
	elif [[ $HOSTNAME == "mbp" ]]; then
        ~/bin/battery_checker.sh &
	elif [[ $HOSTNAME == "bulky" ]]; then
		# home
        xrandr --output HDMI1 --mode 1920x1080 --rate 75 --rotate left --pos 0x0
		xrandr --output HDMI2 --mode 1920x1080 --rate 75 --rotate normal --pos 1080x475
        xrandr --output VGA1 --mode 1920x1080 --rate 75 --rotate right --pos 3000x0
        #~/src/synergy/bin/synergyc --crypto-pass $(cat $HOME/.synergy_pass) -f 10.8.0.51:24800 > /dev/null 2>&1 &
	fi

	node ~/dev/node/nodifier/clients/notify-send/notify-send.js &
	nm-applet &
	numlockx &
	pasystray &
    start-pulseaudio-x11 &
fi

exec herbstluftwm --locked
