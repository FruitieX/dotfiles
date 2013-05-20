#!/bin/zsh

# fetch oh-my-zsh configs
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# remove oh-my-zsh default .zshrc (if a .zshrc existed before installing oh-my-zsh it was backed up)
rm ~/.zshrc
