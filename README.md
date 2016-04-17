# deluge-libtorrent

https://registry.hub.docker.com/u/perdjesk/deluge-libtorrent/

```
cd alpine-autotools
docker build -t alpine-autotools .
docker run -it alpine-autotools sh
cd /tmp/libtorrent/libtorrent*
export CFLAGS="-lstdc++"
./configure --prefix=/usr --enable-python-binding -enable-debug=no --with-boost-system=boost_system --with-libgeoip=system
```

```
cd alpine-bjam
docker build -t alpine-bjam .
docker run -it alpine-bjam sh
cd /tmp/libtorrent/libtorrent*
cd bindings/python
bjam -j4 libtorrent-link=static geoip=static boost-link=static release optimization=space stage_module
LD_LIBRARY_PATH=. python test.py
```
