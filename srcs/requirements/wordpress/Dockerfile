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

#RUN mkdir -p /var/www && \
#    curl -o /var/www/wordpress-6.8-fr_FR.tar.gz https://fr.wordpress.org/wordpress-6.8-fr_FR.tar.gz && \
#    tar -xzf /var/www/wordpress-6.8-fr_FR.tar.gz -C /var/www && rm -f /var/www/wordpress-6.8-fr_FR.tar.gz && \
#    chown -R root:root /var/www/wordpress

RUN mkdir -p /run/php

RUN curl -O  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


#COPY ./wp-config.sh /var/www/wordpress/wp-config.sh
COPY ./wp-config.sh .
# give permission to wordpress directory
RUN chmod  755 /var/www/wordpress
# change owner of wordpress directory to www-data
RUN chown  www-data:www-data /var/www/wordpress
EXPOSE 9000
ENTRYPOINT ["bash", "wp-config.sh"]
