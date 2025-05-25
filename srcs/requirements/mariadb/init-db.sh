#!/bin/bash

# start mariadb
echo "Starting MariaDB service..."
service mariadb start # start mariadb

until mysqladmin ping >/dev/null 2>&1; do
    sleep 1
    echo "Waiting for MariaDB service..."
done
echo "MariaDB service started."

# re config database

# Create database if it doesn't exist
mysql -u root -p$MDB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${MDB_NAME}\`;"

# Créer l'utilisateur
mysql -u root -p$MDB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${MDB_USER}\`@'%' IDENTIFIED BY '${MDB_PASSWORD}';"

# Attribuer les privilèges à l'utilisateur
mysql -u root -p$MDB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON ${MDB_NAME}.* TO \`${MDB_USER}\`@'%';"

# Mettre à jour le mot de passe root
mysql -h localhost -u root -p${MDB_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASSWORD}';"

# Rafraîchir les privilèges
mysql -u root -p$MDB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

#--------------mariadb restart--------------#
echo "Shutting down MariaDB to restart with new config..."
mysqladmin -u root -p$MDB_ROOT_PASSWORD shutdown

# Wait a bit for MariaDB to shut down properly
sleep 2

echo "Restarting MariaDB with new config..."
# Restart mariadb with new config in the background to keep the container running
# mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
mysqld_safe

# Keep the container alive
##
echo "MariaDB should now be running. Keeping container alive..."
