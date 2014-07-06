#!/bin/zsh

# compile colors
FILES=( .Xdefaults )

# cd to root of git repo
cd "$(dirname $0)"
DOTFILES=$(pwd)

rm -r compiled
mkdir compiled
touch compiled/DO_NOT_EDIT_FILES_IN_THIS_DIRECTORY

function find_and_replace() {
	if [[ ! -f compiled/$1 ]]; then
		cp $1 compiled/$1
	fi
	sed -i -e "s/$2/$($HOME/bin/theme.sh $3)/g" compiled/$1
}

function symlink() {
	# TODO: prettier solution needed. integration with symlink.sh?
	rm "$HOME/$1"
	ln -s "$DOTFILES/compiled/$1" "$HOME/$1"
}

find_and_replace ".Xdefaults" "\$HOME" "HOME"
find_and_replace ".Xdefaults" "\$font" "font"
find_and_replace ".Xdefaults" "\$active_fg" "active_fg"
find_and_replace ".Xdefaults" "\$active_bg" "active_bg"
symlink ".Xdefaults"

find_and_replace ".tmux.conf" "\$active_fg" "active_fg"
find_and_replace ".tmux.conf" "\$inactive_fg" "inactive_fg"
symlink ".tmux.conf"
