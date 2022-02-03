#!/bin/bash

set -eu

echo -e "
=======================================================================
                         Tmux Plugin Manager
=======================================================================
"

TPM_DIRECTORY=~/.tmux/plugins/tpm

if [ ! -d $TPM_DIRECTORY ]; then
    echo "Creating tpm directory at: $TPM_DIRECTORY"
    mkdir -p $TPM_DIRECTORY

    echo "Cloning tpm repo"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    echo "Sourcing .tmux.conf"
    tmux source ~/.tmux.conf
else
    echo "Tmux already installed"
fi

echo "Installing Tmux Plugins"
~/.tmux/plugins/tpm/bin/install_plugins

echo "Update Tmux Plugins"
~/.tmux/plugins/tpm/bin/update_plugins all

echo "Removing Tmux Plugins Not in List"
~/.tmux/plugins/tpm/bin/clean_plugins

printf -- '\n';
exit 0

