cd /var/www/


# until mariadb -u "$MYSQL_USER" -h "$MYSQL_HOST" --password="${MYSQL_PASSWORD}" -e "FLUSH PRIVILEGES;"; do
#   echo "Database is not up yet. Waiting..."
#   sleep 0.2 # wait for 5 seconds before check again
# done


wget https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz && rm -rf latest.tar.gz 
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf

chown -R www-data:www-data /var/www/wordpress/


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/bin/wp-cli

# cd /var/www/wordpress

# wp core download --path="/var/www/wordpress" --allow-root

# wp config create --path="/var/www/wordpress" --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --dbprefix=wp_

# wp core install --path="/var/www/wordpress" --allow-root --url=$DOMAIN_NAME --title="$WP_TITLE" --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL

# wp user create --path="/var/www/wordpress" --allow-root $WP_USR $WP_EMAIL --user_pass=$WP_USER_PWD

# chown www-data:www-data /var/www/wordpress/ -R

mkdir -p /run/php/

php-fpm7.4 -F -R