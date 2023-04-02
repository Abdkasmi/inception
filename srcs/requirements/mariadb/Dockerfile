# instructions to build my database image
FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

RUN chown -R mysql:mysql /var/lib/mysql
RUN mkdir -p /var/run/mysqld; \
	mkfifo /var/run/mysqld/mysqld.sock
RUN chown -R mysql:mysql /var/run/mysqld

COPY ./tools/mariadb.cnf /etc/my.cnf.d/
RUN chmod +x /etc/my.cnf.d/mariadb.cnf

COPY ./tools/config.sql /tmp/
RUN chmod +x /tmp/config.sql

COPY ./tools/entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "bash", "entrypoint.sh" ]

# create directory for deamon
# RUN mkdir -p /var/lib/mysqld /run/mysqld

# # COPY the config.sql file
# COPY ./tools/config.sql /tmp/
# RUN chmod +x /tmp/config.sql

# # COPY entrypoint script and add execution right to execute it
# COPY ./tools/entrypoint.sh ./
# RUN chmod +x ./entrypoint.sh

# # COPY mariadb conf file
# COPY ./tools/mariadb.cnf /etc/my.cnf.d/
# RUN chmod +x /etc/my.cnf.d/mariadb.cnf

# # Change ownership for mysql files 
# # This ensures that the MySQL server has the necessary permissions to read and write to these directories and their contents.
# RUN	chown -R mysql:mysql /var/lib/mysql 
# RUN mkdir -p /var/run/mysqld; mkfifo /var/run/mysqld/mysqld.sock
# RUN chown -R mysql:mysql /run/mysqld

# ENTRYPOINT ["bash", "/entrypoint.sh"]
