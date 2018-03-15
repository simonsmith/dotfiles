# Check if zsh is in list of accepted shells
if grep -Fxq "/usr/local/bin/zsh" /etc/shells > /dev/null 2>&1; then
  echo "zsh is already in the list of accepted shells ..."
else
  # If not found
  echo "Adding zsh to list of accepted shells ..."
  sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
fi

# Check if zsh is default shell
if echo $SHELL | grep /bin/bash > /dev/null 2>&1; then
  echo "Setting zsh as default shell ..."
  chsh -s /usr/local/bin/zsh
else
  echo "zsh is already the default shell ..."
fi

# Install zsh-git-prompt
# https://github.com/olivierverdier/zsh-git-prompt
if [ ! -d $HOME/zsh-git-prompt ]; then
  echo "Installing zsh-git-prompt ..."
  pushd ~
  git clone https://github.com/olivierverdier/zsh-git-prompt.git
  popd
else
  echo "zsh-git-prompt already installed ..."
fi
