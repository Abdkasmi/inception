# instructions to build my database image

FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

# RUN chown -R mysql:mysql /var/lib/mysql
# RUN mkdir -p /var/run/mysqld; \
# 	mkfifo /var/run/mysqld/mysqld.sock
# RUN chown -R mysql:mysql /var/run/mysqld

COPY ./tools/mariadb.cnf /etc/mysql/
COPY ./tools/config.sql /tmp/
COPY ./tools/entrypoint.sh /tmp/

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
CMD [ "mysqld", "--bind-address=0.0.0.0" ]
