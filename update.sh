#!/bin/zsh

set -e # quit if merge fails

# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

git pull
git submodule sync
git submodule update --init --recursive
git submodule foreach --recursive git checkout master
git submodule foreach --recursive git pull origin master

./symlink.sh -y
