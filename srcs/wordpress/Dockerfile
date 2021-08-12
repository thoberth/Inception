FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
	&& apt-get install tar -y \
	&& apt-get install php-fpm php-mysql -y \
	&& mkdir -p /run/php/

ADD https://wordpress.org/latest.tar.gz /tmp/latest.tar.gz
RUN cd /tmp \
	&& tar xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& mkdir /var/www \
	&& mv -f wordpress /var/www/ \
	&& chmod 775 -R /var/www/wordpress \
	&& chown -R www-data:www-data /var/www/wordpress

RUN rm -rf /var/www/wordpress/wp-config-sample.php
COPY wp-config.php /var/www/wordpress
COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY start-wp-php.sh /bin/start-wp-php.sh
RUN chmod 775 /bin/start-wp-php.sh 

ENTRYPOINT [ "/bin/start-wp-php.sh" ]

EXPOSE 9000