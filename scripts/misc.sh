# Install fzf
log "Setting up fzf ..."
yes | /usr/local/opt/fzf/install

# Install git-hub
log "Installing git-hub CLI tool ..."
git clone https://github.com/ingydotnet/git-hub "$HOME/git-hub"

# Allow CTRL-H mapping to work in neovim
# https://github.com/neovim/neovim/wiki/Troubleshooting#my-ctrl-h-mapping-doesnt-work
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
