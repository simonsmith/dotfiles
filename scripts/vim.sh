mkdir -p "$HOME/.config/nvim/autoload"
mkdir -p "$HOME/.vim/autoload"

# Neovim
if [ -e "$HOME/.config/nvim/autoload/plug.vim" ]; then
  log "vim plug exists, skipping ..."
else
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Vim
if [ -e "$HOME/.vim/autoload/plug.vim" ]; then
  log "vim plug exists, skipping ..."
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Allow CTRL-H mapping to work in neovim
# https://github.com/neovim/neovim/wiki/Troubleshooting#my-ctrl-h-mapping-doesnt-work
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
