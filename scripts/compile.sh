#!/bin/bash
set -e
BIN_DIR="$(dirname "$0")/../bin"
export TWEEGO_PATH="$BIN_DIR/storyformats"
mkdir -p "$(dirname "$0")/../dist"
"$BIN_DIR/tweego" --format=harlowe-3 "$(dirname "$0")/../src/story.twee" --output "$(dirname "$0")/../dist/index.html"
echo "Compiled to dist/index.html"
