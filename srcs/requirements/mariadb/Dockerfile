FROM debian:bullseye

# Install MariaDB
RUN apt update -y 
RUN apt install -y mariadb-client
RUN apt install -y mariadb-server

# Copy your custom config file if needed
# RUN touch -y mariadb.cnf
# COPY mariadb.cnf /etc/mysql/mariadb.conf.d/
RUN echo "/etc/mysql/mariadb.conf.d > mariadb.cnf"

# Set up MariaDB to run on container
COPY init-db.sh /init-db.sh
RUN chmod +x /init-db.sh

# RUN bash /init-db.sh
# ENTRYPOINT ["./init-db.sh"]

ENV NAME="John Doe" 
ENTRYPOINT ["/bin/echo", "Hello, $(NAME)"]
