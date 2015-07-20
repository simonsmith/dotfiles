# .dotfiles

These are my personal Mac OS configs and setup steps.

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

### Install oh-my-zsh

``` bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Install powerline fonts

https://github.com/powerline/fonts

### Install tmuxinator

https://github.com/tmuxinator/tmuxinator

```bash
gem install tmuxinator
```

### Install Vundle

https://github.com/gmarik/Vundle.vim#quick-start

### Install Oceanic Next for Vim/iTerm

https://github.com/voronianski/oceanic-next-color-scheme

### Install nvm

``` bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
nvm install 0.10
```

### Install global npm packages

```bash
./.npm_global
```

### Install native apps with `brew cask`

Install native apps with [`brew cask`](https://github.com/phinze/homebrew-cask):

```bash
./cask.sh
```

## Icons

Muir Icons
 - http://dewith.com/2014/muir-yosemite-creative-suite-icons/
 - http://dewith.com/2014/muir-yosemite-icons-volume-ii/

Others
 - https://gumroad.com/l/yosemite
 - https://dribbble.com/shots/1622794-OSX-Yosemite-Replacement-Icons


## Menubar

Layout - http://cl.ly/c00h
