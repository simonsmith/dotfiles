echo "Installing volta ..."

curl https://get.volta.sh | bash
source "$HOME/.volta/bin"
volta install node@lts
volta install yarn@1.22.5
