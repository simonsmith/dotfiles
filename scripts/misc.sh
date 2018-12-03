# Install fzf
echo "Setting up fzf ..."
yes | /usr/local/opt/fzf/install

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install blsd
# http://theinfiniteset.net/content/2016/08/combining-tools-blsd-and-fzf/
bash <(curl -fL https://raw.githubusercontent.com/junegunn/blsd/master/install)

