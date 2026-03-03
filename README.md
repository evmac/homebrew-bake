# homebrew-bake

Homebrew tap for [bake](https://github.com/evmac/go-bake).

## Install

**From GitHub** (after pushing this repo):

```bash
brew tap evmac/bake
brew install bake
```

**From local tap** (before pushing):

```bash
brew tap evmac/bake ~/homebrew-bake
brew install bake
```

From HEAD (latest main):

```bash
brew install --HEAD evmac/bake/bake
```

## Linux

Homebrew on Linux uses a different prefix:

| Install type | Prefix | Binary path |
|--------------|--------|-------------|
| User (default) | `~/.linuxbrew` | `~/.linuxbrew/bin/bake` |
| System-wide | `/home/linuxbrew/.linuxbrew` | `/home/linuxbrew/.linuxbrew/bin/bake` |

Ensure `$(brew --prefix)/bin` is in your `PATH`. If you use the user install, add to `~/.bashrc` or `~/.zshrc`:

```bash
eval "$(~/.linuxbrew/bin/brew shellenv)"
```
