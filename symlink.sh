#!/bin/zsh

dosymlink()
{
	for FILE in $(find "$@"); do
		echo "$FILE => $HOME/$FILE"
		rm "$HOME/$FILE"

		# create parent directies if they do not exist
		if [ ! -d $(dirname "$HOME/$FILE") ]; then
			mkdir -p $(dirname "$HOME/$FILE")
		fi

		ln -sr "$FILE" "$HOME/$FILE"
	done
}

FILES=( ".config/dwb" ".oh-my-zsh/themes/powerline.zsh-theme" )

echo "WARNING! this script will OVERWRITE the following files/directories with symlinks:"
for FILE in $(find ${FILES[@]}); do
	echo "$HOME/$FILE"
done

echo "are you sure you want to continue? (y/n)"
read answer

if [[ "$answer" != "y" ]]; then
	echo "aborting."
	exit
fi

# cd to root of git repo
cd $(dirname $0)
CWD=$(pwd)

# create dirs
if [ ! -d "$HOME/bin" ]; then
	mkdir ~/bin
fi
if [ ! -d "$HOME/.config/dwb" ]; then
	mkdir "$HOME/.config/dwb"
fi

# TODO does this filter all files containing any of these chars??
for FILE in .[^.git]*; do
	echo "$FILE => $HOME/$FILE"
	rm "$HOME/$FILE"
	ln -sr "$FILE" "$HOME/$FILE"
done

# dwb config
dosymlink .config/dwb/ ".oh-my-zsh/themes/powerline.zsh-theme"

# ~/bin
for FILE in bin/*; do
	echo "$FILE => $HOME/$FILE"
	rm "$HOME/$FILE"
	ln -sr "$FILE" "$HOME/$FILE"
done

echo "all done!"
