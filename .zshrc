# Load the shell dotfiles
for file in ~/.{extra,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

ZSH_THEME="bullet-train"
DEFAULT_USER="simonsmith"

# Plugins
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin
# ---------------------------------------------------------------

plugins=(git npm z tmux bundler vi-mode)

# Exports
# ---------------------------------------------------------------

# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Make vim the default editor
export EDITOR="vim"

# LESS
# Syntax highlighting
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"

# vi mode
export MODE_INDICATOR="[NORMAL]"
export KEYTIMEOUT=1
bindkey '^r' history-incremental-search-backward

# Larger history (allow 32³ entries; default is 500)
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

# Stop z polluting the home dir
export _Z_DATA="$HOME/.zdata/.z"

# PATH
# ---------------------------------------------------------------

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="~/.rbenv/shims:$PATH"
export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"

# Load some misc things
# ---------------------------------------------------------------
source ~/git-hub/init
source ~/.nvm/nvm.sh
eval "$(rbenv init -)"
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

source $ZSH/oh-my-zsh.sh

# https://github.com/zsh-users/zsh-syntax-highlighting
# Must be sourced last
source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
