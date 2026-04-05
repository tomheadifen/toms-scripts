#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config/nvim

cp "$SCRIPT_DIR/init.lua" ~/.config/nvim/init.lua
cp -r "$SCRIPT_DIR/lua" ~/.config/nvim/

echo "Copied nvim config to ~/.config/nvim/"
