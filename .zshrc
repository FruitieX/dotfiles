# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerline"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ant archlinux history-substring-search rsync tmux nyan vi-mode)

# colors
PROMPT_HOST_COLOR_BG=148
PROMPT_HOST_COLOR_FG=22
PROMPT_CWD_COLOR_BG=240
PROMPT_CWD_COLOR_FG=252
PROMPT_GIT_BG=236
PROMPT_GIT_FG=247
PROMPT_GIT_DIRTY_BG=252
PROMPT_GIT_DIRTY_FG=236

if [ -f ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi
source $ZSH/oh-my-zsh.sh

alias sr="ssh rasse@fruitiex.org"
alias vmx="startx -- -config xorg.vm"
alias l="ll"
alias netmenu="sudo netcfg-menu"

export BROWSER="luakit"
export EDITOR="vim"
export VISUAL="vim"
export PAGER="vimpager"

export PATH="${PATH}:${HOME}/bin:${HOME}/dev/sh:${HOME}/android/sdk/android-sdk-linux/tools:${HOME}/android/sdk/android-sdk-linux/platform-tools:${HOME}/android/ndk/android-ndk-r8d"
export ANDROID_HOME="~/android/sdk/android-sdk-linux"

# Disable ctrl-s sending XOFF
stty ixany
stty ixoff -ixon

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

export TERM=screen-256color
