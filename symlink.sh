#!/bin/bash

echo "Symlink Utility"

# Savage: Maybe use printf?

# Args: <location of file> <location of symlink>
source_path=$1
link_path=$2

# if [ -L ${my_link} ] ; then
#    if [ -e ${my_link} ] ; then
#       echo "Good link"
#    else
#       echo "Broken link"
#    fi
# elif [ -e ${my_link} ] ; then
#    echo "Not a link"
# else
#    echo "Missing"
# fi

# Check for file.
if [ ! -e "$source_path" ] ; then
    echo "$source_path not found"
    exit 1
else
    echo "$source_path found"
fi

# Check for symlink/
if [ -L "$link_path" ] ; then
    echo "Symlink already exists for $link_path"
    # exit 1
else
    echo "No symlink found for $link_path"
fi

# Check that symlink links to file.

test="~/dotfiles/$source_path"
echo $test
echo "readlink " "$(readlink $test)"
echo "link_path " "$link_path"
if [ "$(readlink $link_path)" = $source_path ] ; then
    echo "a match"
else
    echo "no match"
fi


# If symlink existings but points somewhere else...

# If no symlink
# Check for file instead of symlink.
# Move file to old files folder.
# Create symlink.

# Should this be reversable?
