#!/bin/bash
echo '{ "version": 1 }'
echo '['
echo '[]'

while :
do
    #id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
    #name=$(xprop -id $id | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
	date=$(date)
	echo ",[{\"name\":\"time\",\"full_text\":\"$(date)\"}]"
	sleep 1
done
