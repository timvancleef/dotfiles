# Dotfiles

Dotfiles are managed via [GNU stow](https://www.gnu.org/software/stow/).

## Apps that need to be installed

* [neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
* [git](https://git-scm.com/install/)
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
* [fzf](https://github.com/junegunn/fzf)
* [fd-find](https://github.com/sharkdp/fd)
* [nodejs](https://nodejs.org/en/download)

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
