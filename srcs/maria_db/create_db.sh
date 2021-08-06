#export MYSQL_DATABASE=db
#export MYSQL_USER=root
#export DOMAIN_NAME=thoberth.42.fr
#export MYSQL_PASSWORD=@123toto

mysqld_safe &

sleep 10

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "GRANT ALL ON db.* TO ${MYSQL_USER}@${DOMAIN_NAME} IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown
exec mysqld -u root --datadir=/var/lib/mysql