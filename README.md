# My Fish Settings

A simple Fish shell configuration for consistent prompt and theme settings across user accounts.

## Prerequisites

- Fish shell 3.0 or higher

## Installation

### Install Fish Shell

**Debian/Ubuntu:**
```bash
sudo apt install fish
```

**Fedora:**
```bash
sudo dnf install fish
```

**Arch Linux:**
```bash
sudo pacman -S fish
```

**macOS (Homebrew):**
```bash
brew install fish
```

### Set Fish as Default Shell (Optional)

```bash
chsh -s $(which fish)
```

## Configuration

Run these commands for each user account to apply the "nim" prompt and "Just a Touch" theme:

```bash
fish_config prompt choose nim
fish_config prompt save
fish_config theme choose "Just a Touch"
fish_config theme save
```

## What This Does

- **Prompt:** Sets the "nim" prompt style
- **Theme:** Applies the "Just a Touch" color scheme (a minimal dark theme)

## Resources

- [Fish Shell Documentation](https://fishshell.com/docs/current/)
- [Fish Shell Themes](https://github.com/fish-shell/fish-shell/tree/master/share/themes)
- [Fish Shell Prompts](https://github.com/fish-shell/fish-shell/tree/master/share/prompts)