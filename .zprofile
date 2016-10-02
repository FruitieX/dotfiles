export BROWSER="google-chrome-unstable"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="vimpager"

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

unamestr=$(uname)

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

if [[ $unamestr == 'Darwin' ]]; then
    export ANDROID_HOME="${HOME}/.android-sdk-macosx"
    export ANDROID_SDK_ROOT="${HOME}/.android-sdk-macosx"
else
    export JAVA_HOME="/usr/lib/jvm/default"
    #export ANDROID_HOME="${HOME}/apps/android-sdk"
    #export ANDROID_SDK_ROOT="${HOME}/apps/android-sdk"
fi

export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="${HOME}/bin:${HOME}/dev/sh:${HOME}/apps/android-sdk/sdk/tools:${HOME}/apps/android-sdk/sdk/platform-tools:${HOME}/apps/android-sdk/ndk/android-ndk-r8d:${HOME}/.gem/ruby/2.2.0/bin:${NPM_PACKAGES}/bin:${PATH}"

if [ -f $HOME/.zprofile.secret ]; then
    source $HOME/.zprofile.secret
fi

unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

if [[ $unamestr == 'Darwin' ]]; then
    export PATH="/usr/local/heroku/bin:${HOME}/.android-sdk-macosx/platform-tools:$PATH"
    export GDK_SCALE=2
else
    eval "$(dircolors ~/.dir_colors)"
fi
