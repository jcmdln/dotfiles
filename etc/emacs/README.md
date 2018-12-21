## About
Please see
[config.org](https://github.com/jcmdln/config/blob/master/etc/emacs/config.org)
for documentation about my configuration.

## Compiling
I prefer compiling emacs without GUI support using the master branch for
early access to features. I suspect this would not be very different to
`emacs-nox` packages already available on most OS's, aside from some
small details.


### emacs-nox
```
./configure \
    CFLAGS="-g3 -O3 -pipe" \
    --without-all \
    --without-x \
    --with-gnutls \
    --with-jansson \
    --with-mailutils \
    --with-modules \
    --with-threads \
    --with-xml2 \
    --with-zlib
```


### emacs
```
./configure \
    CFLAGS="-g3 -O3 -pipe" \
    --without-all \
    --with-gif \
    --with-gnutls \
    --with-imagemagick \
    --with-jpeg \
    --with-json \
    --with-libotf \
    --with-mailutils \
    --with-modules \
    --with-png \
    --with-rsvg \
    --with-sound \
    --with-threads \
    --with-tiff \
    --with-xft \
    --with-xml2 \
    --with-xpm \
    --with-zlib
```
