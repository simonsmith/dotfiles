# Install fzf
echo "Setting up fzf ..."
yes | /usr/local/opt/fzf/install

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install blsd
# http://theinfiniteset.net/content/2016/08/combining-tools-blsd-and-fzf/
bash <(curl -fL https://raw.githubusercontent.com/junegunn/blsd/master/install)

# java version manager
curl -s "https://get.sdkman.io" | bash
source "$HOME/.zshrc"
sdk install java 16.0.2.7.1-amzn
sdk install java 11.0.12.7.2-amzn
sdk default java 16.0.2.7.1-amzn
