## About
Please see
[config.org](https://github.com/jcmdln/config/blob/master/etc/emacs/config.org)
for documentation about my configuration.


## Compiling
I prefer using the master branch of the official Emacs git repository,
and track it for updates. Below are two variants I commonly use
depending on the target platform.


Fully bloated Emacs, with _almost_ everything enabled:

	git clone https://git.savannah.gnu.org/git/emacs --branch master --single-branch &&
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

	git clone https://git.savannah.gnu.org/git/emacs --branch master --single-branch &&
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
