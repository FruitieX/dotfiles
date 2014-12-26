#!/bin/zsh

set -e # quit if merge fails

# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

cd .zprezto
git remote add upstream https://github.com/sorin-ionescu/prezto || true 2>/dev/null
git pull upstream master
git checkout master
cd "$CWD"

git pull
git submodule sync
git submodule update --init --recursive
git submodule foreach --recursive git pull origin master
git submodule foreach --recursive git checkout master

./symlink.sh -y
