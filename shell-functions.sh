#!/bin/bash

nvim() {
  gnome-terminal --class=NvimTerminal -- nvim "$@" & disown
}

claude() {
  gnome-terminal --class=ClaudeTerminal -- claude "$@" & disown
}
