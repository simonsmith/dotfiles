symlink_dotfile() {
  ln -sfv $(grealpath $1) "$HOME/.$1"
}

symlink() {
  ln -sfv $(grealpath $1) "$HOME/$1"
}

echo "Creating symlinks ..."

# ./dots/foo -> ~/.foo
for file in ./dots/*; do
  ln -sfv $(grealpath $file) "$HOME/.$(basename $file)"
done

symlink redis.conf

# Directories

# Remove first so folders don't become nested if this runs
# more than once
rm "$HOME/.tmuxinator"
symlink_dotfile tmuxinator
rm "$HOME/emmet"
symlink emmet
rm "$HOME/iterm"
symlink iterm
rm "$HOME/applescript"
symlink applescript
rm "$HOME/bin"
symlink bin
rm "$HOME/eslint"
symlink eslint

mkdir "$HOME/.zdata"
touch "$HOME/.zdata/.z"
