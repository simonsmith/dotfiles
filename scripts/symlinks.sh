source ./scripts/utils.sh

 symlink() {
   filePath=$(grealpath $1)
   [ ! -e "$HOME/$2$1" ] && ln -sfv $filePath "$HOME/$2$1"
 }

log_info "Creating symlinks ..."

# remove any existing version
rm ~/.zshrc

pushd ./dots

dots=(
  ackrc
  aerospace.toml
  aliases
  alacritty.common.toml
  batconfig
  ctags
  curlrc
  editorconfig
  functions
  gitconfig
  gitignore
  gitmessage
  hushlogin
  skhdrc
  ripgreprc
  rgignore
  tmux.conf
  wgetrc
  zshrc
)

for dotfile in ${dots[*]}; do
  symlink "$dotfile" .
done

# Files that need slightly different symlink
mkdir -p "$HOME/.config/nvim/"
[ ! -e "$HOME/.config/nvim/coc-settings.json" ] && ln -sfv $(grealpath coc-settings.json) "$HOME/.config/nvim/coc-settings.json"
[ ! -e "$HOME/.config/nvim/init.lua" ] && ln -sfv $(grealpath init.lua) "$HOME/.config/nvim/init.lua"
[ ! -e "$HOME/.config/starship.toml" ] && ln -sfv $(grealpath starship.toml) "$HOME/.config/starship.toml"
[ ! -e "$HOME/.config/mise.toml" ] && ln -sfv $(grealpath mise.toml) "$HOME/.config/mise.toml"

mkdir -p "$HOME/.config/btop"
[ ! -e "$HOME/.config/btop/btop.conf" ] && ln -sfv $(grealpath btop.conf) "$HOME/.config/btop/btop.conf"

mkdir -p "$HOME/.config/workmux"
[ ! -e "$HOME/.config/workmux/config.yaml" ] && ln -sfv $(grealpath workmux.yaml) "$HOME/.config/workmux/config.yaml"


mkdir "$HOME/.ssh"
[ ! -e "$HOME/.ssh/config" ] && ln -sfv $(grealpath ssh-config) "$HOME/.ssh/config"

mkdir "$HOME/.vscode"
[ ! -e "$HOME/.vscode/init.vim" ] && ln -sfv $(grealpath vscode.vim) "$HOME/.vscode/init.vim"

# just copy this so it can be changed per mac
cp ./alacritty.toml "$HOME/.alacritty.toml"

popd

# Directories

symlink applescript .
symlink bin .
symlink tmuxinator .

log_success "Symlinks created!"
