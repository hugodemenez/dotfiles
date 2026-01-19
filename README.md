# My dotfiles

## Purpose

As I started my developer journey with VS Code, I realized that it was not customized to meet my needs in any way. In fact, I couldn't navigate through files and easily switch terminals with shortcuts. This pain point led me to start working with Vim (specifically Neovim, since Vim isn't going to progress further at this stage).

I had previous experience working with Vim on Ubuntu servers to make quick code changes; however, it isn't suitable for long coding sessions.

I soon realized that I could significantly increase my productivity by using a custom development configuration tailored to my needs.

This repository contains all my configuration files that I use on my MacBook Pro M1 (2021).

If you are on a Linux system, you won't encounter any difficulty in using the same configuration.

## Setup

Clone this repo to `~/dotfiles`.

For faster implementation, a bash script is in the repo.
To run the bash script, use `chmod 755 script.sh` then `./script.sh`.

This will install the required tools via Homebrew and create symlinks from `~/dotfiles` to the appropriate config locations.

## Config

There are different config directories:
- `nvim/`: Neovim configuration (init.lua, plugins, themes)
- `ghostty/`: Ghostty terminal emulator config and themes
- `tmux/`: Tmux configuration
- `yabai/`: Yabai window manager config
- `skhd/`: SKHD hotkey daemon config

All configs are symlinked to `~/.config/` or `~/` as appropriate.

> Last updated on Jan 2026
