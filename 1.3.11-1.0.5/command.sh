#!/bin/sh

deluged -c /config -L info -l /config/deluged.log

if [ ! -f /config/core.conf ]; then
    sleep 2
    echo "Pushing configuration for core.conf (deluge)"
    deluge-console -c /config "config -s move_completed_path /data/completed"
    deluge-console -c /config "config -s torrentfiles_location /data/torrentsfiles"
    deluge-console -c /config "config -s download_location /data/download"
    deluge-console -c /config "config -s autoadd_location /data/autoadd"
	deluge-console -c /config "config -s random_port false"
	deluge-console -c /config "config -s listen_ports (6881, 6881)"
  ],

fi

deluge-web -c /config