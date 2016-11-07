source ./scripts/homebrew.sh
source ./scripts/cask.sh
source ./scripts/zsh.sh
source ./scripts/symlinks.sh
source ./scripts/vim.sh
source ./scripts/node.sh
source ./scripts/ruby.sh
source ./scripts/misc.sh

echo "Sourcing .zshrc ..."
source "$HOME/.zshrc"
echo "Installation complete!"
echo "Now open a new Terminal tab to install zgen plugins..."
