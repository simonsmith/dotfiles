mkdir "$HOME/.vim"
mkdir "$HOME/.vim/autoload"

fancy_log "Installing vim plug"

if [ -e "$HOME/.vim/autoload/plug.vim" ]; then
  fancy_log "vim plug exists, skipping ..."
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
