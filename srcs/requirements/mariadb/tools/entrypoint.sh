chown -R mysql:mysql /var/lib/mysql

if [ ! -d /var/lib/mysql/$MARIADB_DATABASE ]; then
	echo "-- Starting service"
	service mysql start

	mkdir -p /var/run/mysqld
	touch /var/run/mysqld/mysqlf.pid
	mkfifo /var/run/mysqld/mysqlf.sock

	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
	mysql -u root -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';"
	mysql -u root -e "FLUSH PRIVILEGES;"

	mysqladmin -u root -p$MARIADB_ROOT_PWD;
	
	echo "-----------------"
	service mysql stop
	echo "-- Stopping service"
else
	mkdir /var/run/mysqld
	touch /var/run/mysqld/mysqlf.pid
	mkfifo /var/run/mysqld/mysqlf.sock
fi

chown -R mysql /var/run/mysqld

exec "$@"
mysqld_safe --datadir=/var/lib/mysql
