
# Install fzf
echo "Setting up fzf ..."
yes | /usr/local/opt/fzf/install

# Install git-hub
echo "Installing git-hub CLI tool ..."
git clone https://github.com/ingydotnet/git-hub "$HOME/git-hub"

# Install blsd
# http://theinfiniteset.net/content/2016/08/combining-tools-blsd-and-fzf/
bash <(curl -fL https://raw.githubusercontent.com/junegunn/blsd/master/install)
