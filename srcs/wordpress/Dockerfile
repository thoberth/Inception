FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
	&& apt-get install wordpress -y \
	&& apt-get install php-fpm php-mysql -y \
	&& mkdir -p /run/php/

CMD exec php-fpm7.3 -F

EXPOSE 9000