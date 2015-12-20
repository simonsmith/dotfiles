# .dotfiles

Mac config and setup steps.

![](http://f.cl.ly/items/2E2b0v0b3G1H0r0j1l2B/Screen%20Shot%202015-12-20%20at%2023.06.52.png)

## First steps

[Install](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/) command line developer tools:

```
xcode-select --install`
```

Clone dotfiles to home directory

```
git clone https://github.com/simonsmith/dotfiles.git
```

## Install

Set OS X defaults:

```
./scripts/osx.sh
```

Run install script

```
./install.sh
```

When complete, open new terminal window to trigger `zgen` plugin downloads.

## Manual steps

* Load custom iterm settings

* Open Vim and `:PlugInstall` to install plugins.

* Add private dotfiles to home directory (`.extra` and `.gitconfig.local`).

### Weechat

Most config should work from the `.weechat` dir, but some useful links:

* https://gist.github.com/allcentury/e1ed5800d0a98a8828a9
* http://stackoverflow.com/a/32490506/617615

## Menubar

![](http://f.cl.ly/items/0I3w0S2D3o2V1d2X3A3o/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f662e636c2e6c792f6974656d732f327a317a30353242337a326132533339315133622f53637265656e25323053686f74253230323031352d31322d3138253230617425323032302e30322e33342e706e673f763d3664623439376263.png)

## Credit

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/)
* [ismay](https://github.com/ismay/dotfiles)
* [thoughtbot](https://github.com/thoughtbot/laptop)
