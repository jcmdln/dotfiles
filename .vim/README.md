These are my recommended compilation options, though they aren't required.

```
./configure \
    --prefix=/usr \
    --disable-gui \
    --disable-netbeans \
    --enable-multibyte \
    --enable-largefile \
    --with-features=huge \
    --without-x
```

```
make \
    -j$(grep -c ^processor /proc/cpuinfo) \
    MAKE="make -e" \
    VIMRCLOC=/etc \
    VIMRUNTIMEDIR=/usr/share/vim/
```
