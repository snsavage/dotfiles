#!/bin/bash

# Updates Oh My Zsh Submodule.  Updates Oh My Zsh.

set -eu

echo -e "
=======================================================================
                            Oh My Zsh
=======================================================================
"

# git submodule add https://github.com/anishathalye/dotbot
# git config -f .gitmodules submodule.dotbot.ignore dirty # ignore dirty commits in the submodule

if [ ! -d ./oh-my-zsh ]; then
    echo "Installing Oh My Zsh"
    git submodule add https://github.com/ohmyzsh/ohmyzsh.git ./oh-my-zsh
else
    echo "Updating Oh My Zsh"
    /bin/zsh -i -c 'omz update'
fi

printf -- '\n';
exit 0

