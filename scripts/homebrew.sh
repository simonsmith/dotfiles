log() {
  local fmt="$1"; shift
  printf "\n\e[94m$fmt\n" "$@"
}

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      log "Upgrading %s ..." "$1"
      brew upgrade "$1"
    else
      log "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    log "Installing %s ..." "$1"
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
log "Installing homebrew ..."

which -s brew
if [[ $? != 0 ]] ; then
  yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  log "Homebrew already installed ..."
fi

log "Updating Homebrew formulas ..."
brew update

log "Installing & upgrading formulas ..."

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew_install_or_upgrade coreutils
ln -sv /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew_install_or_upgrade moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew_install_or_upgrade findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew_install_or_upgrade gnu-sed --with-default-names

# Replace system curl
brew_install_or_upgrade curl --with-openssl
brew link curl --force

# Install zsh
brew_install_or_upgrade zsh
brew_install_or_upgrade zsh-syntax-highlighting

# less highlighting
brew_install_or_upgrade source-highlight

# Install `wget` with IRI support.
brew_install_or_upgrade wget --with-iri

# Use brew vim
brew_install_or_upgrade vim --with-override-system-vi

# neovim
brew_install_or_upgrade python3
brew install neovim/neovim/neovim
pip3 install neovim

# fzf
brew_install_or_upgrade fzf
yes | /usr/local/opt/fzf/install

# Ag - fzf is configured to use this
brew_install_or_upgrade the_silver_searcher

# tmux
brew_install_or_upgrade reattach-to-user-namespace
brew_install_or_upgrade tmux
brew_install_or_upgrade urlview

# git
brew_install_or_upgrade cdiff
brew_install_or_upgrade git
brew_install_or_upgrade scmpuff

# Install more recent versions of some OS X tools.
brew tap homebrew/dupes
brew_install_or_upgrade grep --with-default-names

# Ruby
brew_install_or_upgrade rbenv
brew_install_or_upgrade ruby-build

# Window manager
brew_install_or_upgrade koekeishiya/khd/khd
brew_install_or_upgrade koekeishiya/kwm/kwm

# React Native
brew_install_or_upgrade android-sdk
brew_install_or_upgrade watchman

# Install other useful binaries.
brew_install_or_upgrade ack
brew_install_or_upgrade ctags
brew_install_or_upgrade direnv
brew_install_or_upgrade go
brew_install_or_upgrade heroku
brew_install_or_upgrade htop
brew_install_or_upgrade httpie
brew_install_or_upgrade hugo
brew_install_or_upgrade p7zip
brew_install_or_upgrade python
brew_install_or_upgrade redis

brew cleanup
