echo "Installing nvs ..."

# nvs
# https://github.com/jasongin/nvs
# ---------------------------------------------------------------

git clone https://github.com/jasongin/nvs "$HOME/.nvs"
source "$HOME/.nvs/nvs.sh"
nvs add lts
nvs use lts
nvs link lts
nvs auto on

echo "Installing yarn ..."

curl -o- -L https://yarnpkg.com/install.sh | bash
