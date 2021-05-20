FROM debian:buster

RUN	apt-get update \
    && apt-get upgrade \
    && apt-get install vim -y \
    && apt-get install nginx -y

CMD nginx -g "daemon off;" && service nginx start