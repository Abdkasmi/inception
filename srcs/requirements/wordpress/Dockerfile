# # instructions to build my wordpress image 

# FROM debian:buster

# ENV DEBIAN_FRONTEND noninteractive
# ENV TERM xterm

# # installing php7.3 and some utils
# RUN apt-get update -y
# RUN apt-get install curl bash vim -y
# RUN apt-get install php7.3 php7.3-fpm php7.3-mysql -y
# RUN mkdir -p /run/php

# # intalling wp-cli from a url using curl (wordpress-commandline)
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# WORKDIR /var/www/wordpress

# RUN	wp core download --allow-root

# COPY	tools/wp-config.php /conf/wp-config.php

# COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
# RUN chmod +x /tmp/entrypoint.sh

# # change ownership for wordpress file
# RUN chown -R www-data:www-data /var/www/wordpress

# ENTRYPOINT [ "bash", "/tmp/entrypoint.sh" ]

FROM debian:buster

RUN apt-get update -y && apt-get install -y php7.3 php-mysqli php-fpm wget sendmail

COPY tools/www.conf /etc/php/7.3/fpm/pool.d/
COPY tools/wp-config.php /var/www/
COPY tools/entrypoint.sh /var/www/

RUN chmod +x /var/www/entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/var/www/entrypoint.sh"]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]