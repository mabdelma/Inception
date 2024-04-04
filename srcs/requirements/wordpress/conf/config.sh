#! /bin/bash
cd /var/www/wordpress

wp core download --force --allow-root


wp config create --path=/var/www/wordpress --dbname=$DB_NAME  --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root --dbprefix=wp_


wp --allow-root --path=/var/www/wordpress core install \
	--url='mabdelma.42.fr' --title='WordPress' \
	--skip-email --admin_email="$WP_ADMIN_MAIL" \
	--admin_user="$WP_ADMIN_USER" \
	--admin_password="$WP_ADMIN_PASSWORD"

wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD --role=subscriber --porcelain --allow-root


php-fpm7.4 -F