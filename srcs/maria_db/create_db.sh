#export MYSQL_DATABASE=db
#export MYSQL_USER=root
#export DOMAIN_NAME=thoberth.42.fr
#export MYSQL_PASSWORD=@123toto

mysqld_safe &
echo "db initialised"
echo "wait 15s"
sleep 15
echo "ajout de la db"
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "GRANT ALL ON db.* TO ${MYSQL_USER}@${DOMAIN_NAME} IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
echo "database shutdown"
mysqladmin shutdown
echo "database restarting"
exec mysqld -u root 