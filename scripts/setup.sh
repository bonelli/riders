#!/bin/bash
set -e
# Setup environment for Twine CLI operations
BIN_DIR="$(cd "$(dirname "$0")/.." && pwd)/bin"
mkdir -p "$BIN_DIR"
cd "$BIN_DIR"
if [ ! -f tweego ]; then
    echo "Downloading Tweego..."
    curl -L -o tweego.zip https://github.com/tmedwards/tweego/releases/download/v2.1.1/tweego-2.1.1-linux-x64.zip
    unzip -q tweego.zip
    rm tweego.zip
    chmod +x tweego
fi

# Install Harlowe 3.3.9 story format
SF_DIR="$BIN_DIR/storyformats/harlowe-3.3.9"
if [ ! -f "$SF_DIR/format.js" ]; then
    echo "Fetching Harlowe 3.3.9 story format..."
    mkdir -p "$SF_DIR"
    curl -L -o "$SF_DIR/format.js" https://raw.githubusercontent.com/klembot/twinejs/main/public/story-formats/harlowe-3.3.9/format.js
    curl -L -o "$SF_DIR/icon.svg" https://raw.githubusercontent.com/klembot/twinejs/main/public/story-formats/harlowe-3.3.9/icon.svg
fi

# Add bin directory to PATH for current session suggestion
echo "Setup complete. Use \"export PATH=\$PATH:$BIN_DIR\" to use tweego."
