echo "Adding zsh to list of accepted shells ..."
sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
echo "Setting zsh as default shell ..."
chsh -s /usr/local/bin/zsh
