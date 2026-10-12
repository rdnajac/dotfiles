# dotfiles

My dotfiles, managed with [chezmoi](https://chezmoi.io/).

```sh
# Install `chezmoi` to `~/.local/bin` and initialize dotfiles:
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply rdnajac
```
note: curl is required even by the install script. on ubuntu/debian run:

```sh
sudo apt update && sudo apt install curl # && sudo apt upgrade -y
```

<!-- ## Other `curl`-to-`sh` installations -->

### `brew`

> Homebrew installs command-line tools and applications

```sh
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sh
```

### `rust`

> Rustup installs The Rust Programming Language and
> enables switching between stable, beta, and nightly compilers.

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
```

## [Ghostty](https://ghostty.org/)

> Ghostty is a fast, feature-rich, and cross-platform terminal
> emulator that uses platform-native UI and GPU acceleration.

- Default font is [JetBrains](https://github.com/JetBrains/JetBrainsMono) (with glyphs!)
- Uses macOS native tabs and exposes a [native AppleScript dictionary](https://ghostty.org/docs/features/applescript).

## Resources

<https://www.chezmoi.io/user-guide/templating/>

## License

???
