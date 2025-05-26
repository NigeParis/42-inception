#!/bin/sh

sleep 10
clear_env = no
listen=wordpress:9000

wp config create	--allow-root \
			--dbname=$MDB_NAME \
			--dbuser=$MDB_USER \
			--dbpass=$MDB_ROOT_PASSWORD \
			--dbhost=mariadb:3306 --path='/var/www/wordpress'


/usr/sbin/php-fpm7.4 -F
