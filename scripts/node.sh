echo "Installing volta ..."

curl https://get.volta.sh | bash
source "$HOME/.zshrc"
source "$HOME/.volta/bin"
volta install node@lts
volta install yarn@1.22.17
yarn global add fx
