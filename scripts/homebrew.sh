echo "Installing homebrew ..."

brew update

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
ln -sv /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew install gettext
brew link --force gettext

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Replace system curl
brew install curl

# Install zsh
brew install zsh
brew install zplug
brew install starship

# less highlighting
brew install source-highlight

# Install `wget`
brew install wget

# Diff images on cmd-line - https://github.com/ewanmellor/git-diff-image
brew install exiftool
brew install imagemagick

# neovim
brew install python3
brew install neovim
pip3 install neovim
pip3 install pynvim

# fzf
brew install fzf
yes | /usr/local/opt/fzf/install

# Search
brew install the_silver_searcher
brew install rg
brew install ack

# tmux
brew install reattach-to-user-namespace
brew install tmux
brew install urlview
brew install tmuxinator

# git
brew install git
brew install scmpuff
brew install git-delta

# Install more recent versions of some OS X tools.
brew install grep

# Ruby
brew install rbenv
brew install ruby-build

# Window manager
brew tap koekeishiya/formulae
brew install koekeishiya/formulae/skhd --with-logging
brew install koekeishiya/formulae/yabai

# Install other useful binaries.
brew install bat
brew install fd
brew install devd
brew install go
brew install jordanbaird-ice
brew install eza
brew install trash
brew install direnv
brew tap clementtsang/bottom
brew install bottom
brew install httpie
brew install imageoptim-cli
brew install python
brew install youtube-dl
brew install meetingbar
brew install deskpad

brew cleanup
