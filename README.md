<h2 style="color: #FEC163;">🔥 @vadikace dotfiles</h2>

These dotfiles are an addition to the essential set from [thoughtbot](https://github.com/thoughtbot/dotfiles). Here I'm storing extensions and adjustments to already provided configs and tools in thoughtbot's repo.

## Installation
```
rake install
```

This will do some pre-configuration first and then follow the steps from thoughbot [installation guide](https://github.com/thoughtbot/dotfiles#install) to properly symlink dotfiles. Default folders are `~/dotfiles` (where thoughtbot repo should be cloned) and `~/dotfiles-local` where you put your customisations. In the guide you may find further information in case you'd like to change this behaviour.

Symlinking hooks is a originally bad idea and will lead to implicit issue, like changing content of one hook will lead to change of it everywhere. This is already tweaked during installation.

Some installed tools from this setup like [fzf](https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew) may require additional setup.

Congratulations, you dotfiles are perfect now! 🎉

## iTerm2 Customization
You may find your favorite theme [here](https://iterm2colorschemes.com/) from hundreds. There are REALLY a lot of them.

My preffered themes:
- [AdventureTime](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/AdventureTime.itermcolors)
- [SpaceGray](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/SpaceGray.itermcolors)

## Atom sync
In case you'd like to sync atom settings across multiple machines, `.atom` folder from this repo should be additionally symlinked to your home folder by doing this:
```
ln -s .atom ~/.atom
```

