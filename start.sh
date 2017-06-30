#!/bin/sh

sed -i -e "s/127.0.0.1/${VARNISH_BACKEND_ADDRESS}/g" /etc/varnish/conf/backend.vcl
sed -i -e "s/8080/${VARNISH_BACKEND_PORT}/g" /etc/varnish/conf/backend.vcl
sed -i -e "s/%purge_key%/${VARNISH_PURGE_KEY}/g" /etc/varnish/lib/purge.vcl
sed -i -e "s/%login_cookie%/${VARNISH_LOGIN_COOKIE}/g" /etc/varnish/default.vcl

mkdir -p /var/lib/varnish/`hostname` && chown nobody /var/lib/varnish/`hostname`
varnishd -s malloc,${VARNISH_MEMORY} -a :80 -f /etc/varnish/default.vcl
sleep 1
varnishlog
