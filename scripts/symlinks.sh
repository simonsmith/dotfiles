
symlink_dotfile() {
  ln -sfv $(grealpath $1) "$HOME/.$1"
}

symlink() {
  ln -sfv $(grealpath $1) "$HOME/$1"
}

echo "Creating symlinks ..."

symlink_dotfile vimrc
symlink_dotfile ackrc
symlink_dotfile agignore
symlink_dotfile aliases
symlink_dotfile caniuse.json
symlink_dotfile curlrc
symlink_dotfile editorconfig
symlink_dotfile fzf.zsh
symlink_dotfile functions
symlink_dotfile gitignore
symlink_dotfile gitconfig
symlink_dotfile hushlogin
symlink_dotfile jshintrc
symlink_dotfile tmux.conf
symlink_dotfile tmuxline_snapshot
symlink_dotfile wgetrc
symlink_dotfile zshenv
symlink_dotfile zshrc
symlink redis.conf

symlink_dotfile tmuxinator

echo "Creating directories ..."

mkdir "$HOME/.zdata"
mkdir "$HOME/.vim"
