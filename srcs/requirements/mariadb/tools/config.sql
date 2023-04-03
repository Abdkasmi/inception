/** Create first user, second one will be created via wordpress container */
CREATE DATABASE $MARIADB_DATABASE;
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED by '$MARIADB_USER_PWD';
GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO $MARIADB_USER@'%';

/** We need to flush for the grant to be active sort of reboot*/
/** To tell the server to reload the grant tables */
FLUSH PRIVILEGES;
