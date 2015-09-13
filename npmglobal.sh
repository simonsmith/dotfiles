# Install node modules globally

PACKAGES="caniuse-cmd
          bower
          postcss
          npm-check-updates
          gulp
          npmlist
          mversion
          webpack
          nodemon
          modernizr"

echo "Installing global npm packages:
      $PACKAGES"

npm install $PACKAGES --global --quiet

