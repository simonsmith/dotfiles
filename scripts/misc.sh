source $(dirname $0)/log.sh

# Install fzf
log "Setting up fzf ..."
yes | /usr/local/opt/fzf/install

# Install git-hub
log "Installing git-hub CLI tool ..."
git clone https://github.com/ingydotnet/git-hub "$HOME/git-hub"
