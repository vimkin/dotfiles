<h2 style="color: #FEC163;">🔥 @vimkin dotfiles</h2>

## TODO
- [ ] Consider switch to [asdf](https://asdf-vm.com/)
- [ ] Update external plugins and theme function

## What's in the box?
- Homebrew: Install formulas and casks
- [Alacritty](https://github.com/alacritty/alacritty)
- [Zsh](https://www.zsh.org/)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [p10k zsh theme](https://github.com/romkatv/powerlevel10k)
- NeoVim
- tmux
- [MacOS Shortcuts](docs/MACOS_SHORTCUTS.md)

## Installation

### Preparation: Homebrew

First install Homebrew and its packages with running in dotfiles repo:
```
brew
```
this will install all recommended cli utils and casks (unless excluded).

To exclude GUI programs (casks), find and remove/comment the following line in [brew.sh](brew.sh) file:
```diff
- install_casks
```

### Install dotfiles

To setup actual dotfiles, execute bootstrap script with zsh (preinstalled by brew):
```
zsh bootstrap
```
`--force` or `-f` option can be added to avoid the confirmation prompt.

After successful completion all the files are copied to your $HOME folder.

To update changed dotfiles rerun bootstrap command to apply the changes.

**Caveat**: deletions are not automatically synced with $HOME. Unwanted files should be deleted from both locations individually.

## Source of inspiration
* [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
* [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [dotfiles.github.io](https://dotfiles.github.io/)

## Further reading
* [Lightning Fast ZSH Performance](https://joshghent.com/zsh-speed/)
