# Install node modules globally

PACKAGES="caniuse-cmd bower postcss npm-check-updates gulp npmlist mversion webpack nodemon node-inspector"

echo "Installing global npm packages: $PACKAGES"

npm install $PACKAGES --global --quiet

