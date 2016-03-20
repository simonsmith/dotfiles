
# Create directories
mkdir -p "$HOME/.config/nvim/"
mkdir -p "$HOME/.vim/"
ln -sfv "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"

# Neovim
if [ -e "$HOME/.config/nvim/autoload/plug.vim" ]; then
  echo "vim plug exists for neovim, skipping ..."
else
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Vim
if [ -e "$HOME/.vim/autoload/plug.vim" ]; then
  echo "vim plug exists for vim, skipping ..."
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Allow CTRL-H mapping to work in neovim
# https://github.com/neovim/neovim/wiki/Troubleshooting#my-ctrl-h-mapping-doesnt-work
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
