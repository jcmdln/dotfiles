## About
Please see
[config.org](https://github.com/jcmdln/config/blob/master/etc/emacs/config.org)
for documentation about my configuration.

## Compiling
I prefer compiling emacs without GUI support using the master branch for
early access to features. I suspect this would not be very different to
`emacs-nox` packages already available on most OS's, aside from some
small details.

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
