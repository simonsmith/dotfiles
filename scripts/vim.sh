mkdir -p "$HOME/.config/nvim/autoload"

if [ -e "$HOME/.config/nvim/autoload/plug.vim" ]; then
  log "vim plug exists, skipping ..."
else
  curl -fLo "$HOME/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi
