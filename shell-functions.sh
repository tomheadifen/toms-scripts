#!/bin/bash

nvim() {
  if [[ "$1" == -* ]]; then
    command nvim "$@"
  else
    gnome-terminal --disable-factory --class=NvimTerminal -- nvim "$@" & disown
  fi
}

claude() {
  gnome-terminal --class=ClaudeTerminal -- claude "$@" & disown
}
