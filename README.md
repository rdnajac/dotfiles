# .files

My dotfiles, managed with [chezmoi](https://chezmoi.io/).

Install `chezmoi` to `~/.local/bin` and initialize dotfiles:

```sh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply rdnajac
```

## Other `curl`-to-`sh` installations

```sh
# `brew`
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sh
```

```sh
# `rust`
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
```

## Terminal

### [Ghostty](https://ghostty.org/)

> Ghostty is a fast, feature-rich, and cross-platform terminal
> emulator that uses platform-native UI and GPU acceleration.

- Default font is JetBrains (with glyphs!)

## Archive

Stuff goes here

## Bugs

### missing or unsuitable terminal: xterm-ghostty

<https://ghostty.org/docs/help/terminfo#ssh>

## Resources

<https://www.chezmoi.io/user-guide/templating/>

## License

???

