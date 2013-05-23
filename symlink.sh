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
	echo "_pentadactylrc => $HOME/_pentadactylrc"
	ln -sr "_pentadactylrc" "$HOME/_pentadactylrc"
fi

# custom oh-my-zsh theme
if [ ! -f "$HOME/.oh-my-zsh/themes/powerline.zsh-theme" ];
then
	echo "powerline.zsh-theme => $HOME/.oh-my-zsh/themes/powerline.zsh-theme"
	ln -sr "powerline.zsh-theme" "$HOME/.oh-my-zsh/themes/powerline.zsh-theme"
fi

# ~/bin
if [ ! -d "$HOME/bin" ];
then
	echo "bin/ => $HOME/bin"
	ln -sr "bin" "$HOME/bin"
fi

echo "done!"
