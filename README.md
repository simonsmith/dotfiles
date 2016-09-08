# .dotfiles

Mac config and setup steps.

![](https://cl.ly/gpnk/Screen%20Shot%202016-07-30%20at%2007.00.34.png)

[nvim and tmux screenshot](https://cl.ly/hPr2)

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

## UserStyles

* [Slack Dark](https://userstyles.org/styles/117475/slack-night-mode-black)
* [YouTube Dark](https://userstyles.org/styles/117673/darktube)
* [Hacker News](https://github.com/oskarkrawczyk/hackernews-userstyles)

## Menubar

![](https://cl.ly/gpd7/Image%202016-07-30%20at%207.02.42%20am.png)

## Credit

* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles/)
* [ismay](https://github.com/ismay/dotfiles)
* [thoughtbot](https://github.com/thoughtbot/laptop)
