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

let absolute_includes = [
  ".aliases.nu",
  ".gitconfig",
  ".tmux.conf"
]
| append (glob .git*.txt)
| append (glob .config/**)
| path expand

def main [--force: int] {
  if $force == 1 {
    init
  } else {
    let response = (input "This may overwrite existing files in your home directory. Are you sure? (y/n) ")

    if $response =~ "^y" or $response =~ "^Y" {
      init
    }
  }
}

def init [] {
  let file_table = $absolute_includes | each { |it|
    {
      name: ($it | path relative-to $env.PWD),
      type: ($it | path type)
    }
  }

  for dir in ($file_table | where type == "dir" | get name) {
    let $create_dir = ($env.HOME | path join $dir)

    print $"Attempt create directory: ($create_dir)"
    mkdir -v ($env.HOME | path join $dir)
  }

  for file in ($file_table | where type == 'file' | get name) {
    let $source_file = $file | path expand
    let $target_file = ($env.HOME | path join $file)

    ln -vsf $source_file $target_file
  }

  let $nu_path = (which nu | get path | get 0)

  if $env.SHELL != $nu_path {
    chsh -s $nu_path # make nushell the default shell
  }

  $env.XDG_CONFIG_HOME = $env.HOME | path join ".config"
  nu
}
