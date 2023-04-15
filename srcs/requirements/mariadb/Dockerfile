# instructions to build my database image

FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install mariadb-server mariadb-client -y

# RUN chown -R mysql:mysql /var/lib/mysql
# RUN mkdir -p /run/mysqld; \
# 	mkfifo /run/mysqld/mysqld.sock
# RUN chown -R mysql:mysql /run/mysqld

# COPY ./tools/mariadb.cnf /etc/mysql/
# COPY ./tools/config.sql ./
# COPY ./tools/entrypoint.sh ./

RUN mkdir -p /tmp/
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh


ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["mysqld", "--bind-address=0.0.0.0"]

# ENTRYPOINT [ "bash", "entrypoint.sh" ]
