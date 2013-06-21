# [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# e.g. stlarch lives here
xset +fp /usr/share/fonts/local/ &

# disable turning screen off automatically
xset -dpms &
xset s off &

xset m 1 1 &
#xflux -l 0
redshift -l 0:0 &
VBoxClient-all &

# configs
#urxvtd &
xmodmap .Xmodmap &
nvidia-settings -l &
xsetroot -cursor_name left_ptr &

# autostart
~/bin/wallpaper.sh &
~/bin/steam.sh &
urxvt -title tmux -e tmux &
luakit &
xchat &
numlockx &
synergys -c ~/.synergy.conf &

#xrandr --output LVDS1 --set "scaling mode" Full &

exec xmonad

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

