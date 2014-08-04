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

set -e # quit on failure

# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

./update.sh

# vim undo files will be stored here
mkdir -p ~/.vim/undo

cd .vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh
# TODO: this is dumb to run again
cd $CWD

#git clone https://github.com/zsh-users/zsh-syntax-highlighting
#git clone https://github.com/zsh-users/zsh-history-substring-search
#git clone https://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions

./symlink.sh -y
./compile.sh
