#! /bin/bash

sed -i "s|cert_placeholder|$CERTIFICATE|g" /tmp/default.conf
sed -i "s|the_key|$KEY|g" /tmp/default.conf

openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=mabdelma.42.fr"

cp /tmp/default.conf /etc/nginx/sites-available/default

nginx -g 'daemon off;'