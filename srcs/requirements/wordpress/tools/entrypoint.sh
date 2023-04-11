!/bin/sh

echo "does Wordpress listen on the good port"
grep -E "listen = 9000" "/etc/php/7.3/fpm/pool.d/www.conf" > /dev/null 2>&1
if [ $? -ne 0 ]; then
 	echo "listen port configuration"
	sed -i "s|.*listen = /run/php/php7.3-fpm.sock.*|listen = 9000|g" "/etc/php/7.3/fpm/pool.d/www.conf" 
fi

echo "check if the config file already exist"
cat /.setup 2> /dev/null
if [ ! -f "wp-config.php" ]; then
	echo "create config.php"

	cp /config/wp-config.php ./wp-config.php

	# wp config create --dbname=$MARIADB_DATABASE \
	# 				--dbuser=$MARIADB_USER \
	# 				--dbpass=$MARIADB_USER_PWD \
	# 				--dbhost=$MARIADB_HOST \
	# 				--path="/var/www/wordpress/" \
	# 				--skip-check \
	# 				--allow-root
	touch /.setup
fi

if ! wp core is-installed --allow-root; then
	echo "install Wordpress"
	wp core install --url=$WORDPRESS_URL \
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ADMIN \
					--admin_password=$WORDPRESS_ADMIN_PWD \
					--admin_email=$WORDPRESS_ADMIN_EMAIL \
					--skip-email \
					--allow-root

	echo "update Wordpress"
	wp plugin update --all --allow-root
	
	echo "create Wordpress user"
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
					--role=editor \
					--user_pass=$WORDPRESS_USER_PWD \
					--allow-root

	echo "generate first post"
	wp post generate --count=1 \
						--post_title=$WORDPRESS_TITLE \
						--post_author=$WORDPRESS_ADMIN \
						--post_content="Hey, it's my first time here !" \
						--allow-root
fi

php-fpm7.3 --nodaemonize
