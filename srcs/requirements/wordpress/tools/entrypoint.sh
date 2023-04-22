# WP-CLI is the official command-line interface for WordPress.
#
# Modify www.conf so that it works locally as it's asked
# target="/etc/php/7.3/fpm/pool.d/www.conf"

# # The www.conf file is needed for communication with the server
# # 2>&1 redirige la sortie d’erreur(STDERR) vers la sortie standard(STDOUT) et la sortie STDOUT dans /dev/null.
# # Dans ce cas, l’administrateur ou root ne sera jamais si la commande c’est bien exécutées ou pas.
# grep -E "listen = 127.0.0.1" $target > /dev/null 2>&1
# if [ $? -eq 0 ]
# then
# 	# Replace first part with second
# 	# worpress not in local but nginx port 9000
# 	sed -i "s|.*listen = 127.0.0.1.*|listen = 9000|g" $target
# 	echo "env[MARIADB_HOST] = \$MARIADB_HOST" >> $target
# 	echo "env[MARIADB_USER] = \$MARIADB_USER" >> $target
# 	echo "env[MARIADB_PWD] = \$MARIADB_PWD" >> $target
# 	echo "env[MARIADB_DB] = \$MARIADB_DB" >> $target
# fi

# # Enter if file doesn't exist yet
# if [ ! -f "wp-config.php" ]
# then
# 	echo "creating config.php"
# 	cp /conf/wp-config.php ./wp-config.php

# 	# We have to wait a bit or else the next steps will be skipped
# 	# In the meantime, connection to database is happening
# 	sleep 5 

# 	# Wordpress configuration
# 	wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" \
#     	--admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root

# 	wp plugin update --all  --allow-root

# 	# Install and activate theme
# 	wp theme install twentysixteen --activate --allow-root

# 	wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD --allow-root

# 	# Creation d'un article pour l'example
# 	wp post generate --count=1 --post_title="example-post" --allow-root
# fi

# # We need this to run wordpress but also so that the container keeps running
# # --nodaemonize == keep foreground
# php-fpm7.3 --nodaemonize

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
chown -R www-data:www-data /var/www/*
chmod 755 /var/www/*
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid

if [ ! -f /var/www/html/wp-config.php ]; then

	echo "Starting wordpress setup"

	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	cd /var/www/html
	wp core download --allow-root
	mv /var/www/wp-config.php /var/www/wordpress/

	sed -i "s/XXX_WORDPRESS_DB_NAME_XXX/$MARIADB_DATABASE/g" /var/www/html/wp-config.php
	sed -i "s/XXX_WORDPRESS_DB_USER_XXX/$MARIADB_USER/g" /var/www/html/wp-config.php
	sed -i "s/XXX_WORDPRESS_DB_HOST_XXX/$MARIADBDB_HOST/g" /var/www/html/wp-config.php
	sed -i "s/XXX_WORDPRESS_DB_PASS_XXX/$MARIADB_USER_PASSWORD/g" /var/www/html/wp-config.php

	echo "Creating wordpress users..."

	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD}

	echo "Wordpress is set up"

fi

exec "$@"