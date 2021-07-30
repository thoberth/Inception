export MYSQL_DATABASE=db
export MYSQL_USER=admin
export DOMAIN_NAME=thoberth.42.fr
export MYSQL_PASSWORD=@123toto

/etc/init.d/mysql start ;

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "GRANT ALL ON db.* TO ${MYSQL_USER}@${DOMAIN_NAME} IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

/etc/init.d/mysql stop