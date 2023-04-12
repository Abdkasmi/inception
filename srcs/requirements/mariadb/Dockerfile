# instructions to build my database image

FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY ./tools/mariadb.cnf /etc/mysql/
COPY ./tools/config.sql ./
COPY ./tools/entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "bash", "entrypoint.sh" ]
