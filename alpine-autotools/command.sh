#!/bin/sh

chown deluge /config
chown deluge /data
chown deluge /log

if [ ! -f /config/core.conf ]; then
    supervisord -c /etc/supervisord.conf
    sleep 2
    echo "Pushing configuration for core.conf (deluge)"
    deluge-console -c /config "config -s move_completed_path /data/completed"
    deluge-console -c /config "config -s torrentfiles_location /data/torrentsfiles"
    deluge-console -c /config "config -s download_location /data/download"
    deluge-console -c /config "config -s autoadd_location /data/autoadd"
    deluge-console -c /config "config -s random_port false"
    deluge-console -c /config "config -s listen_ports (6881, 6881)"
    pkill -TERM -f .*supervisord.*
    sleep 2
fi

supervisord -c /etc/supervisord.conf -n
