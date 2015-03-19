#!/usr/bin/env zsh

color00="$base00" # Base 00 - Black
color01="$base08" # Base 08 - Red
color02="$base0B" # Base 0B - Green
color03="$base0A" # Base 0A - Yellow
color04="$base0D" # Base 0D - Blue
color05="$base0E" # Base 0E - Magenta
color06="$base0C" # Base 0C - Cyan
color07="$base05" # Base 05 - White
color08="$base03" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="$base07" # Base 07 - Bright White
color16="$base09" # Base 09
color17="$base0F" # Base 0F
color18="$base01" # Base 01
color19="$base02" # Base 02
color20="$base04" # Base 04
color21="$base06" # Base 06

if [ -n "$TMUX" ]; then
  # tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
fi

# 16 color space
printf $printf_template 0  ${color00:0:2}/${color00:2:2}/${color00:4:2}
printf $printf_template 1  ${color01:0:2}/${color01:2:2}/${color01:4:2}
printf $printf_template 2  ${color02:0:2}/${color02:2:2}/${color02:4:2}
printf $printf_template 3  ${color03:0:2}/${color03:2:2}/${color03:4:2}
printf $printf_template 4  ${color04:0:2}/${color04:2:2}/${color04:4:2}
printf $printf_template 5  ${color05:0:2}/${color05:2:2}/${color05:4:2}
printf $printf_template 6  ${color06:0:2}/${color06:2:2}/${color06:4:2}
printf $printf_template 7  ${color07:0:2}/${color07:2:2}/${color07:4:2}
printf $printf_template 8  ${color08:0:2}/${color08:2:2}/${color08:4:2}
printf $printf_template 9  ${color09:0:2}/${color09:2:2}/${color09:4:2}
printf $printf_template 10 ${color10:0:2}/${color10:2:2}/${color10:4:2}
printf $printf_template 11 ${color11:0:2}/${color11:2:2}/${color11:4:2}
printf $printf_template 12 ${color12:0:2}/${color12:2:2}/${color12:4:2}
printf $printf_template 13 ${color13:0:2}/${color13:2:2}/${color13:4:2}
printf $printf_template 14 ${color14:0:2}/${color14:2:2}/${color14:4:2}
printf $printf_template 15 ${color15:0:2}/${color15:2:2}/${color15:4:2}

# 256 color space
if [ "$TERM" != linux ]; then
  printf $printf_template 16 ${color16:0:2}/${color16:2:2}/${color16:4:2}
  printf $printf_template 17 ${color17:0:2}/${color17:2:2}/${color17:4:2}
  printf $printf_template 18 ${color18:0:2}/${color18:2:2}/${color18:4:2}
  printf $printf_template 19 ${color19:0:2}/${color19:2:2}/${color19:4:2}
  printf $printf_template 20 ${color20:0:2}/${color20:2:2}/${color20:4:2}
  printf $printf_template 21 ${color21:0:2}/${color21:2:2}/${color21:4:2}
fi

# clean up
unset printf_template
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
