# Git Worktrees Quick Reference

Work on multiple branches simultaneously with isolated worktrees + tmux environments.

## Commands

### wtmux - Create worktree + tmux environment

Opens neovim, terminal, and claude in a 3-pane layout.

```bash
wtmux feature/auth              # Add existing branch
wtmux -b feature/new            # Create new branch
wtmux -b feature/test main      # Create new branch from main
```

### wtclose - Remove worktree

Closes tmux window and removes worktree.

```bash
wtclose                         # Remove current worktree (keep branch)
wtclose -b                      # Remove current worktree + delete branch
wtclose feature/auth            # Remove specific worktree
wtclose -b feature/auth         # Remove specific worktree + delete branch
```

### wtlist - List all worktrees

```bash
wtlist
```

### wtcd - Navigate to worktree

```bash
wtcd                           # Go to main worktree
wtcd feature/auth              # Go to specific worktree
```

## Aliases

| Alias | Command | Description |
|-------|---------|-------------|
| `wt` | `wtp` | Main wtp command |
| `wta` | `wtp add` | Add existing branch as worktree |
| `wtb` | `wtp add -b` | Create new branch and worktree |
| `wtl` | `wtp list` | List all worktrees |
| `wtc` | `wtp cd` | Navigate to worktree |
| `wtr` | `wtp remove` | Remove worktree only |
| `wtrb` | `wtp remove --with-branch` | Remove worktree and branch |

## Common Workflows

### New feature

```bash
wtmux -b feature/user-profile    # Create + open
# ... work on feature ...
wtclose -b                        # Close + clean up
```

### Existing branch

```bash
wtmux feature/existing           # Open existing branch
# ... work on it ...
wtclose                          # Close (keep branch)
```

### Multiple features

```bash
wtmux -b feature/auth            # Open first feature
wtmux -b feature/payments        # Open second (new tmux window)

# Switch between: Ctrl-b n/p or Ctrl-b <number>
```

### Quick fix

```bash
wtmux hotfix/urgent-bug          # Quick switch
# ... make fix ...
git add . && git commit -m "fix"
wtclose                          # Back to previous work
```

### Clean up

```bash
wtlist                           # See all worktrees
wtclose -b feature/old           # Remove worktree + branch
```

## Tmux Layout

```
┌─────────────────┬──────────────┐
│                 │              │
│                 │   Terminal   │
│    Neovim       │              │
│                 ├──────────────┤
│                 │              │
│                 │    Claude    │
└─────────────────┴──────────────┘
```

## Files

- **Config:** `~/dotfiles/.wtp.yml`
- **Functions:** `~/dotfiles/dots/worktree-functions`
- **Aliases:** `~/dotfiles/dots/aliases`
