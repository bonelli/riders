# Project Guidelines

This repository stores an exported Twine project. Automation scripts are in `scripts/`.

## Setup
Run `scripts/setup.sh` once to download the Tweego CLI and the required Harlowe story format. After running, add the `bin` directory to your PATH for the current session:

```bash
export PATH="$(pwd)/bin:$PATH"
```

## Workflow
- **Decompile**: `scripts/decompile.sh` extracts `index.html` into `src/story.twee`.
- **Compile**: `scripts/compile.sh` builds `dist/index.html` from `src/story.twee`. The compiled file is tracked in git so others can compare the output.
- **Cleanup**: `scripts/cleanup.sh` removes the `dist/` directory. Running it will delete the tracked `dist/index.html`, so recompile afterwards if needed.

Always run these scripts instead of manual commands.
