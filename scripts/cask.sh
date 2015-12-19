casks="$(brew cask list)"

install_cask() {
  if echo $casks | grep -w $1 > /dev/null 2>&1; then
    fancy_echo "Already have %s installed. Skipping ..." "$1"
  else
    fancy_echo "Installing %s ..." "$1"
    brew cask install "$@" 2> /dev/null
  fi
}

brew tap caskroom/cask
brew tap caskroom/versions

# Browsers
install_cask 'google-chrome-beta'
install_cask 'google-chrome-canary'
install_cask 'firefox'
install_cask 'opera'
install_cask 'torbrowser'

# Cloud
install_cask 'cloud'
install_cask 'dropbox'

# Comms
install_cask 'skype'
install_cask 'google-hangouts'

# Media
install_cask 'burn'
install_cask 'sonos'
install_cask 'spotify'
install_cask 'spotify-notifications'
install_cask 'vlc'
install_cask 'max'
install_cask 'beardedspice'

# Development
install_cask 'gitify'
install_cask 'transmit'
install_cask 'vmware-fusion'
install_cask 'iterm2-beta'
install_cask 'kaleidoscope'
install_cask 'jq'

# Mac OS Enhancements
install_cask 'bartender'
install_cask 'bettertouchtool'
install_cask 'gpgtools'
install_cask 'istat-menus'
install_cask 'keepingyouawake'
install_cask 'launchbar'
install_cask 'paragon-ntfs'
install_cask 'shortcat'
install_cask 'the-unarchiver'
install_cask 'totalfinder'
install_cask 'karabiner'
install_cask 'seil'
install_cask 'exa'

# Other stuff
install_cask 'viscosity'
install_cask 'deluge'
install_cask 'flux'
install_cask 'appcleaner'
install_cask 'imazing'
install_cask 'steam'
install_cask 'daisydisk'

brew cask cleanup
