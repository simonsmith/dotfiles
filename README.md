# .dotfiles

These are my personal Mac OS configs and setup steps.

<div style="text-align: center">
<img src="http://f.cl.ly/items/411H2Q3p3g3h3b3D120N/Screen%20Shot%202015-09-29%20at%2014.54.35.png">
</div>

## First steps
1. Install command line developer tools (type `make` or `gcc` to spawn a prompt)
1. Install Homebrew - `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## Install dotfiles

```bash
git clone https://github.com/simonsmith/dotfiles.git && cd dotfiles && sh bootstrap.sh
```

### OS X defaults

When setting up a new Mac, set some OS X defaults:

```bash
./.osx
```

Wipe the dock icons

```bash
defaults write com.apple.dock persistent-apps -array ""
```

### Install Homebrew formulae

```bash
./brew.sh
```

### Use zsh

Add `/usr/local/bin/zsh` to `/etc/shells`

Run `chsh -s $(which zsh)`

zgen should install everything when `.zshrc` is loaded

### Install powerline fonts

https://github.com/powerline/fonts

Droid Sans all the things

### Install git-hub

https://github.com/ingydotnet/git-hub#installation

### Install tmuxinator

https://github.com/tmuxinator/tmuxinator

```bash
gem install tmuxinator
```

### Install vim-plug

https://github.com/junegunn/vim-plug#installation

Install all plugins

### Weechat

Most config should work from the `.weechat` dir, but some useful links

https://gist.github.com/allcentury/e1ed5800d0a98a8828a9
http://stackoverflow.com/a/32490506/617615

### Install nvm

``` bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
nvm install 0.10
```

### Install global npm packages

```bash
./npmglobal.sh
```

### Install native apps with `brew cask`

Install native apps with [`brew cask`](https://github.com/phinze/homebrew-cask):

```bash
./cask.sh
```
## Menubar

Layout - http://cl.ly/d3ao
