# .dotfiles

Mac config and setup steps.

![](http://cl.ly/fD1z/Screen%20Shot%202016-02-22%20at%2009.39.03.png)

## First steps

[Install](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/) command line developer tools:

```
make
```

Clone dotfiles to home directory

```
git clone https://github.com/simonsmith/dotfiles.git
```

If permissions are not set (they should be) then do it manually

```
chmod u+x ./install.sh ./scripts/*.sh
```

## Install

Set OS X defaults:

```
./scripts/osx.sh
```

Change to `~/dotfiles` directory and run install script:

```
./install.sh
```

When complete, open new terminal window to trigger `zgen` plugin downloads.

## Manual steps

* Load custom iterm settings

* Open Vim and `:PlugInstall` to install plugins.

* Setup [YCM](https://github.com/Valloric/YouCompleteMe#mac-os-x-installation)
  and [Tern](https://github.com/ternjs/tern_for_vim)

* Add private dotfiles to home directory (`.extra` and `.gitconfig.local`).

### Weechat

Most config should work from the `.weechat` dir, but some useful links:

* https://gist.github.com/allcentury/e1ed5800d0a98a8828a9
* http://stackoverflow.com/a/32490506/617615

## UserStyles

* [GitHub Dark](https://userstyles.org/styles/37035/github-dark) (#c787de)
* [Gitter Dark](https://userstyles.org/styles/112547/matu-s-dark-gitter)
* [Slack Dark](https://userstyles.org/styles/117475/slack-night-mode-black)
* [YouTube Dark](https://userstyles.org/styles/117673/darktube)
* [Hacker News](https://github.com/oskarkrawczyk/hackernews-userstyles)

## Menubar

![](http://f.cl.ly/items/1m1l40172O38401e1F2U/Screen%20Shot%202016-01-14%20at%2010.31.24.png)

## Credit

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/)
* [ismay](https://github.com/ismay/dotfiles)
* [thoughtbot](https://github.com/thoughtbot/laptop)
