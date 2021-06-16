export MDB_NAME=DB
export MDB_USER=admin
export MDB_PW=@123toto

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS ${MDB_NAME};"
mysql -e "GRANT ALL ON db.* TO ${MDB_USER}@${DOMAIN_NAME} IDENTIFIED BY '${MDB_PW}';"
mysql -e "FLUSH PRIVILEGES;"