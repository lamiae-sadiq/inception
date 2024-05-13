cd /var/www/


until mariadb -u "$MYSQL_USER" -h mariadb --password="${MYSQL_PASSWORD}" -e "show databases;"; do
  echo "Database is not up yet. Waiting..."
  sleep 0.2 # wait for 5 seconds before check again
done
# sleep 3;

wget https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz && rm -rf latest.tar.gz 
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf


mkdir -p /run/php/

php-fpm7.4 -F -R