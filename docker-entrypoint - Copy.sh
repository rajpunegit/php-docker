#!/bin/bash
set -e

if [ "$1" = 'apache' ]; then
        echo "Starting Apache"
       sudo /etc/init.d/apache2 restart
fi

exec "$@"