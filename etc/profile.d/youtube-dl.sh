# /etc/profile.d/youtube-dl.sh

if [ -x $(command -v youtube-dl) ]; then
    alias music-dl="youtube-dl --extract-audio --add-metadata --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s'"
    alias video-dl="youtube-dl -f best"
fi
