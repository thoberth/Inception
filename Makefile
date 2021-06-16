# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thoberth <thoberth@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/31 11:16:03 by thoberth          #+#    #+#              #
#    Updated: 2021/06/01 11:52:37 by thoberth         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CREATE_NGINX = docker build -t nginx srcs/nginx/

CREATE_WORDPRESS = docker build -t wordpress srcs/wordpress/

CREATE_MARIADB = docker build -t mariadb srcs/maria_db/

RM_IMAGES = docker rmi -f $(shell docker images -q)

LAUNCH_DOCKER_COMPOSE = docker-compose --env-file srcs/.env up

STOP_DOCKER_COMPOSE = docker-compose --env-file srcs/.env down

DOCKER_BUILD = ${CREATE_NGINX} && ${CREATE_MARIADB} && ${CREATE_WORDPRESS}

all:
	${DOCKER_BUILD} && ${LAUNCH_DOCKER_COMPOSE}

down:
	${STOP_DOCKER_COMPOSE}

clean:
	${RM_IMAGES}

re: clean down all
	
.PHONY:	all down clean re