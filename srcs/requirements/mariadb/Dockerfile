# instructions to build my database image

FROM debian:10

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install mariadb mariadb-client -y

# change ownerchip for mysql files
RUN chown -R mysql:mysql /var/lib/mysql

# create directory for deamon
RUN mkdir -p /var/run/mysqld; mkfifo /var/run/mysqld/mysqld.sock
RUN chown -R mysql:mysql /var/run/mysql

