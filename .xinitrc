###function defer {
	#sleep 2
	#xsetroot -cursor ~/none.xbm ~/none.xbm
###}

# [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# e.g. stlarch lives here
#xset +fp /usr/share/fonts/local/ &

# disable turning screen off automatically
xset -dpms &
xset s off &
start-pulseaudio-x11

#xset m 1 1 &
#xflux -l 0
#redshift -l 0:0 &
#VBoxClient-all &

# configs
#urxvtd &
xmodmap .Xmodmap &
#nvidia-settings -l &
#xsetroot -cursor_name /dev/null &

# autostart
#~/bin/wallpaper.sh &
#~/bin/steam.sh &
#dwb &
#numlockx &
#synergys -c ~/.synergy.conf &

#xrandr --output LVDS1 --set "scaling mode" Full &
xrandr --output DVI-0 --rotate left &
#defer &
unset TMUX
urxvt -e tmux &
unclutter -idle 3 &
exec i3
