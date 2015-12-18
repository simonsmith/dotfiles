# Install nvm

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

echo "Installing nvm ..."
if [ ! -s "$NVM_DIR/nvm.sh" ] ; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | zsh
else
  echo "nvm already installed ..."
fi

echo "Installing npm global packages ..."

npm_packages="$(npm list -g --depth=0)"

install_global_npm_package() {
  if echo $npm_packages | grep $1@ > /dev/null 2>&1; then
    fancy_echo "Already have %s installed. Skipping ..." "$1"
  else
    fancy_echo "Installing %s ..." "$1"
    npm i -g "$@" --quiet
  fi
}

install_global_npm_package 'bower'
install_global_npm_package 'postcss-cli'
install_global_npm_package 'postcss'
install_global_npm_package 'eslint'
install_global_npm_package 'stylelint'
install_global_npm_package 'stylelint-config-suitcss'
install_global_npm_package 'babel'
install_global_npm_package 'webpack'
install_global_npm_package 'mversion'
install_global_npm_package 'nodemon'
install_global_npm_package 'modernizr'
install_global_npm_package 'caniuse-cmd'
install_global_npm_package 'npm-check'
install_global_npm_package 'gulp'
install_global_npm_package 'npmlist'
