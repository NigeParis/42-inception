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
# Nginx Dockerfile

FROM debian:bullseye
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y nginx
RUN apt install -y vim

RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/nigel.crt \
-keyout /etc/nginx/ssl/nigel.key \
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=nrobinso.42.fr/UID=nigel"
RUN mkdir -p /etc/nginx/ssl
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
#WARNING!!!!! always copy your files in your container
COPY /conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]

