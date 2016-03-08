node_install_version=5.7.0

log "Installing nvm ..."
if [ ! -s "$NVM_DIR/nvm.sh" ] ; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | zsh
  source "$HOME/.nvm/nvm.sh"
  log "Installing node $node_install_version ..."
  nvm install "$node_install_version"
  nvm use "$node_install_version"
  nvm alias default node
else
  log "nvm already installed ..."
fi

log "Installing npm 2.14.15 ..."
npm i -g npm@2.14.15

npm_packages="$(npm list -g --depth=0)"
install_global_npm_package() {
  if echo $npm_packages | grep $1@ > /dev/null 2>&1; then
    log "Already have %s installed. Skipping ..." "$1"
  else
    log "Installing %s ..." "$1"
    npm i -g "$@" --quiet
  fi
}

log "Installing npm global packages ..."

install_global_npm_package 'babel'
install_global_npm_package 'bower'
install_global_npm_package 'caniuse-cmd'
install_global_npm_package 'diff-so-fancy'
install_global_npm_package 'eslint'
install_global_npm_package 'eslint'
install_global_npm_package 'instant-markdown-d'
install_global_npm_package 'http-server'
install_global_npm_package 'modernizr'
install_global_npm_package 'nodemon'
install_global_npm_package 'npm-check'
install_global_npm_package 'npmlist'
install_global_npm_package 'postcss-cli'
install_global_npm_package 'stylelint'
install_global_npm_package 'stylelint-config-suitcss'
install_global_npm_package 'tldr'
install_global_npm_package 'webpack'
