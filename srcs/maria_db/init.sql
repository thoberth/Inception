CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
GRANT ALL ON db.* TO ${MYSQL_USER}@${DOMAIN_NAME} IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;