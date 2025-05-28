# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nrobinso <nrobinso@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/28 13:29:05 by nrobinso          #+#    #+#              #
#    Updated: 2025/05/28 13:29:57 by nrobinso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
# Mariadb Dockerfile

FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# # install the required packages
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/
RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld/
RUN chown mysql:mysql /var/lib/mysql/
RUN chmod -R 755 /var/lib/mysql/

# copy file from host to container
COPY ./init-db.sh .

# set permissions to the file
RUN chmod +x ./init-db.sh

# define command to run when the container starts
ENTRYPOINT ["bash", "init-db.sh"]
