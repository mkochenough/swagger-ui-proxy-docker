#!/bin/sh

if [ -z "$PROXY_TARGET" ] ; then
        echo "PROXY_TARGET not set."
        exit 1
fi

sed -e "s|%PROXY_TARGET%|$PROXY_TARGET|" -i /etc/nginx/sites-enabled/default

exec nginx -g "daemon off;"

