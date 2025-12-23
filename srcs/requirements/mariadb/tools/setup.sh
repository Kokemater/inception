#!/bin/sh

export DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

export DB_PASSWORD=$(cat /run/secrets/db_password)

mkdir -p /run/mysqld

chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mariadb-install-db --datadir=/var/lib/mysql --user=mysql 
	mariadbd --datadir=/var/lib/mysql --skip-networking &

	while ! mariadb-admin ping --silent --user=root > /dev/null 2>&1; do
		sleep 1
	done
	
	envsubst < init.sql > init_copy.sql
	mariadb -u root < init_copy.sql
	mariadb-admin shutdown -u root -p$DB_ROOT_PASSWORD
	wait
fi

exec mariadbd
