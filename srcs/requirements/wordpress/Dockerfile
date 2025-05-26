FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client
RUN apt-get install vim -y

RUN apt-get update && apt-get install -y tar \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /var/www && chmod -R 755 /var/www/ && \
    wget https://fr.wordpress.org/wordpress-6.8-fr_FR.tar.gz -P /var/www && \
    tar -xzf /var/www/wordpress-6.8-fr_FR.tar.gz -C /var/www && rm -f /var/www/wordpress-6.8-fr_FR.tar.gz && \
    chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


COPY ./wp-config.sh /wp-config.sh

EXPOSE 9000
ENTRYPOINT ["bash", "./wp-config.sh"]
