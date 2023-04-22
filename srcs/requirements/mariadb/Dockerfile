# instructions to build my database image

FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm


# RUN apt-get update
# RUN apt-get upgrade -y
# RUN apt-get install mariadb-server mariadb-client -y

# RUN chown -R mysql:mysql /var/lib/mysql
# RUN mkdir -p /run/mysqld; \
# 	mkfifo /run/mysqld/mysqld.sock
# RUN chown -R mysql:mysql /run/mysqld

# COPY ./tools/mariadb.cnf /etc/mysql/
# COPY ./tools/config.sql ./
# COPY ./tools/entrypoint.sh ./

# ENTRYPOINT [ "bash", "entrypoint.sh" ]


RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["mysqld", "--bind-address=0.0.0.0"]