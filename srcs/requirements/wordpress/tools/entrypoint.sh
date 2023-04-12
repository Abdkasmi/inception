# !/bin/sh

# echo "does Wordpress listen on the good port"
# grep -E "listen = 9000" "/etc/php/7.3/fpm/pool.d/www.conf" > /dev/null 2>&1
# if [ $? -ne 0 ]; then
#  	echo "listen port configuration"
# 	sed -i "s|.*listen = /run/php/php7.3-fpm.sock.*|listen = 9000|g" "/etc/php/7.3/fpm/pool.d/www.conf" 
# fi

# echo "check if the config file already exist"
# cat /.setup 2> /dev/null
# if [ $? -ne 0 ]; then
# 	echo "create config.php"

# 	wp config create --dbname=$MARIADB_DATABASE \
# 					--dbuser=$MARIADB_USER \
# 					--dbpass=$MARIADB_USER_PASSWORD \
# 					--dbhost=$MARIADB_HOST \
# 					--path="/var/www/wordpress/" \
# 					--skip-check \
# 					--allow-root
# 	touch /.setup
# fi

# if ! wp core is-installed --allow-root; then
# 	echo "install Wordpress"
# 	wp core install --url=$WORDPRESS_URL \
# 					--title=$WORDPRESS_TITLE \
# 					--admin_user=$WORDPRESS_ADMIN \
# 					--admin_password=$WORDPRESS_ADMIN_PASSWORD \
# 					--admin_email=$WORDPRESS_ADMIN_EMAIL \
# 					--skip-email \
# 					--allow-root

# 	echo "update Wordpress"
# 	wp plugin update --all --allow-root
	
# 	echo "create Wordpress user"
# 	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
# 					--role=editor \
# 					--user_pass=$WORDPRESS_USER_PASSWORD \
# 					--allow-root

# 	echo "generate first post"
# 	wp post generate --count=1 \
# 						--post_title=$WORDPRESS_TITLE \
# 						--post_author=$WORDPRESS_ADMIN \
# 						--post_content="Hey, it's my first time here !" \
# 						--allow-root
# fi

# php-fpm7.3 --nodaemonize










# WP-CLI is the official command-line interface for WordPress.
#
# Modify www.conf so that it works locally as it's asked
target="/etc/php7/php-fpm.d/www.conf"

# The www.conf file is needed for communication with the server
# 2>&1 redirige la sortie d’erreur(STDERR) vers la sortie standard(STDOUT) et la sortie STDOUT dans /dev/null.
# Dans ce cas, l’administrateur ou root ne sera jamais si la commande c’est bien exécutées ou pas.
grep -E "listen = 127.0.0.1" $target > /dev/null 2>&1
if [ $? -eq 0 ]
then
	# Replace first part with second
	# worpress not in local but nginx port 9000
	sed -i "s|.*listen = 127.0.0.1.*|listen = 9000|g" $target
	echo "env[MARIADB_HOST] = \$MARIADB_HOST" >> $target
	echo "env[MARIADB_USER] = \$MARIADB_USER" >> $target
	echo "env[MARIADB_PWD] = \$MARIADB_PWD" >> $target
	echo "env[MARIADB_DB] = \$MARIADB_DB" >> $target
fi

# Enter if file doesn't exist yet
if [ ! -f "wp-config.php" ]
then
	cp /config/wp-config.php ./wp-config.php

	# We have to wait a bit or else the next steps will be skipped
	# In the meantime, connection to database is happening
	sleep 5 

	# Wordpress configuration
	wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" \
    	--admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root


	wp plugin update --all 

	# Install and activate theme
	wp theme install twentysixteen --activate 

	wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD

	# Creation d'un article pour l'example
	wp post generate --count=1 --post_title="example-post"
fi

# We need this to run wordpress but also so that the container keeps running
# --nodaemonize == keep foreground
php-fpm7 --nodaemonize