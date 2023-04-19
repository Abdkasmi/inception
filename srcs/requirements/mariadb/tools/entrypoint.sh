#!/bin/bash

# Start the mysql service
service mysql start

# Insert data
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}'; FLUSH PRIVILEGES;" && \
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE}; GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${WP_USER}'@'%' IDENTIFIED BY '${WP_USER_PWD}'; FLUSH PRIVILEGES;"
# Stop the mysql service
sleep 1
service mysql stop

exec "$@"