
if [ ! -s "$NVM_DIR/nvm.sh" ] ; then
  echo "Installing nvm ..."
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | zsh
else
  echo "nvm already installed ..."
fi

PACKAGES="caniuse-cmd bower postcss-cli npm-upgrade gulp npmlist eslint
stylelint stylelint-config-suitcss babel mversion webpack nodemon modernizr"

echo "Installing global npm packages $PACKAGES"

npm install $PACKAGES --global --quiet
