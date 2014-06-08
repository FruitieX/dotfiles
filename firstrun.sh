#!/bin/zsh
#
# cd to root of git repo
cd "$(dirname $0)"
CWD=$(pwd)

# fetch oh-my-zsh configs
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

mkdir -p ~/.config/dwb
curl -L https://easylist-downloads.adblockplus.org/easylist.txt > ~/.config/dwb/easylist.txt

# remove oh-my-zsh default .zshrc (if a .zshrc existed before installing oh-my-zsh it was backed up)
rm ~/.zshrc

git submodule init
git submodule update

./symlink.sh

# vim undo files will be stored here
mkdir -p ~/.vim/undo

cd .vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
# TODO: this is dumb to run again
cd $CWD
./symlink.sh

mkdir -p ~/.oh-my-zsh/custom/plugins
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search
git clone https://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions
git clone git@github.com:chriskempson/base16-shell.git ~/.config/base16-shell
