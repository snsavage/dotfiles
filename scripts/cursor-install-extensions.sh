#!/bin/bash

# Check if 'cursor' command exists
if command -v cursor &> /dev/null; then
  # Read extensions from file and sort them
  code_extensions=$(cat "$HOME/dotfiles/cursor_extensions.txt" | sort)
  
  # Get installed extensions and sort them
  installed_extensions=$(cursor --list-extensions | sort)
  
  # Find uninstalled extensions by comparing the two lists
  uninstalled_extensions=$(comm -23 <(echo "$code_extensions") <(echo "$installed_extensions"))
  
  echo "Checking for uninstalled Cursor extensions..."
  
  if [ -z "$uninstalled_extensions" ]; then
    echo "all good!"
  else
    # Count uninstalled extensions
    count=$(echo "$uninstalled_extensions" | wc -l)
    echo "found $count."
    
    # Install each uninstalled extension
    echo "$uninstalled_extensions" | while read -r extension; do
      if [ -n "$extension" ]; then
        echo "Installing $extension..."
        cursor --install-extension "$extension"
      fi
    done
    
    echo "Done!"
  fi
fi