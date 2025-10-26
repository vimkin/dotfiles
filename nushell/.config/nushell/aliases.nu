alias ll = ls -al
alias ln = ln -v
alias tf = tail -f
alias cl = clear

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
