FROM alpine:3.3

#RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.3/testing' >> /etc/apk/repositories

RUN apk add --update boost geoip openssl python python3 openssl-dev boost-dev geoip-dev g++ python-dev python3-dev make automake autoconf

RUN apk add --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing libexecinfo libexecinfo-dev

ADD ax_python_devel.m4 /tmp/libtorrent/ax_python_devel.m4
ADD ax_boost_python.m4 /tmp/libtorrent/ax_boost_python.m4

RUN mkdir -p /tmp/libtorrent && \
    cd /tmp/libtorrent && \
    wget https://github.com/arvidn/libtorrent/releases/download/libtorrent-1_0_6/libtorrent-rasterbar-1.0.6.tar.gz -O release.tar.gz && \
    tar -zxvf release.tar.gz && \
    cd libtorrent* && \
    export CFLAGS="-lstdc++" && \
#    export PYTHON="python3" && \
    cp /tmp/libtorrent/ax* m4/
#    autoconf && \
#    aclocal && \
#    automake && \
#    ./configure --enable-python-binding -enable-debug=no --with-boost-system=boost_system  --with-boost-python=boost_python --with-libgeoip=system && \
#    make -j4 CXXFLAGS="-Wno-cpp" CFLAGS="-w" install
#    ldconfig 
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
