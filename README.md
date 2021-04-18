<h2 style="color: #FEC163;">🔥 @vadikace dotfiles</h2>

## TODO
[ ] Migrate Ruby scripts
[ ] Move thoughtbot's dotfiles here

## What's in the box?
- [Zsh](https://www.zsh.org/)
- [Zinit](https://zdharma.github.io/zinit/wiki/)
- [p10k zsh theme](https://github.com/romkatv/powerlevel10k)

## Installation


This will do some pre-configuration first and then follow the steps from thoughbot [installation guide](https://github.com/thoughtbot/dotfiles#install) to properly symlink dotfiles. Default folders are `~/dotfiles` (where thoughtbot repo should be cloned) and `~/dotfiles-local` where you put your customisations. In the guide you may find further information in case you'd like to change this behaviour.

Symlinking hooks is a originally bad idea and will lead to implicit issue, like changing content of one hook will lead to change of it everywhere. This is already tweaked during installation.

Some installed tools from this setup like [fzf](https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew) may require additional setup.

Congratulations, you dotfiles are perfect now! 🎉

## iTerm2 Customization
You may find your favorite theme [here](https://iterm2colorschemes.com/) from hundreds. There are REALLY a lot of them.

My preffered themes:
- [AdventureTime](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/AdventureTime.itermcolors)
- [SpaceGray](https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/SpaceGray.itermcolors)
- [IntelliJ Darcula](https://gist.githubusercontent.com/kouphax/4628750/raw/051d8616f62cb3d942942001dace93c19d372525/Darcula.itermcolors)

## Atom sync
In case you'd like to sync atom settings across multiple machines, `.atom` folder from this repo should be additionally symlinked to your home folder by doing this:
```
ln -s .atom ~/.atom
```

