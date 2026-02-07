#!/bin/bash

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print messages in green
function print_success() {
    echo -e "${GREEN}$1${NC}"
}

# Function to print messages in red
function print_error() {
    echo -e "${RED}$1${NC}"
}

# Check if Fish is installed
if ! command -v fish &> /dev/null
then
    print_success "Installing Fish..."
    sudo apt update && sudo apt install -y fish
    if [ $? -ne 0 ]; then
        print_error "Failed to install Fish. Exiting..."
        exit 1
    fi
else
    print_success "Fish is already installed."
fi

# Apply configuration
print_success "Applying Fish configuration..."
mkdir -p ~/.config/fish
# Add your configuration commands here
# Example: echo 'set -g Fish_autosuggestion_enabled true' >> ~/.config/fish/config.fish

# Skip set as default shell prompt
# Check if Fish is in /etc/shells
if ! grep -Fxq "/usr/bin/fish" /etc/shells
then
    echo "/usr/bin/fish" | sudo tee -a /etc/shells
fi

chsh -s $(which fish)

print_success "Fish configuration applied successfully!"