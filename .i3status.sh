#!/bin/bash
echo '{ "version": 1 }'
echo '['
echo '[]'

while :;
do

	cpu=$(top -b -n 1  | awk -F'[:,]' '/^Cpu/{sub("\\..*","",$2); print $2}')
	echo ",[\
		{\"full_text\":\"$cpu\"},\
		{\"full_text\":\"$(date '+%a %d.%m.%Y %H:%M:%S')\"},\
	]"
	sleep 1
done
