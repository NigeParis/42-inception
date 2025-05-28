#!/bin/bash

# start mariadb
echo "Starting MariaDB service..."
exec mysqld_safe &

until mysqladmin ping >/dev/null 2>&1; do
    sleep 1
    echo "Waiting for MariaDB service..."
done

echo "MariaDB service started."

# re config database

echo "Create database ${MDB_NAME} password=${MDB_ROOT_PASSWORD} if it doesn't exist"
mysql -u root -p${MDB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${MDB_NAME}\`;"

echo "Créer l'utilisateur ${MDB_USER} with password ${MDB_PASSWORD}"
mysql   -u root -p${MDB_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${MDB_USER}\`@'%' IDENTIFIED BY '${MDB_PASSWORD}';"

echo "Attribuer les privilèges à l'utilisateur"
mysql -u root -p${MDB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${MDB_NAME}\`.* TO '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASSWORD}';"

echo "Mettre à jour le mot de passe root"
mysql  -u root -p${MDB_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASSWORD}';"

echo " Rafraîchir les privilèges ${MDB_PASSWORD}" 
mysql  -u root -p${MDB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

#--------------mariadb restart--------------#
echo "Shutting down MariaDB to restart with new config..."
mysqladmin -u root -p${MDB_ROOT_PASSWORD} shutdown

# Wait a bit for MariaDB to shut down properly

echo "Restarting MariaDB with new config..."
# Restart mariadb with new config in the background to keep the container running
# mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
exec mysqld_safe

# Keep the container alive
##
echo "MariaDB should now be running. Keeping container alive..."
