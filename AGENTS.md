# Project Guidelines

This repository stores an exported Twine project. Automation scripts are in `scripts/`.

## Setup
Run `scripts/setup.sh` once to download the latest Tweego CLI and Harlowe story format. After running, add the `bin` directory to your PATH for the current session:

```bash
export PATH="$(pwd)/bin:$PATH"
```

## Workflow
- **Decompile**: `scripts/decompile.sh` extracts `index.html` into `src/story.twee`.
- **Compile**: `scripts/compile.sh [input.twee] [output.html]` builds the HTML file from the specified Twee source (defaults to `src/story.twee` and `dist/index.html`). The compiled output is tracked in git so others can compare the result.
- **Cleanup**: `scripts/cleanup.sh` removes the `dist/` directory. Running it will delete any tracked HTML files there, so recompile afterwards if needed.

Always run these scripts instead of manual commands.
