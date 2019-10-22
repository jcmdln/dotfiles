Please see the
[config.org](https://github.com/jcmdln/config/blob/master/etc/emacs/config.org)
file for the configuration itself as well as inline documentation and
instructions on usage.


## Compiling
I currently maintain a fork of GNU/Emacs that includes changes that I
intend to push upstream, and I only supply the master branch since
that's what I personally use.

Fully bloated Emacs, with _almost_ everything enabled:

	git clone git@github.com:jcmdln/emacs.git &&
	cd emacs &&
	./autogen.sh &&
	./configure \
		MAKE="gmake" \
		CC="clang" \
		CFLAGS="-O2 -g3 -march=native -pipe" \
		--with-all \
		--with-imagemagick \
		--with-mailutils \
		--with-modules \
		--with-xwidgets &&
	make -j$(grep -c ^processor /proc/cpuinfo) &&
	sudo make install


Minimal Emacs without graphical support or other such posh features:

	git clone git@github.com:jcmdln/emacs.git &&
	cd emacs &&
	./autogen.sh &&
	./configure \
		MAKE="gmake" \
		CC="clang" \
		CFLAGS="-O2 -g3 -march=native -pipe" \
		--without-all \
		--with-dbus \
		--with-file-notification \
		--with-gnutls \
		--with-json \
		--with-m17n-flt \
		--with-mailutils \
		--with-modules \
		--with-threads \
		--with-xwidgets=no \
		--with-xml2 \
		--with-zlib &&
	make -j$(grep -c ^processor /proc/cpuinfo) &&
	sudo make install
