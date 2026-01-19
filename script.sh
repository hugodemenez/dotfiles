#!/bin/sh
#
# At this stage I suppose you have brew and git installed
#

# Install tmux
brew install tmux

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Then use prefix + I to install plugins

# Install neovim
brew install neovim

# Install yabai
brew install koekeishiya/formulae/yabai

# Install skhd
brew install koekeishiya/formulae/skhd

# Install ghostty
brew install ghostty

# Start services
yabai --start-service
skhd --start-service

# Create symlinks for configs
DOTFILES_DIR="$HOME/dotfiles"

# Neovim
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Ghostty
ln -sf "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

# Yabai
ln -sf "$DOTFILES_DIR/yabai/yabairc" "$HOME/.config/yabai/yabairc"

# SKHD
ln -sf "$DOTFILES_DIR/skhd/skhdrc" "$HOME/.config/skhd/skhdrc"

# Tmux
ln -sf "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.tmux.conf"

echo "Setup complete. Reload your shell or restart services as needed."

