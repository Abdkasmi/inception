socket=/run/mysqld/mysqld.sock
if [ ! -d /var/lib/mysql/$MARIADB_DATABASE ]; then
	service mysql start

	echo "create $MARIADB_DATABASE"
	mariadb -u root -p$MARIADB_ROOT_PASSWORD
	mysqladmin -u root password $MARIADB_ROOT_PASSWORD

	mysqladmin -u root password $MARIADB_ROOT_PASSWORD shutdown
fi

echo "$MARIADB_DATABASE ready"
mysqld_safe
