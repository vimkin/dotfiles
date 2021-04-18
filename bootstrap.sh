#!/usr/bin/env zsh

curDir=$(dirname ${(%):-%x})
cd ${curDir}

git pull origin master

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "Installing zdharma/zinit..."
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
    print -P "Installation successful." || \
    print -P "The clone has failed."
fi

function init() {
  rsync --include ".zsh*" \
    --include ".zsh/**" \
    --exclude "*" \
    -avh --no-perms . ~
  source ~/.zshrc
}

if [[ "$1" == "--force" ]] || [[ "$1" == "-f" ]]; then
  init
else
  # -q for yes/no answers
  if read -q '?This may overwrite existing files in your home directory. Are you sure? (y/n)'; then
    echo ""
    init
  fi
fi

unset init
