Please see the
[config.org](https://github.com/jcmdln/config/blob/master/etc/emacs/config.org)
file for the configuration itself as well as inline documentation and
instructions on usage.


Fully bloated Emacs, with _almost_ everything enabled:

	git clone https://github.com/emacs-mirror/emacs.git --depth 1 &&
	cd emacs &&
	./autogen.sh &&
	./configure \
		MAKE="gmake" \
		CC="clang" \
		CFLAGS="-O2 -g3 -march=native -pipe" \
		--without-all \
		--with-dbus \
		--with-file-notification \
		--with-gif \
		--with-gpm \
		--with-gnutls \
		--with-harfbuzz \
		--with-jpeg \
		--with-json \
		--with-lcms2 \
		--with-libotf \
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
		--with-xft \
		--with-xml2 \
		--with-xpm \
		--with-xwidgets \
		--with-zlib &&
	make -j$(grep -c ^processor /proc/cpuinfo) &&
	sudo make install


Minimal Emacs without graphical support or other such posh features:

	git clone https://github.com/emacs-mirror/emacs.git --depth 1 &&
	cd emacs &&
	./autogen.sh &&
	./configure \
		MAKE="gmake" \
		CC="clang" \
		CFLAGS="-O2 -g3 -march=native -pipe" \
		--without-all \
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
