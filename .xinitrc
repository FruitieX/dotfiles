# [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# e.g. terminus-font lives here
xset +fp /usr/share/fonts/local
xset fp rehash

xrandr --output HDMI1 --right-of eDP1 --mode 1920x1080

# disable turning screen off automatically
xset -dpms &
xset s off &

xset m 1 1 &
synclient PalmDetect=1 MaxSpeed=3 TouchpadOff=1 &
#xflux -l 0
#redshift -l 0:0 &
VBoxClient-all &
start-pulseaudio-x11
pasystray &

# configs
#urxvtd &
xmodmap .Xmodmap &
nvidia-settings -l &
xsetroot -cursor_name left_ptr &

# autostart
~/bin/wallpaper.sh &
~/bin/steam.sh &
urxvt -title tmux -e tmux &
urxvt -title irc -e weechat-curses &
cd ~/.config/dwb
dwb &
cd
numlockx &
synergyc lappy &
dunst &

unclutter -idle 3 &
#xrandr --output LVDS1 --set "scaling mode" Full &

#exec xmonad
exec i3
#exec bspwm

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

