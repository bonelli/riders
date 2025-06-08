#!/bin/bash
set -e
BIN_DIR="$(dirname "$0")/../bin"
export TWEEGO_PATH="$BIN_DIR/storyformats"
"$BIN_DIR/tweego" --decompile-twee3 "$(dirname "$0")/../index.html" --output "$(dirname "$0")/../src/story.twee"
echo "Decompiled to src/story.twee"
