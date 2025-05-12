# 🍎 macOS System Configuration with Nix and Homebrew

This repository is a declarative and reproducible setup for macOS using Nix and nix-darwin, combined with Homebrew and Home Manager. It automates the setup of essential development tools, packages, fonts, and configurations.

## ✨ Features

### 🧩 Modular Configuration:

Each configuration aspect is split into its own Nix module (git.nix, zsh.nix, packages.nix).

### 📦 System Packages:

Installed via Nix and Homebrew, including tools like vim, git, gh, git-lfs.

### 🖋 Developer Fonts:

JetBrains Mono, Hack, and Fira Code via nerd-fonts.

### 🔧 Git Setup:

Pre-configured with name and email.

### 🧪 Reproducible Builds:

Uses Flakes for precise dependency locking (flake.nix, flake.lock).

### 🍺 Homebrew Integration:

Includes taps and formulae managed via homebrew.nix.

## 🛠 Project Structure

```
.
├── darwin/
│ ├── base-packages.nix # Core CLI tools
│ ├── fonts.nix # Developer fonts
│ ├── homebrew.nix # Homebrew taps and formulae
│ └── system.nix # macOS-specific system settings
├── modules/
│ ├── git.nix # Git configuration
│ ├── packages.nix # Additional packages
│ └── zsh.nix # ZSH shell config
├── home.nix # User-level home-manager config
├── flake.nix # Nix flake entry point
├── flake.lock # Locked dependencies
```

## ⚙️ Prerequisites

Before setting this up, you’ll need:

- macOS (Intel or Apple Silicon)
- Nix installed with Flake support enabled
- Git
- Optional: Homebrew for native macOS integrations

## 🚀 Setup Instructions

### - Clone the repo:

```
git clone https://github.com/your-username/mac-nix-config.git
cd mac-nix-config
```

### - Enable Flakes (if not already):

Add to your ~/.nix/nix.conf:

```ini
experimental-features = nix-command flakes
```

### - Build and apply your configuration:

```bash
darwin-rebuild switch --flake .#$(hostname)
```

### - Home Manager setup:

If using user-level configs:

```bash
home-manager switch --flake .
```

## - 🧪 Usage Examples

- Update Flake dependencies:

```bash
nix flake update
```

- Rebuild system config:

```bash
darwin-rebuild switch --flake .
```

- List available Homebrew services:

```bash
brew services list
```
