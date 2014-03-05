# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fruitmini"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true" # don't ask

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux rsync vi-mode zsh-syntax-highlighting zsh-history-substring-search)

if [ -f ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi
source $ZSH/oh-my-zsh.sh

alias sr="ssh rasse@fruitiex.org"
alias vmx="startx -- -config xorg.vm"
alias l="ll"
alias netmenu="sudo wifi-menu -o"
alias gx="git annex"
alias slp="systemctl suspend"
alias ds="dirs -v"
alias hc="herbstclient"
alias startx="ssh-agent startx"

export BROWSER="firefox-nightly"
export EDITOR="vim"
export VISUAL="vim"
export PAGER="vimpager"

export PATH="${PATH}:${HOME}/bin:${HOME}/dev/sh:${HOME}/android/sdk/android-sdk-linux/tools:${HOME}/android/sdk/android-sdk-linux/platform-tools:${HOME}/android/ndk/android-ndk-r8d"
export ANDROID_HOME="~/android/sdk/android-sdk-linux"
eval "$(dircolors ~/.dir_colors)"

unset SSH_ASKPASS

# Disable ctrl-s sending XOFF
stty ixany
stty ixoff -ixon

setopt DVORAK

# use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
#bindkey -M menuselect 'j' vi-down-line-or-history # bottom, unfortunately the command below interferes with this
bindkey -M viins 'jj' vi-cmd-mode # 'jj' takes you into cmd mode

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey -M vicmd 'k' up-line-or-search
bindkey -M vicmd 'j' down-line-or-search

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
#source ~/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
#zle-line-init() {
	#zle autosuggest-start
#}
#zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
#bindkey '^T' autosuggest-toggle
# Accept suggestions without leaving insert mode
#bindkey '^f' vi-forward-word

# zsh-history-substring-search keybinds
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export TERM=screen-256color

BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3
#zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/rasse/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

~/bin/tmx
if [[ -z "$TMUX" ]]; then
	exit
fi
