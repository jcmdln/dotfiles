#!/usr/bin/env sh

# Create missing user directories that are likely to be needed at some
# point.

if [ "$(whoami)" != "root" ]; then
    Folders="Documents Downloads Music Pictures Projects Videos"

    for Folder in $(echo $Folders); do
        if [ ! -d "$HOME/$Folder" ]; then
            mkdir -v "$HOME/$Folder"
        fi
    done

    unset Folder Folders
fi
