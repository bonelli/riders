#!/bin/bash
set -e
BIN_DIR="$(dirname "$0")/../bin"
export TWEEGO_PATH="$BIN_DIR/storyformats"
mkdir -p "$(dirname "$0")/../dist"
HARLOWE_DIR=$(ls "$TWEEGO_PATH" | grep '^harlowe-' | sort -V | tail -n 1)
"$BIN_DIR/tweego" --format="$HARLOWE_DIR" "$(dirname "$0")/../src/story.twee" --output "$(dirname "$0")/../dist/index.html"
echo "Compiled to dist/index.html using $HARLOWE_DIR"
