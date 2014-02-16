for color in {000..255}; do
	FG[$color]="%{[38;5;${color}m%}"
	BG[$color]="%{[48;5;${color}m%}"
done

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{%F{255}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# display exitcode on the right when >0
return_code="%(?..%{$fg[red]%} %? ↵%{$reset_color%})"

PROMPT='%{$fg[black]%}%{$BG[255]%} %n %{$reset_color%}%{$fg[magenta]%}%{$FG[255]$BG[239]%} %m %{$reset_color%} %~%{$reset_color%}$(git_prompt_info)${return_code}$(git_prompt_status)%{$reset_color%} > '

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} *"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} -"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} r"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%F{239}%} u"
