#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config/nvim

cp -r "$SCRIPT_DIR/nvim"/. ~/.config/nvim/

echo "Copied nvim config to ~/.config/nvim/"
