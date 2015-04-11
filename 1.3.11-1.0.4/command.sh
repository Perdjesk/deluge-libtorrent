#!/bin/sh

deluged -c /config -L info -l /config/deluged.log

if [ ! -f /config/core.conf ]; then
    sleep 2
    echo "Creating default configuration and adding default /data path"
    deluge-console -c /config "config -s move_completed_path /data/completed"
    deluge-console -c /config "config -s torrentfiles_location /data/torrents"
    deluge-console -c /config "config -s download_location /data/download"
    deluge-console -c /config "config -s autoadd_location /data/autoadd"
fi

deluge-web -c /config
