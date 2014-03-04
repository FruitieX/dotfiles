#!/bin/bash

COMMAND=$(tmux display-message -p '#{pane_current_command}')
DIR=$1 # L, R, U, D

case $DIR in
L)
	KEY=h
	;;
R)
	KEY=l
	;;
U)
	KEY=k
	;;
D)
	KEY=j
	;;
\\)
	(echo $COMMAND | grep -iq 'vim' && tmux send-keys 'C-\') ||
	(echo $COMMAND | grep -iq 'ssh' && tmux send-keys 'C-\' && tmux select-pane -l) ||
	tmux select-pane -l
	exit
	;;
esac

(echo $COMMAND | grep -iq 'vim' && tmux send-keys C-$KEY) ||
	(echo $COMMAND | grep -iq 'ssh' && tmux send-keys C-$KEY && tmux select-pane -$1) ||
	tmux select-pane -$1
