#!/bin/bash
set -e
# Setup environment for Twine CLI operations
BIN_DIR="$(cd "$(dirname "$0")/.." && pwd)/bin"
mkdir -p "$BIN_DIR"
cd "$BIN_DIR"
if [ ! -f tweego ]; then
    echo "Downloading Tweego..."
    TWEEGO_TAG=$(curl -s https://api.github.com/repos/tmedwards/tweego/releases/latest | grep -oP '"tag_name":\s*"\K[^" ]+')
    TWEEGO_VERSION=${TWEEGO_TAG#v}
    curl -L -o tweego.zip "https://github.com/tmedwards/tweego/releases/download/${TWEEGO_TAG}/tweego-${TWEEGO_VERSION}-linux-x64.zip"
    unzip -q tweego.zip
    rm tweego.zip
    chmod +x tweego
fi

# Install latest Harlowe story format
HARLOWE_VERSION=$(curl -s https://api.github.com/repos/klembot/twinejs/contents/public/story-formats | grep -oP '"name":\s*"harlowe-\K[0-9.]+' | sort -V | tail -n 1)
SF_DIR="$BIN_DIR/storyformats/harlowe-$HARLOWE_VERSION"
if [ ! -f "$SF_DIR/format.js" ]; then
    echo "Fetching Harlowe $HARLOWE_VERSION story format..."
    mkdir -p "$SF_DIR"
    curl -L -o "$SF_DIR/format.js" "https://raw.githubusercontent.com/klembot/twinejs/main/public/story-formats/harlowe-$HARLOWE_VERSION/format.js"
    curl -L -o "$SF_DIR/icon.svg" "https://raw.githubusercontent.com/klembot/twinejs/main/public/story-formats/harlowe-$HARLOWE_VERSION/icon.svg"
fi

# Add bin directory to PATH for current session suggestion
echo "Setup complete. Use \"export PATH=\$PATH:$BIN_DIR\" to use tweego."
