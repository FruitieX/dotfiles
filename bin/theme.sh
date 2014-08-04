#!/bin/bash

# return color for requested theme variable
var=$(grep "^$1 " $HOME/.theme.cfg | tail -n1 | cut -d' ' -f2-)

# first char of result is a $, try replacing with a variable defined in .theme.cfg
if [[ ${var:0:1} == "\$" ]]; then
    var=$(grep "^${var:1} " $HOME/.theme.cfg | tail -n1 | cut -d' ' -f2-)
fi

echo $var
