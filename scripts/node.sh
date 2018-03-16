echo "Installing npm global packages ..."

npm i -g --quiet eslint
npm i -g --quiet http-server
npm i -g --quiet imageoptim-cli
npm i -g --quiet nodemon
npm i -g --quiet npm-check
npm i -g --quiet npmlist
npm i -g --quiet tern

echo "Installing yarn ..."

curl -o- -L https://yarnpkg.com/install.sh | bash
