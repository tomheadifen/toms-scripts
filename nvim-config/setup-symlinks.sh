#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config/nvim

ln -sf "$SCRIPT_DIR/init.lua" ~/.config/nvim/init.lua

echo "Symlink created: ~/.config/nvim/init.lua -> $SCRIPT_DIR/init.lua"
