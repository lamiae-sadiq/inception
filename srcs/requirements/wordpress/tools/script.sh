cd /var/www/wordpress

wp core download --path="/var/www/wordpress" --allow-root

wp config create --path="/var/www/wordpress" --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --dbprefix=wp_

wp core install --path="/var/www/wordpress" --allow-root --url=$DOMAIN_NAME --title="$WP_TITLE" --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL

wp user create --path="/var/www/wordpress" --allow-root $WP_USR $WP_EMAIL --user_pass=$WP_USER_PWD

chown www-data:www-data /var/www/wordpress/wp-content/uploads -R

mkdir -p /run/php/

php-fpm -F