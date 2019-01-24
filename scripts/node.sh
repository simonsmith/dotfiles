echo "Installing nvs ..."

# nvs
# https://github.com/jasongin/nvs
# ---------------------------------------------------------------

git clone https://github.com/jasongin/nvs "$HOME/.nvs"
source "$HOME/.nvs/nvs.sh"
nvs install lts
nvs link lts
nvs auto on

echo "Installing npm global packages ..."

npm i -g --quiet http-server
npm i -g --quiet imageoptim-cli
npm i -g --quiet npm-check
npm i -g --quiet tern

echo "Installing yarn ..."

curl -o- -L https://yarnpkg.com/install.sh | bash
