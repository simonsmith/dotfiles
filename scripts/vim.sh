source ./scripts/utils.sh

log_info "Installing Neovim plugins"

# Create directories
ln -sfv "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"

# Neovim
if [ -e "$HOME/.config/nvim/autoload/plug.vim" ]; then
  echo "vim plug exists for neovim, skipping ..."
else
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # Open Neovim and install all plugins
  nvim -c PlugInstall -c quitall
fi
