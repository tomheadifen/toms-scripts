# toms-scripts

## set-shortcuts

Registers custom global keyboard shortcuts in Linux Mint (Cinnamon) and restarts Cinnamon to apply them.

### Shortcuts

| Key | Action |
|-----|--------|
| F1  | Focus the running Neovim terminal window. Shows a notification if no Neovim instance is open. |
| F2  | Focus the Chrome window, or launch Chrome if it isn't running. |
| F3  | Focus a terminal window (excluding Claude Code terminals), or launch a new terminal if none is open. |
| F4  | Focus the running Claude Code terminal window. Shows a notification if no Claude Code instance is open. |

### Usage

```bash
# Set shortcuts
./set-shortcuts

# Remove all custom shortcuts
./set-shortcuts --clear
```

Cinnamon will restart automatically after setting shortcuts (screen may flicker briefly).

### Dependencies

- `wmctrl` — used to find and focus windows
- `notify-send` — used to display notifications

## nvim-config

Neovim configuration, intended to be symlinked into `~/.config/nvim/`.

### Usage

```bash
./nvim-config/setup-symlinks.sh
```

This creates `~/.config/nvim/init.lua` as a symlink pointing to `nvim-config/init.lua` in this repo.

## shell-functions.sh

Wrapper functions for `nvim` and `claude` that launch each in a dedicated `gnome-terminal` window with a specific WM class. This allows `set-shortcuts` to reliably identify and focus those windows.

| Function | WM Class | Effect |
|----------|----------|--------|
| `nvim`   | `NvimTerminal` | Opens Neovim in a new terminal window |
| `claude` | `ClaudeTerminal` | Opens Claude Code in a new terminal window |

### Usage

Source the file in your shell config (e.g. `~/.bashrc` or `~/.zshrc`):

```bash
source /path/to/shell-functions.sh
```

Then use `nvim` and `claude` as normal — they will open in their own dedicated windows that F1/F4 can focus.

## claude

Global Claude Code config (settings and rules), symlinked into `~/.claude/` so it stays in sync across machines.

| File | Purpose |
|------|---------|
| `claude/settings.json` | Global settings: hooks, plugins, permission deny rules |
| `claude/rules/` | Global rules loaded in every project (commit messages, safety) |

### Usage

```bash
./setup-claude.sh
```

Any existing `~/.claude/settings.json` or `~/.claude/rules` is moved to a `.bak` first. Because they're symlinks, edits made from either location (including by Claude Code itself) land in this repo — commit and push them as normal.
