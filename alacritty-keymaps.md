# Alacritty Keymaps Documentation

This document provides a comprehensive reference for all keyboard shortcuts configured in your Alacritty setup.

## Table of Contents
- [Window Management](#window-management)
- [Tab Management](#tab-management)
- [Font Control](#font-control)
- [Clipboard Operations](#clipboard-operations)
- [Scrolling](#scrolling)
- [Search](#search)
- [Vi Mode](#vi-mode)
- [URL Hints](#url-hints)
- [Mouse Actions](#mouse-actions)
- [Tips and Tricks](#tips-and-tricks)

---

## Window Management

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + Q` | Quit | Quit Alacritty completely |
| `Cmd + N` | New Window | Create a new Alacritty window |
| `Cmd + M` | Minimize | Minimize the current window |
| `Cmd + H` | Hide | Hide Alacritty |
| `Cmd + Alt + H` | Hide Others | Hide all other applications |
| `Cmd + Shift + Enter` | Toggle Fullscreen | Enter or exit fullscreen mode |

---

## Tab Management

**Note: Alacritty does not support native tabs.** Consider using a terminal multiplexer like tmux or screen for tab/window management.

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + T` | New Window | Opens a new Alacritty window (not a tab) |
| `Cmd + N` | New Window | Create a new Alacritty window |

For tab-like functionality within Alacritty, install and use **tmux**:
- `tmux new-session` - Start new tmux session
- `Ctrl + b, c` - Create new tmux window (tab)
- `Ctrl + b, n` - Next tmux window
- `Ctrl + b, p` - Previous tmux window
- `Ctrl + b, 0-9` - Switch to tmux window by number

---

## Font Control

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + =` | Increase Font Size | Make text larger |
| `Cmd + +` | Increase Font Size | Make text larger (alternative) |
| `Cmd + -` | Decrease Font Size | Make text smaller |
| `Cmd + 0` | Reset Font Size | Return to default size (14.0) |

---

## Clipboard Operations

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + C` | Copy | Copy selected text |
| `Cmd + V` | Paste | Paste from clipboard |
| `Cmd + X` | Cut | Cut selected text |
| `Cmd + A` | Select All | Select all text in terminal |

---

## Scrolling

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + K` | Clear History | Clear scrollback buffer and screen |
| `Cmd + L` | Clear Log Notice | Clear log notices |
| `Shift + PageUp` | Page Up | Scroll up one page |
| `Shift + PageDown` | Page Down | Scroll down one page |
| `Shift + Home` | Scroll to Top | Jump to the beginning of scrollback |
| `Shift + End` | Scroll to Bottom | Jump to the bottom (latest output) |
| `Cmd + Shift + ↑` | Scroll Line Up | Scroll up one line |
| `Cmd + Shift + ↓` | Scroll Line Down | Scroll down one line |

---

## Search

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + F` | Search Forward | Open search bar to find text |
| `Cmd + B` | Search Backward | Search backwards from cursor |
| `Cmd + Shift + F` | Search Forward | Alternative search forward |
| `Cmd + Shift + B` | Search Backward | Alternative search backward |

### Search Mode Navigation
Once in search mode:
- `Enter` - Find next match
- `Shift + Enter` - Find previous match
- `Escape` - Exit search mode

---

## Vi Mode

Vi Mode provides vim-like keyboard navigation and selection in the terminal.

### Activation
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl + Shift + Space` | Toggle Vi Mode | Enter/exit Vi mode |
| `Escape` | Clear Selection | Clear current selection in Vi mode |
| `I` | Exit Vi Mode | Return to normal mode from Vi mode |
| `Ctrl + C` | Exit Vi Mode | Alternative exit from Vi mode |

### Vi Mode Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `h` | Move Left | Move cursor left |
| `j` | Move Down | Move cursor down |
| `k` | Move Up | Move cursor up |
| `l` | Move Right | Move cursor right |
| `0` | Line Start | Jump to start of line |
| `$` | Line End | Jump to end of line |
| `^` | First Non-blank | Jump to first non-blank character |
| `H` | High | Move to top of screen |
| `M` | Middle | Move to middle of screen |
| `L` | Low | Move to bottom of screen |
| `g` | Top | Go to top of scrollback |
| `G` | Bottom | Go to bottom of scrollback |

### Word Movement in Vi Mode
| Key | Action | Description |
|-----|--------|-------------|
| `w` | Next Word | Move forward by word |
| `b` | Previous Word | Move backward by word |
| `e` | Word End | Move to end of word |
| `W` | Next WORD | Move forward by WORD (space-delimited) |
| `B` | Previous WORD | Move backward by WORD |
| `E` | WORD End | Move to end of WORD |

### Vi Mode Selection
| Key | Action | Description |
|-----|--------|-------------|
| `v` | Visual Mode | Start character selection |
| `V` | Visual Line | Start line selection |
| `Ctrl + v` | Visual Block | Start block selection |
| `y` | Copy | Copy selected text |
| `Y` | Copy Line | Copy entire line |
| `Return` | Open | Open selected URL or path |

### Vi Mode Search
| Key | Action | Description |
|-----|--------|-------------|
| `/` | Search Forward | Start forward search |
| `?` | Search Backward | Start backward search |
| `n` | Next Match | Go to next search match |
| `N` | Previous Match | Go to previous search match |

---

## URL Hints

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + Shift + U` | URL Hints | Highlight URLs for quick opening |
| `Cmd + Click` | Open URL | Open URL under mouse cursor |

When URL hints are activated, clickable URLs are highlighted and can be opened in your default browser.

---

## Mouse Actions

| Action | Function | Description |
|--------|----------|-------------|
| `Right Click` | Paste | Paste from clipboard |
| `Middle Click` | Paste Selection | Paste primary selection |
| `Cmd + Click` | Open URL | Open link under cursor |
| `Click + Drag` | Select Text | Select text by dragging |
| `Double Click` | Select Word | Select word under cursor |
| `Triple Click` | Select Line | Select entire line |

---

## Tips and Tricks

### Configuration
- **Config Location**: `~/.config/nix-darwin/modules/alacritty.nix`
- **Font**: JetBrainsMono Nerd Font at 14pt
- **Theme**: Gruvbox Dark color scheme
- **Opacity**: 95% with blur effect
- **Scrollback**: 10,000 lines

### Performance Features
- **Fast Rendering**: GPU-accelerated terminal
- **Minimal Latency**: Optimized for speed
- **Efficient Scrolling**: Smooth scrollback with multiplier set to 3

### Productivity Tips

1. **Vi Mode for Navigation**: Use `Ctrl + Shift + Space` to enter Vi mode for keyboard-only navigation
2. **Quick URL Opening**: `Cmd + Shift + U` highlights all URLs for quick access
3. **Efficient Selection**: Use Vi mode's visual selections for precise text copying
4. **Search Navigation**: Use `/` in Vi mode for vim-style searching
5. **Window Management**: Use `Cmd + N` for new windows, or use tmux for tabs
6. **Clear Screen**: `Cmd + K` clears both screen and scrollback buffer

### Common Workflows

#### Text Selection and Copy
1. Enter Vi mode: `Ctrl + Shift + Space`
2. Navigate to text: Use `hjkl` or arrow keys
3. Start selection: Press `v`
4. Extend selection: Navigate with movement keys
5. Copy: Press `y`
6. Exit Vi mode: Press `i` or `Escape`

#### Quick Search
1. Press `Cmd + F` to open search
2. Type your search term
3. Press `Enter` to find next match
4. Press `Shift + Enter` for previous match
5. Press `Escape` to exit search

#### URL Navigation
1. Press `Cmd + Shift + U` to highlight URLs
2. Click on highlighted URL to open
3. Or use `Cmd + Click` on any URL directly

### Customization Notes

The configuration uses:
- **Gruvbox Dark** theme for consistency with your system
- **JetBrainsMono Nerd Font** for excellent readability and icon support
- **Buttonless window decorations** for a clean look on macOS
- **95% opacity with blur** for a modern, translucent appearance
- **Option as Alt set to "Both"** for better key compatibility

### Troubleshooting

- **Keys not working**: Check if you're in Vi mode (look for cursor style change)
- **Can't select text**: Exit Vi mode with `i` or use mouse selection
- **Font issues**: Ensure JetBrainsMono Nerd Font is installed via Nix
- **Performance**: Alacritty is GPU-accelerated; ensure GPU drivers are up to date

---

## Applying Configuration Changes

After modifying the Alacritty configuration:

```bash
cd ~/.config/nix-darwin
sudo darwin-rebuild switch --flake ".#sahrulramdan"
```

Then restart Alacritty for changes to take effect.

---

*This documentation covers all keybindings configured in your Nix-managed Alacritty setup.*