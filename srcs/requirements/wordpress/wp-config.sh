#!/bin/sh
trap 'exit' TERM INT
sleep 10

cd /var/www/wordpress

echo "create wp-config.php file with database details"
wp config create  --allow-root --dbhost=mariadb:3306 --path='/var/www/wordpress' --dbname=$MDB_NAME --dbuser=$MDB_USER --dbpass=$MDB_PASSWORD
echo "succes on creating"

echo "install wordpress with the given title, admin username, password and email"
wp core install  --allow-root --url="https://$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL"

echo "create a new user with the given username, email, password and role"
wp user create "$WP_USER" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASSWORD" --role=author --allow-root

echo "launching php fm"
exec php-fpm7.4 -F -R

