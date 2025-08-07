# WezTerm Keymaps Documentation

This document provides a comprehensive reference for all keyboard shortcuts configured in your WezTerm setup.

## Table of Contents
- [Pane Management](#pane-management)
- [Tab Management](#tab-management)
- [Font and Display](#font-and-display)
- [Navigation and Selection](#navigation-and-selection)
- [Search and Copy](#search-and-copy)
- [Utility Functions](#utility-functions)
- [Mouse Actions](#mouse-actions)
- [Default WezTerm Shortcuts](#default-wezterm-shortcuts)

---

## Pane Management

### Splitting Panes
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + D` | Split Horizontal | Splits the current pane horizontally (side by side) |
| `Cmd + Shift + D` | Split Vertical | Splits the current pane vertically (top and bottom) |

### Navigating Between Panes (Vim-style)
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + Alt + H` | Move Left | Switch focus to the pane on the left |
| `Cmd + Alt + L` | Move Right | Switch focus to the pane on the right |
| `Cmd + Alt + K` | Move Up | Switch focus to the pane above |
| `Cmd + Alt + J` | Move Down | Switch focus to the pane below |

### Resizing Panes (Vim-style)
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + Shift + H` | Resize Left | Decrease pane width by 5 units |
| `Cmd + Shift + L` | Resize Right | Increase pane width by 5 units |
| `Cmd + Shift + K` | Resize Up | Decrease pane height by 5 units |
| `Cmd + Shift + J` | Resize Down | Increase pane height by 5 units |

### Closing Panes
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + W` | Close Pane | Closes the current pane (with confirmation) |

---

## Tab Management

### Default Tab Operations
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + T` | New Tab | Opens a new tab |
| `Cmd + Shift + T` | New Tab (with launcher) | Opens a new tab with the launcher menu |
| `Cmd + 1-9` | Switch to Tab | Switch to tab by number (1-9) |
| `Cmd + Shift + [` | Previous Tab | Switch to the previous tab |
| `Cmd + Shift + ]` | Next Tab | Switch to the next tab |
| `Cmd + Alt + ←` | Move Tab Left | Move current tab one position to the left |
| `Cmd + Alt + →` | Move Tab Right | Move current tab one position to the right |

---

## Font and Display

### Font Size Control
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + =` | Increase Font Size | Makes text larger |
| `Cmd + -` | Decrease Font Size | Makes text smaller |
| `Cmd + 0` | Reset Font Size | Returns font to default size (14.0) |

### Display Options
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + Shift + Enter` | Toggle Fullscreen | Enter or exit fullscreen mode |

---

## Navigation and Selection

### Copy Mode
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + Shift + X` | Enter Copy Mode | Activates keyboard-driven text selection mode |

#### Copy Mode Navigation (once activated)
| Key | Action |
|-----|--------|
| `h/j/k/l` | Move cursor left/down/up/right (vim-style) |
| `Arrow keys` | Move cursor |
| `w/b` | Move word forward/backward |
| `0/$` | Move to start/end of line |
| `g/G` | Move to start/end of scrollback |
| `v` | Start selection |
| `V` | Start line selection |
| `Ctrl + v` | Start block selection |
| `y` | Copy selection and exit |
| `Esc` | Exit copy mode |

### Quick Select Mode
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + Shift + U` | Quick Select | Quickly select URLs, file paths, git hashes, etc. |

---

## Search and Copy

### Search Functions
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + Shift + F` | Search | Opens search bar for finding text in scrollback |
| `Cmd + F` | Search (alternative) | Alternative search binding |

#### Search Mode Navigation
| Key | Action |
|-----|--------|
| `Enter` | Find next match |
| `Shift + Enter` | Find previous match |
| `Esc` | Close search |
| `Ctrl + r` | Toggle regex mode |
| `Ctrl + c` | Toggle case sensitivity |

### Clipboard Operations
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + C` | Copy | Copy selected text to clipboard |
| `Cmd + V` | Paste | Paste from clipboard |
| `Cmd + Shift + V` | Paste (no formatting) | Paste without formatting |

---

## Utility Functions

### Terminal Control
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd + K` | Clear Scrollback | Clears both scrollback buffer and viewport |
| `Cmd + Shift + L` | Show Launcher | Opens launcher menu with predefined commands |
| `Cmd + ,` | Open Config | Opens WezTerm configuration file |
| `Cmd + Shift + P` | Command Palette | Opens command palette |

### Launcher Menu Items
The launcher menu (`Cmd + Shift + L`) includes quick access to:
- **btop** - System resource monitor
- **lazygit** - Git terminal UI
- **k9s** - Kubernetes cluster management

---

## Mouse Actions

### Mouse Shortcuts
| Action | Function | Description |
|--------|----------|-------------|
| `Cmd + Click` | Open Link | Opens the link under the mouse cursor |
| `Right Click` | Paste | Pastes from clipboard at cursor position |
| `Double Click` | Select Word | Selects the word under cursor |
| `Triple Click` | Select Line | Selects the entire line |
| `Drag` | Select Text | Click and drag to select text |

### Scrolling
| Action | Function |
|--------|----------|
| `Scroll Up/Down` | Navigate scrollback buffer |
| `Cmd + Scroll` | Zoom in/out (font size) |

---

## Default WezTerm Shortcuts

These are additional default shortcuts that work alongside your custom configuration:

### Window Management
| Shortcut | Action |
|----------|--------|
| `Cmd + N` | New Window |
| `Cmd + Shift + N` | New Window (with launcher) |
| `Cmd + Q` | Quit WezTerm |
| `Cmd + H` | Hide Window |
| `Cmd + M` | Minimize Window |

### Advanced Features
| Shortcut | Action |
|----------|--------|
| `Cmd + Shift + Space` | Quick Select Mode (alternative) |
| `Cmd + Shift + Z` | Toggle Pane Zoom |
| `Cmd + R` | Reload Configuration |
| `Cmd + Shift + R` | Reload Configuration (clear cache) |

---

## Tips and Tricks

### Productivity Tips
1. **Quick Navigation**: Use `Cmd + numbers` to quickly jump between tabs
2. **Vim-style Pane Control**: Navigate panes with `Cmd + Alt + HJKL` and resize with `Cmd + Shift + HJKL`
3. **Efficient Pane Layout**: Start with `Cmd + D` for horizontal split, then use `Cmd + Shift + D` for vertical splits within panes
4. **URL Opening**: Simply `Cmd + Click` on any URL to open it in your default browser
5. **Fast Selection**: Use `Cmd + Shift + U` to quickly select and copy URLs, file paths, or git commit hashes

### Customization Notes
- Font size defaults to 14.0 and uses JetBrainsMono Nerd Font
- Color scheme is set to Gruvbox Dark for consistency with your system theme
- Background opacity is set to 95% with blur for a modern look
- The configuration file is managed by Nix and located at `~/.config/wezterm/wezterm.lua`

### Troubleshooting
- If shortcuts don't work, ensure WezTerm is the active application
- Some shortcuts might conflict with macOS system shortcuts
- Reload configuration with `Cmd + R` after making changes
- Check the debug overlay with `Cmd + Shift + L` then select "Debug Overlay"

---

## Configuration File Location
Your WezTerm configuration is managed by Nix and can be edited at:
```
~/.config/nix-darwin/modules/wezterm.nix
```

After making changes, apply them with:
```bash
cd ~/.config/nix-darwin
sudo darwin-rebuild switch --flake ".#sahrulramdan"
```

---

*Last updated: Configuration includes all keymaps from your Nix-managed WezTerm setup*