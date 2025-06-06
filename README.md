# Twine Hello World Example

This repository contains a simple Twine story compiled into a static HTML page using [Tweego](https://www.motoslave.net/tweego/).

## Development

The source story is `story.twee`. To (re)build `index.html` you can use Tweego:

```bash
/tmp/tweego story.twee -o index.html
```

## Publishing on GitHub Pages

1. Commit the generated `index.html` to the repository.
2. Push the repository to GitHub.
3. Enable GitHub Pages from the repository settings and select the `main` branch as the source.
4. Visit `https://<username>.github.io/<repository>/` to see the published story.

The included `index.html` already displays **Hello World** using the SugarCube story format.
