FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
	&& apt-get install mariadb-server mariadb-client gnupg -y \
	&& mkdir -p /var/run/mysql

COPY create_db.sh /bin/

EXPOSE 3306

CMD sh bin/create_db.sh && mysqld_safe