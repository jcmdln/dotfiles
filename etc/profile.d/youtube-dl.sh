#!/usr/bin/env sh

if [ -x "$(command -v youtube-dl)" ]; then
    alias music-dl="youtube-dl --extract-audio --add-metadata --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s'"
    alias video-dl="youtube-dl -f best -o '%(title)s.%(ext)s'"
fi
