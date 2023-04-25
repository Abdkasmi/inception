#!/bin/bash


# Start the mysql service
service mysql start


# Insert data
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"
echo '1'
mysql -u root -pJoueur11 -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED WITH mysql_native_password BY '${MARIADB_USER_PASSWORD}';"
echo '2'
mysql -u root -pJoueur11 -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@'%'; FLUSH PRIVILEGES;"
echo '3'
# mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"
# mysql -u root -e "CREATE USER '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';FLUSH PRIVILEGES;"
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE}; GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}'; FLUSH PRIVILEGES;"

# Stop the mysql service
sleep 1
service mysql stop

exec "$@"