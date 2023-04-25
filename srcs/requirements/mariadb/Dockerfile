# instructions to build my database image

# FROM debian:buster
# LABEL maintainer="abkasmi <abkasmi@student.s19.be>"


# ENV DEBIAN_FRONTEND noninteractive
# ENV TERM xterm

# RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
#     && rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /tmp/
# COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
# RUN chmod +x /tmp/entrypoint.sh

# EXPOSE 3306

# ENTRYPOINT ["/tmp/entrypoint.sh"]
# CMD ["mysqld", "--bind-address=0.0.0.0"]

FROM debian:buster
RUN apt-get update
RUN apt-get upgrade -y

#MariaDB will be our database
RUN apt-get install mariadb-server -y

#Copy database creation and configutation
COPY ./tools/config.sql /tmp/config.sql

#Copy more configuration details given in the .cnf
COPY tools/mariadb.cnf /etc/mysql/

#Copy .sh script to execute everything
COPY ./tools/entrypoint.sh ./

# This execution of the  script is now the starting point
ENTRYPOINT [ "entrypoint.sh" ]