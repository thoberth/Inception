FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
	&& apt-get install wordpress -y \
	&& apt-get install php-fpm php-mysql php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip -y \
	&& mkdir -p /run/php/


CMD php-fpm7.3 -F