# /etc/profile.d/user.sh

# Create missing user directories that are likely to be needed at some
# point.

if [ "$(whoami)" != 'root' ]; then
    Folders="
	Documents
	Downloads
	Mail
	Music
	Pictures
	Projects
	Videos
	Templates
    "

    for Folder in $Folders; do
	[ -d "$HOME"/"$Folder" ] ||
	    mkdir "$HOME"/"$Folder"
    done

    unset Folder Folders
fi
