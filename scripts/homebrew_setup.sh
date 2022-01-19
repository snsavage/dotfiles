#!/bin/bash

# Installs and updates Homebrew.  Installs Brewfile packages.
# Inspired by:
# * https://github.com/ZachiNachshon/dotfiles/blob/master/brew/brew.sh
# * https://pumpingco.de/blog/brewfile/

set -eu

echo -e "
=======================================================================
                            Homebrew
=======================================================================
"

if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed."
fi

echo "Updating Homebrew"
brew update

echo "Upgrading Homebrew"
brew upgrade

echo "Install packages from Brewfile"
brew bundle --file ./Brewfile

printf -- '\n';
exit 0

