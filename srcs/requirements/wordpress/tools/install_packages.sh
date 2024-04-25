#bin/bash

# The first line is a comment, so it is not executed.
cd /var/www/ \
    && curl -LO https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz \
    && rm -rf latest.tar.gz \
    && cp /wp-config.php /var/www/wordpress/ \
    && chown -R www-data:www-data /var/www/wordpress/
    sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.3/fpm/pool.d/www.conf
    chown -R www-data:www-data /var/www/wordpress/
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/bin/wp-cli
    cd /var/www/wordpress
    runuser -u www-data -- wp-cli plugin install redis-cache --activate --path='/var/www/wordpress'
    runuser -u www-data -- wp-cli plugin update --all --path='/var/www/wordpress'
    runuser -u www-data -- wp-cli redis enable --path='/var/www/wordpress'
    mkdir /run/php/
    php-fpm7.3 -F -R