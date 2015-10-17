#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --default-names

# Install zsh
brew install zsh
brew install zsh-syntax-highlighting

# less highlighting
brew install source-highlight

# Install `wget` with IRI support.
brew install wget --enable-iri

# Use brew vim
brew install vim --override-system-vi

# tmux
brew install tmux
# Used for stats in tmuxline
brew install tmux-mem-cpu-load
brew install battery
brew install spark

# git
brew install git
brew install tig

# Install more recent versions of some OS X tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install composer --ignore-dependencies

# Ruby
brew install rbenv
brew install ruby-build

# Install other useful binaries.
brew install ack
brew install imagemagick --with-webp
brew install ucspi-tcp # `tcpserver` et al.
brew install redis
brew install the_silver_searcher
brew install python
brew install tidy-html5
brew install weechat
brew install phantomjs
brew install heroku
brew install p7zip
brew install tree
brew install webkit2png
brew install reattach-to-user-namespace

# Remove outdated versions from the cellar.
brew cleanup
