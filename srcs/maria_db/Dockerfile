FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
	&& apt-get install mariadb-server -y \
	&& service mysql start