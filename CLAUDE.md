# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a nix-darwin configuration repository for macOS that uses Nix flakes to manage system configuration, packages, and user environment. The configuration is modular and split between system-level (darwin) and user-level (modules) settings.

## Essential Commands

```bash
# Apply system configuration changes
darwin-rebuild switch --flake .#sahrulramdan

# Apply home-manager changes only
home-manager switch --flake .

# Update all flake dependencies
nix flake update

# Update specific input
nix flake update <input-name>

# Check flake outputs
nix flake show

# Garbage collection
nix-collect-garbage -d
```

## Architecture

The repository follows a clear separation of concerns:

- **`flake.nix`**: Entry point that wires together all modules and defines the system
- **`darwin/`**: System-level macOS configurations
  - `base-packages.nix`: Core system packages
  - `fonts.nix`: Developer fonts
  - `homebrew.nix`: Declarative Homebrew management (taps, brews, casks, mas apps)
  - `system.nix`: macOS system preferences (dock, finder, trackpad)
- **`modules/`**: User-level configurations via Home Manager
  - `git.nix`: Git configuration
  - `packages.nix`: Development tools and CLI utilities
  - `zsh.nix`: Shell configuration with aliases and functions
  - `theme.nix`: Color theme configuration (currently unused)
- **`home.nix`**: Home Manager entry point that imports user modules

## Key Patterns

1. **Adding System Packages**: Edit `darwin/base-packages.nix` for packages that need system-wide installation
2. **Adding User Packages**: Edit `modules/packages.nix` for user-specific tools
3. **Homebrew Apps**: Add GUI applications to `darwin/homebrew.nix` under appropriate sections (brews, casks, masApps)
4. **Shell Aliases**: Add to `modules/zsh.nix` in the shellAliases attribute set
5. **System Settings**: Modify `darwin/system.nix` for macOS preferences

## Important Notes

- After any configuration change, run `darwin-rebuild switch --flake .#sahrulramdan`
- The system is configured for user "sahrulramdan" on Apple Silicon (aarch64-darwin)
- Homebrew is managed declaratively through nix-homebrew
- The configuration uses experimental Nix features (flakes, nix-command)