#!/bin/bash

# Checks for git username and email.
# Prompts user for missing values and sets the config.

set -eu
echo -e "
=======================================================================
                            Git Config
=======================================================================
"

echo "Checking Git user configuration."

LOCAL_CONFIG=~/.gitconfig_local

if [ ! -e "$LOCAL_CONFIG" ]
then
    echo "Creating $LOCAL_CONFIG"
    touch $LOCAL_CONFIG
fi

set +e
USER_NAME=$(git config user.name)
USER_EMAIL=$(git config user.email)
set -e

if [ -z "$USER_NAME" ]
then
    echo "WARNING: Git Config User.Name is not set!"
    read -p "Git User.Name: " NEW_USER_NAME
    git config --file $LOCAL_CONFIG user.name "$NEW_USER_NAME"
fi

if [ -z "$USER_EMAIL" ]
then
    echo "WARNING: Git Config User.Email is not set!"
    read -p "Git User.Email: " NEW_USER_EMAIL
    git config --file $LOCAL_CONFIG user.email "$NEW_USER_EMAIL"
fi

echo "Git Config for User and Email"
echo "$(git config user.name)"
echo "$(git config user.email)"

printf -- '\n';
exit 0
