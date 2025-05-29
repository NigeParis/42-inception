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
COPY /conf/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]

# **************************************************************************** #
# Notes - Configuration for an Nginx Docker Container #
# **************************************************************************** #

# Line 14: Pulls Debian Bullseye as the container's base image.
# Line 15: Updates package lists for security and stability.
# Line 16: Upgrades system packages to the latest versions.
# Line 17: Installs the Nginx web server.
# Line 18: Installs Vim for text editing.
# Line 19: Creates a directory for SSL certificates.
# Line 20: Installs OpenSSL for certificate generation.
# Line 21: Generates a self-signed SSL certificate for secure connections.
# Line 24: Creates a directory for SSL files (repeated for consistency).
# Line 25: Sets correct permissions for the web directory.
# Line 26: Grants ownership of web files to the Nginx user.
# Line 27: Copies the Nginx configuration file into the container.
# Line 28: Exposes port 443 for HTTPS traffic.
# Line 29: Sets the container’s entry point to start Nginx in the foreground.

