#!/bin/zsh

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
	ln -sr "_pentadactylrc" "$HOME/_pentadactylrc"
fi

# custom oh-my-zsh theme
if [ ! -f "$HOME/.oh-my-zsh/themes/powerline.zsh-theme" ];
then
	ln -sr "powerline.zsh-theme" "$HOME/.oh-my-zsh/themes/powerline.zsh-theme"
fi

echo "done!"
