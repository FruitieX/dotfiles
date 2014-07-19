#!/bin/zsh

# cd to root of git repo
cd "$(dirname $0)"
DOTFILES=$(pwd)

rm -r .compiled
mkdir .compiled
touch .compiled/DO_NOT_EDIT_FILES_IN_THIS_DIRECTORY

variables=$(cat .theme.cfg | cut -d' ' -f1 | sed '/^$/d')

# arguments: filename, search string, replace with which variable
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
    # TODO: prettier solution needed. integration with symlink.sh?
    rm "$HOME/$1"
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
