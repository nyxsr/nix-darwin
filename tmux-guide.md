# Tmux Configuration Guide

A powerful tmux configuration optimized for macOS with Alacritty, featuring intuitive keybindings, session persistence, and beautiful Catppuccin theme.

## Table of Contents
- [Installation](#installation)
- [Key Concepts](#key-concepts)
- [Keybindings Reference](#keybindings-reference)
- [Workflows](#workflows)
- [Tips & Tricks](#tips--tricks)
- [Troubleshooting](#troubleshooting)

## Installation

This tmux configuration is managed through Nix Darwin. It's already included in your setup and will be automatically configured when you run:

```bash
cd ~/.config/nix-darwin
sudo darwin-rebuild switch --flake ".#sahrulramdan"
```

## Key Concepts

### Prefix Key
- **Default tmux**: `Ctrl+b`
- **Our config**: `Ctrl+a` (easier to reach)
- To send commands to tmux, press `Ctrl+a` then the command key

### Hierarchy
```
Server
  └── Session (workspace/project)
        └── Window (tab-like)
              └── Pane (split view)
```

## Keybindings Reference

> **Note**: `Prefix` means `Ctrl+a` in our configuration

### 🎯 Essential Commands

| Command | Description |
|---------|-------------|
| `Prefix + ?` | Show all keybindings |
| `Prefix + r` | Reload tmux configuration |
| `Prefix + :` | Enter command mode |
| `Prefix + d` | Detach from session |

### 🪟 Window Management

| Command | Description |
|---------|-------------|
| `Prefix + c` | Create new window |
| `Prefix + ,` | Rename current window |
| `Prefix + &` | Kill current window |
| `Prefix + w` | List all windows |
| `Prefix + 0-9` | Switch to window number |
| `Alt + h` | Previous window (no prefix needed) |
| `Alt + l` | Next window (no prefix needed) |
| `Alt + 1-9` | Quick jump to window 1-9 (no prefix) |
| `Ctrl+Shift + ←/→` | Move window left/right |

### 📦 Pane Management

#### Creating Panes
| Command | Description |
|---------|-------------|
| `Prefix + \|` | Split pane vertically |
| `Prefix + -` | Split pane horizontally |
| `Prefix + %` | Split vertically (default) |
| `Prefix + "` | Split horizontally (default) |

#### Navigating Panes
| Command | Description |
|---------|-------------|
| `Prefix + h/j/k/l` | Navigate panes (vim-style) |
| `Alt + ←/↓/↑/→` | Navigate panes (no prefix) |
| `Ctrl + h/j/k/l` | Smart vim-aware navigation |
| `Prefix + q` | Show pane numbers |
| `Prefix + q + 0-9` | Jump to pane by number |

#### Resizing Panes
| Command | Description |
|---------|-------------|
| `Prefix + H/J/K/L` | Resize pane (hold to repeat) |
| `Ctrl+Shift + ←/↓/↑/→` | Resize by 5 units (no prefix) |

#### Pane Operations
| Command | Description |
|---------|-------------|
| `Prefix + z` | Toggle pane zoom |
| `Alt + z` | Toggle zoom (no prefix) |
| `Prefix + x` | Kill current pane |
| `Prefix + !` | Break pane into new window |
| `Prefix + >` | Swap with next pane |
| `Prefix + <` | Swap with previous pane |
| `Prefix + Space` | Toggle pane layouts |
| `Prefix + {` | Move pane left |
| `Prefix + }` | Move pane right |

### 🎮 Session Management

| Command | Description |
|---------|-------------|
| `tmux new -s name` | Create named session |
| `tmux ls` | List all sessions |
| `tmux attach -t name` | Attach to session |
| `Prefix + s` | Session switcher |
| `Prefix + $` | Rename session |
| `Prefix + N` | Create new session |
| `Prefix + X` | Kill current session |
| `Prefix + (` | Previous session |
| `Prefix + )` | Next session |
| `Alt + j` | Next session (no prefix) |
| `Alt + k` | Previous session (no prefix) |

### 📋 Copy Mode

| Command | Description |
|---------|-------------|
| `Prefix + Enter` | Enter copy mode |
| `Alt + v` | Enter copy mode (no prefix) |
| `Prefix + [` | Enter copy mode (default) |
| `v` | Begin selection (in copy mode) |
| `Ctrl + v` | Rectangle selection |
| `y` | Copy selection |
| `Enter` | Copy and exit |
| `Escape` | Exit copy mode |
| `q` | Exit copy mode |

**In Copy Mode (vi-style navigation):**
- `h/j/k/l` - Move cursor
- `w/b` - Next/previous word
- `f/F` - Find character forward/backward
- `g/G` - Go to top/bottom
- `0/$` - Start/end of line
- `/` - Search forward
- `?` - Search backward
- `n/N` - Next/previous search result

### 🎨 Quick Layouts

| Command | Description |
|---------|-------------|
| `Alt + 1` | Even horizontal split |
| `Alt + 2` | Even vertical split |
| `Alt + 3` | Main horizontal (big top) |
| `Alt + 4` | Main vertical (big left) |
| `Alt + 5` | Tiled layout |

### 🚀 Quick Launch Windows

| Command | Description |
|---------|-------------|
| `Prefix + H` | Open htop in new window |
| `Prefix + g` | Open lazygit in new window |
| `Prefix + K` | Open k9s in new window |

### 🔧 Popup Windows (Floating)

| Command | Description |
|---------|-------------|
| `Prefix + G` | Open lazygit in popup |
| `Prefix + F` | File picker with preview |
| `Prefix + T` | Terminal popup |

### 💾 Session Persistence (via plugins)

| Command | Description |
|---------|-------------|
| `Prefix + Ctrl+s` | Save session |
| `Prefix + Ctrl+r` | Restore session |

The Continuum plugin auto-saves every 15 minutes and can auto-restore on tmux start.

### 🔄 Nested Sessions

| Command | Description |
|---------|-------------|
| `F12` | Toggle key bindings for nested tmux |

Use this when SSHing to a remote server that also runs tmux.

## Workflows

### 🏗️ Project Setup Workflow

```bash
# Create a new session for your project
tmux new -s myproject

# Split window for editor and terminal
Prefix + |  # Vertical split

# Navigate to panes
Alt + ←/→

# Create new window for server
Prefix + c
Prefix + ,  # Rename to 'server'

# Create window for git
Prefix + c
Prefix + ,  # Rename to 'git'

# Save session layout
Prefix + Ctrl+s

# Detach
Prefix + d

# Later, reattach
tmux attach -t myproject
```

### 🔍 Quick Navigation Workflow

```bash
# Jump between windows
Alt + h/l  # Previous/next
Alt + 1-9  # Direct jump

# Quick pane navigation
Alt + Arrow keys  # No prefix needed

# Zoom into pane for focus
Alt + z

# Quick copy text
Alt + v  # Enter copy mode
v        # Start selection
y        # Copy to clipboard
```

### 📊 Monitoring Workflow

```bash
# Open monitoring tools
Prefix + H  # htop in new window
Prefix + K  # k9s for Kubernetes

# Use popups for quick checks
Prefix + G  # lazygit popup
Prefix + T  # Quick terminal popup
```

## Tips & Tricks

### 🎯 Pro Tips

1. **Mouse Support**: Click to select panes, drag to resize, scroll to navigate
2. **Smart Pane Switching**: `Ctrl+h/j/k/l` works seamlessly between vim splits and tmux panes
3. **Persistent Sessions**: Sessions survive system restarts with tmux-resurrect
4. **Quick Window Switching**: Use `Alt+1-9` for instant window access
5. **Popup Windows**: Use `Prefix+T` for quick commands without leaving current view

### 🎨 Visual Indicators

- **Active Pane**: Blue border
- **Inactive Pane**: Gray border
- **Window Status**: Current window highlighted in red
- **Pane Info**: Shows pane number and current command in border

### ⚡ Performance Tips

1. **Reduce Escape Time**: Set to 0ms for instant vim mode switching
2. **Large History**: 50,000 lines of scrollback per pane
3. **Smart Resizing**: Hold resize keys to repeat action

### 🔌 Included Plugins

1. **tmux-sensible**: Better defaults
2. **tmux-yank**: Enhanced copy/paste
3. **tmux-pain-control**: Better pane management
4. **tmux-sessionist**: Session management utilities
5. **tmux-resurrect**: Save/restore sessions
6. **tmux-continuum**: Auto-save/restore
7. **catppuccin**: Beautiful theme

## Troubleshooting

### Common Issues

**Q: Prefix key not working?**
- Ensure you're pressing `Ctrl+a` (not `Ctrl+b`)
- Check if you're in a nested session (try `F12`)

**Q: Colors look wrong?**
- Restart tmux: `tmux kill-server && tmux`
- Ensure Alacritty is using `alacritty` as TERM

**Q: Copy to clipboard not working?**
- On macOS, pbcopy integration is automatic
- Try `Prefix + r` to reload config

**Q: Session not restoring?**
- Manual restore: `Prefix + Ctrl+r`
- Check if continuum is running: `Prefix + I`

**Q: Can't see pane borders?**
- Your terminal might not support Unicode
- Try changing theme or border characters

### Reset Everything

```bash
# Kill all tmux processes
tmux kill-server

# Remove resurrect saves (optional)
rm -rf ~/.local/share/tmux/resurrect/*

# Start fresh
tmux
```

## Quick Reference Card

```
┌─────────────────────────────────────┐
│          TMUX QUICK REFERENCE       │
├─────────────────────────────────────┤
│ Prefix: Ctrl+a                      │
├─────────────────────────────────────┤
│ WINDOWS                             │
│ c     - new          Alt+h - prev   │
│ ,     - rename       Alt+l - next   │
│ &     - kill         Alt+1-9 - jump │
├─────────────────────────────────────┤
│ PANES                               │
│ |     - split vert   h/j/k/l - nav  │
│ -     - split horiz  z - zoom       │
│ x     - kill         q - show nums  │
├─────────────────────────────────────┤
│ SESSIONS                            │
│ s     - switcher     d - detach     │
│ $     - rename       N - new        │
├─────────────────────────────────────┤
│ COPY MODE                           │
│ Enter - start        v - select     │
│ y     - copy         Esc - exit     │
├─────────────────────────────────────┤
│ NO PREFIX NEEDED                    │
│ Alt+h/l     - prev/next window     │
│ Alt+Arrows  - navigate panes       │
│ Alt+z       - zoom pane            │
│ Alt+v       - copy mode            │
└─────────────────────────────────────┘
```

---

*Configuration managed by Nix Darwin at `~/.config/nix-darwin/modules/tmux.nix`*