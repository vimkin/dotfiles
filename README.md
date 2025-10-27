# Dotfiles

My modular dotfiles configuration for macOS using GNU Stow for symlink management.

Each tool's configuration is organized in its own directory, making it easy to install or remove specific components as needed.

## Main Features

- **Nushell**: Modern shell configuration with custom scripts and completions
- **Neovim**: Text editor configuration with plugins and custom settings
- **Starship**: Cross-shell prompt with custom theming
- **Tmux**: Terminal multiplexer with productivity-focused keybindings

## Installation

### Prerequisites

> [!IMPORTANT]
> Ensure you have [Homebrew](https://brew.sh/) installed on your system.

### Setup

1. Clone the repository:

```bash
git clone https://github.com/vimkin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Install dependencies and configure:

```bash
brew bundle install
nu ./bootstrap.nu
```

The above commands will:

- ‼️ Set Nushell as the default shell
- Install required packages and App Store applications via `brew bundle`
- Use GNU Stow to create symlinks for each configuration module (nushell, nvim, tmux, etc.)
- Clone additional Nushell scripts from the community repository

### Manual Configuration

For selective installation, use Stow directly:

```bash
stow nushell  # Install only Nushell config
stow nvim     # Install only Neovim config
stow tmux     # Install only Tmux config
stow starship # Install only Starship config
```
