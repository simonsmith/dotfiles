#!/bin/bash
set -euo pipefail

source ./scripts/utils.sh

log_info "Installing Neovim plugins"

ln -sfv "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"

# Check if mise is available and install yarn 1.22.22
if ! command -v mise &> /dev/null; then
  log_error "mise not found. Cannot install yarn 1.22.22 for vim-plug compatibility."
  exit 1
fi

mise install yarn@1.22.22

# Neovim
if [ -e "$HOME/.config/nvim/autoload/plug.vim" ]; then
  echo "vim plug exists for neovim, skipping ..."
else
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # Open Neovim and install all plugins using yarn 1.22.22
  mise exec yarn@1.22.22 --command "nvim -c PlugInstall -c quitall"
fi
