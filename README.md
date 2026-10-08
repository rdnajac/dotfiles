# dotfiles

My dotfiles, managed with [chezmoi](https://chezmoi.io/).

## Install

Install `chezmoi` to `~/.local/bin` and initialize dotfiles:

```sh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply rdnajac
```

## Other `curl`-to-`sh` installations

### `brew`

```sh
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sh
```


### `rust`

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
```

### `atuin`

```sh
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
```

## [Ghostty](https://ghostty.org/)

> Ghostty is a fast, feature-rich, and cross-platform terminal
> emulator that uses platform-native UI and GPU acceleration.

- Default font is JetBrains (with glyphs!)

## Resources

<https://www.chezmoi.io/user-guide/templating/>

## License

???

