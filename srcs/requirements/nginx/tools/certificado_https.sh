#!/bin/sh

mkdir -p /etc/nginx/ssl

openssl req -x509 -noenc \
	-subj "/C=ES/ST=Madrid/L=Madrid/O=inception/CN=jbutragu.42.fr" \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt
