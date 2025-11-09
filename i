
#!/bin/bash

# Installation script for adi command
# Works on macOS without Homebrew - No sudo required!

set -e

# Create bin directory if it doesn't exist
mkdir -p ~/.local/bin

# Download the adi script
curl -fsSL https://raw.githubusercontent.com/sagaryali/adi-cli/main/adi -o ~/.local/bin/adi

# Make it executable
chmod +x ~/.local/bin/adi

# Add to PATH if not already there
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    # Detect shell config file
    if [ -f ~/.zshrc ]; then
        SHELL_CONFIG=~/.zshrc
    elif [ -f ~/.bash_profile ]; then
        SHELL_CONFIG=~/.bash_profile
    else
        SHELL_CONFIG=~/.bashrc
    fi
    
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_CONFIG"
    export PATH="$HOME/.local/bin:$PATH"
fi

echo "✅ Installation complete!"
echo ""

# Run the command to show it works
~/.local/bin/adi

echo ""
echo "🎉 Type 'adi' in a new terminal window to use it!"
