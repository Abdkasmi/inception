# instructions to build my database image

FROM debian:buster
LABEL maintainer="abkasmi <abkasmi@student.s19.be>"


ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["mysqld", "--bind-address=0.0.0.0"]
