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
  # Base packages for all systems
  let base_packages = [nushell nvim tmux git fastfetch starship atuin zellij]
  # Add macOS-specific packages
  let packages = if (uname | get operating-system | str contains 'Darwin') {
    $base_packages | append [hammerspoon startup]
  } else {
    $base_packages
  }

  # Execute stow with the package list
  stow -v ...$packages

  let $nu_path = (which nu | get path | get 0)

  if $env.SHELL != $nu_path {
    if (not (open /etc/shells | lines | any {|line| $line == $nu_path})) {
      $nu_path | sudo tee -a /etc/shells
    }

    chsh -s $nu_path # make nushell the default shell
  }

  nu
}
