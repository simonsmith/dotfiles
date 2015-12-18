fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_is_installed() {
  local name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

brew_is_upgradable() {
  local name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$name" >/dev/null
}

brew_tap() {
  brew tap "$1" 2> /dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

# Check for homebrew and install if needed
echo "Installing homebrew ..."

which -s brew
if [[ $? != 0 ]] ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed ..."
fi

echo "Updating Homebrew formulas ..."
brew update

echo "Installing & upgrading formulas ..."

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew_install_or_upgrade coreutils
sudo ln -sv /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew_install_or_upgrade 'moreutils'
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew_install_or_upgrade 'findutils'
# Install GNU `sed`, overwriting the built-in `sed`.
brew_install_or_upgrade 'gnu-sed --default-names'

# Install zsh
brew_install_or_upgrade 'zsh'
brew_install_or_upgrade 'zsh-syntax-highlighting'

# less highlighting
brew_install_or_upgrade 'source-highlight'

# Install `wget` with IRI support.
brew_install_or_upgrade 'wget --enable-iri'

# Use brew vim
brew_install_or_upgrade 'vim --override-system-vi'

# tmux
brew_install_or_upgrade 'tmux'
# Used for stats in tmuxline
brew_install_or_upgrade 'tmux-mem-cpu-load'
brew_install_or_upgrade 'battery'
brew_install_or_upgrade 'spark'

# git
brew_install_or_upgrade 'git'
brew_install_or_upgrade 'tig'

# Install more recent versions of some OS X tools.
brew_install_or_upgrade 'homebrew/dupes/grep'
brew_install_or_upgrade 'homebrew/dupes/screen'
brew_install_or_upgrade 'composer --ignore-dependencies'

# Ruby
brew_install_or_upgrade 'rbenv'
brew_install_or_upgrade 'ruby-build'

# Install other useful binaries.
brew_install_or_upgrade 'ack'
brew_install_or_upgrade 'imagemagick --with-webp'
brew_install_or_upgrade 'ucspi-tcp' # `tcpserver` et al.
brew_install_or_upgrade 'redis'
brew_install_or_upgrade 'the_silver_searcher'
brew_install_or_upgrade 'fzf'
brew_install_or_upgrade 'scmpuff'
brew_install_or_upgrade 'python'
brew_install_or_upgrade 'tidy-html5'
brew_install_or_upgrade 'weechat'
brew_install_or_upgrade 'phantomjs'
brew_install_or_upgrade 'heroku'
brew_install_or_upgrade 'p7zip'
brew_install_or_upgrade 'tree'
brew_install_or_upgrade 'webkit2png'
brew_install_or_upgrade 'reattach-to-user-namespace'

brew cleanup
