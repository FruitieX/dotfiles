# vim like keybindings
function jj_vim
    fish_vi_mode
    bind -M insert -m default 'jj' force-repaint
end
set -g fish_key_bindings jj_vim

if status --is-login
    set fish_greeting ""
    set EDITOR nvim
    set VISUAL nvim
    set BROWSER chromium

    set ANDROID_HOME $HOME/apps/android-sdk
    set ANDROID_SDK_ROOT $HOME/apps/android-sdk
    set NPM_PACKAGES $HOME/.npm-packages
    set NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH
    set PATH $HOME/bin $HOME/apps/android-sdk/tools $NPM_PACKAGES/bin $PATH

    set MANPATH $NPM_PACKAGES/share/man (manpath | sed 's/:/ /g')
end

if begin [ $XDG_VTNR = 1 ]; and not [ $DISPLAY ]; and not [ $TMUX ]; end
    exec startx -- -keeptty
end

if not [ $TMUX ]
    exec ~/bin/tmx
end

function l; ll $argv; end
function gl; git pull $argv; end
function ds; dirs -v $argv; end
function hc; herbstclient $argv; end
function n; ~/src/nodifier/clients/cli/cli.js $argv; end
function nr; n r $argv; end
function nu; n u $argv; end
function m; ~/src/nodeplayer-client/index.js $argv; end
function ms; ~/src/nodeplayer-client/index.js -s $argv; end
function ma; ~/src/nodeplayer-client/index.js -a $argv; end
function mp; ~/src/nodeplayer-client/index.js -p $argv; end
function mn; ~/src/nodeplayer-client/index.js -n $argv; end
function mg; ~/src/nodeplayer-client/index.js -g $argv; end
function md; ~/src/nodeplayer-client/index.js -d $argv; end
function mw; ~/src/nodeplayer-client/index.js -w $argv; end
function mpp; ~/src/nodeplayer-player/index.js $argv; end
function t; ~/src/nodifier/clients/todo/todo.js $argv; end
function v; ~/src/v/v $argv; end
function xf; DISPLAY=:10 $argv; end
function s; mosh $argv; end
function sys; systemctl $argv; end
function sysu; systemctl --user $argv; end
function jrn; journalctl $argv; end
function jrnu; journalctl --user-unit $argv $argv; end
#alias sudo="sudo " # fix running aliases as sudo
function vim; nvim $argv; end
#function chromium; chromium --proxy-server=localhost:8118 > /dev/null 2>&1 &; end
function pingg; ping google.com $argv; end

# irc alias
#for ((i = 0; i < 100; i++)); do
#	alias i$i="i $i"
#done

# Git
function g; git $argv; end

# Branch (b)
function gb; git branch $argv; end
function gbc; git checkout -b $argv; end
function gbl; git branch -v $argv; end
function gbL; git branch -av $argv; end
function gbx; git branch -d $argv; end
function gbX; git branch -D $argv; end
function gbm; git branch -m $argv; end
function gbM; git branch -M $argv; end
function gbs; git show-branch $argv; end
function gbS; git show-branch -a $argv; end

# Commit (c)
function gc; git commit --verbose $argv; end
function gca; git commit --verbose --all $argv; end
function gcm; git commit --message $argv; end
function gco; git checkout $argv; end
function gcO; git checkout --patch $argv; end
function gcf; git commit --amend --reuse-message HEAD $argv; end
function gcF; git commit --verbose --amend $argv; end
function gcp; git cherry-pick --ff $argv; end
function gcP; git cherry-pick --no-commit $argv; end
function gcr; git revert $argv; end
function gcR; git reset "HEAD^" $argv; end
function gcs; git show $argv; end
function gcl; git-commit-lost $argv; end

# Conflict (C)
function gCl; git status | sed -n "s/^.*both [a-z]*ed: *//p" $argv; end
function gCa; git add (gCl) $argv; end
function gCe; git mergetool (gCl) $argv; end
function gCo; git checkout --ours -- $argv; end
function gCO; gCo (gCl) $argv; end
function gCt; git checkout --theirs -- $argv; end
function gCT; gCt (gCl) $argv; end

# Data (d)
function gd; git ls-files $argv; end
function gdc; git ls-files --cached $argv; end
function gdx; git ls-files --deleted $argv; end
function gdm; git ls-files --modified $argv; end
function gdu; git ls-files --other --exclude-standard $argv; end
function gdk; git ls-files --killed $argv; end
function gdi; git status --porcelain --short --ignored | sed -n "s/^!! //p" $argv; end

# Fetch (f)
function gf; git fetch $argv; end
function gfc; git clone $argv; end
function gfm; git pull $argv; end
function gfr; git pull --rebase $argv; end

# Grep (g)
function gg; git grep $argv; end
function ggi; git grep --ignore-case $argv; end
function ggl; git grep --files-with-matches $argv; end
function ggL; git grep --files-without-matches $argv; end
function ggv; git grep --invert-match $argv; end
function ggw; git grep --word-regexp $argv; end

# Index (i)
function gia; git add $argv; end
function giA; git add --patch $argv; end
function giu; git add --update $argv; end
function gid; git diff --no-ext-diff --cached $argv; end
function giD; git diff --no-ext-diff --cached --word-diff $argv; end
function gir; git reset $argv; end
function giR; git reset --patch $argv; end
function gix; git rm -r --cached $argv; end
function giX; git rm -rf --cached $argv; end

# Log (l)
#function gl; git log --topo-order --pretty=format:"$_git_log_medium_format" $argv; end
function gls; git log --topo-order --stat --pretty=format:"$_git_log_medium_format" $argv; end
function gld; git log --topo-order --stat --patch --full-diff --pretty=format:"$_git_log_medium_format" $argv; end
function glo; git log --topo-order --pretty=format:"$_git_log_oneline_format" $argv; end
function glg; git log --topo-order --all --graph --pretty=format:"$_git_log_oneline_format" $argv; end
function glb; git log --topo-order --pretty=format:"$_git_log_brief_format" $argv; end
function glc; git shortlog --summary --numbered $argv; end

# Merge (m)
function gm; git merge $argv; end
function gmC; git merge --no-commit $argv; end
function gmF; git merge --no-ff $argv; end
function gma; git merge --abort $argv; end
function gmt; git mergetool $argv; end

# Push (p)
function gp; git push $argv; end
function gpf; git push --force $argv; end
function gpa; git push --all $argv; end
function gpA; git push --all; and git push --tags $argv; end
function gpt; git push --tags $argv; end
function gpc; git push --set-upstream origin "(git-branch-current 2> /dev/null)" $argv; end
function gpp; git pull origin "(git-branch-current 2> /dev/null)"; and git push origin "(git-branch-current 2> /dev/null)" $argv; end

# Rebase (r)
function gr; git rebase $argv; end
function gra; git rebase --abort $argv; end
function grc; git rebase --continue $argv; end
function gri; git rebase --interactive $argv; end
function grs; git rebase --skip $argv; end

# Remote (R)
function gR; git remote $argv; end
function gRl; git remote --verbose $argv; end
function gRa; git remote add $argv; end
function gRx; git remote rm $argv; end
function gRm; git remote rename $argv; end
function gRu; git remote update $argv; end
function gRp; git remote prune $argv; end
function gRs; git remote show $argv; end
function gRb; git-hub-browse $argv; end

# Stash (s)
function gs; git stash $argv; end
function gsa; git stash apply $argv; end
function gsx; git stash drop $argv; end
function gsX; git-stash-clear-interactive $argv; end
function gsl; git stash list $argv; end
function gsL; git-stash-dropped $argv; end
function gsd; git stash show --patch --stat $argv; end
function gsp; git stash pop $argv; end
function gsr; git-stash-recover $argv; end
function gss; git stash save --include-untracked $argv; end
function gsS; git stash save --patch --no-keep-index $argv; end
function gsw; git stash save --include-untracked --keep-index $argv; end

# Submodule (S)
function gS; git submodule $argv; end
function gSa; git submodule add $argv; end
function gSf; git submodule foreach $argv; end
function gSi; git submodule init $argv; end
function gSI; git submodule update --init --recursive $argv; end
function gSl; git submodule status $argv; end
function gSm; git-submodule-move $argv; end
function gSs; git submodule sync $argv; end
function gSu; git submodule foreach git pull origin master $argv; end
function gSx; git-submodule-remove $argv; end

# Working Copy (w)
function gws; git status --ignore-submodules=$_git_status_ignore_submodules --short $argv; end
function gwS; git status --ignore-submodules=$_git_status_ignore_submodules $argv; end
function gwd; git diff --no-ext-diff $argv; end
function gwD; git diff --no-ext-diff --word-diff $argv; end
function gwr; git reset --soft $argv; end
function gwR; git reset --hard $argv; end
function gwc; git clean -n $argv; end
function gwC; git clean -f $argv; end
function gwx; git rm -r $argv; end
function gwX; git rm -rf $argv; end
