# Dotfiles

Dotfiles are managed via [GNU stow](https://www.gnu.org/software/stow/).

## Install a dotfile package

```bash
$ stow --target ~ --stow <package name>
# or:
$ stow -t ~ <package name>
```

## Unistall a dotfile package

```bash
$ stow --target ~ --delete <package name>
```

## Reinstall a dotfile package

```bash
$ stow --target ~ --restow <package name>
```

## Available packages

* zsh
* vim
* nvim
* git
* tmux
* ideavim
