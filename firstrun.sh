#!/bin/zsh
#
#
echo "WARNING: This script does a LOT of magic to your home directory!"
echo "If you haven't done so yet, go and read through it NOW!"
echo "You *probably* don't want to run it unless you want a set up exactly like mine"
echo "In other cases, for your own safety, just manually symlink any config files you want to your home directory"
echo "I will provide little to no support if you break your system with this :)"
echo
echo "are you sure you want to continue? (y/n)"
read answer
if [[ "$answer" != "y" ]]; then
	echo "aborting."
	exit
fi

# clone .zprezto repo
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# clone various tools into ~/src
mkdir "$HOME/src"
git clone https://github.com/rupa/v "$HOME/src/v"
git clone https://github.com/rupa/z "$HOME/src/z"

# cd to root of git repo
cd "$(dirname $0)"

./update.sh
