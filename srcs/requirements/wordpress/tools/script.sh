mkdir -p /var/www/wordpress
cd /var/www/wordpress


until mariadb -u "$MYSQL_USER" -h mariadb --password="${MYSQL_PASSWORD}" -e "show databases;"; do
  echo "Database is not up yet. Waiting..."
  sleep 0.2 # wait for 5 seconds before check again
done
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf


wp core download  --allow-root

wp config create --allow-root  --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb 

wp core install --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL  --allow-root --url=$DOMAIN_NAME

# wp user create --user=$WP_USER --user-email=$WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root

chown -R www-data:www-data /var/www/wordpress

mkdir -p /run/php/

php-fpm7.4 -F -R