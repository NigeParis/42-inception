# **************************************************************************** #
#                                                                              #
#                                                                              #
#    Dockerfile                                                                #
#                                                                              #
#    By: nrobinso <nrobinso@student.42.fr>                                     #
#                                                                              #
#    Created: 2025/05/28 13:29:05 by nrobinso                                  #
#    Updated: 2025/05/28 13:29:57 by nrobinso                                  #
#                                                                              #
# **************************************************************************** #
# Wordpress Dockerfile

FROM debian:bullseye
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4
RUN apt-get install -y php7.4-fpm
RUN apt-get install -y php7.4-mysql
RUN apt-get install -y mariadb-client
RUN apt-get install -y curl
RUN apt-get install vim -y
RUN apt-get update && apt-get install -y tar \
    && rm -rf /var/lib/apt/lists/*
COPY www.conf /etc/php/7.4/fpm/pool.d/
RUN wget https://fr.wordpress.org/wordpress-6.6-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.6-fr_FR.tar.gz && rm -rf wordpress-6.6-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
RUN mkdir -p /run/php
RUN curl -O  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./wp-config.sh .
RUN chmod  755 /var/www/wordpress
RUN chown  www-data:www-data /var/www/wordpress
EXPOSE 9000
ENTRYPOINT ["bash", "wp-config.sh"]

# **************************************************************************** #
# Notes - Configuration for a WordPress Docker Container #
# **************************************************************************** #

# Line 14: Uses Debian Bullseye as the container's base image.
# Line 15: Updates package lists to ensure the latest versions.
# Line 16: Upgrades system packages for stability.
# Line 17: Installs wget for downloading files.
# Line 18: Installs PHP 7.4 for WordPress compatibility.
# Line 19: Installs PHP-FPM for handling PHP processing.# Line 30: Executes "php-fpm" in the -F foreground as -R root user
# Line 20: Installs MySQL extension to interact with databases.
# Line 21: Installs MariaDB client for database communication.
# Line 22: Installs curl for web requests.
# Line 23: Installs Vim for text editing within the container.
# Line 24: Updates packages and installs tar, removing unused files.
# Line 26: Copies PHP-FPM pool configuration.
# Line 27: Downloads WordPress in French to /var/www.
# Line 28: Extracts and removes the downloaded WordPress archive.
# Line 29: Sets ownership of the WordPress directory to root.
# Line 30: Creates a directory for PHP runtime files.
# Line 31: Downloads WP-CLI for managing WordPress via command line.
# Line 32: Grants execution permissions to WP-CLI.
# Line 33: Moves WP-CLI to a location where it can be used globally.
# Line 34: Copies the WordPress configuration script in to container.
# Line 35: Grants necessary permissions for WordPress directory.
# Line 36: Assigns ownership of the WordPress directory to www-data.
#          Sets both the owner and group to www-data, which is the default user 
#          that Nginx and PHP-FPM processes run under. /var/www/wordpress
# Line 37: Exposes port 9000 for PHP-FPM.
# Line 38: Sets up the container to execute the WordPress configuration script.

