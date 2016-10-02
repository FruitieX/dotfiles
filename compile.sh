#!/bin/zsh

# compiles configuration files by swapping out variables with values from
# .theme.cfg
#
# also generate a wallpaper from bg.png with colors from .theme.cfg

# cd to root of git repo
cd "$(dirname $0)"
DOTFILES=$(pwd)

rm -r .compiled 2> /dev/null
mkdir .compiled
touch .compiled/DO_NOT_EDIT_FILES_IN_THIS_DIRECTORY

variables=$(cat .theme.cfg | cut -d' ' -f1 | sed '/^$/d')

# arguments: filename
function find_and_replace() {
    echo "find_and_replace $1"
    if [[ ! -f ".compiled/$1" ]]; then
        mkdir -p $(dirname ".compiled/$1")
        cp "$1" ".compiled/$1"
    fi
    echo $variables | while read -r var; do
        sed -i -e "s|\$$var|$($HOME/bin/theme.sh $var)|g" .compiled/$1
    done
}

# arguments: filename
function symlink() {
    # remove old symlink
    if [ -L "$HOME/$1" ]; then
        rm "$HOME/$1"
    fi

    # create parent directies if they do not exist
    if [ ! -d "$(dirname "$HOME/$1")" ]; then
        mkdir -p $(dirname "$HOME/$1")
    fi

    ln -s "$DOTFILES/.compiled/$1" "$HOME/$1"
}

find_and_replace ".Xdefaults"
symlink ".Xdefaults"

find_and_replace ".tmux.conf"
symlink ".tmux.conf"

find_and_replace ".config/dunst/dunstrc"
symlink ".config/dunst/dunstrc"

find_and_replace ".config/tint2/tint2rc"
symlink ".config/tint2/tint2rc"

find_and_replace ".colors/base16.sh"
symlink ".colors/base16.sh"

#find_and_replace ".mozilla/firefox/ynjiim1o.default/chrome/userChrome.css"
#symlink ".mozilla/firefox/ynjiim1o.default/chrome/userChrome.css"

#find_and_replace ".pentadactyl/colors/fruit.penta"
#symlink ".pentadactyl/colors/fruit.penta"

# generate wallpaper for color theme
#convert "$DOTFILES/bg.png" -fill "#$($DOTFILES/bin/theme.sh inactive_bg)" -opaque black "$DOTFILES/.compiled/bg.png" 2> /dev/null
#convert "$DOTFILES/.compiled/bg.png" -fill "#$($DOTFILES/bin/theme.sh active_bg)" -opaque white "$DOTFILES/.compiled/bg.png" 2> /dev/null

if [[ $DISPLAY == ":0" ]]; then
    xrdb ~/.Xdefaults
    source ~/.zshrc
    herbstclient reload
    xsetroot -solid black
    killall -SIGUSR1 tint2
    #feh --bg-fill ~/sdotfiles/wallpapers/blocks.jpg
fi
