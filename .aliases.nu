# Unix
alias ll = ls -al
alias ln = ln -v

# Editors
alias vim = nvim
alias v = nvim

# Quick edits
alias ea = vim ~/.aliases.local
alias ez = vim ~/.zshrc.local
alias eg = vim ~/.gitconfig
alias ev = vim ~/.vimrc
alias es = vim ~/bin/autosort
alias et = vim ~/.tmux.conf

alias hosts = sudo vim /etc/hosts

def lss [path?: string] {
  let target_path = if $path == null { '.' } else { $path }

  ls -a $target_path | sort-by type name -i
}

def cpu [] {
  ps | sort-by cpu --reverse | first 5
}

def mem [] {
  ps | sort-by mem --reverse | first 5
}

alias tf = tail -f
alias cl = clear
alias chmox = chmod +x

alias ns = npm start
alias ni = npm install

alias nas = cd ~/Library/CloudStorage/SynologyDrive-Home
