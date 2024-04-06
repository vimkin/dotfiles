# Ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# Try loading ASDF from the regular home dir location
if which brew >/dev/null &&
  BREW_DIR="$(dirname $(which brew))/.." &&
  [ -f "$BREW_DIR/opt/asdf/libexec/asdf.sh" ]; then
  . "$BREW_DIR/opt/asdf/libexec/asdf.sh"
fi

# https://thoughtbot.com/blog/git-safe
# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

# Add Rust package manager to path
PATH="$HOME/.cargo/bin:$PATH"

# Add global node modules
export NODE_PATH=$(npm root --quiet -g)

export -U PATH
