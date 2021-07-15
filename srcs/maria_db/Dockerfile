FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
	&& apt-get install mariadb-server -y \
	&& mkdir -p /var/run/mysql

COPY create_db.sh /bin/
COPY init.sql /bin/

RUN sh /bin/create_db.sh \
    && etc/init.d/mysql start \
    && mysql -u root < /bin/init.sql

CMD mysqld