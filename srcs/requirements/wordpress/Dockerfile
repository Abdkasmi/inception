# instructions to build my wordpress image 

FROM debian:buster

# installing php7.4 and some utils
RUN apt-get update
RUN apt-get install curl bash vim -y
RUN apt-get install php7.4 php7.4-fpm php7.4-mysql -y

# intalling wp-cli from a url using curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# assigning execution rights to use wp and moving the executable in PATH
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
