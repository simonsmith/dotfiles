log() {
  local fmt="$1"; shift
  printf "\n\e[94m$fmt\n" "$@"
}

casks="$(brew cask list)"

install_cask() {
  if echo $casks | grep -w $1 > /dev/null 2>&1; then
    log "Already have %s installed. Skipping ..." "$1"
  else
    log "Installing %s ..." "$1"
    brew cask install "$@" 2> /dev/null
  fi
}

brew tap caskroom/cask
brew tap caskroom/versions

# Browsers
install_cask firefox
install_cask google-chrome-beta
install_cask google-chrome-canary
install_cask opera
install_cask torbrowser

# Cloud
install_cask cloud
install_cask dropbox
install_cask google-drive

# Comms
install_cask google-hangouts
install_cask franz
install_cask skype

# Media
install_cask beardedspice
install_cask burn
install_cask max
install_cask sonos
install_cask spotify
install_cask vlc

# Development
install_cask gitify
install_cask iterm2-beta
install_cask jq
install_cask kaleidoscope
install_cask transmit
install_cask vmware-fusion
install_cask atom

# Mac OS Enhancements
install_cask bartender
install_cask bettertouchtool
install_cask exa
install_cask gpgtools
install_cask istat-menus
install_cask karabiner
install_cask keepingyouawake
install_cask alfred
install_cask paragon-ntfs
install_cask seil
install_cask shortcat
install_cask the-unarchiver
install_cask totalfinder

# Other stuff
install_cask appcleaner
install_cask daisydisk
install_cask deluge
install_cask flux
install_cask imazing
install_cask steam
install_cask viscosity

brew cask cleanup
