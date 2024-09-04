 symlink() {
   filePath=$(grealpath $1)
   [ ! -e "$HOME/$2$1" ] && ln -sfv $filePath "$HOME/$2$1"
 }

echo "Creating symlinks ..."
rm ~/.zshrc

pushd ./dots

dots=(
  ackrc
  agignore
  aliases
  alacritty.common.toml
  batconfig
  yabairc
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
  tmuxline_snapshot
  vimrc
  wgetrc
  zshrc
)

for dotfile in ${dots[*]}; do
  symlink "$dotfile" .
done

# Files that need slightly different symlink

[ ! -e "$HOME/.config/nvim/coc-settings.json" ] && ln -sfv $(grealpath coc-settings.json) "$HOME/.config/nvim/coc-settings.json"
[ ! -e "$HOME/.config/starship.toml" ] && ln -sfv $(grealpath starship.toml) "$HOME/.config/starship.toml"

mkdir "$HOME/.ssh"
[ ! -e "$HOME/.ssh/config" ] && ln -sfv $(grealpath ssh-config) "$HOME/.ssh/config"

mkdir "$HOME/.vscode"
[ ! -e "$HOME/.vscode/init.vim" ] && ln -sfv $(grealpath vscode.vim) "$HOME/.vscode/init.vim"

popd

# Directories

symlink applescript
symlink bin
symlink tmuxinator .

mkdir "$HOME/.zdata"
touch "$HOME/.zdata/.z"

