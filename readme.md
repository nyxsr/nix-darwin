# 🍏 Sahrul's macOS Development Environment

<div align="center">

[![Nix](https://img.shields.io/badge/Built%20With-Nix-5277C3?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org)
[![macOS](https://img.shields.io/badge/macOS-Sequoia+-292e33?style=for-the-badge&logo=apple&logoColor=white)](https://www.apple.com/macos)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

A **declarative**, **reproducible**, and **modular** macOS configuration using Nix Darwin, Home Manager, and Homebrew.

[Features](#-features) • [Quick Start](#-quick-start) • [Structure](#-structure) • [Usage](#-usage)

</div>

---

## ✨ Features

<table>
<tr>
<td>

### 🎯 **Declarative Configuration**
- System settings as code
- Version controlled environment
- Reproducible across machines

</td>
<td>

### 📦 **Smart Package Management**
- Nix for development tools
- Homebrew for GUI apps
- Automatic updates

</td>
</tr>
<tr>
<td>

### 🛠️ **Developer Ready**
- Multiple language toolchains
- Modern CLI utilities
- Cloud & container tools

</td>
<td>

### 🎨 **Customized Experience**
- Optimized macOS settings
- ZSH with Oh My Zsh
- Developer fonts (JetBrains Mono, Fira Code)

</td>
</tr>
</table>

## 🚀 Quick Start

### Prerequisites

- **macOS** (Apple Silicon or Intel)
- **[Nix](https://nixos.org/download.html)** with flakes enabled
- **Git** for cloning this repository

### Installation

```bash
# 1. Clone this configuration
git clone https://github.com/nyxsr/nix-darwin ~/.config/nix-darwin
cd ~/.config/nix-darwin

# 2. Apply the configuration
darwin-rebuild switch --flake .#sahrulramdan

# 3. Reload your shell
exec zsh
```

## 📁 Structure

```
~/.config/nix-darwin/
│
├── 📄 flake.nix           # Entry point & system definition
├── 🏠 home.nix            # Home Manager configuration
│
├── 🍎 darwin/             # System-level configurations
│   ├── base-packages.nix  # Core system tools
│   ├── fonts.nix          # Developer fonts
│   ├── homebrew.nix       # Homebrew packages & apps
│   └── system.nix         # macOS preferences
│
└── 🧩 modules/            # User-level configurations
    ├── git.nix            # Git settings & aliases
    ├── packages.nix       # Development tools
    ├── theme.nix          # Color themes (unused)
    ├── tmux.nix           # Terminal multiplexer config
    └── zsh.nix            # Shell configuration
```

## 🔧 Usage

### Common Commands

| Command | Description |
|---------|-------------|
| `darwin-rebuild switch --flake .#sahrulramdan` | Apply configuration changes |
| `home-manager switch --flake .` | Update home environment only |
| `nix flake update` | Update all dependencies |
| `nix flake update <input>` | Update specific dependency |
| `nix-collect-garbage -d` | Clean up old generations |

### Making Changes

<details>
<summary><b>🆕 Adding a Package</b></summary>

**For CLI tools**, edit `modules/packages.nix`:
```nix
home.packages = with pkgs; [
  # ... existing packages
  your-new-package
];
```

**For GUI applications**, edit `darwin/homebrew.nix`:
```nix
casks = [
  # ... existing casks
  "your-gui-app"
];
```
</details>

<details>
<summary><b>⚙️ Modifying System Settings</b></summary>

Edit `darwin/system.nix` to change macOS preferences:
```nix
system.defaults = {
  dock.autohide = true;  # Example setting
  # Add your preferences here
};
```
</details>

<details>
<summary><b>🐚 Adding Shell Aliases</b></summary>

Edit `modules/zsh.nix`:
```nix
shellAliases = {
  # ... existing aliases
  myalias = "your-command";
};
```
</details>

## 🌟 Included Tools

### Development Languages
`Node.js` `Python` `Go` `Rust` `Ruby` `Java`

### DevOps & Cloud
`Docker` `Kubernetes` `Terraform` `AWS CLI` `Google Cloud SDK`

### Productivity Apps
`Visual Studio Code` `Zed` `Medis` `MongoDB Compass` `KeyCastr` `Opera`

### CLI Utilities
`fzf` `ripgrep` `bat` `eza` `zoxide` `starship` `tmux` `neovim` `git` `htop`

### Terminal & Fonts
`Ghostty` `JetBrains Mono Nerd Font` `Fira Code` `Hack Nerd Font`

## 🤝 Contributing

Feel free to fork this repository and customize it for your own needs! If you find any issues or have suggestions, please open an issue.

## 📝 License

This configuration is available under the MIT License. See [LICENSE](LICENSE) for details.

---

<div align="center">
<sub>Built with ❤️ using Nix</sub>
</div>