#!/bin/zsh

# compiles configuration files by swapping out variables with values from
# .theme.cfg
#
# also generate a wallpaper from bg.png with colors from .theme.cfg

# cd to root of git repo
cd "$(dirname $0)"
DOTFILES=$(pwd)

rm -r .compiled
mkdir .compiled
touch .compiled/DO_NOT_EDIT_FILES_IN_THIS_DIRECTORY

variables=$(cat .theme.cfg | cut -d' ' -f1 | sed '/^$/d')

# arguments: filename
function find_and_replace() {
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
    rm "$HOME/$1"

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

find_and_replace ".colors/base16.sh"
symlink ".colors/base16.sh"

find_and_replace ".conkyrc"
symlink ".conkyrc"
screen_width=$(xrandr | head -n1 | cut -d' ' -f8)
echo "\
minimum_size $(($screen_width - 50))
maximum_width $(($screen_width - 50))
$(cat ~/.conkyrc)" > ~/.conkyrc

find_and_replace ".mozilla/firefox/ynjiim1o.default/chrome/userChrome.css"
symlink ".mozilla/firefox/ynjiim1o.default/chrome/userChrome.css"

find_and_replace ".pentadactyl/colors/fruit.penta"
symlink ".pentadactyl/colors/fruit.penta"

# generate wallpaper for color theme
convert "$DOTFILES/bg.png" -fill "#$($DOTFILES/bin/theme.sh inactive_bg)" -opaque black "$DOTFILES/.compiled/bg.png"
convert "$DOTFILES/.compiled/bg.png" -fill "#$($DOTFILES/bin/theme.sh active_bg)" -opaque white "$DOTFILES/.compiled/bg.png"

xrdb ~/.Xdefaults
source ~/.zshrc
herbstclient reload
feh --bg-tile ~/dotfiles/.compiled/bg.png
