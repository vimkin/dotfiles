#!/bin/sh

if [[ ! -f $(which brew) ]]; then
  echo "Oh no! Dotfiles requires Homebrew to be installed. Please visit https://brew.sh for installation instructions. Execute me again when brew is installed."
  exit 1
fi

brew update

function install_casks() {
  brew tap homebrew/cask-fonts

  devTools=(
    'ghostty'
    'visual-studio-code'
    'insomnia' # API development
    'postman' # API development
    'docker'
    'github' # get native notifications from github, not emails
    # 'wireshark' # network protocol analyzer
    'ollama' # run LLMs on your machine
  )
  utils=(
    '1password'
    'bettermouse' # mouse customization
    'calibre' # ebook management
    'firefox'
    'gimp' # image editor
    'google-chrome'
    'hammerspoon' # automate your mac
    'homerow' # keyboard shortcuts for UI navigation
    'inkscape' # vector graphics editor
    'jordanbaird-ice' # powerful menu bar management tool
    'keycastr' # show keystrokes on screen
    'keymap' # keyboard remapping
    'lulu' # open-source firewall
    'notion' # note taking
    'obsidian' # note taking
    'raindropio' # bookmark manager
    'spotify'
    'startupfolder' # run anything at startup by simply placing it in a special folder
    'tunnelblick' # vpn client
    'vlc'
    'setapp' # install Setapp, a suite of macOS apps
  )
  social=(
    # 'telegram'
    'discord'
  )
  fonts=(
    'font-fira-code'
    'font-jetbrains-mono'
    'font-fira-code-nerd-font'
  )
  all=(
    "${devTools[@]}"
    "${utils[@]}"
    "${social[@]}"
    "${fonts[@]}"
  )

  for cask in "${all[@]}"; do
    brew install --cask $cask
  done
}

function install_appstore_apps() {
  echo "Installing App Store apps..."
  brew install mas

  mas install 1529448980  # Reeder
  mas install 6714467650  # Perplexity
  mas install 1233965871  # ScreenBrush
  mas install 6503120862  # Synology Image Assistant Extension
  mas install 1569813296  # 1Password for Safari
  mas install 1593408455  # Anybox
  mas install 1606897889  # Consent-O-Matic
  mas install 441258766  # Magnet
  mas install 497799835  # Xcode

  mas upgrade
}

function install_gnu_utils() {
  all=(
    'gnu-sed' # patches sed to be unix compatible
    # Replaces standard Mac OS X utilities with GNU core utilities List of all commands can be
    # found here: https://en.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands Initially
    # available with 'g' prefix (grm, gmv etc.)
    'coreutils'
    # Extending directory search and file locating capabilities https://www.gnu.org/software/findutils/
    'findutils'
  )

  for formula in "${all[@]}"; do
    brew install $formula
  done
}

function install_formulas() {
  brew tap rsteube/homebrew-tap

  devUtils=(
    'python3'
    'n' # node version manager
    'neovim'
    'rsteube/tap/carapace' # multi-shell completions
    'git'
    # Improves git diff https://github.com/so-fancy/diff-so-fancy gitconfig should be additionally
    # configured to apply it for every diff.
    'diff-so-fancy'
    'gh'  #github cli
    'docker-compose'
    'nushell'
    'tmux'
    'bat' # colorful cat
    'zoxide' # faster way to navigate filesystem
    'atuin' # improved shell history
    'starship' # cross-shell prompt
    'stow' # symlink manager
  )
  utils=(
    'p7zip' # 7zip archiver
    # Use to convert & minimize video quality like: ffmpeg -i input.mov -vcodec libx265 -crf 28 output.mp4
    'ffmpeg'
    'ghostscript' # interpreter for the PostScript language and for PDF
    'imagemagick' # image manipulation
    'ripgrep' # faster grep
    'sd' # intuitive find & replace
    'qpdf' # manipulate pdf files
    'tree' # visualize directory structure
  )
  all=(
    "${devUtils[@]}"
    "${utils[@]}"
  )

  for formula in "${all[@]}"; do
    brew install $formula
  done

  # fzf is a general-purpose command-line fuzzy finder.
  brew install fzf
  $(brew --prefix)/opt/fzf/install
}

install_formulas
install_gnu_utils
install_casks
install_appstore_apps
