# .dotfiles

Mac config and setup steps.

![](https://cl.ly/pibU/Image%202018-02-22%20at%2010.12.26%20pm.png)

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

Run install script:

```
./install.sh
```

Set macOS defaults:

```
./scripts/macos.sh
```

When complete, open new terminal window to trigger `zgen` plugin downloads.

## Manual steps

* Install [Alacritty](https://github.com/jwilm/alacritty/)

* Install Knack font

* Add private dotfiles to home directory (`.extra` and `.gitconfig.local`).

## UserStyles

* [Slack Dark](https://userstyles.org/styles/117475/slack-night-mode-black)
* [Hacker News](https://github.com/oskarkrawczyk/hackernews-userstyles)
