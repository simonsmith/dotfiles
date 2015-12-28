symlink_dotfile() {
  ln -sfv $(grealpath $1) "$HOME/.$1"
}

symlink() {
  ln -sfv $(grealpath $1) "$HOME/$1"
}

log "Creating symlinks ..."

pushd ./dots
symlink redis.conf
symlink_dotfile ackrc
symlink_dotfile agignore
symlink_dotfile aliases
symlink_dotfile caniuse.json
symlink_dotfile curlrc
symlink_dotfile editorconfig
symlink_dotfile eslintrc
symlink_dotfile functions
symlink_dotfile gitconfig
symlink_dotfile gitignore
symlink_dotfile hushlogin
symlink_dotfile jshintrc
symlink_dotfile stylelintrc
symlink_dotfile tern-config
symlink_dotfile tmux.conf
symlink_dotfile tmuxline_snapshot
symlink_dotfile vimrc
symlink_dotfile wgetrc
symlink_dotfile zshenv
symlink_dotfile zshrc
popd

# Directories

# Remove first so folders don't become nested if this runs
# more than once
rm "$HOME/.tmuxinator"
symlink_dotfile tmuxinator
rm "$HOME/emmet"
symlink emmet
rm "$HOME/iterm"
symlink iterm
rm "$HOME/bin"
symlink bin
rm "$HOME/eslint"
symlink eslint

mkdir "$HOME/.zdata"
touch "$HOME/.zdata/.z"
