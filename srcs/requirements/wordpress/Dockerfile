# instructions to build my wordpress image 

FROM debian:buster

# installing php7.4 and some utils
RUN apt-get update
RUN apt-get install curl bash vim -y
RUN apt-get install curl php7.3 php7.3-fpm php7.3-mysql -y
RUN mkdir -p /run/php

# intalling wp-cli from a url using curl (wordpress-commandline)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# assigning execution rights to use wp and moving the executable in PATH
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy the entrypoint script
COPY ./tools/entrypoint.sh ./

# Changing current directory to /var/www/wordpress
WORKDIR /var/www/wordpress

# Downloads and extracts WordPress core files to the specified path.
RUN wp core download --allow-root

# change ownership for wordpress file
RUN chown -R www-data:www-data /var/www/wordpress

ENTRYPOINT [ "bash", "/entrypoint.sh" ]