FROM debian:bullseye


RUN apt update -y && apt upgrade -y
RUN apt install -y nginx
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/nigel.crt \
-keyout /etc/nginx/ssl/nigel.key \
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=nigel.42.fr/UID=nigel"
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
#WARNING!!!!! always copy your files in your container
COPY ./nginx.conf /etc/nginx/conf.d/default.conf


EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]

