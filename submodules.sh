#!/bin/bash

# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

git submodule init
git submodule update
