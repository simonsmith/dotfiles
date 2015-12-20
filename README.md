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

Load Vim and `:PlugInstall` to install plugins.

Add private dotfiles to home directory (`.extra` and `.gitconfig.local`).

### Weechat

Most config should work from the `.weechat` dir, but some useful links:

* https://gist.github.com/allcentury/e1ed5800d0a98a8828a9
* http://stackoverflow.com/a/32490506/617615

## Menubar

![](https://s3.amazonaws.com/f.cl.ly/items/2z1z052B3z2a2S391Q3b/Screen%20Shot%202015-12-18%20at%2020.02.34.png?v=6db497bc)

## Credit

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/)
* [ismay](https://github.com/ismay/dotfiles)
* [thoughtbot](https://github.com/thoughtbot/laptop)
