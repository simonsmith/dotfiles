# .dotfiles

Mac config and setup steps.

![](http://cl.ly/g6W0/Screen%20Shot%202016-05-08%20at%2011.39.20.png)

## First steps

[Install](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/) command line developer tools:

```
make
```

Clone dotfiles to home directory

```
git clone https://github.com/simonsmith/dotfiles.git
```

## Install

Set macOS defaults:

```
./scripts/macos.sh
```

Run install script:

```
./install.sh
```

When complete, open new terminal window to trigger `zgen` plugin downloads.

## Manual steps

* Load custom iterm settings

* Install [Knack](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack/Regular/complete) font

* Add private dotfiles to home directory (`.extra` and `.gitconfig.local`).

### Weechat

Most config should work from the `.weechat` dir, but some useful links:

* https://gist.github.com/allcentury/e1ed5800d0a98a8828a9
* http://stackoverflow.com/a/32490506/617615

## UserStyles

* [Slack Dark](https://userstyles.org/styles/117475/slack-night-mode-black)
* [YouTube Dark](https://userstyles.org/styles/117673/darktube)
* [Hacker News](https://github.com/oskarkrawczyk/hackernews-userstyles)

## Menubar

![](http://f.cl.ly/items/1m1l40172O38401e1F2U/Screen%20Shot%202016-01-14%20at%2010.31.24.png)

## Credit

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/)
* [ismay](https://github.com/ismay/dotfiles)
* [thoughtbot](https://github.com/thoughtbot/laptop)
