FROM debian:bullseye
RUN apt update -y && apt upgrade -y
RUN apt install -y nginx
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/nigel.crt \
-keyout /etc/nginx/ssl/nigel.key \
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=nigel.42.fr/UID=nigel"

#WARNING!!!!! always copy your files in your container
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]

