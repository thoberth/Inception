FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
	&& apt-get install mariadb-server procps net-tools -y

COPY create_db.sh /bin/
COPY my.cnf /etc/mysql/my.cnf

RUN chmod 775 /bin/create_db.sh
RUN chmod 775 /etc/mysql/my.cnf
RUN chmod 775 /var/lib/mysql

EXPOSE 3306

ENTRYPOINT [ "bin/create_db.sh" ]