#!/bin/bash


#start the sql server
service mysql start;

#create a database if it's not exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

#create the user if it's not exists (adding localhost so the user can only connect from the localhost)
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

#give the user all the privilages of the database
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#modify the user: root connecting form: localhsot old password and replace it with the new password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

#reload the grant tables memory for the changes to take effect immediately
mysql -e "FLUSH PRIVILEGES;"

#shutdown the sql server
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

#starting mysql server in safe mode
exec mysqld_safe