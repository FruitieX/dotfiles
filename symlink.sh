#!/bin/zsh

# symlink individual files from this array
FILES=( "bin" ".config" ".oh-my-zsh" ".synergy.conf" ".tmux.conf" ".urlview" ".vimrc" ".weechat" ".Xdefaults" ".xinitrc" ".Xmodmap" ".zshrc" )
# symlink entire directories from this array
DIRS=( ".vim" ".i3" )

# cd to root of git repo
cd $(dirname $0)
CWD=$(pwd)

echo "WARNING! this script will OVERWRITE the following files with symlinks:"
for FILE in $(find $FILES -type f); do
	echo "$HOME/$FILE"
done
echo

echo "WARNING! this script will OVERWRITE the following directories (INCLUDING contents!) with symlinks:"
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
	echo "$FILE => $HOME/$FILE"

	# create parent directies if they do not exist
	if [ ! -d $(dirname "$HOME/$FILE") ]; then
		mkdir -p $(dirname "$HOME/$FILE")
	fi

	rm "$HOME/$FILE" > /dev/null 2&>1
	ln -sr "$FILE" "$HOME/$FILE"
done

# symlink dirs
for DIR in $DIRS; do
	echo "$DIR => $HOME/$DIR"
	rm -r "$HOME/$DIR" > /dev/null 2&>1
	ln -sr "$DIR" "$HOME/$DIR"
done

echo "all done!"
