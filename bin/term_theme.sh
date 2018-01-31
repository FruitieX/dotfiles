#!/usr/bin/env bash

# return 255 terminal color code for requested theme variable

# first look for the color code by calling theme.sh normally
color=$($HOME/bin/theme.sh $1)

# grep color from .theme.cfg, assuming that $color matches with a base16 color
base=$(grep "base0. $color" $HOME/.theme.cfg | tail -n1 | cut -d' ' -f1)

case $base in
base00) echo 0 ;;
base01) echo 18 ;;
base02) echo 19 ;;
base03) echo 8 ;;
base04) echo 20 ;;
base05) echo 7 ;;
base06) echo 21 ;;
base07) echo 15 ;;
base08) echo 9 ;;
base09) echo 16 ;;
base0A) echo 11 ;;
base0B) echo 10 ;;
base0C) echo 14 ;;
base0D) echo 12 ;;
base0E) echo 5 ;;
base0F) echo 17 ;;
esac
