FROM debian:buster

RUN	apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
    && apt-get install nginx -y \
	&& mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.origin

COPY    srcs/nginx/thoberth.42.fr /etc/nginx/sites-available/ \
		srcs/nginx/nginx.conf etc/nginx/
RUN     ln -s  /etc/nginx/sites-available/thoberth.42.fr.conf /etc/nginx/sites-enabled/

CMD nginx -g "daemon off;" && service nginx start