#!/bin/sh

service mariadb start

mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME ;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;"
mariadb -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

mysqld_safe

#take off the mysqld_safe and check for the diff