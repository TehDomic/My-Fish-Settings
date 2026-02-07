# My Fish Settings

A simple Fish shell configuration for consistent prompt and theme settings across user accounts.

## Quick Install

Run this one-liner to automatically install and configure Fish shell:

```bash
curl -sSL https://raw.githubusercontent.com/TehDomic/My-Fish-Settings/main/setup.sh | bash
```

Or download and run the script manually:

```bash
git clone https://github.com/TehDomic/My-Fish-Settings.git
cd My-Fish-Settings
chmod +x setup.sh
./setup.sh
```

The script will:
- Check if Fish is installed (and offer to install it)
- Apply the "nim" prompt and "Just a Touch" theme
- Optionally set Fish as your default shell

---

## Manual Installation

### Prerequisites

- Fish shell 3.0 or higher

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

### Configuration

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