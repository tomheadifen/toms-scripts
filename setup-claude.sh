#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

LINKS=(
    "settings.json"
    "rules"
)

link_item() {
    local name="$1"
    local source="$SCRIPT_DIR/claude/$name"
    local target="$CLAUDE_DIR/$name"

    if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
        echo "Already linked: $target"
        return
    fi

    if [[ -e "$target" || -L "$target" ]]; then
        echo "Backing up existing $target to ${target}.bak"
        rm -rf "${target}.bak"
        mv "$target" "${target}.bak"
    fi

    ln -s "$source" "$target"
    echo "Linked $target -> $source"
}

mkdir -p "$CLAUDE_DIR"

for item in "${LINKS[@]}"; do
    link_item "$item"
done

echo "Done. Restart Claude Code to pick up changes."
