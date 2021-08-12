FROM debian:buster

RUN	apt-get update \
    && apt-get upgrade -y \
	&& apt-get install openssl -y \
    && apt-get install vim -y \
    && apt-get install nginx -y \
	&& mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.origin \
	&& mkdir -p /etc/nginx/ssl/ \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=FR/ST=Ile de France/L=Paris/O=42/OU=Inception/CN=thoberth.42.fr" 

COPY	thoberth.42.fr.conf	/etc/nginx/sites-available/
COPY	nginx.conf	etc/nginx/
COPY 	start-nginx.sh /bin/
RUN     ln -s  /etc/nginx/sites-available/thoberth.42.fr.conf /etc/nginx/sites-enabled/thoberth.42.fr.conf \
		&& chmod 775 /bin/start-nginx.sh \
		&& chown -R www-data:www-data /var/www

EXPOSE 443

ENTRYPOINT [ "/bin/start-nginx.sh" ]