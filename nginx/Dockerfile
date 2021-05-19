FROM alpine:3.12

RUN		apk update \
&& apk upgrade \
&& apk add vim \
&& apk add openrc \
&& adduser -D -g 'www' www \
&& mkdir /www \
&& chown -R www:www /www \
&& openrc \
&& apk add nginx \
&& mkdir /run/nginx/ \
&& touch /run/openrc/softlevel \
&& chown -R www:www /run/nginx/ \
&& chmod 775 /run/nginx/ \
&& mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./index.html /www/index.html

EXPOSE 80

CMD	rc-service nginx start && sh