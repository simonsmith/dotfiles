# Check for homebrew and install if needed
echo "Installing homebrew ..."

which -s brew
if [[ $? != 0 ]] ; then
  yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed ..."
fi

brew update

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
ln -sv /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Replace system curl
brew install curl --with-openssl
brew link curl --force

# Install zsh
brew install zsh
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install zplug

# less highlighting
brew install source-highlight

# Install `wget` with IRI support.
brew install wget --with-iri

# neovim
brew install python3
brew install neovim/neovim/neovim
pip3 install neovim

# fzf
brew install fzf
yes | /usr/local/opt/fzf/install

# Ag - fzf is configured to use this
brew install the_silver_searcher

# tmux
brew install reattach-to-user-namespace
brew install tmux
brew install urlview

# git
brew install cdiff
brew install git
brew install scmpuff
brew install diff-so-fancy

# Install more recent versions of some OS X tools.
brew tap homebrew/dupes
brew install grep --with-default-names

# Ruby
brew install rbenv
brew install ruby-build

# Window manager
brew install koekeishiya/formulae/khd
brew tap crisidev/homebrew-chunkwm
brew install chunkwm

# Install other useful binaries.
brew install ack
brew install ctags
brew install direnv
brew install go
brew install exa
brew install fpp
brew install htop
brew install httpie
brew install hugo
brew install p7zip
brew install python
brew install redis
brew install youtube-dl

brew cleanup
