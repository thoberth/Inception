FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
	&& apt-get install mariadb-server -y \
	&& mkdir -p /var/run/mysqld/

COPY create_db.sh /bin/

CMD etc/init.d/mysql start && sh /bin/create_db.sh && etc/init.d/mysql restart