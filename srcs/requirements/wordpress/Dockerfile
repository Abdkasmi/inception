# # instructions to build my wordpress image 

FROM debian:buster
LABEL maintainer="abkasmi <abkasmi@student.s19.be>"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update -y && apt-get install -y php7.3 php-mysqli php-fpm wget

COPY tools/www.conf /etc/php/7.3/fpm/pool.d/
COPY tools/wp-config.php /var/www/
COPY tools/entrypoint.sh /var/www/

RUN chmod +x /var/www/entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/var/www/entrypoint.sh"]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
