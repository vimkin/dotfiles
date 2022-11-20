![logo](docs/logo.png)

## What's in the box?
- Install packages and GUI apps with Homebrew
- [iTerm2](https://github.com/gnachman/iTerm2)
- [Zsh](https://www.zsh.org/)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [p10k zsh theme](https://github.com/romkatv/powerlevel10k)
- NeoVim
- tmux
- [MacOS Shortcuts](docs/MACOS_SHORTCUTS.md)
- Colorful and shiny cli experience 🌈

## Installation

1. `cd $HOME && git clone https://github.com/vimkin/dotfiles.git && cd dotfiles`
2. **Homebrew**

    First install necessary packages and GUI applications from Homebrew. Execute the brew script by running following command in dotfiles repo
    *(\*the script might guide you in case of missing dependencies)*:
    ```
    brew
    ```
    To exclude GUI programs(casks) remove/comment the following line in [brew](brew) file:
    ```diff
    - install_casks
    ```

3. **Bootstrap dotfiles**

    Execute the bootstrap script to install the dotfiles *(\*the script will guide you in case of missing dependencies)*:
    ```
    zsh bootstrap
    ```
    *\*`--force` or `-f` parameter can be added to avoid the confirmation prompt.*

    After the successful completion most of the dotfiles are symlinked to the `$HOME` folder, except few exceptions like `.bin` or `.config` folders.

    Changes between originals and symlinked files are of course synced, so feel free to modify whether former or latter, makes no difference.

    **Caveat**: deletions are not automatically synced with a root folder. Deleting originals leads to dangling symlinks. To clean up run the following command in your root `find -L . -maxdepth 1 -type l | xargs rm -rf`, which finds and removes the broken symlinks.

## Source of inspiration
* [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
* [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [dotfiles.github.io](https://dotfiles.github.io/)

## Further reading
* [Lightning Fast ZSH Performance](https://joshghent.com/zsh-speed/)
