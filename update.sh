#!/bin/zsh

set -e # quit if merge fails

# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

git pull
git submodule sync
#git submodule init
#git submodule update
git submodule foreach git checkout master
git submodule foreach git pull origin master

./compile.sh
./symlink.sh -y

xrdb ~/.Xdefaults
source ~/.zshrc
herbstclient reload
hsetroot -solid $($HOME/bin/theme.sh bg)
