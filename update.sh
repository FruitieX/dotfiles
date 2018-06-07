#!/usr/bin/env zsh

set -e # quit if anything fails

# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

echo "Updating $HOME/dotfiles"
git pull
echo

# ~/.zprezto
cd $HOME/.zprezto
    echo "Updating $HOME/.zprezto"
    git pull && git submodule update --init --recursive
    echo
cd $CWD

#for repo in "$HOME/src/v" "$HOME/src/z"; do
#    echo Updating $repo
#    cd $repo
#    git pull
#    echo
#done

cd $CWD

./symlink.sh -y
