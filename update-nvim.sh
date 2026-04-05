#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config/nvim

rsync -a --delete "$SCRIPT_DIR/nvim/" ~/.config/nvim/

echo "Synced nvim config to ~/.config/nvim/"
