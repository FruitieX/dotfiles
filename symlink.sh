#!/bin/bash

for FILE in $(find -maxdepth 1 -type f | grep -v "symlink.sh"); do
	FILE=$(basename $FILE)
	if [ ! -f "$HOME/$FILE" ];
	then
		echo "$FILE => $HOME/$FILE"
		ln -sr $FILE $HOME/$FILE
	fi
done

echo "done!"
