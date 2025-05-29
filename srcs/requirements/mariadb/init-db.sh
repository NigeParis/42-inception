#!/bin/bash
trap 'exit' TERM INT
exec mysqld_safe &
until mysqladmin ping >/dev/null 2>&1; do
    sleep 1
    echo "Waiting for MariaDB service..."
done
mysql -u root -p${MDB_ROOT_PASSWORD} -e \
"CREATE DATABASE IF NOT EXISTS \`${MDB_NAME}\`;"
mysql -u root -p${MDB_ROOT_PASSWORD} -e \
"CREATE USER IF NOT EXISTS \`${MDB_USER}\`@'%' IDENTIFIED BY '${MDB_PASSWORD}';"
mysql -u root -p${MDB_ROOT_PASSWORD} -e \
"GRANT ALL PRIVILEGES ON \`${MDB_NAME}\`.* TO '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASSWORD}';"
mysql -u root -p${MDB_ROOT_PASSWORD} -e \
"ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASSWORD}';"
mysql -u root -p${MDB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p${MDB_ROOT_PASSWORD} shutdown
exec mysqld_safe
echo "MariaDB should now be running. Keeping container alive..."

# **************************************************************************** #
# Notes - Initialization Script for MariaDB in Docker Container                #
# **************************************************************************** #

# Line 01: Defines the script as a Bash executable.
# Line 02: Ensures the script exits cleanly when the container stops.
# Line 03: Starts the MariaDB service using mysqld_safe in the background.
# Line 04: Waits for MariaDB to become available before proceeding.
# Line 05: Sleeps for 1 second between connection attempts to avoid excessive polling.
# Line 06: Prints a message indicating the database service is still starting.
# Line 08: Creates the database if it does not already exist.
# Line 10: Creates a new database user with a specified password if it does not exist.
# Line 12: Grants full privileges to the new user on the created database.
# Line 14: Updates the root user's password for enhanced security.
# Line 16: Applies the changes by flushing privileges.
# Line 17: Shuts down MariaDB gracefully after setting up users and databases.
# Line 18: Restarts MariaDB to ensure a clean and stable startup.
# Line 19: Prints a confirmation message indicating MariaDB is running properly.

