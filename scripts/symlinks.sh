symlink_dotfile() {
  ln -sfv $(grealpath $1) "$HOME/.$1"
}

symlink() {
  ln -sfv $(grealpath $1) "$HOME/$1"
}

echo "Creating symlinks ..."

pushd ./dots
symlink redis.conf
symlink_dotfile ackrc
symlink_dotfile agignore
symlink_dotfile aliases
symlink_dotfile alacritty.yml
symlink_dotfile chunkwmrc
symlink_dotfile ctags
symlink_dotfile curlrc
symlink_dotfile editorconfig
symlink_dotfile functions
symlink_dotfile gitconfig
symlink_dotfile gitignore
symlink_dotfile gitmessage
symlink_dotfile hushlogin
symlink_dotfile khdrc
symlink_dotfile ripgreprc
symlink_dotfile rgignore
symlink_dotfile tern-project
symlink_dotfile tmux.conf
symlink_dotfile tmuxline_snapshot
symlink_dotfile vimrc
symlink_dotfile wgetrc
symlink_dotfile zshenv
symlink_dotfile zshrc
ln -sfv $(grealpath tern-project) "$HOME/.tern-config"
mkdir "$HOME/.ssh"
ln -sfv $(grealpath ssh-config) "$HOME/.ssh/config"
popd

# Directories

# Remove first so folders don't become nested if this runs more than once
rm "$HOME/.tmuxinator"
rm "$HOME/applescript"
rm "$HOME/bin"

symlink applescript
symlink bin
symlink_dotfile tmuxinator

mkdir "$HOME/.zdata"
touch "$HOME/.zdata/.z"
