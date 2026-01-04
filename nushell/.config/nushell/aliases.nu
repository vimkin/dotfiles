alias ll = ls -al
alias ln = ln -v
alias tf = tail -f
alias cl = clear

alias hosts = sudo nvim /etc/hosts
alias ff = fastfetch

# List files and directories with hidden files included, sorted by type then name (case-insensitive)
# Takes an optional path parameter, defaults to current directory if not provided
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

# Tmux session manager - attach or create session named after current directory
def tat [session_name?: string] {
  # Get directory name and sanitize it for tmux session name
  let path_name = (pwd | path basename | str replace '.' '-')
  let session_name = if ($session_name | is-empty) { $path_name } else { $session_name }

  # Helper function to check if we're inside tmux
  let in_tmux = ($env.TMUX? | is-not-empty)

  # Helper function to check if session exists
  let session_exists = {|name|
    (tmux has-session -t $"=($name)" | complete | get exit_code) == 0
  }

  if not $in_tmux {
    # Not in tmux - create new session or attach to existing one
    tmux new-session -As $session_name
  } else {
    # We're already in tmux - switch to session or create it first
    if not (do $session_exists $session_name) {
      # Create detached session to avoid nesting issues
      let _ = (tmux new-session -Ad -s $session_name | complete)
    }
    tmux switch-client -t $session_name
  }
}

# Remove dangling symlinks in the current directory
def remove-dangling-symlinks [] {
  ls -a | where type == symlink | each { |it|
    let target = (^readlink $it.name | str trim)

    if not ($target | path exists) {
      rm $it.name
      print $"Removed: ($it.name) -> ($target)"
    }
  }
}

# Rename current branch and update remote
def git-rename-branch [new_name: string] {
  # Get current branch name
  let old_branch = (git branch --show-current | str trim)

  if ($old_branch | is-empty) {
    print "Error: Not on a branch (detached HEAD?)"
    return
  }

  git branch -m $old_branch $new_name
  git push origin --set-upstream $new_name
  git push origin --delete $old_branch
}
