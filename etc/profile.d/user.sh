#!/usr/bin/env sh

# Create missing user directories that are likely to be needed at some
# point.

if [ "$(whoami)" != 'root' ]; then
    Folders="
        Documents
        Downloads
        Music
        Pictures
        Projects
        Videos
        Templates
    "

    for Folder in $Folders; do
        if [ ! -e "$HOME"/"$Folder" ]; then
            mkdir "$HOME"/"$Folder"
        fi
    done

    unset Folder Folders
fi
