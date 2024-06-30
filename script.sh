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
brew install yabai

# Install skhd
brew install koekeishiya/formulae/skhd
skhd --start-service

