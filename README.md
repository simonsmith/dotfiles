# .dotfiles

Mac config and setup steps.

## First steps

Install Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

This will also install command line tools

Clone dotfiles to home directory

```
git clone https://github.com/simonsmith/dotfiles.git
```

## Install

Run install script from dotfiles directory:

```
cd dotfiles
./install.sh
```

Set macOS defaults:

```
./scripts/macos.sh
```

## Manual steps

* Add private dotfiles to home directory (`.extra` and `.gitconfig.local`).
