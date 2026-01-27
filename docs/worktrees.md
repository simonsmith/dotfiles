# Git Worktrees + Tmux

Work on multiple branches simultaneously with isolated worktrees in tmux windows.

## Commands

### Tmux Integration

Create and manage worktrees with automatic tmux environments (editor + terminal + claude).

```bash
wt new <branch> [base]         # Create new branch, open in tmux window
                               # Example: wt new feature/auth
                               # Example: wt new feature/auth main

wt open <branch>               # Open existing branch in tmux window
                               # Creates worktree if doesn't exist
                               # Example: wt open feature/existing

wt close [branch]              # Close tmux window, remove worktree (keep branch)
                               # Example: wt close
                               # Example: wt close feature/old

wt close -d [branch]           # Close tmux window, remove worktree + DELETE branch
wt close --delete [branch]     # Example: wt close -d
                               # Example: wt close --delete feature/old
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

wt status                      # Show current worktree info
                               # Branch, path, tmux window

wt update [branch]             # Fetch origin/master and rebase
                               # No args: update current branch
                               # Example: wt update feature/auth
```

## Tmux Layout

```
┌─────────────────┬──────────────┐
│                 │   Terminal   │
│    Neovim       ├──────────────┤
│                 │    Claude    │
└─────────────────┴──────────────┘
```

Navigate between panes: `Ctrl+h/j/k/l` (seamlessly works with vim splits)

## Customization

Environment variables to customize tmux layout:

```bash
export WT_EDITOR="nvim"                                    # Default editor
export WT_ASSISTANT="claude --dangerously-skip-permissions" # AI assistant
export WT_TERMINAL_CMD=""                                  # Terminal command
export WT_PANE_WIDTH="40"                                  # Right pane width %
```

## Files

- **Functions:** `~/dotfiles/dots/worktree-functions`
- **Requires:** [wtp](https://github.com/satococoa/wtp)
