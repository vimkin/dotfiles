# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. Initialization code
# that may require console input (password prompts, [y/n] confirmations, etc.) must go above this
# block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# Add global node modules
export NODE_PATH=$(npm root --quiet -g)

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
  _dir="$1"

  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*~*.zwc(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*~*.zwc(N-.); do
        . $config
      done
    fi
  fi
}

function bundle_plugins() {
  source $HOME/.zinit/bin/zinit.zsh

  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  # Load a few important annexes, without Turbo (this is currently required for annexes)
  zinit light-mode for \
      zinit-zsh/z-a-rust \
      zinit-zsh/z-a-as-monitor \
      zinit-zsh/z-a-patch-dl \
      zinit-zsh/z-a-bin-gem-node

  # oh-my-zsh
  zinit ice svn
  zinit snippet OMZ::plugins/osx
  zinit snippet OMZ::plugins/git/git.plugin.zsh
  zinit ice svn
  zinit snippet OMZ::plugins/z
  zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh # suggests package name with requested command if that doesn't exist

  zinit ice svn pick="_docker"
  zinit snippet OMZ::plugins/docker
  # enable option-stacking for docker e.g. docket run -it ubuntu be aware of following quirk
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker#settings
  zstyle ':completion:*:*:docker:*' option-stacking yes
  zstyle ':completion:*:*:docker-*:*' option-stacking yes

  # zsh-users
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light zsh-users/zsh-autosuggestions

  # p10k theme
  zinit ice depth=1
  zinit light romkatv/powerlevel10k
}

load_settings "$HOME/.zsh/configs"
bundle_plugins

# aliases
[ -f ~/.aliases ] && source ~/.aliases

# Enable fuzzy autocompletions and keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
