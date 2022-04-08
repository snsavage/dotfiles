#!/bin/bash

set -eu
echo -e "
=======================================================================
                            macOS Config
=======================================================================
"

echo "Sets macOS configuration."

echo "AppleShowAllFiles = true"
defaults write com.apple.Finder AppleShowAllFiles true

printf -- '\n';
exit 0
