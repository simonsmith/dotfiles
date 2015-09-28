# Load functions here instead of .zshrc
# http://unix.stackexchange.com/a/126961
[ -r ~/.functions ] && [ -f ~/.functions ] && source ~/.functions

# Exports
#
# Make vim the default editor
export EDITOR="vim"

# vi mode
export MODE_INDICATOR="[NORMAL]"
export KEYTIMEOUT=1
bindkey '^r' history-incremental-search-backward

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Force terminal 256 colour with iterm
export TERM='xterm-256color'

# Node dev
export NODE_ENV=development
