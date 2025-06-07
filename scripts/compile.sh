#!/bin/bash
set -e
BIN_DIR="$(dirname "$0")/../bin"
export TWEEGO_PATH="$BIN_DIR/storyformats"

INPUT_FILE="${1:-$(dirname "$0")/../src/story.twee}"
OUTPUT_FILE="${2:-$(dirname "$0")/../dist/index.html}"

mkdir -p "$(dirname "$OUTPUT_FILE")"
HARLOWE_DIR=$(ls "$TWEEGO_PATH" | grep '^harlowe-' | sort -V | tail -n 1)
"$BIN_DIR/tweego" --format="$HARLOWE_DIR" "$INPUT_FILE" --output "$OUTPUT_FILE"
echo "Compiled $INPUT_FILE to $OUTPUT_FILE using $HARLOWE_DIR"
