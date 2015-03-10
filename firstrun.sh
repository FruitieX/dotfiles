#!/bin/zsh

echo "WARNING!"
echo "--------"
echo "Not only does this script do a LOT of magic to your home directory, it"
echo "will also (as root!) change your default shell to zsh."
echo
echo "Note that you should have installed at least packages git, zsh, tmux"
echo "before answering y here."
echo
echo "If you haven't done so yet, go and read through the script NOW!"
echo "You *probably* don't want to run it unless you want a set up exactly like"
echo "mine. In other cases, for your own safety, just manually symlink any"
echo "config files you want to your home directory. I will provide little to no"
echo "support if you break your system with this :)"
echo
echo "are you sure you want to continue? (y/n)"
read answer
if [[ "$answer" != "y" ]]; then
	echo "aborting."
	exit
fi

sudo chsh -s $(which zsh) $USER

# clone .zprezto repo
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# clone various tools into ~/src
mkdir "$HOME/src"
git clone https://github.com/rupa/v "$HOME/src/v"
git clone https://github.com/rupa/z "$HOME/src/z"

# cd to root of git repo
cd "$(dirname $0)"

./update.sh
