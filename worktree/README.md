# git worktrees ❤️tmux

Work on multiple branches simultaneously with isolated worktrees in tmux windows.
Uses [wtp](https://github.com/satococoa/wtp)

Press `wt <tab>` for autocomplete

## Install

Source the functions file and unalias `wt` so this function overrides the `wtp` alias:

```bash
if [[ -f "$HOME/dotfiles/worktree/worktree-functions" ]]; then
  source "$HOME/dotfiles/worktree/worktree-functions"
  unalias wt 2>/dev/null
fi
```

## Commands

### Tmux Integration

Create and manage worktrees with automatic tmux sessions (editor + terminal + assistant).
Each worktree gets its own dedicated session with 3 windows.

```bash
wt new <branch> [base]         # Create new branch, open in dedicated tmux session
                               # Example: wt new feature/auth
                               # Example: wt new feature/auth main

wt open <branch>               # Open existing branch in dedicated tmux session
                               # Creates worktree if doesn't exist
                               # Example: wt open feature/existing

wt close [branch]              # Exit/detach from tmux session
                               # Example: wt close
                               # Example: wt close feature/auth

wt destroy [branch]            # Kill tmux session, remove worktree (keep branch)
                               # Example: wt destroy
                               # Example: wt destroy feature/old

wt destroy -d [branch]         # Kill tmux session, remove worktree + DELETE branch
wt destroy --delete [branch]   # Example: wt destroy -d
                               # Example: wt destroy --delete feature/old
```

### Standard Worktree Commands

Manage worktrees without tmux integration.

```bash
wt add <branch>                # Add existing branch as worktree
                               # Example: wt add feature/existing

wt add -b <branch> [base]      # Create new branch as worktree
                               # Example: wt add -b feature/new
                               # Example: wt add -b feature/new main

wt remove <branch>             # Remove worktree only (keep branch)
                               # Example: wt remove feature/old
```

### Navigation & Info

```bash
wt list                        # List all worktrees and their branches

wt cd [branch]                 # Navigate to worktree directory
                               # No args: go to main worktree
                               # Example: wt cd feature/auth

wt sync [branch]               # Fetch origin default branch and rebase
                               # No args: sync current branch
                               # Example: wt sync feature/auth
```

## Tmux Layout

Each worktree gets its own dedicated tmux session named `wt-<repo>_<branch>` with 3 windows:

**Windows:**
- Window 0: `edit` - Your editor (neovim)
- Window 1: `term` - Terminal for commands, tests, etc.
- Window 2: `ai` - AI assistant

## Customization

Environment variables to customize tmux windows:

```bash
export WT_EDITOR="nvim"                                     # Default editor
export WT_ASSISTANT="claude --dangerously-skip-permissions" # AI assistant
export WT_TERMINAL_CMD=""                                   # Command to run in term window
```
