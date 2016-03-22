log() {
  local fmt="$1"; shift
  printf "\n\e[94m$fmt\n" "$@"
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    log "Updating %s ..." "$1"
    gem update "$@"
  else
    log "Installing %s ..." "$1"
    gem install "$@"
    rbenv rehash
  fi
}

ruby_version="$(curl -sSL http://ruby.thoughtbot.com/latest)"

log "Installing ruby ..."
if ! rbenv versions | grep -Fq "$ruby_version"; then
  rbenv install -s "$ruby_version"
fi

eval "$(rbenv init -)"

rbenv global "$ruby_version"
rbenv shell "$ruby_version"

gem update --system

gem_install_or_update bundler
gem_install_or_update middleman
gem_install_or_update tmuxinator
gem_install_or_update circle-ci

log "Configuring Bundler ..."
  number_of_cores=$(sysctl -n hw.ncpu)
  bundle config --global jobs $((number_of_cores - 1))
log "Bundler configured ..."
