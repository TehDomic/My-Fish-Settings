#!/usr/bin/env bash

# Fish Shell Configuration Setup Script
# This script installs Fish shell (if needed) and applies the configuration

set -e

echo "==================================="
echo "Fish Shell Configuration Setup"
echo "==================================="
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if Fish is installed
check_fish() {
    if command -v fish &> /dev/null; then
        echo -e "${GREEN}✓${NC} Fish shell is already installed"
        fish --version
        return 0
    else
        echo -e "${YELLOW}!${NC} Fish shell is not installed"
        return 1
    fi
}

# Function to install Fish based on OS
install_fish() {
    echo ""
    echo "Installing Fish shell automatically..."
    
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt &> /dev/null; then
            sudo apt update
            sudo apt install -y fish
        elif command -v dnf &> /dev/null; then
            sudo dnf install -y fish
        elif command -v pacman &> /dev/null; then
            sudo pacman -S --noconfirm fish
        else
            echo -e "${RED}✗${NC} Unsupported package manager. Please install Fish manually."
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew &> /dev/null; then
            brew install fish
        else
            echo -e "${RED}✗${NC} Homebrew not found. Please install Homebrew first."
            exit 1
        fi
    else
        echo -e "${RED}✗${NC} Unsupported operating system"
        exit 1
    fi
    
    if check_fish; then
        echo -e "${GREEN}✓${NC} Fish shell installed successfully"
    else
        echo -e "${RED}✗${NC} Fish installation failed"
        exit 1
    fi
}

# Function to apply Fish configuration
apply_config() {
    echo ""
    echo "Applying Fish configuration..."
    
    fish -c "fish_config prompt choose nim"
    fish -c "fish_config prompt save"
    fish -c "fish_config theme choose 'Just a Touch'"
    fish -c "fish_config theme save"
    
    echo -e "${GREEN}✓${NC} Configuration applied successfully"
    echo "  - Prompt: nim"
    echo "  - Theme: Just a Touch"
}

# Function to set Fish as default shell (non-interactive)
set_default_shell() {
    echo ""
    echo "Setting Fish as default shell..."
    
    FISH_PATH=$(which fish)
    
    # Add fish to /etc/shells if not already there
    if ! grep -q "$FISH_PATH" /etc/shells 2>/dev/null; then
        echo "Adding Fish to /etc/shells (requires sudo)..."
        echo "$FISH_PATH" | sudo tee -a /etc/shells > /dev/null
    fi
    
    # Change default shell
    echo "Changing default shell to Fish (requires sudo)..."
    sudo chsh -s "$FISH_PATH" "$USER"
    
    echo -e "${GREEN}✓${NC} Default shell set to Fish"
    echo "  Please log out and log back in for changes to take effect"
}

# Main execution
main() {
    if ! check_fish; then
        install_fish
    fi
    
    apply_config
    set_default_shell
    
    echo ""
    echo "==================================="
    echo -e "${GREEN}Setup complete!${NC}"
    echo "==================================="
    echo ""
    echo "You can start Fish by running: fish"
}

main
