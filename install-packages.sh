#!/usr/bin/env bash
set -eu

sudo pacman -S --needed neovim go nodejs npm tmux ghostty obsidian curl

export PATH="$HOME/.opencode/bin:$PATH"
curl -fsSL https://opencode.ai/install | bash -s -- --no-modify-path
