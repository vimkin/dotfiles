#!/bin/nu

if (which rustc | is-empty) {
  print "Rust is not installed. Installing now..."

  http get 'https://sh.rustup.rs' | save rustup-init.sh

  sh rustup-init.sh -y
  bash -c "source ~/.cargo/env"
} else {
  # Check for Rust updates
  rustup check
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
  let base_packages = [atuin fastfetch git nvim nushell starship tmux zellij containers]
  # Add macOS-specific packages
  let packages = if (uname | get operating-system | str contains 'Darwin') {
    $base_packages | append [hammerspoon startup]
  } else {
    $base_packages | append [cosmic flatpak scripts]
  }

  # Execute stow with the package list
  stow -v ...$packages

  let $nu_path = (which nu | get path | get 0)
  let $is_symlink = (ls $nu_path | get type | get 0) == "symlink"

  # Determine the path to use for shell registration
  # If nu is a symlink (e.g., from Nix), create a stable wrapper in ~/.local/bin
  let $shell_path = if $is_symlink {
    let $wrapper_dir = ($env.HOME | path join ".local" "bin")
    let $wrapper_path = ($wrapper_dir | path join "nu")

    mkdir $wrapper_dir

    # Create wrapper script that executes the symlinked nu
    $"#!/bin/sh\nexec ($nu_path) \"$@\"" | save -f $wrapper_path
    ^chmod +x $wrapper_path

    print $"Created nushell wrapper at ($wrapper_path)"
    $wrapper_path
  } else {
    $nu_path
  }

  if $env.SHELL != $shell_path {
    if (not (open /etc/shells | lines | any {|line| $line == $shell_path})) {
      $shell_path | sudo tee -a /etc/shells | ignore
    }

    chsh -s $shell_path # make nushell the default shell
  }

  nu
}
