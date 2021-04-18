#!/usr/bin/env bash

if [[ ! -f $(which brew) ]]; then
  echo "Homebrew not installed. Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

function install_casks() {
  brew tap caskroom/cask

  brew cask install iterm2
  brew cask install visual-studio-code
  brew cask install spotify
  brew cask install 1password
  brew cask install google-chrome

  # Install FiraCode
  brew tap homebrew/cask-fonts
  brew cask install font-fira-code
}

function install_gnu_utils() {
  brew install gnu-sed # patches sed to be unix compatible

  # Replaces standard Mac OS X utilities with GNU core utilities List of all commands can be found
  # here: https://en.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands Initially available with
  # 'g' prefix (grm, gmv etc.)
  # brew install coreutils

  # Extending directory search and file locating capabilities https://www.gnu.org/software/findutils/
  # brew install findutils
}

function install_formulas() {
  brew install git
  brew install python3
  brew install bat # colorful cat
  brew install n
  brew install docker-compose

  # Improves git diff https://github.com/so-fancy/diff-so-fancy gitconfig should be additionally
  # configured to apply it for every diff
  brew install diff-so-fancy

  # Installing yarn without global node dependency
  # https://gist.github.com/AGutierrezR/2c22fdd8686e6e30c56949f5e37e214e
  brew install yarn --ignore-dependencies

  # fzf is a general-purpose command-line fuzzy finder. Don't forget to execute `$(brew
  # --prefix)/opt/fzf/install` command after installation
  brew install fzf
  $(brew --prefix)/opt/fzf/install
}

install_formulas
install_gnu_utils
install_casks
