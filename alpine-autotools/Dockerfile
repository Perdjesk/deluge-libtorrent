FROM alpine:edge

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

RUN apk add --update boost geoip libexecinfo openssl openssl-dev boost-dev geoip-dev libexecinfo-dev g++ python-dev

RUN mkdir -p /tmp/libtorrent && \
    cd /tmp/libtorrent && \
    wget https://github.com/arvidn/libtorrent/releases/download/libtorrent-1_0_6/libtorrent-rasterbar-1.0.6.tar.gz -O release.tar.gz && \
    tar -zxvf release.tar.gz && \
    cd libtorrent* 
#    ./configure --prefix=/usr --enable-python-binding -enable-debug=no --with-boost-system=boost_system --with-libgeoip=system  && \
#    make -j4 install && \
#    ldconfig && \
#    rm -fr /tmp/libtorrent && \
#    apk del g++ boost-dev boost-dev geoip-dev openssl-dev python-dev linux-headers
    

# Deluge WebClient
#EXPOSE 8112

# Deluged
#EXPOSE 58846

# BitTorrent incoming
#EXPOSE 6881
#EXPOSE 6881/udp

# Volumes
#VOLUME /config
#VOLUME /log
#VOLUME /data

# add the deluge:deluge user:group 
#RUN adduser -S -s "/bin/sh" -D -h /var/lib/deluge deluge

#RUN echo 'export PYTHON_EGG_CACHE=/data/python_egg_cache' >> /etc/profile
#ENV PYTHON_EGG_CACHE /data/python_egg_cache

# import the supervisor configuration
#ADD *.ini /etc/supervisor.d/

# setup command script file
#ADD command.sh /opt/command.sh
#RUN chmod +x /opt/command.sh

#CMD ["/opt/command.sh"]
