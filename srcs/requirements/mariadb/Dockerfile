# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nrobinso <nrobinso@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/29 09:29:05 by nrobinso          #+#    #+#              #
#    Updated: 2025/05/29 09:29:57 by nrobinso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
# Mariadb Dockerfile

FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/
RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld/
RUN chown mysql:mysql /var/lib/mysql/
RUN chmod -R 755 /var/lib/mysql/
COPY ./init-db.sh .
RUN chmod +x ./init-db.sh
ENTRYPOINT ["bash", "init-db.sh"]

# **************************************************************************** #
# Notes - Configuration for a MariaDB Container Setup #
# **************************************************************************** #

# Line 14: Base image: Debian Bullseye - stable version.
# Line 15: Updates and upgrades system packages.
# Line 16: Installs MariaDB server in the container.
# Line 17: Copies MariaDB configuration file to the containers file location.
# Line 18: Creates a runtime directory for MySQL processes.
# Line 19: Creates a directory for storing database files.
# Line 20: Sets ownership of the runtime directory to the MySQL user.
# Line 21: Grants necessary permissions for the runtime directory.
# Line 22: Sets ownership of the database directory to the MySQL user.
# Line 23: Grants necessary permissions for the database directory.
# Line 24: Copies the database initialization script into the container.
# Line 25: Makes the initialization script executable.
# Line 26: Defines the entry point to execute the init script at startup.


