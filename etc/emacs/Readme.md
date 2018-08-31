I prefer to use a stripped-down version of emacs that doesn't include X11
or other graphical support. Here are the settings I used when compiling,
though this is not a requirement to use `default.el`:

```
./configure \
    CFLAGS="-g3 -O3 -pipe" \
    --with-json \
    --with-mailutils \
    --with-modules \
    --with-xml2 \
    --with-zlib \
    --without-dbus \
    --without-gconf \
    --without-gif \
    --without-gpm \
    --without-gsettings \
    --without-imagemagick \
    --without-jpeg \
    --without-libotf \
    --without-m17n-flt \
    --without-makeinfo \
    --without-png \
    --without-sound \
    --without-rsvg \
    --without-tiff \
    --without-toolkit-scroll-bars \
    --without-x \
    --without-x-toolkit \
    --without-xaw3d \
    --without-xft \
    --without-xpm
```
