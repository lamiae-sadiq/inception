#!/bin/bash

set -m

# start the sql server
mkdir -p /run/mysqld
mysqld_safe &




# until mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"; do
#   echo "Database is not up yet. Waiting..."
#   sleep 0.2 # wait for 5 seconds before check again
# done



# service mariadb status;

# create a database if it's not exist

echo 1
echo " create a database if it's not exist"
mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;"
# echo " create a database if it's not exist"
# mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# echo "create the user if it's not exists (adding localhost so the user can only connect from the localhost)"
# mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# echo "give the user all the privilages of the database"
# mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"

# echo "modify the user: root connecting form: localhsot old password and replace it with the new password"
# mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# echo "reload the grant tables memory for the changes to take effect immediately"
# mariadb -u root -h localhost --password="${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# echo "shutdown the sql server"
# mysqladmin -u root --password="${MYSQL_ROOT_PASSWORD}" shutdown
# service mariadb stop
#starting mysql server in safe mode
fg