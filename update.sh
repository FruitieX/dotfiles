#!/bin/zsh

set -e # quit if anything fails

# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

git pull

# ~/.zprezto
cd $HOME/.zprezto
    git pull && git submodule update --init --recursive
cd $CWD

# ~/src/v
cd $HOME/src/v
    git pull
cd $CWD

# ~/src/z
cd $HOME/src/z
    git pull
cd $CWD

./symlink.sh -y
