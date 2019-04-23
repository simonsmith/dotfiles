 symlink() {
   filePath=$(grealpath $1)
   [ ! -e "$HOME/$2$1" ] && ln -sfv $filePath "$HOME/$2$1"
 }

echo "Creating symlinks ..."

pushd ./dots

dots=(
  ackrc
  agignore
  aliases
  alacritty.yml
  chunkwmrc
  ctags
  curlrc
  editorconfig
  functions
  gitconfig
  gitignore
  gitmessage
  hushlogin
  khdrc
  ripgreprc
  rgignore
  tern-project
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

[ ! -e "$HOME/.tern-config" ] && ln -sfv $(grealpath tern-project) "$HOME/.tern-config"

[ ! -e "$HOME/.config/nvim/coc-settings.json" ] && ln -sfv $(grealpath coc-settings.json) "$HOME/.config/nvim/coc-settings.json"

mkdir "$HOME/.ssh"
[ ! -e "$HOME/.ssh/config" ] && ln -sfv $(grealpath ssh-config) "$HOME/.ssh/config"

popd

# Directories

symlink applescript
symlink bin
symlink tmuxinator .

mkdir "$HOME/.zdata"
touch "$HOME/.zdata/.z"
