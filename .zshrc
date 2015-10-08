# Load the shell dotfiles
for file in ~/.{extra,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="bullet-train"
DEFAULT_USER="simonsmith"

# Load plugins
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
plugins=(git npm z tmux bundler vi-mode)

# Highlight syntax when using `less`
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"

# Stop z polluting the home dir
export _Z_DATA="$HOME/.zdata/.z"

# $PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="~/.rbenv/shims:$PATH"
export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"

# Load some additional things
source ~/git-hub/init
source ~/.nvm/nvm.sh
eval "$(rbenv init -)"
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

source $ZSH/oh-my-zsh.sh

# https://github.com/zsh-users/zsh-syntax-highlighting
# Must be sourced last
source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
