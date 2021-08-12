#!/bin/bash

echo "initialization of database"

mysqld_safe &
sleep 2

echo "wait 15s"
sleep 15

echo "ajout de la db"
sleep 2
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS ${WP_DB_USER}@'%' IDENTIFIED BY '${WP_DB_PW}';"
mysql -e "CREATE USER IF NOT EXISTS ${WP_ADMIN}@'%' IDENTIFIED BY '${WP_ADMIN_PW}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO ${WP_ADMIN}@'%' IDENTIFIED BY '${WP_ADMIN_PW}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${WP_DB_USER}@'%';"
mysql -e "FLUSH PRIVILEGES;"

echo "database shutdown"
sleep 2
mysqladmin shutdown

echo "database restarting"
sleep 2

exec mysqld -u root