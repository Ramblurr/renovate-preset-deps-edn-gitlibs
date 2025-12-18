# renovate-config-clojure-gitlibs

A [Renovate](https://github.com/renovatebot/renovate) preset for automatically
updating Clojure git dependencies in `deps.edn` files.

## What it does

This preset adds support for updating git-based dependencies in Clojure
`deps.edn` files that follow this format:

```clojure
com.example/some-lib {:git/url "https://github.com/example/some-lib.git"
                      :git/tag "v1.2.3"
                      :git/sha "abc123..."}
```

Renovate will automatically:

- Detect new tags in the GitHub repository
- Update both the :git/tag and :git/sha values
- Create pull requests with the updates

## Usage

Add this preset to your renovate config:

```json5
{
  extends: [
    "config:base",
    // your other presets
    "github>ramblurr/renovate-preset-deps-edn-gitlibs",
    "github>ramblurr/renovate-preset-deps-edn-gitlibs:javascript", // optional if your project uses npm
  ],
  // your config
}
```

## Requirements

- Git dependencies must use https://github.com/ URLs
- Dependencies must include both :git/tag and :git/sha fields
- Tags should follow semver or semver-like patterns (e.g., v1.2.3, v1.2.3-alpha)

## License: European Union Public License 1.2

Copyright © 2025 Casey Link <unnamedrambler@gmail.com> Distributed under the
[EUPL-1.2](https://spdx.org/licenses/EUPL-1.2.html)
