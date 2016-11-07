# .dotfiles

Mac config and setup steps.

![](https://cl.ly/hdHl/Screen%20Shot%202016-09-30%20at%2016.03.42.png)

[nvim and tmux screenshot with kwm](https://cl.ly/hgAq)

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

* Install Knack font from iterm directory

* Add private dotfiles to home directory (`.extra` and `.gitconfig.local`).

## UserStyles

* [Slack Dark](https://userstyles.org/styles/117475/slack-night-mode-black)
* [YouTube Dark](https://userstyles.org/styles/117673/darktube)
* [Hacker News](https://github.com/oskarkrawczyk/hackernews-userstyles)

## Credit

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/)
* [thoughtbot](https://github.com/thoughtbot/laptop)
