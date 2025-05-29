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

# **************************************************************************** #
# Notes - WordPress Installation Script in Docker Container                    #
# **************************************************************************** #

# Line 01: Defines the script as a Shell executable.
# Line 02: Ensures the script exits cleanly when the container stops.
# Line 03: Waits 10 seconds before proceeding to allow dependent services to start.
# Line 04: Changes directory to the WordPress installation path.
# Line 06: Creates the WordPress configuration file using WP-CLI.
#          Allows execution as the root user (necessary in some container environments).
#          Specifies MariaDB as the database host with its port.
#          Defines the path where WordPress is installed.
#          Sets the database name for WordPress.
#          Defines the database username.
#          Sets the password for the database user.
# Line 09: Installs WordPress using WP-CLI with specified parameters.
#          Allows execution as the root user.
#          Sets the website URL for WordPress.
#          Defines the site title.
#          Creates the WordPress admin user.
#          Sets the admin user password.
#          Defines the email address for the admin account.
# Line 11: Creates an additional WordPress user using WP-CLI.
#          Defines the new user's email address.
#          Assigns a password to the new WordPress user.
#          Defines the role of the new WordPress user as an author.
#          Ensures the command executes with root privileges if necessary.
# Line 30: Executes "php-fpm" in the -F foreground as -R root user

