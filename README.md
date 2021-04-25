<h2 style="color: #FEC163;">🔥 @vimkin dotfiles</h2>

## TODO
[ ] Consider switch to [asdf](https://asdf-vm.com/)

## What's in the box?
- [Zsh](https://www.zsh.org/)
- [Zinit](https://zdharma.github.io/zinit/wiki/)
- [p10k zsh theme](https://github.com/romkatv/powerlevel10k)
- Homebrew: install formulas and casks
- tmux
- Vim

## Installation

First consider installing Homebrew and it's packages with running:
```
brew
```
this will install all recommended cli utils and casks (unless excluded).

If you want to exclude GUI programs (casks), find and remove/comment the following line in [brew.sh](brew.sh) file:
```diff
- install_casks
```

To setup actual dotfiles, execute bootstrap script with zsh:
```
zsh bootstrap
```
`--force` option can be added to exclude yes/no prompt message.

After successful completion all the files are copied to the $HOME folder.

In case of editing dotfiles rerun bootstrap command to apply the changes.

**Caveat**: deletions are not automatically synced with $HOME. Unwanted files should be deleted from both locations individually.
