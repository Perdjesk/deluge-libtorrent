FROM debian:stable

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl python python-twisted python-openssl python-setuptools intltool \
    python-xdg python-chardet geoip-database python-libtorrent python-notify \
    python-pygame python-glade2 librsvg2-common xdg-utils python-mako

RUN apt-get install --no-install-recommends -y libboost-all-dev make g++ && \
    mkdir -p /tmp/libtorrent && \
    cd /tmp/libtorrent && \
    curl -SL http://sourceforge.net/projects/libtorrent/files/libtorrent/libtorrent-rasterbar-1.0.4.tar.gz/download -o release.tar.gz && \
    tar -zxvf release.tar.gz && \
    cd libtorrent* && \
    ./configure --enable-python-binding -enable-debug=no && \
    make -j2 install && \
    ldconfig && \
    rm -fr /tmp/libtorrent && \
    apt-get purge -y libboost-all-dev make g++ && \
    apt-get autoremove -y

RUN mkdir -p /tmp/deluge && \
    cd /tmp/deluge && \
    curl -SL http://download.deluge-torrent.org/source/deluge-1.3.11.tar.gz -o release.tar.gz && \
    tar -zxvf release.tar.gz && \
    cd deluge* && \
    python setup.py build && \
    python setup.py install && \
    rm -fr /tmp/deluge

ADD command.sh /opt/command.sh
RUN chmod +x /opt/command.sh

VOLUME /config
VOLUME /data

EXPOSE 8112
EXPOSE 58846
EXPOSE 6881

CMD ["/opt/command.sh"]
