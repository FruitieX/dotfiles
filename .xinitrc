# [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# e.g. stlarch lives here
xset +fp /usr/share/fonts/local/
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
/home/rasse/dev/sh/wallpaper.sh &
/home/rasse/dev/sh/steam.sh &
urxvt -title tmux -e tmux &
firefox &
xchat &
numlockx &
synergys -c ~/.synergy.conf

#xrandr --output LVDS1 --set "scaling mode" Full &

#/home/rasse/dev/sh/startwm
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

