#!/bin/bash
set -euo pipefail

DOTFILES_REPO="https://github.com/hugodemenez/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

# Functions
install_homebrew() {
  if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to PATH
    if [[ -f /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
  fi
}

clone_repo() {
  if [[ ! -d "$DOTFILES_DIR" ]]; then
    echo "Cloning dotfiles repo..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
  fi
}

install_tools() {
  echo "Installing tools..."
  brew install tmux neovim koekeishiya/formulae/yabai koekeishiya/formulae/skhd ghostty

  # Install tmux plugin manager
  if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
  echo "Note: In tmux, press prefix + I to install plugins."
}

setup_symlinks() {
  echo "Setting up symlinks..."

  # Backup function
  backup_if_exists() {
    local target="$1"
    if [[ -e "$target" && ! -L "$target" ]]; then
      mv "$target" "${target}.backup"
      echo "Backed up $target to ${target}.backup"
    fi
  }

  # Neovim
  backup_if_exists "$HOME/.config/nvim"
  ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

  # Ghostty
  backup_if_exists "$HOME/.config/ghostty"
  ln -sf "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

  # Yabai
  mkdir -p "$HOME/.config/yabai"
  ln -sf "$DOTFILES_DIR/yabai/yabairc" "$HOME/.config/yabai/yabairc"

  # SKHD
  mkdir -p "$HOME/.config/skhd"
  ln -sf "$DOTFILES_DIR/skhd/skhdrc" "$HOME/.config/skhd/skhdrc"

  # Tmux
  backup_if_exists "$HOME/.tmux.conf"
  ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"
}

# Main
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "This script is for macOS only."
  exit 1
fi

install_homebrew
clone_repo
install_tools
yabai --start-service
skhd --start-service
setup_symlinks

echo "Dotfiles setup complete. Restart your shell and tmux/Neovim/Ghostty."
