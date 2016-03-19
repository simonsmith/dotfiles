source "${BASH_SOURCE%/*}/log.sh"

log "Installing fonts ..."

brew cask install caskroom/fonts/font-hack

log "Downloading Knack font (install manually) ..."
cd ~/Downloads && curl -fLo "Knack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete.ttf
