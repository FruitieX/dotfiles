if [[ "$XDG_VTNR" == 1 && -z "$DISPLAY" && -z "$TMUX" ]]; then
    exec startx
fi

~/bin/tmx
if [[ -z "$TMUX" ]]; then
    exit
fi

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
#plugins=(git archlinux rsync vi-mode zsh-syntax-highlighting zsh-history-substring-search)

if [ -f ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi
#source $ZSH/oh-my-zsh.sh
source $HOME/.zprezto/init.zsh
source ~/src/z/z.sh

alias sr="ssh rasse@fruitiex.org"
alias vmx="startx -- -config xorg.vm"
alias l="ll"
alias netmenu="sudo wifi-menu -o"
alias gx="git annex"
alias gl="git pull"
alias slp="systemctl suspend"
alias ds="dirs -v"
alias hc="herbstclient"
alias startx="ssh-agent startx"
alias n="~/dev/node/nodifier/clients/cli/cli.js"
alias nr="n r"
alias nu="n u"
alias t="~/dev/node/nodifier/clients/todo/todo.js"
alias v="~/src/v/v"
alias xf="DISPLAY=:10"

# irc alias
for ((i = 0; i < 100; i++)); do
	alias i$i="i $i"
done

# because oh-my-zsh overrides this
export PAGER="vimpager"

unset SSH_ASKPASS

# Disable ctrl-s sending XOFF
stty ixany
stty ixoff -ixon

setopt DVORAK

# use the vi navigation keys (hjkl) besides cursor keys in menu completion
#bindkey -M menuselect 'h' vi-backward-char        # left
#bindkey -M menuselect 'k' vi-up-line-or-history   # up
#bindkey -M menuselect 'l' vi-forward-char         # right
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

ulimit -c unlimited
