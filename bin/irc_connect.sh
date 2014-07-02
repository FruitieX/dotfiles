#!/bin/bash

source ~/.ircpw

II=$HOME/src/ii/ii
IRCPATH=$HOME/irc
SERVER=fruitiex.org
PORT=6667
RECONNECT_DELAY=3
NICK="FruitieX"

connect() {
	while true; do
		IRCPASS="$2" $II -i $IRCPATH/$1 -s $SERVER -p $PORT -k "IRCPASS" -n $NICK
		sleep $RECONNECT_DELAY
	done
}

connect qnet $IRCPASS_QNET &
connect freenode $IRCPASS_FREENODE &
connect hut $IRCPASS_HUT &
