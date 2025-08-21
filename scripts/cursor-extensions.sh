#!/bin/bash

extensions_file=$HOME/dotfiles/cursor_extensions.txt

echo "Saving Cursor extensions..."
cursor --list-extensions > "$extensions_file"

cat "$extensions_file"
