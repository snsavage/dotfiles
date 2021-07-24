#!/bin/bash

echo "Symlink Utility"

# Savage: Maybe use printf?

# Args: <location of file> <location of symlink>
source_path=$1
link_path=$2

# Check for file.
if [ ! -e "$source_path" ] ; then
    echo "$source_path not found"
    exit 1
else
    echo "$source_path found"
fi


# Test if the link is there and working.
if [ -L ${link_path} ] && [ -e ${link_path} ] ; then
    echo "Good link"
    exit 0
fi

# Test if the link is there, but broken.
if [ -L ${link_path} ] && [ ! -e ${link_path} ] ; then
    echo "Broken link"
    # Fix the link and retest.
    # Retest the link.
    # Exit 0 if the link is good.
    exit 1
fi

if [ -e ${link_path} ] ; then
    echo "Not a link"
    # Move the existing file and create the link.
    exit 1
fi

if [ ! -e ${link_path} ] ; then
    echo "Missing"
    # Create the link.
    exit 1
fi

