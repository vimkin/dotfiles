#!/bin/nu

if (which rustc | is-empty) {
  print "Rust is not installed. Installing now..."

  http get 'https://sh.rustup.rs' | save rustup-init.sh

  sh rustup-init.sh -y
  bash -c "source ~/.cargo/env"
}

if (not ('~/.nu_scripts' | path exists)) {
  print "Cloning nu_scripts repo..."

  gh repo clone nushell/nu_scripts ~/.nu_scripts
} else {
  print "Updating nu_scripts repo in ~/.nu_scripts"

  git -C ~/.nu_scripts pull
}

def main [] {
  stow -v nushell nvim tmux git

  let $nu_path = (which nu | get path | get 0)

  if $env.SHELL != $nu_path {
    chsh -s $nu_path # make nushell the default shell
  }

  nu
}
