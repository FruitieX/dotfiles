#!/bin/zsh

# recursively symlink all files from paths in this array
FILES=( bin .config .i3 .oh-my-zsh .synergy.conf .tmux.conf .urlview .vim* .weechat .Xdefaults .xinitrc .Xmodmap .zshrc )

# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

# dry run mode enabled?
if [[ $1 == '-d' ]]; then
	DRYRUN=echo
else
	DRYRUN=
fi

echo "WARNING! this script will backup the following files and put symlinks in their place:"
find "${FILES[@]}" -type f -printf "$HOME/%p\n"

echo -e "\nare you sure you want to continue? (y/n)"
read answer
if [[ "$answer" != "y" ]]; then
	echo "aborting."
	exit
fi

# symlink files
echo -e "\nsymlinking..."

find "${FILES[@]}" -type f -print0 | while read -d $'\0' FILE; do

	# create parent directies if they do not exist
	if [ ! -d "$(dirname "$HOME/$FILE")" ]; then
		$DRYRUN mkdir -p $(dirname "$HOME/$FILE")
	fi

	# if file is a symlink, remove it and later make a new symlink
	if [ -L "$HOME/$FILE" ]; then
		$DRYRUN rm "$HOME/$FILE"
	# elif file already exists, make a backup
	elif [ -f "$HOME/$FILE" ]; then
		$DRYRUN mv -f "$HOME/$FILE" "$HOME/$FILE.bak"
		echo "backed up $HOME/$FILE => $HOME/$FILE.bak"
	fi

	echo "$FILE => $HOME/$FILE"
	$DRYRUN ln -sr "$FILE" "$HOME/$FILE"
done

echo "all done!"
