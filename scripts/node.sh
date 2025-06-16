echo "Installing volta ..."

export PATH="$HOME/.volta/bin:$PATH"
curl https://get.volta.sh | bash
volta install node@lts
# need 1.x to install packages inside Neovim, so use this as
# the default
volta install yarn@1.22.22
