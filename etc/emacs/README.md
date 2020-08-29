This file documents how I compile GNU/Emacs. My actual configuration
has been been named `Baemacs`, which has been moved here:
* https://github.com/jcmdln/baemacs


emacs
===================
This is a "standard" build of Emacs, which means GUI support along with
anything useful for GUI situations.

Fedora
--------------------

### Dependencies
```sh
sudo dnf install -y \
	automake cairo-devel giflib-devel gnutls-devel gpm-devel gtk3-devel \
	harfbuzz-devel jansson-devel lcms2-devel libXpm-devel libjpeg-devel \
	libotf-devel librsvg2-devel libtiff-devel m17n-lib-devel ncurses-devel \
	systemd-devel webkit2gtk3-devel
```

### Build
```sh
./autogen.sh &&
./configure \
	MAKE="gmake" \
	CC="gcc" \
	CFLAGS="-O2 -g3 -march=native -pipe" \
	--without-all \
	--with-cairo \
	--with-dbus \
	--with-file-notification \
	--with-gif \
	--with-gpm \
	--with-gnutls \
	--with-harfbuzz \
	--with-jpeg \
	--with-json \
	--with-lcms2 \
	--with-libgmp \
	--with-libotf \
	--with-libsystemd \
	--with-m17n-flt \
	--with-mailutils \
	--with-modules \
	--with-png \
	--with-rsvg \
	--with-selinux \
	--with-sound \
	--with-threads \
	--with-tiff \
	--with-toolkit-scroll-bars \
	--with-x \
	--with-x-toolkit \
	--with-xml2 \
	--with-xpm \
	--with-xwidgets \
	--with-zlib &&
make -j$(grep -c ^processor /proc/cpuinfo) &&
sudo make install
```

OpenBSD
--------------------

### Dependencies
```sh
doas pkg_add \
	autoconf automake gmake gnutls hunspell jansson
```

### Build
```sh
```


emacs-nox
===================
Minimal Emacs without graphical support or other such posh features

Fedora
--------------------

### Dependencies
```sh
sudo dnf install -y \
	automake gnutls-devel gpm-devel jansson-devel ncurses-devel systemd-devel
```

### Build
```sh
./autogen.sh &&
./configure \
	MAKE="gmake" \
	CC="gcc" \
	CFLAGS="-O2 -g3 -march=native -pipe" \
	--without-all \
	--without-x \
	--with-dbus \
	--with-file-notification \
	--with-gpm \
	--with-gnutls \
	--with-json \
	--with-libgmp \
	--with-libsystemd \
	--with-mailutils \
	--with-modules \
	--with-selinux \
	--with-threads \
	--with-toolkit-scroll-bars \
	--with-xml2 \
	--with-zlib &&
make -j$(grep -c ^processor /proc/cpuinfo) &&
sudo make install
```

OpenBSD
--------------------

### Dependencies
```sh
doas pkg_add \
	autoconf automake gmake gnutls hunspell jansson
```

### Build
```sh
export AUTOCONF_VERSION="$(\ls $(which autoconf)-*|awk -F '-' '{print $2}')" &&
./autogen.sh --no-check &&
./configure \
	MAKE="gmake" \
	CC="clang" \
	CFLAGS="-O2 -g3 -march=native -pipe" \
	--without-all \
	--without-x \
	--with-dbus \
	--with-file-notification \
	--with-gpm \
	--with-gnutls \
	--with-json \
	--with-mailutils \
	--with-modules \
	--with-threads \
	--with-toolkit-scroll-bars \
	--with-xml2 \
	--with-zlib &&
gmake -j$(sysctl -n hw.ncpu) &&
doas gmake install
```
