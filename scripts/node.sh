node_install_version=10.15.0

echo "Installing nvm ..."
if [ ! -s "$NVM_DIR/nvm.sh" ] ; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | zsh
  source "$HOME/.nvm/nvm.sh"
  echo "Installing node $node_install_version ..."
  nvm install "$node_install_version"
  nvm use "$node_install_version"
  nvm alias default node
else
  echo "nvm already installed ..."
fi

echo "Installing npm global packages ..."

npm i -g --quiet http-server
npm i -g --quiet imageoptim-cli
npm i -g --quiet nodemon
npm i -g --quiet npm-check
npm i -g --quiet npmlist
npm i -g --quiet tern

echo "Installing yarn ..."

curl -o- -L https://yarnpkg.com/install.sh | bash
