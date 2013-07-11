#!/bin/zsh

# TODO does this filter all files containing any of these chars??
for FILE in .[^.git]*; do
	if [ ! -f "$HOME/$FILE" ] && [ ! -d "$HOME/$FILE" ];
	then
		echo "$FILE => $HOME/$FILE"
		ln -sr "$FILE" "$HOME/$FILE"
	fi
done

# pentadactyl does not like unix dot notation :p
if [ ! -f "$HOME/_pentadactylrc" ];
then
	echo "_pentadactylrc => $HOME/_pentadactylrc"
	ln -sr "_pentadactylrc" "$HOME/_pentadactylrc"
fi

# custom oh-my-zsh theme
if [ ! -f "$HOME/.oh-my-zsh/themes/powerline.zsh-theme" ];
then
	echo "powerline.zsh-theme => $HOME/.oh-my-zsh/themes/powerline.zsh-theme"
	ln -sr "powerline.zsh-theme" "$HOME/.oh-my-zsh/themes/powerline.zsh-theme"
fi

# dwb config
if [ ! -f "$HOME/.config/dwb" ];
then
	echo ".config/dwb => $HOME/.config/dwb"
	ln -sr ".config/dwb" "$HOME/.config/dwb"
fi

# ~/bin
if [ ! -d "$HOME/bin" ];
then
	mkdir ~/bin
fi

for FILE in bin/*; do
	if [ ! -f "$HOME/$FILE" ] && [ ! -d "$HOME/$FILE" ];
	then
		echo "$FILE => $HOME/$FILE"
		ln -sr "$FILE" "$HOME/$FILE"
	fi
done

echo "done!"
