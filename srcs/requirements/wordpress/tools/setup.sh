#!/bin/sh

export DB_PASSWORD=$(cat /run/secrets/db_password)


if [ ! -f /var/www/html/wp-config.php ]; then
	echo "wordpress is being installed"
	cd /tmp
	wget https://wordpress.org/latest.tar.gz
	tar -xzf latest.tar.gz
	mv wordpress/* /var/www/html/
	cd /var/www/html/
	cp wp-config-sample.php wp-config.php

	sed -i "s/'username_here'/'${DB_USER}'/" wp-config.php
	sed -i "s/'password_here'/'${DB_PASSWORD}'/" wp-config.php
	sed -i "s/'database_name_here'/'${DB_NAME}'/" wp-config.php
	sed -i "s/'localhost'/'${DB_HOST}'/" wp-config.php


fi

sed -i 's/^listen *=.*/listen = 0.0.0.0:9000/' /etc/php82/php-fpm.d/www.conf

exec php-fpm82 -F
