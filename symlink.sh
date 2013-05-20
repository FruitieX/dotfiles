#!/bin/zsh

for FILE in .[^.git]*; do
	if [ ! -f "$HOME/$FILE" ] && [ ! -d "$HOME/$FILE" ];
	then
		echo "$FILE => $HOME/$FILE"
		ln -sr $FILE $HOME/$FILE
	fi
done

echo "done!"
