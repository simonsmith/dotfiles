# Install node modules globally

PACKAGES="caniuse-cmd
          bower
          postcss-cli
          npm-upgrade
          gulp
          npmlist
          eslint
          stylelint
          stylelint-config-suitcss
          babel
          mversion
          webpack
          nodemon
          modernizr"

echo "Installing global npm packages  $PACKAGES"

npm install $PACKAGES --global --quiet
