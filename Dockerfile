FROM debian:stable

RUN apt-get update && apt-get install --no-install-recommends -y \
python python-twisted python-openssl python-setuptools intltool python-xdg python-chardet geoip-database python-libtorrent python-notify python-pygame python-glade2 librsvg2-common xdg-utils python-mako lzma

RUN mkdir -p /tmp/deluge && \
    curl -SL http://download.deluge-torrent.org/source/deluge-1.3.11.tar.lzma -o /tmp/deluge/release.tar.lzma
ADD command.sh /opt/command.sh

RUN chmod a+x /opt/command.sh && cd /tmp/deluge/ && mkdir release && tar --lzma -xvf release.tar.lzma -C ./release --strip-components=1 && cd release && \
python setup.py build && python setup.py install

VOLUME /config
VOLUME /data

EXPOSE 8112
EXPOSE 58846

CMD ["/opt/command.sh"]
