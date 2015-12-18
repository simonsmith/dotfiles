# .dotfiles

Mac config and setup steps.

<div style="text-align: center">
<img src="http://cl.ly/e1UK/Screen%20Shot%202015-12-07%20at%2023.27.54.png">
</div>

## First step

1. [Install command line](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/) developer tools - `xcode-select --install`

## Clone dotfiles in home directory

```bash
git clone https://github.com/simonsmith/dotfiles.git
```

## New mac

Set some OS X defaults:

```
./scripts/osx.sh
```

Wipe the dock icons

```
defaults write com.apple.dock persistent-apps -array ""
```

## Install all the things

```
./install.sh
```

This script will check existence of things before installing so it can be run
multiple times

Add private dotfiles to home directory (`.extra` and `.gitconfig.local`)

### Weechat

Most config should work from the `.weechat` dir, but some useful links

https://gist.github.com/allcentury/e1ed5800d0a98a8828a9
http://stackoverflow.com/a/32490506/617615

## Menubar

![](https://s3.amazonaws.com/f.cl.ly/items/2z1z052B3z2a2S391Q3b/Screen%20Shot%202015-12-18%20at%2020.02.34.png?v=6db497bc)
