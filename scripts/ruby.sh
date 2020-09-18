ruby_version=2.7.1

echo "Installing ruby ..."

if ! rbenv versions | grep -Fq "$ruby_version"; then
  rbenv install -s "$ruby_version"
fi

eval "$(rbenv init -)"

rbenv global "$ruby_version"
rbenv shell "$ruby_version"

gem update --system

gem install tmuxinator

rbenv rehash

echo "Configuring Bundler ..."

number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))
