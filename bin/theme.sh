#!/bin/bash

# return color for requested theme variable
grep "^$1 " $HOME/.theme.cfg | tail -n1 | cut -d' ' -f2

