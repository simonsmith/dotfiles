mkdir "$HOME/.vim"
mkdir "$HOME/.vim/autoload"

echo "Installing vim plug"

if [ -e "$HOME/.vim/autoload/plug.vim" ]; then
  echo "vim plug exists, skipping ..."
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
