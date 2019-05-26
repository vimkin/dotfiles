namespace :brew do
  task :install do
    unless system("which brew")
      sh 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    end
  end

  task :install_packages do
    sh "brew update"
    sh "brew install git"

    # Improves git diff https://github.com/so-fancy/diff-so-fancy
    # gitconfig should be additionally configured to apply it for every diff
    sh "brew install diff-so-fancy"

    # Replaces standard Mac OS X utilities with GNU core utilities
    # List of all commands can be found here: https://en.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands
    # Initially available with 'g' prefix (grm, gmv etc.)
    sh "brew install coreutils"

    # Extending directory search and file locating capabilities
    # https://www.gnu.org/software/findutils/
    sh "brew install findutils"

    # Add even more unique unix tools
    # https://joeyh.name/code/moreutils/
    sh "brew install moreutils"

    # Fixes sed to be unix compatible
    sh "brew install gnu-sed"

    sh "brew install n"
    sh "brew install rbenv"
    sh "brew install docker-compose"

    # Installing yarn without global node dependency
    # https://gist.github.com/AGutierrezR/2c22fdd8686e6e30c56949f5e37e214e
    sh "brew install yarn --ignore-dependencies"

    # Install zsh package manager
    sh "brew install antigen"

    # fzf is a general-purpose command-line fuzzy finder
    # You shouldn't forget to execute "$(brew --prefix)/opt/fzf/install" command after installation
    sh "brew install fzf"
  end

  task :install_casks do
    sh "brew tap caskroom/cask"

    sh "brew cask install iterm2"
    sh "brew cask install visual-studio-code"
    sh "brew cask install franz"
    sh "brew cask install spotify"
    sh "brew cask install 1password"
    sh "brew cask install google-chrome"
    sh "brew cask install cheatsheet"
    sh "brew cask install dropbox"
    sh "brew cask install tunnelblick"

    # Install FiraCode
    sh "brew tap homebrew/cask-fonts"
    sh "brew cask install font-fira-code"

    # Additionally
    # sh "brew cask install bartender"
    # sh "brew cask install cleanmymac"
    # sh "brew cask install intellij-idea"
    # sh "brew cask install webstorm"
    # sh "brew cask install atom"

    # MAS only
    # - Spark mail client
    # - Magnet
  end
end
