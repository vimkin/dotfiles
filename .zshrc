# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. Initialization code
# that may require console input (password prompts, [y/n] confirmations, etc.) must go above this
# block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Load custom executable functions
fpath=($HOME/.zsh/functions $fpath)

for f in $HOME/.zsh/functions/*; do
  # The `U` disables alias expansion while the function is being loaded and the `z` forces zsh-style
  # autoloading even if KSH_AUTOLOAD is set for whatever reason.
  autoload -Uz $(basename $f)
done

# Extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post these are loaded
# first, second, and third, respectively.
function load_settings() {
  local themeDir="$1"

  if [ -d "$themeDir" ]; then
    if [ -d "$themeDir/pre" ]; then
      for config in "$themeDir"/pre/**/*~*.zwc(N-.); do
        . $config
      done
    fi

    for config in "$themeDir"/**/*(N-.); do
      case "$config" in
        "$themeDir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$themeDir/post" ]; then
      for config in "$themeDir"/post/**/*~*.zwc(N-.); do
        . $config
      done
    fi
  fi
}

function bundle_plugins() {
  plugins=(
    git
    macos
    asdf # runtime version manager
    z
    command-not-found # suggests package name with requested command if that doesn't exist
    # docker
    zsh-autosuggestions # external
    zsh-syntax-highlighting # external
  )

  source $ZSH/oh-my-zsh.sh

  # enable option-stacking for docker e.g. docker run -it ubuntu be aware of following quirk
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker#settings
  # zstyle ':completion:*:*:docker:*' option-stacking yes
  # zstyle ':completion:*:*:docker-*:*' option-stacking yes
}

load_settings "$HOME/.zsh/configs"
bundle_plugins

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# aliases
[ -f ~/.aliases ] && source ~/.aliases

# Enable fuzzy autocompletions and keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
