#!/usr/bin/zsh

IFS=$'\r\n' desktops=($(cat ~/.config/bspwm/desktops))

echo "${desktops[$1]}"
