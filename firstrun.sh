#!/bin/zsh
#
# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

# fetch oh-my-zsh configs
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

mkdir -p ~/.config/dwb
curl -L https://easylist-downloads.adblockplus.org/easylist.txt > ~/.config/dwb/easylist.txt

# remove oh-my-zsh default .zshrc (if a .zshrc existed before installing oh-my-zsh it was backed up)
rm ~/.zshrc

git submodule init
git submodule update

./symlink.sh
