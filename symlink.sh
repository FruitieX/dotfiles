#!/bin/zsh

# symlink individual files from this array
FILES=( "bin" ".config" ".oh-my-zsh" ".synergy.conf" ".tmux.conf" ".urlview" ".vimrc" ".weechat" ".Xdefaults" ".xinitrc" ".Xmodmap" ".zshrc" )
# symlink entire directories from this array
DIRS=( ".vim" ".i3" )

# cd to root of git repo
cd $(dirname $0)
CWD=$(pwd)

echo "WARNING! this script will backup the following files and put symlinks in their place:"
for FILE in $(find $FILES -type f); do
	echo "$HOME/$FILE"
done
echo

echo "WARNING! this script will backup the following directories and put symlinks in their place:"
for DIR in $DIRS; do
	echo "$HOME/$DIR"
done
echo

echo "are you sure you want to continue? (y/n)"
read answer

if [[ "$answer" != "y" ]]; then
	echo "aborting."
	exit
fi

echo && echo "symlinking..."

# symlink files
for FILE in $(find $FILES -type f); do

	# create parent directies if they do not exist
	if [ ! -d $(dirname "$HOME/$FILE") ]; then
		mkdir -p $(dirname "$HOME/$FILE")
	fi

	# if file is a symlink, remove it and later make a new symlink
	if [ -L "$HOME/$FILE" ]; then
		rm "$HOME/$FILE"
	# elif file already exists but is not backed up, make a backup
	elif [ -f "$HOME/$FILE" -a ! -f "$HOME/$FILE.bak" ]; then
		echo "backed up $HOME/$FILE => $HOME/$FILE.bak"
		mv "$HOME/$FILE" "$HOME/$FILE.bak"
	fi

	echo "$FILE => $HOME/$FILE"
	ln -sr "$FILE" "$HOME/$FILE"
done

# symlink dirs
for DIR in $DIRS; do

	# if dir is a symlink, remove it and later make a new symlink
	if [ -L "$HOME/$DIR" ]; then
		rm -r "$HOME/$DIR"
	# elif dir already exists but is not backed up, make a backup
	elif [ -d "$HOME/$DIR" -a ! -d "$HOME/$DIR.bak" ]; then
		echo "backed up $HOME/$DIR => $HOME/$DIR.bak"
		mv "$HOME/$DIR" "$HOME/$DIR.bak"
	fi

	echo "$DIR => $HOME/$DIR"
	ln -sr "$DIR" "$HOME/$DIR"
done

echo "all done!"
