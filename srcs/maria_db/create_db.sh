#!/bin/bash

echo "initialization of database"
sleep 2

mysqld_safe &

echo "wait 15s"
sleep 15

echo "ajout de la db"
sleep 2
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "GRANT ALL ON db.* TO ${MYSQL_USER}@${DOMAIN_NAME} IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

echo "database shutdown"
sleep 2
mysqladmin shutdown

echo "database restarting"
sleep 2
exec mysqld -u root 