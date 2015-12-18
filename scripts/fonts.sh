echo "Installing fonts ..."

# Check if brew uses the fonts repo
brew tap | grep "caskroom/fonts" > /dev/null
if [[ $? != 0 ]] ; then
  brew tap caskroom/fonts
fi

# Checks if fonts are installed and installs them if they aren't.
install_font() {
  brew cask list | grep $1 > /dev/null 2>&1
  if [[ $? != 0 ]] ; then
    echo "Installing $1 ..."
    brew cask install $1
  else
    echo "Skipping $1 installation ..."
  fi
}

install_font 'font-droid-sans-mono-for-powerline'
install_font 'font-anonymous-pro-for-powerline'
install_font 'font-open-sans'
