# Ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# https://thoughtbot.com/blog/git-safe
# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# Add Rust package manager to path
PATH="$HOME/.cargo/bin:$PATH"

# Add Docker binaries to path
PATH="$HOME/.docker/bin:$PATH"

# Add global node modules
export NODE_PATH=$(npm root --quiet -g)

export -U PATH
