# toms-scripts

## set-shortcuts

Registers custom global keyboard shortcuts in Linux Mint (Cinnamon) and restarts Cinnamon to apply them.

### Shortcuts

| Key | Action |
|-----|--------|
| F1  | Focus the running Neovim terminal window. Shows a notification if no Neovim instance is open. |
| F2  | Focus the Chrome window, or launch Chrome if it isn't running. |
| F3  | Focus the terminal window, or launch a new terminal if none is open. |

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
