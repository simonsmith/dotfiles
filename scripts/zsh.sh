source "${BASH_SOURCE%/*}/log.sh"

# Check if zsh is in list of accepted shells
if grep -Fxq "/usr/local/bin/zsh" /etc/shells > /dev/null 2>&1; then
  log "zsh is already in the list of accepted shells ..."
else
  # If not found
  log "Adding zsh to list of accepted shells ..."
  sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
fi

# Check if zsh is default shell
if echo $SHELL | grep /bin/bash > /dev/null 2>&1; then
  log "Setting zsh as default shell ..."
  chsh -s /usr/local/bin/zsh
else
  log "zsh is already the default shell ..."
fi

# Get zgen if it doesn't exist
# https://github.com/tarjoilija/zgen
if [ ! -f $HOME/zgen/zgen.zsh ]; then
  log "Installing zgen ..."
  pushd ~
  git clone https://github.com/tarjoilija/zgen.git
  popd
else
  log "zgen is already installed ..."
fi

# Install zsh-git-prompt
# https://github.com/olivierverdier/zsh-git-prompt
if [ ! -d $HOME/zsh-git-prompt ]; then
  log "Installing zsh-git-prompt ..."
  pushd ~
  git clone https://github.com/olivierverdier/zsh-git-prompt.git
  popd
else
  log "zsh-git-prompt already installed ..."
fi
