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


# Oh my zsh
# ---------------------------------------------------------------
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh


# Exports
# ---------------------------------------------------------------
# Make vim the default editor
export EDITOR="vim"

# vi mode
export MODE_INDICATOR="[NORMAL]"
# Rebind `jj` to esc
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^r' history-incremental-search-backward

# Change cursor shape based on vi mode
zle-line-init () {
  zle -K viins
  echo -ne "\033]12;Gray\007"
  echo -ne "\033[4 q"
}

zle -N zle-line-init
zle-keymap-select () {
  if [[ $KEYMAP == vicmd ]]; then
    if [[ -z $TMUX ]]; then
      printf "\033]12;Green\007"
      printf "\033[2 q"
    else
      printf "\033Ptmux;\033\033]12;red\007\033\\"
      printf "\033Ptmux;\033\033[2 q\033\\"
    fi
  else
    if [[ -z $TMUX ]]; then
      printf "\033]12;Grey\007"
      printf "\033[4 q"
    else
      printf "\033Ptmux;\033\033]12;grey\007\033\\"
      printf "\033Ptmux;\033\033[4 q\033\\"
    fi
  fi
}

zle -N zle-keymap-select

# LESS
# Syntax highlighting
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS='-RJMI'

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


# Misc
# ---------------------------------------------------------------
source ~/git-hub/init
source ~/.nvm/nvm.sh
eval "$(rbenv init -)"
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# https://github.com/zsh-users/zsh-syntax-highlighting
# Must be sourced last
source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
